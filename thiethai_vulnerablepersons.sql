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
-- Table structure for table `vulnerablepersons`
--

DROP TABLE IF EXISTS `vulnerablepersons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vulnerablepersons` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vulnerablePersonsName` varchar(500) NOT NULL,
  `userCreatorsId` bigint(20) NOT NULL,
  `dateCreated` datetime DEFAULT current_timestamp(),
  `dateUpdated` datetime DEFAULT NULL,
  `status` int(11) DEFAULT 1 COMMENT '1: enabled 0: disabled -1: draf; -2: chờ duyệt',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='đối tượng dễ tổn thương';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vulnerablepersons`
--

LOCK TABLES `vulnerablepersons` WRITE;
/*!40000 ALTER TABLE `vulnerablepersons` DISABLE KEYS */;
INSERT INTO `vulnerablepersons` VALUES (3,'Trẻ em nhỏ',1,'2022-12-08 10:16:36','2022-12-09 15:24:21',1),(4,'Phụ nữ đang nuôi con nhỏ dưới 12 tháng tuổi',1,'2022-12-09 14:29:45','2022-12-20 10:37:56',1),(5,'Người khuyết tật',1,'2022-12-11 16:57:52','2022-12-11 16:57:52',1),(6,'Dân tộc thiểu số',1,'2022-12-20 10:36:52','2022-12-20 10:36:52',1),(7,'Người nghèo',1,'2022-12-20 10:36:57','2022-12-20 10:36:57',1),(8,'Người bị bệnh hiểm nghèo',1,'2022-12-20 10:37:13','2022-12-20 10:37:13',1),(9,'Phụ nữ mang thai',1,'2022-12-20 10:37:27','2022-12-20 10:37:27',1),(10,'Phụ nữ đơn thân',1,'2022-12-20 10:37:34','2022-12-20 10:37:34',1);
/*!40000 ALTER TABLE `vulnerablepersons` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:15:53
