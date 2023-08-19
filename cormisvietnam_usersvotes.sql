-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cormisvietnam
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
-- Table structure for table `usersvotes`
--

DROP TABLE IF EXISTS `usersvotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usersvotes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment` varchar(2000) DEFAULT NULL COMMENT 'comment',
  `usersId` bigint(20) NOT NULL,
  `votesId` bigint(20) NOT NULL,
  `dateCreated` datetime DEFAULT current_timestamp() COMMENT 'ngày tạo',
  `eventType` int(11) DEFAULT NULL COMMENT ' 0 -offline , 1 online ,2 cả hai',
  `countriesId` bigint(20) DEFAULT 0,
  `provincesId` bigint(20) DEFAULT 0,
  `timeType` int(11) DEFAULT 0 COMMENT '0: tất cả , 1: sáng , 2 chiều , 3tối',
  PRIMARY KEY (`id`),
  KEY `eventsId` (`votesId`),
  KEY `usersId` (`usersId`),
  KEY `countriesId` (`countriesId`),
  KEY `provincesId` (`provincesId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='bảng vote tổ chức sự kiện';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usersvotes`
--

LOCK TABLES `usersvotes` WRITE;
/*!40000 ALTER TABLE `usersvotes` DISABLE KEYS */;
INSERT INTO `usersvotes` VALUES (2,'ok',1,1,'2023-01-11 10:00:17',0,12,23,1),(3,NULL,566,1,'2023-01-11 12:13:14',NULL,0,0,1),(4,NULL,566,1,'2023-01-11 12:21:43',NULL,13,0,2),(5,NULL,567,1,'2023-01-11 12:44:43',NULL,0,0,1),(6,NULL,508,1,'2023-01-11 13:47:51',NULL,12,23,0),(7,NULL,567,1,'2023-01-11 13:48:25',NULL,0,0,1),(8,NULL,568,1,'2023-01-11 13:51:55',NULL,0,0,1),(9,NULL,509,1,'2023-01-11 13:55:10',NULL,0,0,1),(10,NULL,518,1,'2023-01-11 13:58:21',NULL,0,0,1),(11,NULL,518,1,'2023-01-11 13:58:54',NULL,0,0,2),(12,NULL,1,1,'2023-01-12 17:06:18',NULL,17,0,1);
/*!40000 ALTER TABLE `usersvotes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:18:45
