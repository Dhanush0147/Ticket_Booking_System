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
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `pnr_no` int NOT NULL,
  `coach` varchar(20) DEFAULT NULL,
  `booked_by` varchar(50) DEFAULT NULL,
  `booked_at` datetime DEFAULT NULL,
  `t_number` int DEFAULT NULL,
  `t_date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Confirmed',
  `payment_status` varchar(20) DEFAULT 'Success',
  `src_station_code` varchar(10) DEFAULT NULL,
  `dest_station_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`pnr_no`),
  KEY `booked_by` (`booked_by`),
  KEY `t_number` (`t_number`,`t_date`),
  KEY `src_station_code` (`src_station_code`),
  KEY `dest_station_code` (`dest_station_code`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`booked_by`) REFERENCES `user` (`username`),
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`t_number`, `t_date`) REFERENCES `train` (`t_number`, `t_date`),
  CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`src_station_code`) REFERENCES `station` (`station_code`),
  CONSTRAINT `ticket_ibfk_4` FOREIGN KEY (`dest_station_code`) REFERENCES `station` (`station_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1001,'A1','user1','2025-04-30 08:00:00',10101,'2025-05-01','Confirmed','Paid','DEL','MUM'),(1002,'A2','user2','2025-04-30 08:05:00',10202,'2025-05-01','Confirmed','Paid','CHN','MUM'),(1003,'B1','user3','2025-04-30 08:10:00',10303,'2025-05-01','Confirmed','Paid','DEL','CCU'),(1004,'B2','user4','2025-04-30 08:15:00',10404,'2025-05-01','Confirmed','Paid','AHM','BLR'),(1005,'A1','user5','2025-04-30 08:20:00',10505,'2025-05-01','Confirmed','Paid','JAI','MUM'),(1006,'A1','user6','2025-04-30 08:25:00',10101,'2025-05-01','Cancelled','Paid','DEL','MUM'),(1007,'A2','user7','2025-04-30 08:30:00',10202,'2025-05-01','Confirmed','Paid','CHN','MUM'),(1008,'B1','user8','2025-04-30 08:35:00',10303,'2025-05-01','Confirmed','Paid','DEL','CCU'),(1009,'B2','user9','2025-04-30 08:40:00',10404,'2025-05-01','Confirmed','Paid','AHM','BLR'),(1010,'A1','user10','2025-04-30 08:45:00',10505,'2025-05-01','Confirmed','Paid','JAI','MUM'),(1011,'A2','user11','2025-04-30 08:50:00',10101,'2025-05-01','Cancelled','Paid','DEL','MUM'),(1012,'B1','user12','2025-04-30 08:55:00',10202,'2025-05-01','Cancelled','Paid','CHN','MUM'),(1013,'B2','user13','2025-04-30 09:00:00',10303,'2025-05-01','Cancelled','Paid','DEL','CCU'),(1014,'A1','user14','2025-04-30 09:05:00',10404,'2025-05-01','Cancelled','Refunded','AHM','BLR'),(1015,'A2','user15','2025-04-30 09:10:00',10505,'2025-05-01','Cancelled','Paid','JAI','MUM'),(1016,'B1','user16','2025-04-30 09:15:00',10101,'2025-05-01','Cancelled','Paid','DEL','MUM'),(1017,'B2','user17','2025-04-30 09:20:00',10202,'2025-05-01','Cancelled','Paid','CHN','MUM'),(1018,'A1','user18','2025-04-30 09:25:00',10303,'2025-05-01','Cancelled','Paid','DEL','CCU'),(1019,'A2','user19','2025-04-30 09:30:00',10404,'2025-05-01','Cancelled','Paid','AHM','BLR'),(1020,'B1','user20','2025-04-30 09:35:00',10505,'2025-05-01','Cancelled','Paid','JAI','MUM'),(1021,'B2','user21','2025-04-30 09:40:00',10101,'2025-05-01','Confirmed','Paid','DEL','MUM'),(1022,'A1','user22','2025-04-30 09:45:00',10202,'2025-05-01','Confirmed','Paid','CHN','MUM'),(1023,'A2','user23','2025-04-30 09:50:00',10303,'2025-05-01','Confirmed','Paid','DEL','CCU'),(1024,'B1','user24','2025-04-30 09:55:00',10404,'2025-05-01','Cancelled','Refunded','AHM','BLR'),(1025,'B2','user25','2025-04-30 10:00:00',10505,'2025-05-01','Confirmed','Paid','JAI','MUM'),(1026,'A1','user26','2025-04-30 10:05:00',10101,'2025-05-01','Confirmed','Paid','DEL','MUM'),(1027,'A2','user27','2025-04-30 10:10:00',10202,'2025-05-01','Confirmed','Paid','CHN','MUM'),(1028,'B1','user28','2025-04-30 10:15:00',10303,'2025-05-01','Confirmed','Paid','DEL','CCU'),(1029,'B2','user29','2025-04-30 10:20:00',10404,'2025-05-01','Confirmed','Paid','AHM','BLR'),(1030,'A1','user30','2025-04-30 10:25:00',10505,'2025-05-01','Confirmed','Paid','JAI','MUM'),(1031,'A2','user31','2025-04-30 10:30:00',10101,'2025-05-01','Confirmed','Paid','DEL','MUM'),(1032,'B1','user32','2025-04-30 10:35:00',10202,'2025-05-01','Confirmed','Paid','CHN','MUM'),(1033,'B2','user33','2025-04-30 10:40:00',10303,'2025-05-01','Confirmed','Paid','DEL','CCU'),(1034,'A1','user34','2025-04-30 10:45:00',10404,'2025-05-01','Cancelled','Refunded','AHM','BLR'),(1035,'A2','user35','2025-04-30 10:50:00',10505,'2025-05-01','Confirmed','Paid','JAI','MUM'),(1036,'B1','user36','2025-04-30 10:55:00',10101,'2025-05-01','Confirmed','Paid','DEL','MUM'),(1037,'B2','user37','2025-04-30 11:00:00',10202,'2025-05-01','Confirmed','Paid','CHN','MUM'),(1038,'A1','user38','2025-04-30 11:05:00',10303,'2025-05-01','Confirmed','Paid','DEL','CCU'),(1039,'A2','user39','2025-04-30 11:10:00',10404,'2025-05-01','Confirmed','Paid','AHM','BLR'),(1040,'B1','user40','2025-04-30 11:15:00',10505,'2025-05-01','Confirmed','Paid','JAI','MUM'),(1041,'B2','user41','2025-04-30 11:20:00',10101,'2025-05-01','Confirmed','Paid','DEL','MUM'),(1042,'A1','user42','2025-04-30 11:25:00',10202,'2025-05-01','Confirmed','Paid','CHN','MUM'),(1043,'A2','user43','2025-04-30 11:30:00',10303,'2025-05-01','Confirmed','Paid','DEL','CCU'),(1044,'B1','user44','2025-04-30 11:35:00',10404,'2025-05-01','Cancelled','Refunded','AHM','BLR'),(1045,'B2','user45','2025-04-30 11:40:00',10505,'2025-05-01','Confirmed','Paid','JAI','MUM'),(1046,'A1','user46','2025-04-30 11:45:00',10101,'2025-05-01','Confirmed','Paid','DEL','MUM'),(1047,'A2','user47','2025-04-30 11:50:00',10202,'2025-05-01','Confirmed','Paid','CHN','MUM'),(1048,'B1','user48','2025-04-30 11:55:00',10303,'2025-05-01','Confirmed','Paid','DEL','CCU'),(1049,'B2','user49','2025-04-30 12:00:00',10404,'2025-05-01','Confirmed','Paid','AHM','BLR'),(1050,'A1','user50','2025-04-30 12:05:00',10505,'2025-05-01','Confirmed','Paid','JAI','MUM'),(99266,NULL,'user10','2025-04-14 12:36:54',10202,'2025-05-01','Booked','Success',NULL,NULL),(385594,NULL,'user10','2025-04-16 20:02:47',10202,'2025-05-01','Booked','Success',NULL,NULL),(459558,NULL,'user10','2025-04-16 20:56:08',10202,'2025-05-01','Booked','Success',NULL,NULL),(772773,NULL,'user10','2025-04-16 20:56:48',10202,'2025-05-01','Booked','Success',NULL,NULL);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_ticket_update` BEFORE UPDATE ON `ticket` FOR EACH ROW BEGIN
    IF OLD.pnr_no <> NEW.pnr_no OR OLD.coach <> NEW.coach THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'PNR and Coach details cannot be updated';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `refund_on_cancel` AFTER UPDATE ON `ticket` FOR EACH ROW BEGIN
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
END */;;
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
