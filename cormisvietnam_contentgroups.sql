-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cormisvietnam
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
  `languagesId` bigint(20) DEFAULT 1,
  `parentId` bigint(20) DEFAULT 0,
  `descriptions` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `languagesId` (`languagesId`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentgroups`
--

LOCK TABLES `contentgroups` WRITE;
/*!40000 ALTER TABLE `contentgroups` DISABLE KEYS */;
INSERT INTO `contentgroups` VALUES (12,'Tin tức',1,'2022-12-23 08:51:39','2023-01-05 08:25:13',1,1,0,'Tổng hợp các bài viết chia sẻ về cộng đồng người khuyết tật.'),(13,'Đối tác',1,NULL,'2023-01-11 18:10:16',1,1,0,''),(14,'Donate',1,'2022-12-29 16:22:26','2023-01-04 01:52:22',1,2,0,NULL),(15,'test1',1,'2022-12-30 10:01:22','2022-12-30 10:01:22',-1,1,12,NULL),(16,'Hoạt động',1,'2022-12-30 10:56:10','2022-12-30 10:56:10',1,1,12,NULL),(17,'test1',1,'2022-12-30 11:00:22','2022-12-30 11:00:22',-1,1,12,NULL),(18,'Bốn phương',1,'2022-12-30 11:06:01','2022-12-30 11:06:01',1,1,12,NULL),(19,'Học bổng',1,'2022-12-30 11:13:02','2022-12-30 11:13:02',1,1,12,NULL),(20,'Tuyển dụng',1,'2022-12-30 11:13:19','2022-12-30 11:13:19',1,1,12,NULL),(21,'Cẩm nang',1,'2022-12-30 11:21:08','2022-12-30 11:21:08',1,1,0,NULL),(22,'Nhà tài trợ',1,'2022-12-30 11:21:26','2023-01-11 18:10:05',1,1,0,''),(23,'Dự án',1,'2022-12-30 11:21:35','2022-12-30 11:21:35',1,1,0,NULL),(24,'Ủng hộ',1,'2022-12-30 11:21:49','2022-12-30 11:21:49',1,1,0,NULL),(25,'Tập huấn viên',1,'2022-12-30 11:22:01','2022-12-30 11:22:01',1,1,0,NULL),(26,'News',1,'2022-12-30 11:22:24','2022-12-30 11:22:24',1,2,0,NULL),(27,'Internal',1,'2022-12-30 11:22:38','2022-12-30 11:22:38',1,2,26,NULL),(28,'World',1,'2022-12-30 11:22:53','2022-12-30 11:22:53',1,2,26,NULL),(29,'Scholarship',1,'2022-12-30 11:23:33','2022-12-30 11:23:33',1,2,26,NULL),(30,'Recruitment',1,'2022-12-30 11:23:47','2022-12-30 11:23:47',1,2,26,NULL),(31,'Cẩm nang cơ bản',1,'2023-01-04 01:49:25','2023-01-04 01:49:25',1,1,21,NULL),(32,'Cẩm nang cho người khiếm thị',1,'2023-01-04 01:49:41','2023-01-04 01:49:41',1,1,21,NULL),(33,'Projects',1,'2023-01-04 01:52:05','2023-01-04 01:52:05',1,2,0,NULL),(34,'Trainer',1,'2023-01-04 01:52:46','2023-01-04 01:52:46',1,2,0,NULL),(35,'Donors',1,'2023-01-04 01:53:04','2023-01-12 15:37:33',1,2,0,''),(36,'Handbook',1,'2023-01-04 01:53:20','2023-01-04 01:53:20',1,2,0,NULL),(37,'Basic handbook',1,'2023-01-04 01:53:47','2023-01-11 11:27:32',1,2,36,''),(38,'Handbook for the blind',1,'2023-01-04 01:54:07','2023-01-04 01:54:07',1,2,36,NULL),(39,'Cẩm nang hoà nhập',1,'2023-01-05 10:16:06','2023-01-05 10:16:06',1,1,21,''),(40,'Cẩm nang cho người khiếm thính',1,'2023-01-05 10:58:43','2023-01-05 10:58:43',1,1,21,''),(41,'Handbook for the Deaf',1,'2023-01-05 10:58:56','2023-01-05 10:58:56',1,2,36,''),(42,'Partner',1,'2023-01-05 11:34:59','2023-01-12 15:37:38',1,2,0,''),(43,'Cộng tác viên',1,'2023-01-11 18:08:23','2023-01-11 18:09:53',1,1,0,''),(44,'Collaborators',1,'2023-01-11 18:12:24','2023-01-11 18:12:24',1,2,0,'');
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

-- Dump completed on 2023-08-19 16:18:37
