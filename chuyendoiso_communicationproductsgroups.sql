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
-- Table structure for table `communicationproductsgroups`
--

DROP TABLE IF EXISTS `communicationproductsgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communicationproductsgroups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `communicationProductsGroupName` varchar(200) DEFAULT NULL COMMENT 'Tên đối tượng truyền thông',
  `communicationProductsGroupDescriptions` varchar(500) DEFAULT NULL COMMENT 'mô tả',
  `userCreatorsId` bigint(20) DEFAULT NULL COMMENT 'người tạo',
  `dateCreated` datetime DEFAULT NULL COMMENT 'ngày tạo',
  `dateUpdated` datetime DEFAULT NULL COMMENT 'ngày cập nhật',
  `status` int(11) DEFAULT NULL COMMENT 'trạng thái',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communicationproductsgroups`
--

LOCK TABLES `communicationproductsgroups` WRITE;
/*!40000 ALTER TABLE `communicationproductsgroups` DISABLE KEYS */;
INSERT INTO `communicationproductsgroups` VALUES (1,'Video','mô tả video 1',1,'2020-12-09 07:00:00','2021-03-17 14:10:11',1),(2,'Audio','mô tả audio',1,'2020-12-09 07:00:00','2021-03-17 14:10:36',1),(3,'Tờ rơi','Mô tả tờ rơi',1,'2020-12-09 07:00:00','2021-03-17 14:10:43',1),(4,'video 22','111',1,'2021-02-24 15:49:43','2021-02-24 15:49:47',0),(5,'Ảnh','',1,'2021-02-25 14:50:34','2021-03-17 14:10:04',1),(6,'12345asd>>>','',1,'2021-02-25 14:52:04','2021-02-25 17:11:24',-1),(7,'báo','',1,'2021-02-26 09:35:17','2021-02-26 16:37:51',0),(8,'Internet','',1,'2021-02-26 09:35:26','2021-02-26 16:37:49',0),(9,'.','',1,'2021-02-26 09:35:34','2021-02-26 16:37:47',0),(10,'..','',1,'2021-02-26 09:35:40','2021-02-26 16:37:46',0),(11,'vfxdvf','',1,'2021-02-26 09:35:50','2021-03-02 09:32:34',-1),(12,'aa','',1,'2021-02-26 16:00:04','2021-04-08 16:43:33',-1),(13,'Báo chí','',1,'2021-03-18 11:46:42','2021-03-18 11:46:43',1),(14,'!@#@%#$#^@','',30,'2021-04-23 11:57:35','2021-04-23 11:57:37',0);
/*!40000 ALTER TABLE `communicationproductsgroups` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:18:48
