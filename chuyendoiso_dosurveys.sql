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
-- Table structure for table `dosurveys`
--

DROP TABLE IF EXISTS `dosurveys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dosurveys` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customerName` varchar(100) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `dateCreated` datetime DEFAULT current_timestamp(),
  `surveysId` bigint(20) DEFAULT NULL,
  `wardsId` bigint(20) DEFAULT 0,
  `workplace` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `surveysId` (`surveysId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='tham gia khảo sát';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dosurveys`
--

LOCK TABLES `dosurveys` WRITE;
/*!40000 ALTER TABLE `dosurveys` DISABLE KEYS */;
INSERT INTO `dosurveys` VALUES (1,'Ngọc2','0963735967','ngocnk99@gmail.com','2022-11-23 14:06:19',3,0,NULL),(2,'Ngọc3','09637359678','ngocnk992@gmail.com','2022-12-16 08:42:35',3,0,NULL),(3,'Ngọc2','0963735967','ngocnk99@gmail.com','2022-12-20 10:12:11',3,1,'nơi làm việc'),(4,'THủy','093289238',NULL,'2022-12-21 16:48:47',6,0,NULL),(5,'THủy','093289238',NULL,'2022-12-21 16:48:47',6,0,NULL),(6,'Minh','9032832',NULL,'2022-12-21 16:53:27',6,0,NULL),(7,'d','d',NULL,'2022-12-21 16:57:22',6,0,NULL),(8,'thủy','0923832',NULL,'2022-12-21 16:58:45',6,0,NULL),(9,'thuy0','903829',NULL,'2022-12-21 16:59:07',5,0,NULL),(10,'thuy','09382093',NULL,'2022-12-21 16:59:22',5,0,NULL),(11,'094830943','902839203',NULL,'2022-12-21 17:00:12',5,0,NULL),(12,'94839083','90283290',NULL,'2022-12-21 17:01:25',5,0,NULL),(13,'Lê xuân giang','0123012983','giangbn1997@gmail.com','2022-12-23 16:36:40',7,4032,'TTCS&KTPCTT'),(14,'phạm văn nam','0967673463','nampv97bg@gmail.com','2022-12-23 16:48:54',3,4032,'Trung tâm Chính sách và Kỹ thuật Phòng chống thiên tai');
/*!40000 ALTER TABLE `dosurveys` ENABLE KEYS */;
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
