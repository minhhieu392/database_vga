-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pharmaspaver2
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
-- Table structure for table `ads_type`
--

DROP TABLE IF EXISTS `ads_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `sitesId` bigint(20) NOT NULL,
  `userCreatorsId` bigint(20) NOT NULL,
  `createDate` datetime DEFAULT current_timestamp(),
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_sites_index` (`name`,`sitesId`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads_type`
--

LOCK TABLES `ads_type` WRITE;
/*!40000 ALTER TABLE `ads_type` DISABLE KEYS */;
INSERT INTO `ads_type` VALUES (23,'Video',1,1,'2019-09-23 17:57:16',1),(24,'Slide',1,1,'2019-09-23 18:06:56',1),(25,'Text',1,1,'2019-09-23 18:07:11',1),(26,'Gif',20,1,'2019-09-23 18:07:54',1),(27,'Test',25,1,'2020-04-21 10:03:07',0),(28,'testtttt',25,1,'2020-04-29 09:58:59',0),(29,'content',20,1,'2020-12-04 15:06:41',1),(30,'slidee',20,41,'2020-12-23 10:34:17',1),(31,'loại 12',57,41,'2020-12-23 10:34:30',0),(32,'sdfghjhkl',128,1,'2020-12-31 15:26:30',1),(33,'dg hf',144,1,'2020-12-31 15:37:31',1),(34,'kjhgfdsa',77,1,'2020-12-31 15:37:51',1),(35,'mynj',65,1,'2020-12-31 15:38:24',1),(36,'quảng cáo cuối năm ',100,1,'2021-01-07 10:19:27',1),(37,'Quảng cáo đầu năm ',100,1,'2021-01-07 10:20:08',1),(38,'Quảng cáo test 1',178,1,'2021-05-13 17:45:31',0),(39,'qwe',100,1,'2021-05-14 17:09:59',1),(40,'Thủy',1,1,'2021-05-25 18:05:27',0);
/*!40000 ALTER TABLE `ads_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:16:37
