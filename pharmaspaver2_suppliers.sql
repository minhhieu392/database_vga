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
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `image` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`image`)),
  `suppliersName` varchar(200) DEFAULT NULL,
  `suppliersCode` varchar(200) DEFAULT NULL COMMENT 'mã số khách hàng',
  `email` varchar(200) DEFAULT NULL,
  `mobile` varchar(200) DEFAULT NULL COMMENT '0: Cá nhân\n1: Công ty',
  `address` varchar(500) DEFAULT '',
  `userCreatorsId` bigint(20) NOT NULL,
  `dateUpdated` datetime DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '1: enabled 0: disabled -1: draf; -2: chờ duyệt',
  `note` text DEFAULT NULL COMMENT 'ghi chú',
  `debt` double DEFAULT 0 COMMENT 'số tiền nợ nhà cc\\\\\\\\\\\\\\\\\\\\n debt > 0  => nợ nhà cc                                           \\\\\\\\\\\\\\\\n debt < 0 => nhà CC nợ',
  `medFacilitysId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='nhà cung cấp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,NULL,'Chị Hương quầy 209','001',NULL,NULL,'',591,'2022-11-12 10:43:16','2022-11-12 10:43:16',1,NULL,17755210,1),(2,NULL,'NCC_ngọc_test1','002',NULL,NULL,'',1,'2022-11-16 16:30:43','2022-11-16 16:30:43',1,NULL,-6668950,1),(3,NULL,'NCC_ngoc_test2','003',NULL,NULL,'',1,'2022-11-16 17:17:28','2022-11-16 17:17:28',1,NULL,18000,1),(4,NULL,'ngọc test 1','004',NULL,NULL,'',1,'2022-11-17 08:38:54','2022-11-17 08:38:54',1,NULL,0,4),(5,NULL,'Hafaco','005',NULL,NULL,'',1,'2022-12-16 22:05:38','2022-12-16 22:05:38',1,NULL,0,1);
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:16:35
