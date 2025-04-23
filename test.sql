-- 1. Check email availability
CALL check_email_registered('user50@example.com');
CALL check_email_registered('newuser@example.com');

-- 2. Check username availability
CALL check_username_registered('user25');
CALL check_username_registered('newuser123');

-- 3. Validate admin credentials
CALL check_admin_credentials('admin1', 'pass1'); -- Valid
CALL check_admin_credentials('admin1', 'wrongpass'); -- Invalid

-- 4. Validate user credentials
CALL check_user_credentials('user35', 'pwd35'); -- Valid
CALL check_user_credentials('user35', 'wrongpwd'); -- Invalid

-- 5. Check train validity
CALL check_train_details(10101, '2025-05-01'); -- Valid date
CALL check_train_details(99999, '2025-05-01'); -- Invalid train

-- 6. Check seat availability
CALL check_seats_availability(10101, '2025-05-01', 'AC', 3); -- Check availability
CALL check_seats_availability(10101, '2025-05-01', 'Sleeper', 10);

-- 7. Generate PNR
CALL generate_pnr('user10', 10202, '2025-05-01', @new_pnr);
SELECT @new_pnr;

-- 8. Assign berth (assuming @new_pnr from above)

set @new_pnr = 1050;
CALL assign_berth(@new_pnr, 10202, '2025-05-01', 'AC', 'A3', 'Emma Watson', 28, 'F');


-- 9. Cancel ticket
CALL cancel_ticket(1004); -- Cancels ticket and processes refund

-- 10. Calculate ticket fare
SET @fare = 0;
CALL calculate_ticket_fare(10101, 'DEL', 'MUM', 'AC', @fare);
SELECT @fare AS calculated_fare;

-- 11. Apply concession
SET @base = 500.00;
CALL apply_concession(@base, 'Senior Citizen', @final);
SELECT @final AS discounted_fare;

-- 12. Check valid PNR
CALL check_valid_pnr(1001); -- Valid
CALL check_valid_pnr(9999); -- Invalid

-- 13. List passengers on a train
CALL list_passengers(10101, '2025-05-01');

-- 14. Check busiest route
CALL busiest_route();

-- 15. Generate itemized bill
CALL generate_itemized_bill(1013);
delete from fare where distance <> 100 and class_type = 'AC' or class_type = 'sleeper';
insert into fare values ('sleeper',100,120.00);
call calculate_ticket_fare(10202,'CHN','MUM','AC',@total_fare);
select @total_fare;
-- 16. Test trigger: Prevent overbooking
-- This should throw an error
UPDATE train_status SET seats_b_ac = 3 WHERE t_number = 10101 AND t_date = '2025-05-01';

-- 17. Test trigger: Prevent duplicate berth assignment
-- This should throw an error
INSERT INTO passenger (t_number, t_date, name, age, gender, pnr_no, berth_no, berth_type, coach_no)
VALUES (10101, '2025-05-01', 'Test Passenger', 30, 'M', 1001, 25, 'LB', 'A1');

-- 18. Test refund trigger by updating ticket status
UPDATE ticket SET status = 'Cancelled' WHERE pnr_no = 1015;

-- Verify refund log and seat availability
SELECT * FROM refund_log WHERE pnr_no = 1015;
call cancel_ticket('1013');

SELECT * FROM train_status WHERE t_number = 10101 AND t_date = '2025-05-01';

-- 19. Check total revenue
CALL total_revenue('2025-04-30', '2025-05-01');

-- 20. View train schedules
SELECT * FROM train_schedules WHERE t_number = 10101;