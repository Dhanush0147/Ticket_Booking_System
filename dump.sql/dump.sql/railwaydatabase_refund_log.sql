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
-- Table structure for table `refund_log`
--

DROP TABLE IF EXISTS `refund_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refund_log` (
  `pnr_no` int DEFAULT NULL,
  `refund_time` datetime DEFAULT NULL,
  `refund_amount` decimal(10,2) DEFAULT NULL,
  `refund_status` varchar(20) DEFAULT 'Pending',
  KEY `pnr_no` (`pnr_no`),
  CONSTRAINT `refund_log_ibfk_1` FOREIGN KEY (`pnr_no`) REFERENCES `ticket` (`pnr_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund_log`
--

LOCK TABLES `refund_log` WRITE;
/*!40000 ALTER TABLE `refund_log` DISABLE KEYS */;
INSERT INTO `refund_log` VALUES (1004,'2025-05-01 12:00:00',580.00,'Calculated'),(1014,'2025-05-01 12:05:00',580.00,'Calculated'),(1024,'2025-05-01 12:10:00',580.00,'Calculated'),(1034,'2025-05-01 12:15:00',580.00,'Calculated'),(1044,'2025-05-01 12:20:00',580.00,'Calculated'),(1006,'2025-04-14 15:06:52',NULL,'Calculated'),(1015,'2025-04-14 15:10:06',NULL,'Calculated'),(1012,'2025-04-14 15:13:30',NULL,'Calculated'),(1012,'2025-04-14 15:13:30',NULL,'Calculated'),(1013,'2025-04-14 15:14:34',NULL,'Calculated'),(1013,'2025-04-14 15:14:34',NULL,'Calculated'),(1013,'2025-04-14 15:15:00',NULL,'Calculated'),(1013,'2025-04-14 15:18:12',NULL,'Calculated'),(1013,'2025-04-14 15:20:57',NULL,'Calculated'),(1013,'2025-04-14 15:21:33',NULL,'Calculated'),(1013,'2025-04-14 15:23:14',NULL,'Calculated'),(1013,'2025-04-14 15:23:48',NULL,'Calculated'),(1013,'2025-04-14 15:23:51',NULL,'Calculated'),(1013,'2025-04-14 15:24:09',NULL,'Calculated'),(1013,'2025-04-14 15:32:07',0.00,'Calculated'),(1013,'2025-04-14 15:32:51',0.00,'Calculated'),(1013,'2025-04-14 15:36:15',0.00,'Calculated'),(1012,'2025-04-14 15:36:31',0.00,'Calculated'),(1013,'2025-04-14 15:36:42',0.00,'Calculated'),(1015,'2025-04-14 15:37:38',0.00,'Calculated'),(1013,'2025-04-14 15:45:38',0.00,'Calculated'),(1015,'2025-04-14 15:45:54',0.00,'Calculated'),(1013,'2025-04-14 15:46:51',0.00,'Calculated'),(1013,'2025-04-14 15:48:24',0.00,'Calculated'),(1013,'2025-04-14 15:51:16',0.00,'Calculated'),(1013,'2025-04-14 15:51:40',0.00,'Calculated'),(1013,'2025-04-14 15:52:34',NULL,'Calculated'),(1013,'2025-04-14 15:54:01',0.00,'Calculated'),(1013,'2025-04-15 23:56:28',0.00,'Calculated'),(1013,'2025-04-16 00:02:52',0.00,'Calculated'),(1013,'2025-04-16 00:11:58',371.25,'Calculated'),(1013,'2025-04-16 00:42:41',371.25,'Calculated'),(1013,'2025-04-16 00:51:46',371.25,'Calculated'),(1013,'2025-04-16 00:52:28',0.00,'Calculated'),(1013,'2025-04-16 00:53:18',0.00,'Calculated'),(1013,'2025-04-16 00:54:56',0.00,'Calculated'),(1013,'2025-04-16 00:57:59',0.00,'Calculated'),(1004,'2025-04-16 20:04:23',0.00,'Calculated'),(1012,'2025-04-16 20:04:35',0.00,'Calculated'),(1014,'2025-04-16 20:04:44',0.00,'Calculated'),(1011,'2025-04-16 20:05:46',0.00,'Calculated'),(1011,'2025-04-16 20:05:46',0.00,'Calculated'),(1011,'2025-04-16 20:09:56',0.00,'Calculated'),(1016,'2025-04-16 20:11:10',0.00,'Calculated'),(1016,'2025-04-16 20:11:10',0.00,'Calculated'),(1004,'2025-04-16 20:20:04',0.00,'Calculated'),(1016,'2025-04-16 20:22:02',0.00,'Calculated'),(1017,'2025-04-16 20:23:18',506.25,'Calculated'),(1017,'2025-04-16 20:23:18',0.00,'Calculated'),(1013,'2025-04-16 20:30:36',0.00,'Calculated'),(1020,'2025-04-16 20:30:46',756.00,'Calculated'),(1020,'2025-04-16 20:30:46',0.00,'Calculated'),(1020,'2025-04-16 20:30:46',0.00,'Calculated'),(1021,'2025-04-16 20:30:57',0.00,'Calculated'),(1018,'2025-04-16 20:31:16',594.00,'Calculated'),(1018,'2025-04-16 20:31:16',0.00,'Calculated'),(1017,'2025-04-16 20:56:20',0.00,'Calculated'),(1018,'2025-04-16 20:56:48',0.00,'Calculated'),(1018,'2025-04-16 20:56:56',0.00,'Calculated'),(1019,'2025-04-16 20:57:16',472.50,'Calculated'),(1019,'2025-04-16 20:57:16',0.00,'Calculated');
/*!40000 ALTER TABLE `refund_log` ENABLE KEYS */;
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
