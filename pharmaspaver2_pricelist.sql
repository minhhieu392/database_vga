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
-- Table structure for table `pricelist`
--

DROP TABLE IF EXISTS `pricelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pricelist` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `autoUpdate` tinyint(1) DEFAULT 0,
  `pricelistName` varchar(200) DEFAULT NULL,
  `priceType` int(11) DEFAULT 0 COMMENT '// giá trị gốc của công thức\n                       /// -1 : chưa chọn => có thể nhập thủ công \n                       //  0: đã chọn , nhưng là gắn với id bảng giá khác,  (bảng giá phụ thuộc)\n                       // 1: giá vốn                    importPrice\n                       // 2: giá nhập nhập lần cuối     lastInPrice\n                       // 3: giá bán mặc định           salePrice\n                        //4 : giá bạn hiện tại ',
  `pricelistId` bigint(20) DEFAULT 0,
  `percentChangeValue` double DEFAULT 0 COMMENT '0: giữ nguyên\\n0,2  => + 20%    \\n-0,2 => -20 %',
  `vndChangeValue` double DEFAULT 0 COMMENT '0: giữ nguyên\\\\1000  => + 1000 vnd   ',
  `userCreatorsId` bigint(20) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `dateCreated` datetime DEFAULT current_timestamp() COMMENT 'ngày tạo',
  `dateUpdated` datetime DEFAULT current_timestamp(),
  `isDefault` int(11) DEFAULT 0 COMMENT '1: là bảng giá dùng hiện tại .\\nmỗi một chi nhánh chỉ có 1 bảng giá dùng hiện tại',
  `medFacilitysId` bigint(20) DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `percentChangeValueCardServices` double DEFAULT 0,
  `percentChangeValueComboServices` double DEFAULT 0,
  `percentChangeValueServices` double DEFAULT 0,
  `percentChangeValueComboProducts` double DEFAULT 0,
  `vndChangeValueCardServices` double DEFAULT 0,
  `vndChangeValueComboServices` double DEFAULT 0,
  `vndChangeValueServices` double DEFAULT 0,
  `vndChangeValueComboProducts` double DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `createDate` (`dateCreated`),
  KEY `status` (`status`),
  KEY `usersCreatorId` (`userCreatorsId`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Bảng giá bán';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pricelist`
--

LOCK TABLES `pricelist` WRITE;
/*!40000 ALTER TABLE `pricelist` DISABLE KEYS */;
INSERT INTO `pricelist` VALUES (1,0,'Giá chung',3,0,0,0,1,1,'2022-10-05 02:17:06','2022-12-09 09:29:16',1,1,'2024-10-29 16:00:00','2022-10-19 16:00:17',0,0,0,0,0,0,0,0),(148,0,'Giá chung',1,0,0,0,1,1,'2022-10-20 15:30:30','2022-11-09 18:00:06',1,2,'2024-10-30 15:35:00','2022-10-30 15:35:59',0,0,0,0,0,0,0,0),(153,0,'Giá chung',4,0,0,0,1,1,'2022-12-07 17:18:26','2022-12-07 17:18:26',1,3,NULL,NULL,0,0,0,0,0,0,0,0),(154,0,'theo giá vốn',1,0,0,1000,1,1,'2022-12-15 16:46:46','2022-12-15 16:46:46',0,1,NULL,NULL,0,0,0,0,0,0,0,0);
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

-- Dump completed on 2023-08-19 16:16:34
