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
-- Table structure for table `train_running_days`
--

DROP TABLE IF EXISTS `train_running_days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train_running_days` (
  `t_number` int NOT NULL,
  `weekday` varchar(10) NOT NULL,
  PRIMARY KEY (`t_number`,`weekday`),
  CONSTRAINT `train_running_days_ibfk_1` FOREIGN KEY (`t_number`) REFERENCES `train` (`t_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train_running_days`
--

LOCK TABLES `train_running_days` WRITE;
/*!40000 ALTER TABLE `train_running_days` DISABLE KEYS */;
INSERT INTO `train_running_days` VALUES (10101,'Friday'),(10101,'Monday'),(10101,'Saturday'),(10101,'Sunday'),(10101,'Thursday'),(10101,'Tuesday'),(10101,'Wednesday'),(10202,'Friday'),(10202,'Monday'),(10202,'Saturday'),(10202,'Sunday'),(10202,'Thursday'),(10202,'Tuesday'),(10202,'Wednesday'),(10303,'Friday'),(10303,'Monday'),(10303,'Saturday'),(10303,'Sunday'),(10303,'Thursday'),(10303,'Tuesday'),(10303,'Wednesday'),(10404,'Friday'),(10404,'Monday'),(10404,'Saturday'),(10404,'Sunday'),(10404,'Thursday'),(10404,'Tuesday'),(10404,'Wednesday'),(10505,'Friday'),(10505,'Monday'),(10505,'Saturday'),(10505,'Sunday'),(10505,'Thursday'),(10505,'Tuesday'),(10505,'Wednesday'),(10606,'Friday'),(10606,'Monday'),(10606,'Saturday'),(10606,'Sunday'),(10606,'Thursday'),(10606,'Tuesday'),(10606,'Wednesday'),(10707,'Friday'),(10707,'Monday'),(10707,'Saturday'),(10707,'Sunday'),(10707,'Thursday'),(10707,'Tuesday'),(10707,'Wednesday'),(10808,'Friday'),(10808,'Monday'),(10808,'Saturday'),(10808,'Sunday'),(10808,'Thursday'),(10808,'Tuesday'),(10808,'Wednesday'),(10909,'Friday'),(10909,'Monday'),(10909,'Saturday'),(10909,'Sunday'),(10909,'Thursday'),(10909,'Tuesday'),(10909,'Wednesday'),(11010,'Friday'),(11010,'Monday'),(11010,'Saturday'),(11010,'Sunday'),(11010,'Thursday'),(11010,'Tuesday'),(11010,'Wednesday');
/*!40000 ALTER TABLE `train_running_days` ENABLE KEYS */;
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
