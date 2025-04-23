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
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger` (
  `t_number` int DEFAULT NULL,
  `t_date` date DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `pnr_no` int NOT NULL,
  `berth_no` varchar(10) NOT NULL,
  `berth_type` varchar(20) DEFAULT NULL,
  `coach_no` varchar(10) NOT NULL,
  `concession_type` varchar(50) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Confirmed',
  PRIMARY KEY (`pnr_no`,`berth_no`,`coach_no`),
  KEY `concession_type` (`concession_type`),
  CONSTRAINT `passenger_ibfk_1` FOREIGN KEY (`pnr_no`) REFERENCES `ticket` (`pnr_no`),
  CONSTRAINT `passenger_ibfk_2` FOREIGN KEY (`concession_type`) REFERENCES `concession` (`concession_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (10101,'2025-05-01','Alice A',30,'F',1001,'12','LB','A1','None','Confirmed'),(10101,'2025-05-01','Bob B',45,'M',1001,'13','UB','A1','Senior Citizen','Confirmed'),(10101,'2025-05-01','Test Passenger',30,'M',1001,'25','LB','A1',NULL,'Confirmed'),(10202,'2025-05-01','Charlie C',25,'M',1002,'7','LB','A2','Student','Confirmed'),(10303,'2025-05-01','Diana D',35,'F',1003,'22','MB','B1','None','Confirmed'),(10404,'2025-05-01','Evan E',50,'M',1004,'5','LB','B2','Military','Cancelled'),(10505,'2025-05-01','Fiona F',28,'F',1005,'8','UB','A1','None','Confirmed'),(10101,'2025-05-01','George G',40,'M',1006,'10','LB','A1','None','Confirmed'),(10202,'2025-05-01','Hannah H',32,'F',1007,'15','UB','A2','Student','Confirmed'),(10303,'2025-05-01','Ian I',29,'M',1008,'20','MB','B1','None','Confirmed'),(10404,'2025-05-01','Jane J',38,'F',1009,'11','LB','B2','Senior Citizen','Confirmed'),(10505,'2025-05-01','Kevin K',33,'M',1010,'9','UB','A1','None','Confirmed'),(10101,'2025-05-01','Laura L',27,'F',1011,'14','MB','A2','None','Cancelled'),(10202,'2025-05-01','Mike M',42,'M',1012,'6','LB','B1','Military','Cancelled'),(10404,'2025-05-01','Oscar O',36,'M',1014,'16','MB','A1','None','Cancelled'),(10505,'2025-05-01','Paula P',26,'F',1015,'12','LB','A2','None','Cancelled'),(10101,'2025-05-01','Quinn Q',39,'M',1016,'7','LB','B1','None','Cancelled'),(10202,'2025-05-01','Emma Watson',28,'F',1047,'47','SL','A3','none','Confirmed'),(10202,'2025-05-01','Emma Watson',28,'F',1050,'19','UB','A3','none','Confirmed');
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_berth_assign` BEFORE INSERT ON `passenger` FOR EACH ROW BEGIN
    IF EXISTS (
        SELECT 1 FROM passenger
        WHERE t_number = NEW.t_number AND t_date = NEW.t_date
          AND coach_no = NEW.coach_no AND berth_no = NEW.berth_no
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Berth already assigned';
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `prevent_double_booking` BEFORE INSERT ON `passenger` FOR EACH ROW BEGIN
    DECLARE cnt INT;
    SELECT COUNT(*) INTO cnt FROM passenger
    WHERE coach_no = NEW.coach_no AND berth_no = NEW.berth_no AND pnr_no = NEW.pnr_no;
    IF cnt > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Seat already booked for this PNR.';
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

-- Dump completed on 2025-04-23 19:59:41
