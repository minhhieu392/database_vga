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
-- Table structure for table `contentgroups`
--

DROP TABLE IF EXISTS `contentgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contentgroups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `contentGroupsName` varchar(200) DEFAULT NULL,
  `userCreatorsId` bigint(20) DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateUpdated` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentgroups`
--

LOCK TABLES `contentgroups` WRITE;
/*!40000 ALTER TABLE `contentgroups` DISABLE KEYS */;
INSERT INTO `contentgroups` VALUES (1,'Hoạt động chuyển đổi số PCTT',1,'2022-11-22 16:36:35','2023-01-11 15:29:33',1),(2,'Tin nước ngoài',1,'2022-12-14 10:57:04','2022-12-23 00:55:52',1),(3,'Tin trong nước',1,'2022-12-19 08:37:31','2022-12-19 08:37:31',1),(4,'Chương trình đề án',1,'2022-12-19 14:27:35','2023-01-13 14:36:33',1),(5,'Kiến thức về chuyển đổi số',1,'2022-12-19 14:28:06','2023-01-13 14:39:04',1),(6,'Kiến thức về chuyển đổi số 1',1,'2022-12-23 00:56:10','2022-12-23 08:55:41',0),(7,'Kiến thức về chuyển đổi số 2',1,'2022-12-23 00:56:13','2022-12-23 08:55:39',0),(8,'Kiến thức về chuyển đổi số 3',1,'2022-12-23 00:56:17','2022-12-23 08:55:37',0),(9,'Kiến thức về chuyển đổi số 4',1,'2022-12-23 00:57:08','2022-12-23 08:55:36',0);
/*!40000 ALTER TABLE `contentgroups` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:18:50
