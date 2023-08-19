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
-- Table structure for table `objectusers`
--

DROP TABLE IF EXISTS `objectusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objectusers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `objectUsersName` varchar(200) DEFAULT NULL,
  `userCreatorsId` bigint(20) DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateUpdated` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='đối tượng sử dụng ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objectusers`
--

LOCK TABLES `objectusers` WRITE;
/*!40000 ALTER TABLE `objectusers` DISABLE KEYS */;
INSERT INTO `objectusers` VALUES (1,'Cơ quan quản lý cấp trung ưng',1,'2022-12-20 10:44:57','2022-12-20 11:01:29',1),(2,'Cơ quan quản lý cấp tỉnh',1,'2022-12-20 11:01:53','2022-12-20 11:01:53',1),(3,'Cơ quan quản lý cấp huyện',1,'2022-12-20 11:02:00','2022-12-20 11:02:00',1),(4,'Cơ quan quản lý cấp xã',1,'2022-12-20 11:02:04','2022-12-20 11:02:04',1),(5,'Người dân',1,'2022-12-20 11:02:22','2022-12-20 11:02:22',1),(6,'Doanh nghiệp',1,'2022-12-20 11:02:31','2022-12-20 11:02:31',1),(7,'Tổ chức xã hội',1,'2022-12-20 11:03:05','2022-12-21 08:59:57',1),(8,'Các khối cơ quan trung ương',1,'2022-12-22 16:57:09','2022-12-22 16:57:09',1),(9,'Các Đảng uỷ trực thuộc Đảng uỷ Khối',1,'2022-12-22 17:00:34','2022-12-22 17:00:34',1);
/*!40000 ALTER TABLE `objectusers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:18:47
