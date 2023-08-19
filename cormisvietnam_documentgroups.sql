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
-- Table structure for table `documentgroups`
--

DROP TABLE IF EXISTS `documentgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documentgroups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `documentGroupsName` varchar(200) DEFAULT NULL,
  `userCreatorsId` bigint(20) DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateUpdated` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `languagesId` bigint(20) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `documentGroups` (`languagesId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='nhóm tài liệu';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentgroups`
--

LOCK TABLES `documentgroups` WRITE;
/*!40000 ALTER TABLE `documentgroups` DISABLE KEYS */;
INSERT INTO `documentgroups` VALUES (12,'Sức khỏe cho cộng đồng',1,'2022-12-26 00:00:00','2022-12-27 16:47:35',1,1),(13,'Sức khỏe cho cộng đồng 2023',13,'2022-12-26 12:07:50','2022-12-30 10:45:13',1,1),(14,'Sức khỏe cho cộng đồng 2000',1,'2022-12-27 15:27:44','2022-12-27 15:49:10',1,1),(15,'Báo cáo hoạt động',1,'2022-12-28 11:34:18','2022-12-28 11:34:18',1,1),(16,'Sức khỏe cho cộng đồng 1998',1,'2022-12-30 08:21:15','2022-12-30 08:21:15',1,1),(17,'tai lieu tieng anh',1,'2022-12-30 10:45:05','2022-12-30 10:45:05',1,1),(18,'Chính sách và pháp luật',1,'2022-12-30 16:23:56','2022-12-30 16:23:56',1,1),(19,'Laws and policies',1,'2022-12-30 16:25:06','2023-01-05 11:03:44',1,2),(20,'1111111111',1,'2023-01-05 11:34:12','2023-01-05 11:34:15',0,2);
/*!40000 ALTER TABLE `documentgroups` ENABLE KEYS */;
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
