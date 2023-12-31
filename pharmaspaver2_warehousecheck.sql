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
-- Table structure for table `warehousecheck`
--

DROP TABLE IF EXISTS `warehousecheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehousecheck` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `warehouseCheckCode` varchar(45) DEFAULT NULL,
  `medFacilitysId` bigint(20) DEFAULT NULL,
  `userCreatorsId` bigint(20) NOT NULL,
  `dateCreated` datetime DEFAULT current_timestamp() COMMENT 'ngày tạo',
  `note` text DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `totalMoney` double DEFAULT NULL,
  `dateUpdated` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `createDate` (`dateCreated`),
  KEY `usersCreatorId` (`userCreatorsId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='kiểm kho';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehousecheck`
--

LOCK TABLES `warehousecheck` WRITE;
/*!40000 ALTER TABLE `warehousecheck` DISABLE KEYS */;
INSERT INTO `warehousecheck` VALUES (1,'KK0000001',1,1,'2022-11-18 10:48:49','',1,90300,'2022-11-18 10:48:49'),(2,'KK0000002',1,1,'2022-11-18 10:49:34','',1,-90300,'2022-11-18 10:49:34'),(3,'KK0000003',1,1,'2022-12-19 21:49:32','',1,NULL,'2022-12-19 21:49:46'),(4,'KK0000004',1,1,'2022-12-19 21:50:42','',1,NULL,'2022-12-19 21:50:51'),(5,'KK0000005',1,1,'2022-12-19 21:54:31','',1,NULL,'2022-12-19 21:54:36'),(6,'KK0000006',4,1,'2022-12-22 15:37:52','',1,NULL,'2022-12-22 15:37:55'),(7,'KK0000007',4,1,'2022-12-22 15:37:52','',1,NULL,'2022-12-22 15:38:02'),(8,'KK0000008',4,1,'2022-12-22 15:37:52','',1,NULL,'2022-12-22 15:38:04'),(9,'KK0000009',4,1,'2022-12-22 15:37:52','',1,NULL,'2022-12-22 15:38:49'),(10,'KK0000010',4,1,'2022-12-22 15:37:52','',1,NULL,'2022-12-22 15:42:57'),(11,'KK0000011',4,1,'2022-12-22 15:37:52','',1,NULL,'2022-12-22 15:43:49'),(12,'KK0000012',4,1,'2022-12-22 15:37:52','',1,NULL,'2022-12-22 15:48:57'),(13,'KK0000013',4,1,'2022-12-22 15:37:52','',1,NULL,'2022-12-22 15:49:18'),(14,'KK0000014',4,1,'2022-12-22 15:37:52','',1,0,'2022-12-22 15:50:19'),(15,'KK0000015',1,1,'2022-12-22 16:07:09','',1,0,'2022-12-22 16:07:10'),(16,'KK0000016',1,1,'2022-12-22 16:09:19','',1,0,'2022-12-22 16:09:29'),(17,'KK0000017',1,1,'2022-12-22 16:10:42','',1,0,'2022-12-22 16:11:29'),(18,'KK0000018',1,1,'2022-12-22 16:22:14','',1,0,'2022-12-22 16:22:29');
/*!40000 ALTER TABLE `warehousecheck` ENABLE KEYS */;
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
