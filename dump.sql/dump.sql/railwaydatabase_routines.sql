-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: railwaydatabase
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `train_details`
--

DROP TABLE IF EXISTS `train_details`;
/*!50001 DROP VIEW IF EXISTS `train_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `train_details` AS SELECT 
 1 AS `t_number`,
 1 AS `t_date`,
 1 AS `train_name`,
 1 AS `coach_no`,
 1 AS `num_ac`,
 1 AS `num_sleeper`,
 1 AS `seats_b_ac`,
 1 AS `seats_b_sleeper`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `train_schedules`
--

DROP TABLE IF EXISTS `train_schedules`;
/*!50001 DROP VIEW IF EXISTS `train_schedules`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `train_schedules` AS SELECT 
 1 AS `t_number`,
 1 AS `t_date`,
 1 AS `train_name`,
 1 AS `station_code`,
 1 AS `station_name`,
 1 AS `arrival_time`,
 1 AS `departure_time`,
 1 AS `stop_number`,
 1 AS `distance`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `train_details`
--

/*!50001 DROP VIEW IF EXISTS `train_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `train_details` AS select `t`.`t_number` AS `t_number`,`t`.`t_date` AS `t_date`,`t`.`train_name` AS `train_name`,`t`.`coach_no` AS `coach_no`,`t`.`num_ac` AS `num_ac`,`t`.`num_sleeper` AS `num_sleeper`,`ts`.`seats_b_ac` AS `seats_b_ac`,`ts`.`seats_b_sleeper` AS `seats_b_sleeper` from (`train` `t` join `train_status` `ts` on(((`t`.`t_number` = `ts`.`t_number`) and (`t`.`t_date` = `ts`.`t_date`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `train_schedules`
--

/*!50001 DROP VIEW IF EXISTS `train_schedules`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `train_schedules` AS select `t`.`t_number` AS `t_number`,`t`.`t_date` AS `t_date`,`t`.`train_name` AS `train_name`,`s`.`station_code` AS `station_code`,`s`.`station_name` AS `station_name`,`r`.`arrival_time` AS `arrival_time`,`r`.`departure_time` AS `departure_time`,`r`.`stop_number` AS `stop_number`,`r`.`distance` AS `distance` from ((`train` `t` join `route` `r` on((`t`.`t_number` = `r`.`t_number`))) join `station` `s` on((`r`.`station_code` = `s`.`station_code`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'railwaydatabase'
--

--
-- Dumping routines for database 'railwaydatabase'
--
/*!50003 DROP PROCEDURE IF EXISTS `apply_concession` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `apply_concession`(IN base_fare DECIMAL(10,2), IN con_type VARCHAR(50), OUT final_fare DECIMAL(10,2))
BEGIN
    DECLARE discount INT;
    SELECT discount_percent INTO discount FROM concession WHERE concession_type = con_type;
    SET final_fare = base_fare - (base_fare * discount / 100);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `assign_berth` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `assign_berth`( 
    IN in_pnr INT,
    IN in_t_number INT,
    IN in_t_date DATE,
    IN in_class_type VARCHAR(10),
    IN in_coach VARCHAR(10),
    IN passenger_name VARCHAR(100),
    IN age INT,
    IN gender CHAR(1)
)
BEGIN
    DECLARE new_berth INT;
    DECLARE max_berths INT DEFAULT 72;
    DECLARE attempts INT DEFAULT 0;
    DECLARE b_type VARCHAR(20);

    -- Try to find an unallocated berth (max 100 attempts to avoid infinite loop)
    REPEAT
        SET new_berth = FLOOR(RAND() * max_berths) + 1;
        SET attempts = attempts + 1;
    UNTIL NOT EXISTS (
        SELECT 1 FROM seat_allocation
         WHERE t_number = in_t_number AND t_date = in_t_date AND coach = in_coach AND berth_no = new_berth
    ) OR attempts >= 100
    END REPEAT;

    -- Optional: handle if no seat found
    IF attempts >= 100 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Unable to allocate berth after 100 attempts.';
    END IF;
	
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

    -- Insert into seat_allocation
    INSERT INTO seat_allocation (
        pnr_no, t_number, t_date, class_type, coach, berth_no, berth_type
    )
    VALUES (
        in_pnr, in_t_number, in_t_date, in_class_type, in_coach, new_berth, b_type
    );

    INSERT INTO passenger (t_number, t_date, pnr_no, name, age, gender, coach_no, berth_no, berth_type, concession_type, status)
    VALUES (in_t_number, in_t_date, in_pnr, passenger_name, age, gender, in_coach, new_berth, b_type, 'none', 'Confirmed');
    IF in_class_type = 'AC' THEN 
        UPDATE train_status 
        SET seats_b_ac = seats_b_ac + 1
        WHERE train_status.t_number = in_t_number AND train_status.t_date = in_t_date;
    ELSE 
        UPDATE train_status 
        SET seats_b_sleeper = seats_b_sleeper + 1
        WHERE train_status.t_number = in_t_number AND train_status.t_date = in_t_date; 
    END IF;   
    SELECT CONCAT('Berth assigned: ', in_coach, '-', new_berth, ' (', b_type, ')') AS message ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `busiest_route` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `busiest_route`()
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `calculate_fare` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `calculate_fare`(IN in_class_type VARCHAR(20), IN in_distance INT, OUT total_fare DECIMAL(10,2))
BEGIN
    SELECT price INTO total_fare FROM fare WHERE class_type = in_class_type AND distance = in_distance;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `calculate_ticket_fare` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `calculate_ticket_fare`(
    IN in_t_number INT, 
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cancel_ticket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cancel_ticket`(IN in_pnr INT)
BEGIN
    DECLARE t_no INT;
    DECLARE t_dt DATE;
    DECLARE src VARCHAR(10);
    DECLARE dest VARCHAR(10);
    DECLARE class_type VARCHAR(20);
    DECLARE fare_amt DECIMAL(10,2) DEFAULT 0;
	

    SELECT t_number, t_date, src_station_code, dest_station_code
    INTO t_no, t_dt, src, dest
    FROM ticket WHERE pnr_no = in_pnr and ticket.status <> 'Cancelled' LIMIT 1;

	 select s.class_type into class_type from seat_allocation s  where pnr_no = in_pnr;

	
    CALL calculate_ticket_fare(t_no, src, dest, class_type, @fare_amt);
	select t_no, src, dest, class_type,@fare_amt;
	-- SELECT t_no, t_dt, src, dest, class_type;
    INSERT INTO refund_log (pnr_no, refund_time, refund_amount, refund_status)
    VALUES (in_pnr, NOW(), @fare_amt * 0.9, 'Calculated');

    IF class_type = 'AC' THEN
        UPDATE train_status
        SET seats_b_ac = GREATEST(seats_b_ac - 1, 0)
        WHERE t_number = t_no AND t_date = t_dt;
    ELSEIF class_type = 'Sleeper' THEN
        UPDATE train_status
        SET seats_b_sleeper = GREATEST(seats_b_sleeper - 1, 0)
        WHERE t_number = t_no AND t_date = t_dt;
    END IF;
    if @fare_amt<>0
    then 
        UPDATE ticket SET status = 'Cancelled' WHERE pnr_no = in_pnr;
    UPDATE passenger SET status = 'Cancelled' WHERE pnr_no = in_pnr;

    delete from seat_allocation where pnr_no = in_pnr;
     delete from passenger where pnr_no = in_pnr; 
   else 
   select concat("tickey is already cancelled " , "");
	end if ;
    

    -- SELECT CONCAT('Ticket cancelled. Refund Amount: ₹', fare_amt * 0.9) AS message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_admin_credentials` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_admin_credentials`(IN uname_input VARCHAR(50), IN pwd_input VARCHAR(50))
BEGIN
    IF EXISTS (SELECT 1 FROM admin WHERE username = uname_input AND password = pwd_input) THEN
        SELECT 'Valid admin credentials' AS message;
    ELSE
        SELECT 'Invalid credentials' AS message;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_email_registered` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_email_registered`(IN email_input VARCHAR(100))
BEGIN
    IF EXISTS (SELECT 1 FROM user WHERE email = email_input) THEN
        SELECT 'Email already registered' AS message;
    ELSE
        SELECT 'Email available' AS message;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_seats_availability` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_seats_availability`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_train_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_train_details`(IN train_no_input INT, IN journey_date DATE)
BEGIN
    IF journey_date < CURRENT_DATE THEN
        SELECT 'Invalid date: in the past' AS message;
    ELSEIF journey_date > DATE_ADD(CURRENT_DATE, INTERVAL 2 MONTH) THEN
        SELECT 'Invalid date: more than 2 months in future' AS message;
    ELSEIF NOT EXISTS (SELECT 1 FROM train WHERE t_number = train_no_input) THEN
        SELECT 'Train not available' AS message;
    ELSE
		IF NOT EXISTS (SELECT 1 FROM train_running_days where t_number=train_no_input AND weekday=DAYNAME(journey_date)) THEN
		SELECT 'Train not avaliable on that day' AS message;
        ELSE 
		SELECT 'Train and date valid' AS message; 
        END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_username_registered` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_username_registered`(IN uname_input VARCHAR(50))
BEGIN
    IF EXISTS (SELECT 1 FROM user WHERE username = uname_input) THEN
        SELECT 'Username already taken' AS message;
    ELSE
        SELECT 'Username available' AS message;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_user_credentials` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_user_credentials`(IN uname_input VARCHAR(50), IN pwd_input VARCHAR(50))
BEGIN
    IF EXISTS (SELECT 1 FROM user WHERE username = uname_input AND password = pwd_input) THEN
        SELECT 'Valid user credentials' AS message;
    ELSE
        SELECT 'Invalid credentials' AS message;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_valid_pnr` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_valid_pnr`(IN input_pnr BIGINT)
BEGIN
    IF EXISTS (SELECT 1 FROM ticket WHERE pnr_no = input_pnr) THEN
        SELECT 'Valid PNR' AS message;
    ELSE
        SELECT 'Invalid PNR' AS message;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generate_itemized_bill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_itemized_bill`(IN in_pnr BIGINT)
BEGIN
    DECLARE base_fare DECIMAL(10,2) DEFAULT 0;
    DECLARE concession_amt DECIMAL(10,2) DEFAULT 0;
    DECLARE total DECIMAL(10,2) DEFAULT 0;
    DECLARE t_no INT;
    DECLARE src VARCHAR(10);
    DECLARE dest VARCHAR(10);
    DECLARE class_type VARCHAR(20);
    DECLARE con_type VARCHAR(50);

    -- Get ticket details
    SELECT 
        t.t_number, 
        t.src_station_code, 
        t.dest_station_code, 
        p.concession_type
    INTO t_no, src, dest, con_type
    FROM ticket t
	JOIN passenger p ON t.pnr_no = p.pnr_no
    WHERE t.pnr_no = in_pnr
    LIMIT 1;
    
    select s.class_type into class_type from seat_allocation s where s.pnr_no = in_pnr limit 1;
		

    -- Calculate base fare
    CALL calculate_ticket_fare(t_no, src, dest, class_type, base_fare);
    -- Get concession discount (handle missing concessions)
    SELECT 
        COALESCE(c.discount_percent, 0) 
    INTO concession_amt 
    FROM concession c
    WHERE c.concession_type = con_type;

    -- Calculate total
    SET total = base_fare - (base_fare * concession_amt / 100);

    -- Build bill message
    
    SELECT 
        CONCAT(
            'Itemized Bill for PNR: ', in_pnr, 
            '\nBase Fare: ₹', COALESCE(base_fare, 0.00),
            '\nConcession: ', COALESCE(concession_amt, 0), '%',
            '\nTotal: ₹', COALESCE(total, 0.00)
        ) AS bill;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generate_pnr` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_pnr`(
    IN in_booked_by VARCHAR(50),
    IN in_train_no INT,
    IN journey_date DATE,
    OUT new_pnr BIGINT
)
BEGIN
    SET new_pnr = FLOOR(RAND() * 899999) + 1000;
    INSERT INTO ticket (pnr_no, coach, booked_by, booked_at, t_number, t_date, status, payment_status)
    VALUES (new_pnr, NULL, in_booked_by, NOW(), in_train_no, journey_date, 'Booked', 'Success');
    SELECT new_pnr AS pnr_generated;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `list_passengers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `list_passengers`(IN in_train_no INT, IN in_t_date DATE)
BEGIN
    SELECT * FROM passenger 
    WHERE t_number = in_train_no AND t_date = in_t_date AND status <> 'Cancelled';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `list_waitlisted` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `list_waitlisted`(IN in_train_no INT)
BEGIN
    SELECT t.*, w.position, w.waitlist_type 
    FROM ticket t
    JOIN waitlist w ON t.pnr_no = w.pnr_no
    WHERE t.t_number = in_train_no AND t.status = 'Waitlisted'
    ORDER BY w.position;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `lookup_train_schedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `lookup_train_schedule`(IN src_station VARCHAR(10), IN dest_station VARCHAR(10), IN in_t_date DATE)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `total_revenue` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `total_revenue`(IN start_date DATE, IN end_date DATE)
BEGIN
    SELECT SUM(p.amount) AS revenue
    FROM payment p
    JOIN ticket t ON p.pnr_no = t.pnr_no
    WHERE t.booked_at BETWEEN start_date AND end_date
      AND t.status <> 'Cancelled';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-23 19:59:43
