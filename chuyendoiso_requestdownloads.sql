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
-- Table structure for table `requestdownloads`
--

DROP TABLE IF EXISTS `requestdownloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requestdownloads` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userCreatorsId` bigint(20) DEFAULT NULL,
  `reason` varchar(500) DEFAULT NULL,
  `explorersId` bigint(20) DEFAULT NULL,
  `dateCreated` datetime DEFAULT current_timestamp(),
  `dateApproved` datetime DEFAULT NULL,
  `userApprovedsId` bigint(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '1: enabled 0: disabled -1: draf; -2: chờ duyệt',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requestdownloads`
--

LOCK TABLES `requestdownloads` WRITE;
/*!40000 ALTER TABLE `requestdownloads` DISABLE KEYS */;
INSERT INTO `requestdownloads` VALUES (10,17,'dowload\n..',4,'2020-12-17 15:38:27','2020-12-18 13:19:38',1,1),(11,1,'update hệ thống',3,'2020-12-17 18:05:58','2020-12-17 22:17:39',1,1),(12,1,'test',5,'2020-12-17 18:11:09','2020-12-17 18:11:35',1,-1),(13,1,'update hệ thống',7,'2020-12-21 14:41:55','2020-12-22 09:14:51',29,1),(14,1,'update',4,'2020-12-21 14:44:01','2020-12-21 14:54:46',1,1),(15,29,'cập nhật tin tức',7,'2020-12-22 09:50:56',NULL,NULL,-2);
/*!40000 ALTER TABLE `requestdownloads` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:18:51
