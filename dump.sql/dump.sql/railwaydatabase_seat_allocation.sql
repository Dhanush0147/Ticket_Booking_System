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
-- Table structure for table `seat_allocation`
--

DROP TABLE IF EXISTS `seat_allocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat_allocation` (
  `pnr_no` int NOT NULL,
  `t_number` int DEFAULT NULL,
  `t_date` date DEFAULT NULL,
  `class_type` varchar(10) DEFAULT NULL,
  `coach` varchar(10) DEFAULT NULL,
  `berth_no` int DEFAULT NULL,
  `berth_type` varchar(10) DEFAULT NULL,
  `allocated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pnr_no`),
  KEY `t_number` (`t_number`),
  CONSTRAINT `seat_allocation_ibfk_1` FOREIGN KEY (`pnr_no`) REFERENCES `ticket` (`pnr_no`),
  CONSTRAINT `seat_allocation_ibfk_2` FOREIGN KEY (`t_number`) REFERENCES `train` (`t_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat_allocation`
--

LOCK TABLES `seat_allocation` WRITE;
/*!40000 ALTER TABLE `seat_allocation` DISABLE KEYS */;
INSERT INTO `seat_allocation` VALUES (1001,10101,'2025-05-01','AC','A1',12,'LB','2025-04-30 08:01:30'),(1002,10202,'2025-05-01','sleeper','A2',7,'LB','2025-04-30 08:06:30'),(1003,10303,'2025-05-01','AC','B1',22,'MB','2025-04-30 08:11:30'),(1004,10404,'2025-05-01','sleeper','B2',5,'LB','2025-04-30 08:16:30'),(1005,10505,'2025-05-01','AC','A1',8,'UB','2025-04-30 08:21:30'),(1006,10101,'2025-05-01','sleeper','A1',10,'LB','2025-04-30 08:26:30'),(1007,10202,'2025-05-01','AC','A2',15,'UB','2025-04-30 08:31:30'),(1008,10303,'2025-05-01','sleeper','B1',20,'MB','2025-04-30 08:36:30'),(1009,10404,'2025-05-01','AC','B2',11,'LB','2025-04-30 08:41:30'),(1010,10505,'2025-05-01','sleeper','A1',9,'UB','2025-04-30 08:46:30'),(1011,10101,'2025-05-01','AC','A2',14,'MB','2025-04-30 08:51:30'),(1012,10202,'2025-05-01','sleeper','B1',6,'LB','2025-04-30 08:56:30'),(1014,10404,'2025-05-01','sleeper','A1',16,'MB','2025-04-30 09:06:30'),(1015,10505,'2025-05-01','AC','A2',12,'LB','2025-04-30 09:11:30'),(1016,10101,'2025-05-01','sleeper','B1',7,'LB','2025-04-30 09:16:30'),(1047,10202,'2025-05-01','AC','A3',47,'SL','2025-04-14 12:57:56'),(1050,10202,'2025-05-01','AC','A3',19,'UB','2025-04-14 13:04:01'),(99266,10202,'2025-05-01','AC','A3',35,'UB','2025-04-14 12:39:57');
/*!40000 ALTER TABLE `seat_allocation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-23 19:59:41
