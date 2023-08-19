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
-- Table structure for table `ads_positions`
--

DROP TABLE IF EXISTS `ads_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads_positions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `sitesId` bigint(20) NOT NULL,
  `usersCreatorId` bigint(20) NOT NULL,
  `createDate` datetime DEFAULT current_timestamp(),
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name_sites_index` (`name`,`sitesId`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads_positions`
--

LOCK TABLES `ads_positions` WRITE;
/*!40000 ALTER TABLE `ads_positions` DISABLE KEYS */;
INSERT INTO `ads_positions` VALUES (22,'Trên trái',1,1,'2019-09-23 18:08:22',1),(23,'Trên phải',1,1,'2019-09-23 18:08:32',1),(24,'Bên trái',1,1,'2019-09-23 18:08:50',1),(25,'Bên phải',1,1,'2019-09-23 18:09:01',1),(26,'Chính giữa',1,1,'2019-09-23 18:09:18',1),(27,'Giữa trên',1,1,'2019-09-23 18:09:29',1),(28,'Giữa dưới',1,1,'2019-09-23 18:09:41',1),(29,'Dưới trái',1,1,'2019-09-23 18:10:01',1),(30,'Dưới phải',1,1,'2019-09-23 18:10:11',1),(31,'Dưới phải',15,1,'2019-09-30 15:46:34',1),(32,'Dưới phải trái',16,1,'2019-10-18 11:19:27',1),(33,'Testt',25,1,'2020-04-21 10:22:09',0),(34,'trên cùng',31,1,'2020-05-07 10:41:39',1),(35,'Dưới phải Trái',14,1,'2020-05-07 14:09:58',1),(36,'trên cùng',3,1,'2020-10-12 13:27:40',1),(37,'Trang chủ',20,1,'2020-10-22 16:08:46',1),(38,'trên cùng cao',3,1,'2020-11-12 10:48:18',1),(39,'Dưới phải Trai',14,1,'2020-11-13 17:25:57',1),(40,'Dưới phai Trai',14,1,'2020-11-13 17:26:20',1),(41,'Banner',20,1,'2020-12-04 15:10:37',1),(42,'trên bên trái',170,41,'2020-12-23 10:38:31',1),(43,'trên bên trái ',170,41,'2020-12-23 10:39:04',0),(44,'Banner',57,1,'2020-12-31 09:40:07',0),(45,'Header',100,1,'2021-01-07 10:21:51',1),(46,'hdf',128,1,'2021-01-13 11:09:37',0),(47,'czxc',178,1,'2021-01-14 08:57:25',0),(48,'abcqưe',57,1,'2021-05-13 16:12:14',0),(49,'ádasd',61,1,'2021-05-14 16:20:19',1),(50,'ds',1,1,'2021-05-25 17:57:01',0);
/*!40000 ALTER TABLE `ads_positions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:15:54
