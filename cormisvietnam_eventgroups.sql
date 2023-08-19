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
-- Table structure for table `eventgroups`
--

DROP TABLE IF EXISTS `eventgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventgroups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `eventGroupsName` varchar(500) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT 'trạng thái:\\\\nFalse: ẩn sản phẩm\\\\nTrue: hiển thị sản phẩm',
  `userCreatorsId` bigint(20) NOT NULL COMMENT 'người tạo/Người bán',
  `dateCreated` datetime DEFAULT current_timestamp() COMMENT 'ngày tạo',
  `dateUpdated` datetime DEFAULT current_timestamp(),
  `languagesId` bigint(20) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='nhóm sự kiện';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventgroups`
--

LOCK TABLES `eventgroups` WRITE;
/*!40000 ALTER TABLE `eventgroups` DISABLE KEYS */;
INSERT INTO `eventgroups` VALUES (1,'Kỹ năng vận động',1,1,'2023-01-10 18:02:24','2023-01-10 18:02:24',1),(2,'Kỹ năng cảm xúc',1,1,'2023-01-10 18:02:51','2023-01-10 18:02:51',1),(3,'Emotional skills',1,1,'2023-01-10 18:03:05','2023-01-10 18:03:05',2),(4,'Movement skills',1,1,'2023-01-10 18:03:16','2023-01-10 18:03:16',2),(5,'Giao lưu cộng đồng',1,1,'2023-01-10 18:03:43','2023-01-10 18:03:43',1),(6,'Community exchange',1,1,'2023-01-10 18:03:53','2023-01-10 18:03:53',2);
/*!40000 ALTER TABLE `eventgroups` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:18:42
