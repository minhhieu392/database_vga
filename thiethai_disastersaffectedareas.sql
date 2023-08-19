-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: thiethai
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
-- Table structure for table `disastersaffectedareas`
--

DROP TABLE IF EXISTS `disastersaffectedareas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disastersaffectedareas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `disastersId` bigint(20) DEFAULT NULL,
  `provincesId` bigint(20) DEFAULT 0,
  `districtsId` bigint(20) DEFAULT 0,
  `wardsId` bigint(20) DEFAULT 0,
  `zone` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `disastersId` (`disastersId`),
  KEY `provincesId` (`provincesId`),
  KEY `districtsId` (`districtsId`),
  KEY `zone` (`zone`),
  KEY `wardsId` (`wardsId`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='vùng ảnh hưởng sự kiện thiên tai';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disastersaffectedareas`
--

LOCK TABLES `disastersaffectedareas` WRITE;
/*!40000 ALTER TABLE `disastersaffectedareas` DISABLE KEYS */;
INSERT INTO `disastersaffectedareas` VALUES (2,2,43,386,5538,3),(3,1,43,386,5532,3),(4,3,43,386,5538,3),(5,4,43,386,5538,3),(6,5,21,328,4880,3),(7,6,43,386,5532,3),(8,7,43,386,5533,3),(9,8,43,386,5530,3),(10,9,43,386,5533,3),(11,10,43,386,5533,3),(12,11,43,386,5538,3),(13,12,43,386,5533,3),(14,13,43,386,5533,3),(15,14,43,386,5533,3),(16,15,8,91,1344,3),(17,15,8,91,1349,3),(18,16,62,460,6844,3),(19,16,62,460,6855,3),(20,17,62,460,6831,3),(21,17,62,460,6823,3),(22,17,62,460,6876,3),(23,17,62,460,6844,3),(24,17,62,460,6852,3),(25,17,62,460,6855,3),(26,18,8,93,1319,3),(27,19,52,587,8885,3);
/*!40000 ALTER TABLE `disastersaffectedareas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:15:55
