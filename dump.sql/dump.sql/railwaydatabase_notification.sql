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
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `message` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,'user1','Your ticket has been booked successfully.','2025-04-30 08:01:00'),(2,'user2','Your payment has been received.','2025-04-30 08:06:00'),(3,'user3','Your seat has been allocated.','2025-04-30 08:11:00'),(4,'user4','Your ticket has been cancelled.','2025-04-30 08:16:00'),(5,'user5','Refund process initiated.','2025-04-30 08:21:00'),(6,'user6','Your ticket has been booked successfully.','2025-04-30 08:26:00'),(7,'user7','Your payment has been received.','2025-04-30 08:31:00'),(8,'user8','Your seat has been allocated.','2025-04-30 08:36:00'),(9,'user9','Your ticket has been cancelled.','2025-04-30 08:41:00'),(10,'user10','Refund process initiated.','2025-04-30 08:46:00'),(11,'user11','Your ticket has been booked successfully.','2025-04-30 08:51:00'),(12,'user12','Your payment has been received.','2025-04-30 08:56:00'),(13,'user13','Your seat has been allocated.','2025-04-30 09:01:00'),(14,'user14','Your ticket has been cancelled.','2025-04-30 09:06:00'),(15,'user15','Refund process initiated.','2025-04-30 09:11:00'),(16,'user16','Your ticket has been booked successfully.','2025-04-30 09:16:00'),(17,'user17','Your payment has been received.','2025-04-30 09:21:00'),(18,'user18','Your seat has been allocated.','2025-04-30 09:26:00'),(19,'user19','Your ticket has been cancelled.','2025-04-30 09:31:00'),(20,'user20','Refund process initiated.','2025-04-30 09:36:00'),(21,'user21','Your ticket has been booked successfully.','2025-04-30 09:41:00'),(22,'user22','Your payment has been received.','2025-04-30 09:46:00'),(23,'user23','Your seat has been allocated.','2025-04-30 09:51:00'),(24,'user24','Your ticket has been cancelled.','2025-04-30 09:56:00'),(25,'user25','Refund process initiated.','2025-04-30 10:01:00'),(26,'user26','Your ticket has been booked successfully.','2025-04-30 10:06:00'),(27,'user27','Your payment has been received.','2025-04-30 10:11:00'),(28,'user28','Your seat has been allocated.','2025-04-30 10:16:00'),(29,'user29','Your ticket has been cancelled.','2025-04-30 10:21:00'),(30,'user30','Refund process initiated.','2025-04-30 10:26:00');
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
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
