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
-- Table structure for table `countonline`
--

DROP TABLE IF EXISTS `countonline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countonline` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `countAccess` int(11) DEFAULT 0 COMMENT 'số lượt truy cập trong ngày',
  `currentOnline` int(11) DEFAULT 0 COMMENT 'số người đang online',
  `onlineDate` date DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `onlineDate` (`onlineDate`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='bảng đếm số lượt truy cập theo ngày';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countonline`
--

LOCK TABLES `countonline` WRITE;
/*!40000 ALTER TABLE `countonline` DISABLE KEYS */;
INSERT INTO `countonline` VALUES (1,128,-32,'2022-12-19'),(2,200,0,'2022-12-18'),(7,166,0,'2022-12-21'),(8,78,0,'2022-12-22'),(9,143,0,'2022-12-23'),(10,77,0,'2022-12-26'),(11,16,0,'2022-12-27'),(12,4,0,'2022-12-28'),(13,5,0,'2022-12-29'),(14,1,0,'2022-12-31'),(15,7,0,'2023-01-01'),(16,1,0,'2023-01-02'),(17,27,0,'2023-01-03'),(18,32,0,'2023-01-04'),(19,32,0,'2023-01-05'),(20,2,0,'2023-01-07'),(21,23,0,'2023-01-09'),(22,5,0,'2023-01-10'),(23,68,0,'2023-01-11'),(24,3,0,'2023-01-12'),(25,5,0,'2023-01-13'),(26,3,0,'2023-01-15'),(27,5,0,'2023-01-16'),(28,23,0,'2023-01-17'),(29,5,0,'2023-01-18');
/*!40000 ALTER TABLE `countonline` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:18:47
