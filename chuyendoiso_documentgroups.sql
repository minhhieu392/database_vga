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
  `order` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentgroups`
--

LOCK TABLES `documentgroups` WRITE;
/*!40000 ALTER TABLE `documentgroups` DISABLE KEYS */;
INSERT INTO `documentgroups` VALUES (1,'Kế hoạch chuyển đổi số cấp tỉnh',1,'2022-11-22 16:48:11','2023-01-11 15:08:02',1,3),(2,'Kế hoạch chuyển đổi số cấp bộ',1,'2022-12-14 11:01:21','2023-01-11 15:07:57',1,4),(3,'Tài liệu tham khảo',1,'2022-12-14 11:01:46','2022-12-23 16:15:39',0,6),(4,'Tài liệu đề án',1,'2022-12-14 11:01:55','2022-12-23 16:15:38',0,7),(5,'Tài liệu dự thảo',1,'2022-12-21 08:53:06','2022-12-23 16:15:36',0,8),(6,'Văn bản đến',29,'2023-01-03 11:26:44','2023-01-03 11:26:44',1,2),(7,'Vản bản đi',29,'2023-01-11 15:07:39','2023-01-11 15:07:37',1,1),(8,'Văn bản nghị định',1,'2023-01-13 15:14:13','2023-01-13 15:14:23',0,5);
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

-- Dump completed on 2023-08-19 16:18:54
