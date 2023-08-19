-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: quanlybanhang
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
-- Table structure for table `productgroups`
--

DROP TABLE IF EXISTS `productgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productgroups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `productGroupsName` varchar(200) NOT NULL,
  `workUnitsId` bigint(20) DEFAULT NULL,
  `usersCreatorId` bigint(20) DEFAULT NULL,
  `dateCreated` datetime DEFAULT current_timestamp(),
  `dateUpdated` datetime DEFAULT NULL,
  `status` int(11) DEFAULT 1 COMMENT '1: enabled 0: disabled -1: draf; -2: chờ duyệt',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='thương hiệu';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productgroups`
--

LOCK TABLES `productgroups` WRITE;
/*!40000 ALTER TABLE `productgroups` DISABLE KEYS */;
INSERT INTO `productgroups` VALUES (1,'mỹ phẩm',NULL,541,'2022-06-28 09:38:55','2022-06-28 09:38:55',1),(2,'Nước hoa',NULL,541,'2022-06-28 09:44:11','2022-06-28 09:44:11',1),(3,'sét cọ',NULL,541,'2022-06-28 09:44:11','2022-06-28 09:44:11',1),(4,'tiêu dùng',NULL,541,'2022-06-28 09:44:11','2022-06-28 09:44:11',1),(5,'mỹ phẩm>>phấn mắt',NULL,541,'2022-06-28 09:44:12','2022-06-28 09:44:12',1),(6,'đã xóa',NULL,541,'2022-06-28 10:42:41','2022-12-28 11:12:23',0),(7,'Pk',NULL,542,'2022-07-05 09:25:42','2022-07-05 09:25:42',1),(8,'Điện tử',5,1,'2022-12-19 13:49:57','2022-12-28 12:18:41',1);
/*!40000 ALTER TABLE `productgroups` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:16:17
