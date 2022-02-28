-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: farmtopia
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `farms_has_crops`
--

DROP TABLE IF EXISTS `farms_has_crops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `farms_has_crops` (
  `id` int NOT NULL AUTO_INCREMENT,
  `farms_id` int NOT NULL,
  `crops_id` int NOT NULL,
  `quantity` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`,`farms_id`,`crops_id`),
  KEY `farms_has_crops_ibfk_1_idx` (`farms_id`),
  KEY `farms_has_crops_ibfk_1_idx1` (`crops_id`),
  CONSTRAINT `farms_has_crops_ibfk_1` FOREIGN KEY (`farms_id`) REFERENCES `farms` (`id`),
  CONSTRAINT `farms_has_crops_ibfk_2` FOREIGN KEY (`crops_id`) REFERENCES `crops` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farms_has_crops`
--

LOCK TABLES `farms_has_crops` WRITE;
/*!40000 ALTER TABLE `farms_has_crops` DISABLE KEYS */;
INSERT INTO `farms_has_crops` VALUES (1,1,1,'3kg'),(3,3,3,'4Kg'),(4,1,2,'5kg'),(5,2,4,'4T'),(6,3,2,'5Kg');
/*!40000 ALTER TABLE `farms_has_crops` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-28 14:28:27
