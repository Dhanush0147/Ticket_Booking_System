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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `username` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('user1','User One','user1@example.com','101 First St, CityA','pwd1'),('user10','User Ten','user10@example.com','110 First St, CityA','pwd10'),('user11','User Eleven','user11@example.com','111 First St, CityB','pwd11'),('user12','User Twelve','user12@example.com','112 First St, CityB','pwd12'),('user13','User Thirteen','user13@example.com','113 First St, CityB','pwd13'),('user14','User Fourteen','user14@example.com','114 First St, CityB','pwd14'),('user15','User Fifteen','user15@example.com','115 First St, CityB','pwd15'),('user16','User Sixteen','user16@example.com','116 First St, CityB','pwd16'),('user17','User Seventeen','user17@example.com','117 First St, CityB','pwd17'),('user18','User Eighteen','user18@example.com','118 First St, CityB','pwd18'),('user19','User Nineteen','user19@example.com','119 First St, CityB','pwd19'),('user2','User Two','user2@example.com','102 First St, CityA','pwd2'),('user20','User Twenty','user20@example.com','120 First St, CityB','pwd20'),('user21','User TwentyOne','user21@example.com','121 Second St, CityC','pwd21'),('user22','User TwentyTwo','user22@example.com','122 Second St, CityC','pwd22'),('user23','User TwentyThree','user23@example.com','123 Second St, CityC','pwd23'),('user24','User TwentyFour','user24@example.com','124 Second St, CityC','pwd24'),('user25','User TwentyFive','user25@example.com','125 Second St, CityC','pwd25'),('user26','User TwentySix','user26@example.com','126 Second St, CityC','pwd26'),('user27','User TwentySeven','user27@example.com','127 Second St, CityC','pwd27'),('user28','User TwentyEight','user28@example.com','128 Second St, CityC','pwd28'),('user29','User TwentyNine','user29@example.com','129 Second St, CityC','pwd29'),('user3','User Three','user3@example.com','103 First St, CityA','pwd3'),('user30','User Thirty','user30@example.com','130 Second St, CityC','pwd30'),('user31','User ThirtyOne','user31@example.com','131 Third St, CityD','pwd31'),('user32','User ThirtyTwo','user32@example.com','132 Third St, CityD','pwd32'),('user33','User ThirtyThree','user33@example.com','133 Third St, CityD','pwd33'),('user34','User ThirtyFour','user34@example.com','134 Third St, CityD','pwd34'),('user35','User ThirtyFive','user35@example.com','135 Third St, CityD','pwd35'),('user36','User ThirtySix','user36@example.com','136 Third St, CityD','pwd36'),('user37','User ThirtySeven','user37@example.com','137 Third St, CityD','pwd37'),('user38','User ThirtyEight','user38@example.com','138 Third St, CityD','pwd38'),('user39','User ThirtyNine','user39@example.com','139 Third St, CityD','pwd39'),('user4','User Four','user4@example.com','104 First St, CityA','pwd4'),('user40','User Forty','user40@example.com','140 Third St, CityD','pwd40'),('user41','User FortyOne','user41@example.com','141 Fourth St, CityE','pwd41'),('user42','User FortyTwo','user42@example.com','142 Fourth St, CityE','pwd42'),('user43','User FortyThree','user43@example.com','143 Fourth St, CityE','pwd43'),('user44','User FortyFour','user44@example.com','144 Fourth St, CityE','pwd44'),('user45','User FortyFive','user45@example.com','145 Fourth St, CityE','pwd45'),('user46','User FortySix','user46@example.com','146 Fourth St, CityE','pwd46'),('user47','User FortySeven','user47@example.com','147 Fourth St, CityE','pwd47'),('user48','User FortyEight','user48@example.com','148 Fourth St, CityE','pwd48'),('user49','User FortyNine','user49@example.com','149 Fourth St, CityE','pwd49'),('user5','User Five','user5@example.com','105 First St, CityA','pwd5'),('user50','User Fifty','user50@example.com','150 Fourth St, CityE','pwd50'),('user6','User Six','user6@example.com','106 First St, CityA','pwd6'),('user7','User Seven','user7@example.com','107 First St, CityA','pwd7'),('user8','User Eight','user8@example.com','108 First St, CityA','pwd8'),('user9','User Nine','user9@example.com','109 First St, CityA','pwd9');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-23 19:59:40
