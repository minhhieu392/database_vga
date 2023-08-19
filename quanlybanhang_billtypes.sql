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
-- Table structure for table `billtypes`
--

DROP TABLE IF EXISTS `billtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billtypes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `billTypesName` varchar(200) NOT NULL,
  `billTypesCode` varchar(50) NOT NULL,
  `currentNumber` int(11) DEFAULT 0,
  `type` int(11) DEFAULT NULL COMMENT '0: phiếu thu\n1: phiếu chi',
  `status` int(11) DEFAULT NULL,
  `usersCreatorId` bigint(20) DEFAULT NULL,
  `dateUpdated` datetime DEFAULT current_timestamp(),
  `dateCreated` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='loại phiếu thu/chi';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billtypes`
--

LOCK TABLES `billtypes` WRITE;
/*!40000 ALTER TABLE `billtypes` DISABLE KEYS */;
INSERT INTO `billtypes` VALUES (1,'Phiếu thu Tiền khách trả','TTHD',46,0,1,1,'2022-06-07 08:28:55','2022-06-07 08:28:55'),(2,'Phiếu thu khác','TTK',0,0,1,1,'2022-06-07 08:28:55','2022-06-07 08:28:55'),(3,'Nhận tiền trả hàng nhập','TTTHN',25,0,1,1,'2022-06-07 08:28:55','2022-06-07 08:28:55'),(4,'Phiếu chi Tiền trả NCC','PCPN',54,1,1,1,'2022-06-07 08:28:55','2022-06-07 08:28:55'),(5,'Thanh toán khi khách trả hàng','TTTH',29,1,1,1,'2022-06-07 08:28:55','2022-06-07 08:28:55'),(6,'Phiếu chi khác','PCK',8,1,1,1,'2022-06-07 08:28:55','2022-06-07 08:28:55'),(7,'Trả lương nhân viên','PCTL',0,1,1,1,'2022-06-07 09:10:04','2022-06-07 09:10:04'),(9,'Chuyển tiền','CT',0,0,1,1,'2022-07-13 19:05:23','2022-06-14 14:32:18'),(10,'Ứng lương','UL',0,1,1,1,'2022-06-14 14:34:46','2022-06-14 14:34:46'),(11,'Phiếu chi khách đổi tiền','CTMTH',0,1,1,1,'2022-06-14 14:34:46','2022-06-14 14:34:46'),(12,'Phiếu chi chi phí quản lý doanh nghiệp','CTM',0,1,1,1,'2022-06-14 14:34:46','2022-06-14 14:34:46'),(13,'Phiếu thu tiền đặt hàng','TTDH',25,0,1,1,'2022-06-14 14:34:46','2022-06-14 14:34:46'),(17,'Phiếu chuyển nội bộ ( phiếu thu)','PTNB',6,0,1,1,'2022-06-14 14:34:46','2022-06-14 14:34:46'),(18,'Phiếu chuyển nội bộ ( phiếu chi)','PCNB',6,1,1,1,'2022-06-14 14:34:46','2022-06-14 14:34:46');
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

-- Dump completed on 2023-08-19 16:16:22
