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
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `pnr_no` int DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_time` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `username` (`username`),
  KEY `pnr_no` (`pnr_no`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`),
  CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`pnr_no`) REFERENCES `ticket` (`pnr_no`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,'user1',1001,500.00,'2025-04-30 08:01:00','Success','TXN1001'),(2,'user2',1002,600.00,'2025-04-30 08:06:00','Success','TXN1002'),(3,'user3',1003,550.00,'2025-04-30 08:11:00','Success','TXN1003'),(4,'user4',1004,0.00,'2025-04-30 08:16:00','Refunded','TXN1004'),(5,'user5',1005,700.00,'2025-04-30 08:21:00','Success','TXN1005'),(6,'user6',1006,500.00,'2025-04-30 08:26:00','Success','TXN1006'),(7,'user7',1007,600.00,'2025-04-30 08:31:00','Success','TXN1007'),(8,'user8',1008,550.00,'2025-04-30 08:36:00','Success','TXN1008'),(9,'user9',1009,580.00,'2025-04-30 08:41:00','Success','TXN1009'),(10,'user10',1010,700.00,'2025-04-30 08:46:00','Success','TXN1010'),(11,'user11',1011,500.00,'2025-04-30 08:51:00','Success','TXN1011'),(12,'user12',1012,600.00,'2025-04-30 08:56:00','Success','TXN1012'),(13,'user13',1013,550.00,'2025-04-30 09:01:00','Success','TXN1013'),(14,'user14',1014,0.00,'2025-04-30 09:06:00','Refunded','TXN1014'),(15,'user15',1015,700.00,'2025-04-30 09:11:00','Success','TXN1015'),(16,'user16',1016,500.00,'2025-04-30 09:16:00','Success','TXN1016'),(17,'user17',1017,600.00,'2025-04-30 09:21:00','Success','TXN1017'),(18,'user18',1018,550.00,'2025-04-30 09:26:00','Success','TXN1018'),(19,'user19',1019,580.00,'2025-04-30 09:31:00','Success','TXN1019'),(20,'user20',1020,700.00,'2025-04-30 09:36:00','Success','TXN1020'),(21,'user21',1021,500.00,'2025-04-30 09:41:00','Success','TXN1021'),(22,'user22',1022,600.00,'2025-04-30 09:46:00','Success','TXN1022'),(23,'user23',1023,550.00,'2025-04-30 09:51:00','Success','TXN1023'),(24,'user24',1024,0.00,'2025-04-30 09:56:00','Refunded','TXN1024'),(25,'user25',1025,700.00,'2025-04-30 10:01:00','Success','TXN1025'),(26,'user26',1026,500.00,'2025-04-30 10:06:00','Success','TXN1026'),(27,'user27',1027,600.00,'2025-04-30 10:11:00','Success','TXN1027'),(28,'user28',1028,550.00,'2025-04-30 10:16:00','Success','TXN1028'),(29,'user29',1029,580.00,'2025-04-30 10:21:00','Success','TXN1029'),(30,'user30',1030,700.00,'2025-04-30 10:26:00','Success','TXN1030'),(31,'user31',1031,500.00,'2025-04-30 10:31:00','Success','TXN1031'),(32,'user32',1032,600.00,'2025-04-30 10:36:00','Success','TXN1032'),(33,'user33',1033,550.00,'2025-04-30 10:41:00','Success','TXN1033'),(34,'user34',1034,0.00,'2025-04-30 10:46:00','Refunded','TXN1034'),(35,'user35',1035,700.00,'2025-04-30 10:51:00','Success','TXN1035'),(36,'user36',1036,500.00,'2025-04-30 10:56:00','Success','TXN1036'),(37,'user37',1037,600.00,'2025-04-30 11:01:00','Success','TXN1037'),(38,'user38',1038,550.00,'2025-04-30 11:06:00','Success','TXN1038'),(39,'user39',1039,580.00,'2025-04-30 11:11:00','Success','TXN1039'),(40,'user40',1040,700.00,'2025-04-30 11:16:00','Success','TXN1040'),(41,'user41',1041,500.00,'2025-04-30 11:21:00','Success','TXN1041'),(42,'user42',1042,600.00,'2025-04-30 11:26:00','Success','TXN1042'),(43,'user43',1043,550.00,'2025-04-30 11:31:00','Success','TXN1043'),(44,'user44',1044,0.00,'2025-04-30 11:36:00','Refunded','TXN1044'),(45,'user45',1045,700.00,'2025-04-30 11:41:00','Success','TXN1045'),(46,'user46',1046,500.00,'2025-04-30 11:46:00','Success','TXN1046'),(47,'user47',1047,600.00,'2025-04-30 11:51:00','Success','TXN1047'),(48,'user48',1048,550.00,'2025-04-30 11:56:00','Success','TXN1048'),(49,'user49',1049,580.00,'2025-04-30 12:01:00','Success','TXN1049'),(50,'user50',1050,700.00,'2025-04-30 12:06:00','Success','TXN1050');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-23 19:59:42
