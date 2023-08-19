-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: chuyendoiso
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.27-MariaDB

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
-- Table structure for table `documentsviews`
--

DROP TABLE IF EXISTS `documentsviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documentsviews` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `views` int(11) DEFAULT 0 COMMENT 'số lượt truy cập trong ngày',
  `documentsId` bigint(20) NOT NULL,
  `statisticalDay` date DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `statisticalDay` (`statisticalDay`),
  KEY `documentsId` (`documentsId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='thống kê view documentsId';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentsviews`
--

LOCK TABLES `documentsviews` WRITE;
/*!40000 ALTER TABLE `documentsviews` DISABLE KEYS */;
INSERT INTO `documentsviews` VALUES (1,1,1,'2022-12-19'),(2,39,6,'2022-12-21'),(3,13,6,'2022-12-22'),(4,7,1,'2022-12-22'),(5,4,5,'2022-12-22'),(6,2,10,'2022-12-23'),(7,4,8,'2022-12-23'),(8,1,9,'2022-12-23'),(9,2,6,'2022-12-23'),(10,1,6,'2022-12-30'),(11,10,11,'2023-01-11'),(12,2,8,'2023-01-11'),(13,3,10,'2023-01-11'),(14,7,7,'2023-01-17'),(15,3,9,'2023-01-17'),(16,4,11,'2023-01-17'),(17,1,6,'2023-01-18');
/*!40000 ALTER TABLE `documentsviews` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:18:55
