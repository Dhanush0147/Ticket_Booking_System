-- ==============================
--  Create Database and Use It
-- ==============================
CREATE DATABASE railwaydatabase;
USE railwaydatabase;

---------------------------
-- TABLE DEFINITIONS
---------------------------

-- Table: admin
CREATE TABLE admin (
    username VARCHAR(50) PRIMARY KEY,
    password VARCHAR(100) NOT NULL
);

-- Table: user
CREATE TABLE user (
    username VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    address VARCHAR(200),
    password VARCHAR(100) NOT NULL
);

-- Table: station
CREATE TABLE station (
    station_code VARCHAR(10) PRIMARY KEY,
    station_name VARCHAR(100) NOT NULL,
    zone VARCHAR(50)
);

-- Table: train
-- Added coach_no to clarify coach details.
CREATE TABLE train (
    t_number INT,
    t_date DATE,
    train_name VARCHAR(100),
    released_by VARCHAR(50),
    num_ac INT NOT NULL,
    num_sleeper INT NOT NULL,
    coach_no VARCHAR(50),  -- New: to hold coach number or list of coaches (as needed)
    PRIMARY KEY (t_number, t_date),
    FOREIGN KEY (released_by) REFERENCES admin(username)
);

-- Table: train_status
CREATE TABLE train_status (
    t_number INT,
    t_date DATE,
    seats_b_ac INT DEFAULT 0,
    seats_b_sleeper INT DEFAULT 0,
    PRIMARY KEY (t_number, t_date),
    FOREIGN KEY (t_number, t_date) REFERENCES train(t_number, t_date)
);

-- Table: route
-- Added distance (per leg) so each station-to-station segment has its own fixed distance.
CREATE TABLE route (
    t_number INT,
    station_code VARCHAR(10),
    arrival_time TIME,
    departure_time TIME,
    stop_number INT,
    distance INT NOT NULL,  -- Distance between this station and the previous one
    PRIMARY KEY (t_number, station_code),
    FOREIGN KEY (t_number) REFERENCES train(t_number),
    FOREIGN KEY (station_code) REFERENCES station(station_code)
);

-- Table: fare
CREATE TABLE fare (
    class_type VARCHAR(20),
    distance INT,
    price DECIMAL(10,2),
    PRIMARY KEY (class_type, distance)
);

-- Table: concession
CREATE TABLE concession (
    concession_type VARCHAR(50) PRIMARY KEY,
    discount_percent INT NOT NULL
);

-- Table: ticket
CREATE TABLE ticket (
    pnr_no INT PRIMARY KEY,
    coach VARCHAR(20), -- Indicates class type, e.g., 'AC' or 'Sleeper'
    booked_by VARCHAR(50),
    booked_at DATETIME,
    t_number INT,
    t_date DATE,
    status VARCHAR(20) DEFAULT 'Confirmed',
    payment_status VARCHAR(20) DEFAULT 'Success',
    src_station_code VARCHAR(10),
    dest_station_code VARCHAR(10),
    FOREIGN KEY (booked_by) REFERENCES user(username),
    FOREIGN KEY (t_number, t_date) REFERENCES train(t_number, t_date),
    FOREIGN KEY (src_station_code) REFERENCES station(station_code),
    FOREIGN KEY (dest_station_code) REFERENCES station(station_code)
);

-- Table: payment
CREATE TABLE payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    pnr_no INT,
    amount DECIMAL(10,2),
    payment_time DATETIME,
    status VARCHAR(20),
    transaction_id VARCHAR(50),
    FOREIGN KEY (username) REFERENCES user(username),
    FOREIGN KEY (pnr_no) REFERENCES ticket(pnr_no)
);

-- Table: passenger
-- Added t_number and t_date for verifying berth assignment uniqueness.
CREATE TABLE passenger ( 
    t_number INT,       -- Train number for this passenger
    t_date DATE,        -- Journey date for this passenger
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    pnr_no INT,
    berth_no VARCHAR(10),
    berth_type VARCHAR(20),
    coach_no VARCHAR(10),
    concession_type VARCHAR(50),
    status VARCHAR(20) DEFAULT 'Confirmed',
    PRIMARY KEY (pnr_no, berth_no, coach_no),
    FOREIGN KEY (pnr_no) REFERENCES ticket(pnr_no),
    FOREIGN KEY (concession_type) REFERENCES concession(concession_type)
);

-- Table: refund_log
-- Added refund_status for tracking the refund progress.
CREATE TABLE refund_log (
    pnr_no INT,
    refund_time DATETIME,
    refund_amount DECIMAL(10,2),
    refund_status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (pnr_no) REFERENCES ticket(pnr_no)
);

-- Table: train_running_days
CREATE TABLE train_running_days (
    t_number INT,
    weekday VARCHAR(10),
    PRIMARY KEY (t_number, weekday),
    FOREIGN KEY (t_number) REFERENCES train(t_number)
);

-- Table: waitlist
-- Added waitlist_type to distinguish, for example, RAC vs WL.
CREATE TABLE waitlist (
    pnr_no INT PRIMARY KEY,
    position INT,
    status VARCHAR(20),
    waitlist_type VARCHAR(20) DEFAULT 'WL',  -- 'RAC' or 'WL'
    FOREIGN KEY (pnr_no) REFERENCES ticket(pnr_no)
);

-- Table: notification
CREATE TABLE notification (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    message TEXT,
    created_at DATETIME DEFAULT NOW(),
    FOREIGN KEY (username) REFERENCES user(username)
);

CREATE TABLE seat_allocation ( 
    pnr_no        INT PRIMARY KEY,
    t_number      INT,
    t_date        DATE,
    class_type    VARCHAR(10),
    coach         VARCHAR(10),
    berth_no      INT,
    berth_type    VARCHAR(10),
    allocated_at  DATETIME DEFAULT NOW(),

    FOREIGN KEY (pnr_no) REFERENCES ticket(pnr_no),
    FOREIGN KEY (t_number) REFERENCES train(t_number)
);


---------------------------
-- STORED PROCEDURES
---------------------------
DELIMITER $$

-- Procedure: calculate_ticket_fare
-- Calculates total fare based on cumulative distance between source and destination on a train's route.
CREATE PROCEDURE calculate_ticket_fare(
    IN in_t_number INT, 
    IN src_station VARCHAR(10), 
    IN dest_station VARCHAR(10), 
    IN in_class VARCHAR(20), 
    OUT total_fare DECIMAL(10,2)
)
BEGIN
    DECLARE src_stop INT;
    DECLARE dest_stop INT;
    DECLARE total_distance INT;
    
    -- Get the stop_number for source and destination
    SELECT stop_number INTO src_stop FROM route 
       WHERE t_number = in_t_number AND station_code = src_station
       ORDER BY stop_number ASC LIMIT 1;
    SELECT stop_number INTO dest_stop FROM route 
       WHERE t_number = in_t_number AND station_code = dest_station
       ORDER BY stop_number DESC LIMIT 1;
       
    -- Sum distance from src_stop to dest_stop
    SET total_distance = (SELECT SUM(distance) FROM route 
       WHERE t_number = in_t_number AND stop_number BETWEEN src_stop AND dest_stop);
    
    -- Look up fare using the total distance and class type
    SELECT price INTO total_fare FROM fare 
       WHERE class_type = in_class AND distance = total_distance;
END$$
-- Procedure: cancel_ticket
-- Cancels the ticket, updates status, computes refund using calculated fare, and frees the seat.
CREATE PROCEDURE cancel_ticket(IN in_pnr INT)
BEGIN
    DECLARE t_no INT;
    DECLARE t_dt DATE;
    DECLARE src VARCHAR(10);
    DECLARE dest VARCHAR(10);
    DECLARE class_type VARCHAR(20);
    DECLARE fare_amt DECIMAL(10,2) DEFAULT 0;
	
    UPDATE ticket SET status = 'Cancelled' WHERE pnr_no = in_pnr;
    UPDATE passenger SET status = 'Cancelled' WHERE pnr_no = in_pnr;

    SELECT t_number, t_date, src_station_code, dest_station_code
    INTO t_no, t_dt, src, dest
    FROM ticket WHERE pnr_no = in_pnr and ticket.status <> 'Cancelled' LIMIT 1;

	 select s.class_type into class_type from seat_allocation s  where pnr_no = in_pnr;

	
    CALL calculate_ticket_fare( IN in_t_number INT, 
    IN src_station VARCHAR(10), 
    IN dest_station VARCHAR(10), 
    IN in_class VARCHAR(20), 
    INOUT total_fare DECIMAL(10,2)
)
BEGIN
    DECLARE src_stop INT DEFAULT NULL;
    DECLARE dest_stop INT DEFAULT NULL;
    DECLARE total_distance INT DEFAULT 0;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET total_fare = 0;

    SELECT stop_number INTO src_stop FROM route 
    WHERE t_number = in_t_number AND station_code = src_station 
    ORDER BY stop_number ASC LIMIT 1;

    SELECT stop_number INTO dest_stop FROM route 
    WHERE t_number = in_t_number AND station_code = dest_station 
    ORDER BY stop_number DESC LIMIT 1;

    IF src_stop IS NULL OR dest_stop IS NULL OR src_stop >= dest_stop THEN
        SET total_fare = 0;
    ELSE
        SELECT SUM(distance) INTO total_distance FROM route 
        WHERE t_number = in_t_number AND stop_number BETWEEN src_stop AND dest_stop;

        IF total_distance IS NULL THEN
            SET total_distance = 0;
        END IF;

        SELECT f.price * (total_distance) / 100 INTO total_fare 
        FROM fare f WHERE f.class_type = in_class LIMIT 1;

        IF total_fare IS NULL THEN
            SET total_fare = 0;
        END IF;
    END IF;
END$$

-- Procedure: calculate_fare
-- (Remains as before to calculate fare from fare table given class and distance)
CREATE PROCEDURE calculate_fare(IN in_class_type VARCHAR(20), IN in_distance INT, OUT total_fare DECIMAL(10,2))
BEGIN
    SELECT price INTO total_fare FROM fare WHERE class_type = in_class_type AND distance = in_distance;
END$$

-- Procedure: apply_concession
CREATE PROCEDURE apply_concession(IN base_fare DECIMAL(10,2), IN con_type VARCHAR(50), OUT final_fare DECIMAL(10,2))
BEGIN
    DECLARE discount INT;
    SELECT discount_percent INTO discount FROM concession WHERE concession_type = con_type;
    SET final_fare = base_fare - (base_fare * discount / 100);
END$$

-- Procedure: check_email_registered
CREATE PROCEDURE check_email_registered (IN email_input VARCHAR(100))
BEGIN
    IF EXISTS (SELECT 1 FROM user WHERE email = email_input) THEN
        SELECT 'Email already registered' AS message;
    ELSE
        SELECT 'Email available' AS message;
    END IF;
END$$

-- Procedure: check_username_registered
CREATE PROCEDURE check_username_registered (IN uname_input VARCHAR(50))
BEGIN
    IF EXISTS (SELECT 1 FROM user WHERE username = uname_input) THEN
        SELECT 'Username already taken' AS message;
    ELSE
        SELECT 'Username available' AS message;
    END IF;
END$$

-- Procedure: check_admin_credentials
CREATE PROCEDURE check_admin_credentials (IN uname_input VARCHAR(50), IN pwd_input VARCHAR(50))
BEGIN
    IF EXISTS (SELECT 1 FROM admin WHERE username = uname_input AND password = pwd_input) THEN
        SELECT 'Valid admin credentials' AS message;
    ELSE
        SELECT 'Invalid credentials' AS message;
    END IF;
END$$

-- Procedure: check_user_credentials
CREATE PROCEDURE check_user_credentials (IN uname_input VARCHAR(50), IN pwd_input VARCHAR(50))
BEGIN
    IF EXISTS (SELECT 1 FROM user WHERE username = uname_input AND password = pwd_input) THEN
        SELECT 'Valid user credentials' AS message;
    ELSE
        SELECT 'Invalid credentials' AS message;
    END IF;
END$$

-- Procedure: check_train_details
CREATE PROCEDURE check_train_details (IN train_no_input INT, IN journey_date DATE)
BEGIN
    IF journey_date < CURRENT_DATE THEN
        SELECT 'Invalid date: in the past' AS message;
    ELSEIF journey_date > DATE_ADD(CURRENT_DATE, INTERVAL 2 MONTH) THEN
        SELECT 'Invalid date: more than 2 months in future' AS message;
    ELSEIF NOT EXISTS (SELECT 1 FROM train WHERE t_number = train_no_input) THEN
        SELECT 'Train not available' AS message;
    ELSE
        SELECT 'Train and date valid' AS message;
    END IF;
END$$

-- Procedure: check_seats_availability
-- Calculates available seats for a given train and class.
CREATE PROCEDURE check_seats_availability (
    IN in_train_no INT,
    IN journey_date DATE,
    IN class_type VARCHAR(20),
    IN requested_seats INT
)
BEGIN
    DECLARE total_seats INT;
    DECLARE booked_seats INT;
    DECLARE available_seats INT;

    IF class_type = 'AC' THEN
        SELECT num_ac INTO total_seats FROM train WHERE t_number = in_train_no AND t_date = journey_date;
        SELECT seats_b_ac INTO booked_seats FROM train_status WHERE t_number = in_train_no AND t_date = journey_date;
    ELSEIF class_type = 'Sleeper' THEN
        SELECT num_sleeper INTO total_seats FROM train WHERE t_number = in_train_no AND t_date = journey_date;
        SELECT seats_b_sleeper INTO booked_seats FROM train_status WHERE t_number = in_train_no AND t_date = journey_date;
    ELSE
        SET total_seats = 0; SET booked_seats = 0;
    END IF;
    
    SET available_seats = total_seats - booked_seats;
    
    IF available_seats IS NULL OR available_seats < requested_seats THEN
        SELECT CONCAT('Only ', IF(available_seats IS NULL, 0, available_seats), ' seats available') AS message;
    ELSE
        SELECT 'Seats available' AS message;
    END IF;
END$$



-- Procedure: generate_pnr
-- Generates a unique PNR, inserts the ticket, and returns the new PNR.
CREATE PROCEDURE generate_pnr (
    IN in_booked_by VARCHAR(50),
    IN in_train_no INT,
    IN journey_date DATE,
    OUT new_pnr BIGINT
)
BEGIN
    SET new_pnr = FLOOR(RAND() * 8999999999) + 1000000000;
    INSERT INTO ticket (pnr_no, coach, booked_by, booked_at, t_number, t_date, status, payment_status)
    VALUES (new_pnr, NULL, in_booked_by, NOW(), in_train_no, journey_date, 'Booked', 'Success');
    SELECT new_pnr AS pnr_generated;
END$$

-- Procedure: assign_berth
-- Assigns a berth to a passenger based on sample logic.

DELIMITER $$
CREATE PROCEDURE assign_berth(
    IN in_pnr INT,
    IN in_t_number INT,
    IN in_t_date DATE,
    IN in_class_type VARCHAR(10),
    IN in_coach VARCHAR(10),
    IN passenger_name VARCHAR(100),
    IN age INT,
    IN gender CHAR(1),
    IN src_station VARCHAR(10),
    IN dest_station VARCHAR(10)
)
BEGIN
    DECLARE new_berth INT;
    DECLARE max_berths INT DEFAULT 72;
    DECLARE attempts INT DEFAULT 0;
    DECLARE b_type VARCHAR(20);
    DECLARE src_stop INT;
    DECLARE dest_stop INT;
    DECLARE conflict_count INT;

    -- Get stop numbers
    SELECT stop_number INTO src_stop FROM route WHERE t_number = in_t_number AND station_code = src_station LIMIT 1;
    SELECT stop_number INTO dest_stop FROM route WHERE t_number = in_t_number AND station_code = dest_station LIMIT 1;

    -- Try finding a non-overlapping berth
    REPEAT
        SET new_berth = FLOOR(RAND() * max_berths) + 1;
        SET attempts = attempts + 1;

        SELECT COUNT(*) INTO conflict_count
        FROM seat_allocation sa
        JOIN ticket t ON sa.pnr_no = t.pnr_no
        JOIN route r1 ON t.src_station_code = r1.station_code AND t.t_number = r1.t_number
        JOIN route r2 ON t.dest_station_code = r2.station_code AND t.t_number = r2.t_number
        WHERE sa.t_number = in_t_number AND sa.t_date = in_t_date AND sa.coach = in_coach AND sa.berth_no = new_berth
        AND (
            (src_stop BETWEEN r1.stop_number AND r2.stop_number)
            OR (dest_stop BETWEEN r1.stop_number AND r2.stop_number)
            OR (r1.stop_number BETWEEN src_stop AND dest_stop)
            OR (r2.stop_number BETWEEN src_stop AND dest_stop)
        );
    UNTIL conflict_count = 0 OR attempts >= 100
    END REPEAT;

    -- If not found after 100 attempts → Waitlist
    IF attempts >= 100 THEN
        INSERT INTO passenger (t_number, t_date, pnr_no, name, age, gender, coach_no, berth_no, berth_type, concession_type, status)
        VALUES (in_t_number, in_t_date, in_pnr, passenger_name, age, gender, '-', '-', '-', 'none', 'Waitlisted');

        INSERT INTO waitlist (pnr_no, position, status, waitlist_type)
        VALUES (in_pnr, (SELECT IFNULL(MAX(position), 0) + 1 FROM waitlist), 'Waiting', 'WL');

        UPDATE ticket SET status = 'Waitlisted' WHERE pnr_no = in_pnr;
    ELSE
        IF new_berth % 8 IN (1, 4) THEN
            SET b_type = 'LB';
        ELSEIF new_berth % 8 IN (2, 5) THEN
            SET b_type = 'MB';
        ELSEIF new_berth % 8 IN (3, 6) THEN
            SET b_type = 'UB';
        ELSEIF new_berth % 8 = 7 THEN
            SET b_type = 'SL';
        ELSE
            SET b_type = 'SU';
        END IF;

        INSERT INTO seat_allocation (pnr_no, t_number, t_date, class_type, coach, berth_no, berth_type)
        VALUES (in_pnr, in_t_number, in_t_date, in_class_type, in_coach, new_berth, b_type);

        INSERT INTO passenger (t_number, t_date, pnr_no, name, age, gender, coach_no, berth_no, berth_type, concession_type, status)
        VALUES (in_t_number, in_t_date, in_pnr, passenger_name, age, gender, in_coach, new_berth, b_type, 'none', 'Confirmed');

        IF in_class_type = 'AC' THEN
            UPDATE train_status SET seats_b_ac = seats_b_ac + 1
            WHERE t_number = in_t_number AND t_date = in_t_date;
        ELSE
            UPDATE train_status SET seats_b_sleeper = seats_b_sleeper + 1
            WHERE t_number = in_t_number AND t_date = in_t_date;
        END IF;
    END IF;
END$$
DELIMITER ;

DELIMITER $$
-- Procedure: check_valid_pnr
CREATE PROCEDURE check_valid_pnr (IN input_pnr BIGINT)
BEGIN
    IF EXISTS (SELECT 1 FROM ticket WHERE pnr_no = input_pnr) THEN
        SELECT 'Valid PNR' AS message;
    ELSE
        SELECT 'Invalid PNR' AS message;
    END IF;
END$$

-- Procedure: lookup_train_schedule
-- Returns the train schedule for a given train and date.
delimiter $$
CREATE PROCEDURE lookup_train_schedule(IN src_station VARCHAR(10), IN dest_station VARCHAR(10), IN in_t_date DATE) 
BEGIN
    DECLARE src_station_code VARCHAR(10);
    DECLARE dest_station_code VARCHAR(10);
	DECLARE day_of_week VARCHAR(10);
     DECLARE requestedTrain INT;
    SELECT station_code INTO src_station_code FROM station WHERE station_name = src_station;
    SELECT station_code INTO dest_station_code FROM station WHERE station_name = dest_station;
 
    SET day_of_week = DAYNAME(in_t_date);

   
    SELECT r1.t_number
    FROM route r1
    JOIN route r2 ON r1.t_number = r2.t_number
    JOIN train_running_days trd ON r1.t_number = trd.t_number
    WHERE 
        r1.station_code = src_station_code
        AND r2.station_code = dest_station_code
        AND r1.stop_number < r2.stop_number
        AND trd.day_of_week = day_of_week;  -- Or pass as a variable
    
    SELECT * FROM train, train_status WHERE train.t_number = train.train_status AND train.t_number = requestedTrain;
END$$

-- Procedure: list_passengers
-- Lists all passengers traveling on a specific train on a given date.
CREATE PROCEDURE list_passengers(IN in_train_no INT, IN in_t_date DATE)
BEGIN
    SELECT * FROM passenger 
    WHERE t_number = in_train_no AND t_date = in_t_date AND status <> 'Cancelled';
END$$

-- Procedure: list_waitlisted
-- Retrieves waitlisted tickets for a particular train.
CREATE PROCEDURE list_waitlisted(IN in_train_no INT)
BEGIN
    SELECT t.*, w.position, w.waitlist_type 
    FROM ticket t
    JOIN waitlist w ON t.pnr_no = w.pnr_no
    WHERE t.t_number = in_train_no AND t.status = 'Waitlisted'
    ORDER BY w.position;
END$$

-- Procedure: total_revenue
-- Calculates total revenue from ticket bookings (excluding cancelled tickets) in a specified period.
CREATE PROCEDURE total_revenue(IN start_date DATE, IN end_date DATE)
BEGIN
    SELECT SUM(p.amount) AS revenue
    FROM payment p
    JOIN ticket t ON p.pnr_no = t.pnr_no
    WHERE t.booked_at BETWEEN start_date AND end_date
      AND t.status <> 'Cancelled';
END$$

-- Procedure: busiest_route
-- Finds the route (t_number and station) with the highest passenger count.
delimiter $$
CREATE PROCEDURE busiest_route() 
BEGIN
   
SELECT r.t_number, r.station_code, COUNT(p.pnr_no) AS passenger_count
FROM route r
JOIN ticket t ON r.t_number = t.t_number
JOIN passenger p ON t.pnr_no = p.pnr_no
GROUP BY r.t_number, r.station_code
HAVING COUNT(p.pnr_no) = (
    SELECT MAX(passenger_count)
    FROM (
        SELECT COUNT(p.pnr_no) AS passenger_count
        FROM route r
        JOIN ticket t ON r.t_number = t.t_number
        JOIN passenger p ON t.pnr_no = p.pnr_no
        GROUP BY r.t_number, r.station_code
    ) AS counts
);
END$$
delimiter ;

-- Procedure: generate_itemized_bill
-- Generates an itemized bill for a ticket (base fare and concession, for demonstration).
delimiter $$
CREATE PROCEDURE generate_itemized_bill(IN in_pnr BIGINT)
BEGIN
    DECLARE base_fare DECIMAL(10,2);
    DECLARE concession_amt DECIMAL(10,2);
    DECLARE total DECIMAL(10,2);
    -- For demonstration, assume base_fare is obtained via calculate_ticket_fare (here using a constant if not available)
    DECLARE t_no INT;
    DECLARE src VARCHAR(10);
    DECLARE dest VARCHAR(10);
    DECLARE class_type VARCHAR(20);
    SELECT t_number, src_station_code, dest_station_code, coach INTO t_no, src, dest, class_type FROM ticket WHERE pnr_no = in_pnr;
    CALL calculate_ticket_fare(t_no, src, dest, class_type, base_fare);
    SELECT IFNULL(discount_percent, 0) INTO concession_amt 
      FROM passenger p
      JOIN concession c ON p.concession_type = c.concession_type
      WHERE p.pnr_no = in_pnr LIMIT 1;
    SET total = base_fare - (base_fare * concession_amt / 100);
    SELECT CONCAT('Itemized Bill for PNR: ', in_pnr, 
           '\nBase Fare: ', base_fare,
           '\nConcession: ', concession_amt, '%',
           '\nTotal: ', total) AS bill;
END$$

DELIMITER ;


-- View: train_schedules
-- Joins train, route, and station to display schedule details.
CREATE VIEW train_schedules AS
SELECT t.t_number, t.t_date, t.train_name, s.station_code, s.station_name, 
       r.arrival_time, r.departure_time, r.stop_number, r.distance
FROM train t
JOIN route r ON t.t_number = r.t_number
JOIN station s ON r.station_code = s.station_code;

-- View: train_details
-- Shows train information along with updated seat numbers from train_status.
CREATE VIEW train_details AS
SELECT t.t_number, t.t_date, t.train_name, t.coach_no, t.num_ac, t.num_sleeper,
       ts.seats_b_ac, ts.seats_b_sleeper
FROM train t
JOIN train_status ts ON t.t_number = ts.t_number AND t.t_date = ts.t_date;

---------------------------
-- TRIGGERS
---------------------------
DELIMITER $$

-- Trigger: before_train_release
-- Checks that the train's t_date is at least 1 month and at most 4 months in advance,
-- that no duplicate train is released for that date, and that at least one coach exists.

-- Trigger: check_ticket_update
-- Prevents updates to pnr_no and coach in the ticket table.
CREATE TRIGGER check_ticket_update
BEFORE UPDATE ON ticket
FOR EACH ROW
BEGIN
    IF OLD.pnr_no <> NEW.pnr_no OR OLD.coach <> NEW.coach THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'PNR and Coach details cannot be updated';
    END IF;
END$$

-- Trigger: check_booked_seats
-- Ensures that booked seats do not exceed available seats from train.
CREATE TRIGGER check_booked_seats
BEFORE UPDATE ON train_status
FOR EACH ROW
BEGIN
    DECLARE total_ac INT;
    DECLARE total_sleeper INT;
    SELECT num_ac, num_sleeper INTO total_ac, total_sleeper
      FROM train
     WHERE t_number = NEW.t_number AND t_date = NEW.t_date;
    IF NEW.seats_b_ac > total_ac OR NEW.seats_b_sleeper > total_sleeper THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Booked seats exceed total available seats';
    END IF;
END$$

-- Trigger: before_berth_assign
-- Checks whether the specified berth is already assigned for that train and journey.
CREATE TRIGGER before_berth_assign
BEFORE INSERT ON passenger
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1 FROM passenger
        WHERE t_number = NEW.t_number AND t_date = NEW.t_date
          AND coach_no = NEW.coach_no AND berth_no = NEW.berth_no
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Berth already assigned';
    END IF;
END$$

-- Trigger: prevent_double_booking (extra safety)
CREATE TRIGGER prevent_double_booking
BEFORE INSERT ON passenger
FOR EACH ROW
BEGIN
    DECLARE cnt INT;
    SELECT COUNT(*) INTO cnt FROM passenger
    WHERE coach_no = NEW.coach_no AND berth_no = NEW.berth_no AND pnr_no = NEW.pnr_no;
    IF cnt > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Seat already booked for this PNR.';
    END IF;
END$$

-- Trigger: refund_on_cancel
-- When a ticket is cancelled, computes the refund based on the fare and frees up the seat.

CREATE TRIGGER refund_on_cancel
AFTER UPDATE ON ticket
FOR EACH ROW
BEGIN
    DECLARE fare_amt DECIMAL(10,2);
    DECLARE t_no INT;
    DECLARE t_dt DATE;
    DECLARE src VARCHAR(10);
    DECLARE dest VARCHAR(10);
    DECLARE class_type VARCHAR(20);
    
    IF OLD.status <> 'Cancelled' AND NEW.status = 'Cancelled' THEN
        SELECT t_number, t_date, src_station_code, dest_station_code, coach
          INTO t_no, t_dt, src, dest, class_type
          FROM ticket
          WHERE pnr_no = NEW.pnr_no;
          
        CALL calculate_ticket_fare(t_no, src, dest, class_type, fare_amt);
        
        INSERT INTO refund_log (pnr_no, refund_time, refund_amount, refund_status)
        VALUES (NEW.pnr_no, NOW(), fare_amt, 'Calculated');
        
        -- Free the seat in train_status by reducing the booked seat count.
        IF class_type = 'AC' THEN
            UPDATE train_status 
            SET seats_b_ac = GREATEST(seats_b_ac - 1, 0)
            WHERE t_number = t_no AND t_date = t_dt;
        ELSEIF class_type = 'Sleeper' THEN
            UPDATE train_status 
            SET seats_b_sleeper = GREATEST(seats_b_sleeper - 1, 0)
            WHERE t_number = t_no AND t_date = t_dt;
        END IF;
    END IF;
END$$


-- Triger : after_ticket_cancel
-- After ticket insertion  for populating all the tables according to the input data 

CREATE TRIGGER after_ticket_insert
AFTER INSERT ON ticket
FOR EACH ROW
BEGIN
    DECLARE coach VARCHAR(10);
    DECLARE uname VARCHAR(50);
    DECLARE pname VARCHAR(100);
    DECLARE age INT DEFAULT 30;
    DECLARE gender CHAR(1) DEFAULT 'M';

    SET uname = NEW.booked_by;
    SET coach = NEW.coach;

    -- Just for this example: using defaults or dummy values for passenger
    SET pname = 'Passenger1';  

    CALL assign_berth(
        NEW.pnr_no,
        NEW.t_number,
        NEW.t_date,
        NEW.coach,
        'C1',
        pname,
        age,
        gender,
        NEW.src_station_code,
        NEW.dest_station_code
    );
END$$
DELIMITER ;
