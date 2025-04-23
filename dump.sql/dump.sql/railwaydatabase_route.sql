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
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route` (
  `t_number` int NOT NULL,
  `station_code` varchar(10) NOT NULL,
  `arrival_time` time DEFAULT NULL,
  `departure_time` time DEFAULT NULL,
  `stop_number` int DEFAULT NULL,
  `distance` int NOT NULL,
  PRIMARY KEY (`t_number`,`station_code`),
  KEY `station_code` (`station_code`),
  CONSTRAINT `route_ibfk_1` FOREIGN KEY (`t_number`) REFERENCES `train` (`t_number`),
  CONSTRAINT `route_ibfk_2` FOREIGN KEY (`station_code`) REFERENCES `station` (`station_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (10101,'AGC','08:30:00','08:35:00',2,200),(10101,'DEL',NULL,'06:00:00',1,0),(10101,'JAI','10:30:00','10:35:00',3,150),(10101,'MUM','18:00:00',NULL,4,300),(10202,'BLR','09:00:00','09:05:00',2,250),(10202,'CHN',NULL,'07:00:00',1,0),(10202,'HYD','12:00:00','12:05:00',3,300),(10202,'MUM','16:30:00',NULL,4,200),(10303,'CCU','13:00:00',NULL,4,250),(10303,'DEL',NULL,'05:30:00',1,0),(10303,'LKO','07:00:00','07:05:00',2,120),(10303,'PAT','09:00:00','09:05:00',3,180),(10404,'AHM',NULL,'06:30:00',1,0),(10404,'BLR','15:30:00',NULL,4,300),(10404,'MUM','11:30:00','11:35:00',3,220),(10404,'SUR','08:30:00','08:35:00',2,180),(10505,'AGC','09:00:00','09:05:00',3,150),(10505,'AHM','12:00:00','12:05:00',4,200),(10505,'DEL','07:30:00','07:35:00',2,100),(10505,'JAI',NULL,'06:00:00',1,0),(10505,'MUM','17:00:00',NULL,5,250);
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-23 19:59:43
