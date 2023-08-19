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
-- Table structure for table `pricelist`
--

DROP TABLE IF EXISTS `pricelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pricelist` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `branchesId` bigint(20) DEFAULT 1,
  `autoUpdate` tinyint(1) DEFAULT 0,
  `pricelistName` varchar(200) DEFAULT NULL,
  `priceType` int(11) DEFAULT 0 COMMENT '-1 : chưa chọn => có thể nhập thủ công \\\\\\\\n0: đã chọn , nhưng là gắn với id bảng giá khác,\\\\\\\\n1: giá vốn\\\\\\\\n2: giá nhập lần cuối ,3: giá bán mặc định           ',
  `pricelistId` bigint(20) DEFAULT 0,
  `percentChangeValue` double DEFAULT 0 COMMENT '0: giữ nguyên\\n0,2  => + 20%    \\n-0,2 => -20 %',
  `vndChangeValue` double DEFAULT 0 COMMENT '0: giữ nguyên\\\\1000  => + 1000 vnd   ',
  `usersCreatorId` bigint(20) DEFAULT NULL COMMENT 'người tạo/Người bán',
  `status` int(11) DEFAULT NULL,
  `dateCreated` datetime DEFAULT current_timestamp() COMMENT 'ngày tạo',
  `dateUpdated` datetime DEFAULT current_timestamp(),
  `isDefault` int(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `createDate` (`dateCreated`),
  KEY `status` (`status`),
  KEY `usersCreatorId` (`usersCreatorId`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Bảng giá bán';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pricelist`
--

LOCK TABLES `pricelist` WRITE;
/*!40000 ALTER TABLE `pricelist` DISABLE KEYS */;
INSERT INTO `pricelist` VALUES (1,'2022-06-10 14:22:08','2030-08-06 14:22:08',1,0,'Giá chung',3,0,0,0,1,1,'2022-06-09 14:30:11','2023-01-16 17:39:31',1),(143,'2023-01-01 09:18:43','2023-02-01 09:18:43',1,0,'giá khuyến mại 20/10',1,0,0.1,0,1,1,'2022-10-14 08:37:30','2023-01-18 09:19:04',0);
/*!40000 ALTER TABLE `pricelist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:16:18
