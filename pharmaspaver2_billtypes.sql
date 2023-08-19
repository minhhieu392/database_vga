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
-- Table structure for table `billtypes`
--

DROP TABLE IF EXISTS `billtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billtypes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `workUnitsId` bigint(20) DEFAULT NULL,
  `billTypesName` varchar(200) NOT NULL,
  `billTypesCode` varchar(50) NOT NULL,
  `currentNumber` int(11) DEFAULT 0,
  `type` int(11) DEFAULT NULL COMMENT '0: phiếu thu\n1: phiếu chi',
  `status` int(11) DEFAULT NULL,
  `userCreatorsId` bigint(20) NOT NULL,
  `dateUpdated` datetime DEFAULT current_timestamp(),
  `dateCreated` datetime DEFAULT '0000-00-00 00:00:00',
  `insiderTransaction` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='loại phiếu thu/chi';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billtypes`
--

LOCK TABLES `billtypes` WRITE;
/*!40000 ALTER TABLE `billtypes` DISABLE KEYS */;
INSERT INTO `billtypes` VALUES (1,0,'Phiếu thu tiền khách trả','TTHD',142,0,1,1,'2022-06-07 08:28:55','2022-06-07 08:28:55',NULL),(2,0,'Phiếu thu khác','TTK',14,0,1,1,'2022-06-07 08:28:55','2022-06-07 08:28:55',NULL),(3,0,'Phiếu nhận tiền trả hàng nhập','TTTHN',26,0,1,1,'2022-06-07 08:28:55','2022-06-07 08:28:55',NULL),(4,0,'Phiếu chi tiền nhập hàng','PCNCC',90,1,1,1,'2022-06-07 08:28:55','2022-06-07 08:28:55',NULL),(5,0,'Phiếu chi khi khách trả hàng','TTTH',68,1,1,1,'2022-06-07 08:28:55','2022-06-07 08:28:55',NULL),(6,0,'Phiếu chi khác','PCK',5,1,1,1,'2022-06-07 08:28:55','2022-06-07 08:28:55',NULL),(7,0,'Trả lương nhân viên','PCTL',0,1,1,1,'2022-06-07 09:10:04','2022-06-07 09:10:04',NULL),(8,0,'Ứng lương','UL',0,1,1,1,'2022-06-14 14:34:46','2022-06-14 14:34:46',NULL),(9,0,'Phiếu thu tiền khách hàng đặt hàng trước','TTDH',11,0,1,1,'2022-06-14 14:34:46','2022-06-14 14:34:46',NULL),(10,0,'Phiếu cân đối khi sửa phiếu thu','TTCD',1,0,1,1,'2022-06-14 14:34:46','2022-06-14 14:34:46',NULL),(11,0,'Phiếu cân đối khi sửa phiếu chi','PCCD',4,1,1,1,'2022-06-14 14:34:46','2022-06-14 14:34:46',NULL),(12,0,'Phiếu chuyển nội bộ ( phiếu thu)','PTNB',12,0,1,1,'2022-06-14 14:34:46','2022-06-14 14:34:46',1),(13,0,'Phiếu chuyển nội bộ ( phiếu chi)','PCNB',1,1,1,1,'2022-06-14 14:34:46','2022-06-14 14:34:46',1);
/*!40000 ALTER TABLE `billtypes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:16:39
