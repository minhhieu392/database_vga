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
-- Table structure for table `disastergroupsdisasters`
--

DROP TABLE IF EXISTS `disastergroupsdisasters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disastergroupsdisasters` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `disastersId` bigint(20) NOT NULL,
  `disasterGroupsId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `disastersId` (`disastersId`),
  KEY `disasterGroupsId` (`disasterGroupsId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='bảng liên kết loại thiên tai và sự kiện thiên tai';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disastergroupsdisasters`
--

LOCK TABLES `disastergroupsdisasters` WRITE;
/*!40000 ALTER TABLE `disastergroupsdisasters` DISABLE KEYS */;
INSERT INTO `disastergroupsdisasters` VALUES (2,2,14),(3,1,14),(4,3,14),(5,4,14),(6,5,14),(7,6,14),(8,7,14),(9,8,14),(10,9,14),(11,10,14),(12,11,14),(13,12,14),(14,13,14),(15,14,14),(16,15,4),(17,16,4),(18,17,4),(19,18,4),(20,19,4);
/*!40000 ALTER TABLE `disastergroupsdisasters` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:15:52
