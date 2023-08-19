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
-- Table structure for table `vouchers`
--

DROP TABLE IF EXISTS `vouchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vouchers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vouchersName` varchar(200) NOT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `discountReceiptsPercent` double DEFAULT NULL COMMENT 'giảm theo % hđ',
  `userCreatorsId` bigint(20) NOT NULL,
  `dateCreated` datetime DEFAULT current_timestamp(),
  `dateUpdated` datetime DEFAULT NULL,
  `status` int(11) DEFAULT 1 COMMENT '1: enabled 0: disabled -1: draf; -2: chờ duyệt',
  `discountReceiptsVnd` double DEFAULT NULL COMMENT 'mức giảm cố định (vnd)',
  `discountType` int(11) DEFAULT NULL COMMENT '0: giảm theo % ,1: giảm cố định',
  `maxDiscount` double DEFAULT NULL COMMENT 'số tiên giảm tối đa',
  `forAll` int(1) DEFAULT NULL COMMENT '1: cho tất cả, 0: chỉ định',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='loại sản phẩm ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vouchers`
--

LOCK TABLES `vouchers` WRITE;
/*!40000 ALTER TABLE `vouchers` DISABLE KEYS */;
INSERT INTO `vouchers` VALUES (1,'Ngày phụ nữ Việt Nam','','2022-10-20 07:00:00','2022-10-22 07:00:00',0.2,1,'2022-10-26 14:38:44','2022-10-27 14:35:55',1,0,0,99000,1),(2,'Ngày nhà giáo Việt Nam','','2022-11-20 07:00:00','2022-11-26 07:00:00',0.05,1,'2022-10-26 14:39:42','2022-10-27 14:35:26',1,0,0,199000,1),(3,'Khách hàng thân thiết','','2022-10-26 07:00:00','2022-10-31 07:00:00',0.3,1,'2022-10-26 14:40:23','2022-10-27 14:34:51',1,0,0,199000,0),(4,'BlackFriday','','2022-10-26 14:41:23','2022-12-26 14:41:00',0,1,'2022-10-26 14:41:51','2022-10-27 09:41:31',-1,0,1,79000,1),(5,'Khai trương cửa hàng Spa','','2022-10-26 14:41:58','2022-10-27 14:41:00',0,1,'2022-10-26 14:42:43','2022-10-27 13:44:25',0,0,1,100000,1),(6,'KHai trương','Mừng khai trương','2022-11-03 07:00:00','2022-11-05 07:00:00',0,562,'2022-11-03 11:22:23','2022-11-03 11:22:23',1,0,1,250000,1);
/*!40000 ALTER TABLE `vouchers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:16:37
