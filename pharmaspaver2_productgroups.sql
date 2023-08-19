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
-- Table structure for table `productgroups`
--

DROP TABLE IF EXISTS `productgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productgroups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `productGroupsName` varchar(200) NOT NULL,
  `productTypesId` bigint(20) DEFAULT NULL,
  `parentId` bigint(20) DEFAULT 0,
  `userCreatorsId` bigint(20) NOT NULL,
  `dateCreated` datetime DEFAULT current_timestamp(),
  `dateUpdated` datetime DEFAULT NULL,
  `status` int(11) DEFAULT 1 COMMENT '1: enabled 0: disabled -1: draf; -2: chờ duyệt',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='thương hiệu';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productgroups`
--

LOCK TABLES `productgroups` WRITE;
/*!40000 ALTER TABLE `productgroups` DISABLE KEYS */;
INSERT INTO `productgroups` VALUES (1,'kẹo',10,0,591,'2022-11-12 10:45:16','2022-11-12 10:45:16',1),(2,'dung dịch vệ sinh',1,0,591,'2022-11-12 11:08:21','2022-11-12 11:08:21',1),(3,'Chăm sóc mắt',1,0,591,'2022-11-12 11:30:48','2022-11-12 11:32:23',-1),(4,'Thuốc',5,0,591,'2022-11-12 11:32:42','2022-11-12 11:32:42',1),(5,'TPCN',10,0,591,'2022-11-12 11:32:58','2022-11-12 11:32:58',1),(6,'Mỹ phẩm ',12,0,591,'2022-11-12 11:33:16','2022-11-12 11:33:16',1),(7,'Không phải là thuốc',10,0,591,'2022-11-12 12:47:10','2022-11-12 12:47:10',1),(8,'Trà',2,0,591,'2022-11-13 11:07:29','2022-11-13 11:07:29',1),(9,'xịt mũi',10,0,591,'2022-11-13 11:53:41','2022-11-13 11:53:41',1),(10,'vitamin',2,0,591,'2022-11-13 12:13:57','2022-11-13 12:13:57',1),(11,'Mắt',5,0,1,'2022-11-14 14:13:44','2022-11-14 14:13:44',1),(12,'Thuốc uống điều trị mắt',5,11,1,'2022-11-14 14:13:44','2022-11-14 14:13:44',1);
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

-- Dump completed on 2023-08-19 16:16:33
