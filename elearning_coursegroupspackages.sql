-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: elearning
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
-- Table structure for table `coursegroupspackages`
--

DROP TABLE IF EXISTS `coursegroupspackages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coursegroupspackages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `courseGroupsPackagesName` varchar(500) DEFAULT NULL COMMENT 'tên sản phẩm',
  `numberOfDays` int(11) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `userCreatorsId` bigint(20) NOT NULL COMMENT 'người tạo/Người bán',
  `courseGroupsId` bigint(20) NOT NULL COMMENT 'người tạo/Người bán',
  `status` int(11) DEFAULT NULL COMMENT 'trạng thái:\\\\nFalse: ẩn sản phẩm\\\\nTrue: hiển thị sản phẩm',
  `dateCreated` datetime DEFAULT current_timestamp() COMMENT 'ngày tạo',
  `dateUpdated` datetime DEFAULT current_timestamp(),
  `code` varchar(45) DEFAULT NULL,
  `promotionalMoney` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courseGroupsId` (`courseGroupsId`) USING BTREE,
  KEY `courseLevels_status_IDX` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='gói khóa học';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coursegroupspackages`
--

LOCK TABLES `coursegroupspackages` WRITE;
/*!40000 ALTER TABLE `coursegroupspackages` DISABLE KEYS */;
INSERT INTO `coursegroupspackages` VALUES (1,'Gói 1 năm',365,2500000,1,1,0,'2022-12-06 13:41:41','2022-12-08 14:45:29','KH00001G01',NULL),(11,'Gói 3 tháng',90,800000,1,1,0,'2022-12-06 13:44:54','2022-12-08 14:45:38','KH00001G02',NULL),(12,'Miễn phí',NULL,0,1,1,1,'2022-12-06 13:47:04','2023-01-05 11:59:53','K0001G03',0),(14,'Miễn phí',NULL,0,1,3,1,'2022-12-06 14:02:42','2022-12-08 14:44:41','K0002G01',NULL),(15,'Gói 1 năm',365,1200000,1,3,0,'2022-12-06 14:02:42','2022-12-08 14:45:02','K0002G02',NULL),(16,'Gói 3 tháng',90,400000,1,3,0,'2022-12-06 14:02:42','2022-12-08 14:45:07','K0002G03',NULL),(17,'Miễn phí',7,100000,1,8,1,'2022-12-06 14:03:55','2022-12-06 14:03:55','K0006G01',50000),(18,'Gói 1 năm',365,1000000,1,8,0,'2022-12-06 14:03:55','2022-12-06 14:03:55','K0006G02',NULL),(19,'Gói 3 tháng',90,280000,1,8,0,'2022-12-06 14:03:55','2022-12-06 14:03:55','K0006G03',280000),(20,'Gói dùng thử 7 ngày',7,0,1,1,0,'2022-12-06 15:26:24','2022-12-08 14:45:39','K0001G04',NULL),(21,'Miễn phí',NULL,0,1,5,1,'2022-12-06 16:08:38','2022-12-08 14:43:50','K0005G01',NULL),(22,'Miễn phí',NULL,0,1,5,0,'2022-12-06 16:23:37','2022-12-06 16:23:37','K0005G02',NULL),(23,'Miễn phí',NULL,0,1,5,0,'2022-12-06 16:24:41','2022-12-06 16:24:41','K0005G03',NULL),(24,'Miễn phí',NULL,0,1,5,0,'2022-12-06 16:26:44','2022-12-06 16:26:44','K0005G04',NULL),(25,'Miễn phí',NULL,0,1,9,1,'2022-12-06 16:44:16','2022-12-08 14:44:32','K0009G01',NULL),(26,'Gói vĩnh viễn',NULL,2000000,1,10,1,'2022-12-07 11:46:49','2022-12-07 11:46:49','K0010G01',NULL),(27,'Gói 1 năm',365,1000000,1,10,1,'2022-12-07 11:46:49','2022-12-07 11:46:49','K0010G02',NULL),(28,'Gói 3 tháng',90,280000,1,10,1,'2022-12-07 11:46:49','2022-12-07 11:46:49','K0010G03',NULL),(29,'Miễn phí',NULL,0,1,4,1,'2022-12-08 13:33:07','2022-12-12 08:29:45','K0004G01',NULL),(30,'Miễn phí',NULL,0,1,11,1,'2022-12-09 08:59:15','2022-12-09 08:59:15','K0011G01',NULL),(31,'gói 7 ngày',7,100000,1,12,1,'2022-12-15 16:01:26','2022-12-15 16:01:26','K0012G01',NULL),(32,'gói 30 ngày',30,300000,1,12,1,'2023-01-03 14:32:32','2023-01-03 14:32:32','K0012G02',NULL),(33,'Gói 1 năm',365,1000000,527,14,1,'2023-01-03 14:53:05','2023-01-03 14:53:05','K0014G01',NULL),(34,'Gói 1 năm',365,1000000,528,13,1,'2023-01-03 14:59:13','2023-01-03 14:59:13','K0013G01',NULL),(35,'Gói 1 năm',365,499000,533,26,1,'2023-01-04 11:16:26','2023-01-04 11:16:26','K0026G01',399000),(36,'Gói 1 năm',365,499000,533,25,1,'2023-01-04 11:27:32','2023-01-04 11:27:32','K0025G01',399000),(37,'Gói 1 năm',365,499000,534,24,1,'2023-01-04 11:28:03','2023-01-04 11:28:03','K0024G01',399000),(38,'Gói 1 năm',365,499000,536,23,1,'2023-01-04 11:28:31','2023-01-04 11:28:31','K0023G01',399000),(39,'Gói 1 năm',365,499000,533,22,1,'2023-01-04 11:29:09','2023-01-04 11:29:09','K0022G01',399000),(40,'Gói 1 năm',365,499000,533,21,1,'2023-01-04 11:29:39','2023-01-16 09:42:39','K0021G01',NULL),(41,'Gói 1 năm',365,499000,535,20,1,'2023-01-04 11:31:19','2023-01-04 11:31:19','K0020G01',399000),(42,'Gói 1 năm',365,499000,535,19,1,'2023-01-04 11:31:50','2023-01-04 11:31:50','K0019G01',399000),(43,'Gói 1 năm',365,499000,536,18,1,'2023-01-04 11:32:07','2023-01-04 11:32:07','K0018G01',399000),(44,'Gói 1 năm',365,499000,533,16,1,'2023-01-04 11:32:33','2023-01-04 11:32:33','K0016G01',399000),(45,'Gói 1 năm',365,499000,534,17,1,'2023-01-05 15:57:32','2023-01-05 15:57:32','K0017G01',399000),(46,'Gói 1 năm',365,499000,535,15,1,'2023-01-06 14:19:02','2023-01-06 14:19:02','K0015G01',399000),(47,'Gói 1 năm',365,499000,537,27,1,'2023-01-11 10:59:27','2023-01-11 10:59:27','K0027G01',399000),(48,'Gói 1 năm',365,499000,534,28,1,'2023-01-16 08:32:29','2023-01-16 08:32:29','K0028G01',399000);
/*!40000 ALTER TABLE `coursegroupspackages` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:16:01