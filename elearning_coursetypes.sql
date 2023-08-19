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
-- Table structure for table `coursetypes`
--

DROP TABLE IF EXISTS `coursetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coursetypes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `courseTypesName` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'tên thể loại bài giảng',
  `status` int(11) DEFAULT NULL COMMENT 'trạng thái:\\\\nFalse: ẩn sản phẩm\\\\nTrue: hiển thị sản phẩm',
  `userCreatorsId` bigint(20) NOT NULL COMMENT 'người tạo/Người bán',
  `dateCreated` datetime DEFAULT current_timestamp() COMMENT 'ngày tạo',
  `dateUpdated` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='thể loại bài giảng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coursetypes`
--

LOCK TABLES `coursetypes` WRITE;
/*!40000 ALTER TABLE `coursetypes` DISABLE KEYS */;
INSERT INTO `coursetypes` VALUES (1,'THCS',1,1,'2022-11-28 17:37:40','2022-12-13 09:40:59'),(2,'Design',0,1,'2022-11-28 17:52:31','2022-12-13 09:40:11'),(3,'ẩn',0,1,'2022-12-01 16:13:38','2023-01-04 17:54:39'),(4,'Tiểu học',1,1,'2022-12-01 17:24:40','2022-12-13 09:40:46'),(5,'CoderZ',1,1,'2022-12-02 14:11:59','2022-12-13 09:41:16'),(7,'Mầm non',1,1,'2022-12-09 08:55:56','2022-12-13 09:40:34'),(8,'Giáo viên',1,527,'2023-01-04 17:54:46','2023-01-04 17:54:46');
/*!40000 ALTER TABLE `coursetypes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:16:02
