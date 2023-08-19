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
-- Table structure for table `bonus`
--

DROP TABLE IF EXISTS `bonus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bonus` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `medFacilitysId` bigint(20) DEFAULT 0,
  `bonusVnd` double DEFAULT 0 COMMENT 'thưởng hoa hồng cho nhân viên , theo tỷ lệ %',
  `bonusPercent` double DEFAULT 0 COMMENT 'Thương hoa hồng cho nhân viên theo số tiền//// 0.1 = 10%',
  `bonusType` int(1) DEFAULT NULL COMMENT '0: theo bonusPercent.  1: theo bonusVnd',
  `employeeType` int(1) DEFAULT NULL COMMENT '0: cho chuyên viên tư vấn, 1: cho kỹ thuật viên',
  `comboProductsId` bigint(20) DEFAULT 0,
  `servicesId` bigint(20) DEFAULT 0,
  `comboServicesId` bigint(20) DEFAULT 0,
  `cardServicesId` bigint(20) DEFAULT 0,
  `productsId` bigint(20) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `medFacilitysId` (`medFacilitysId`),
  KEY `employeeType` (`employeeType`),
  KEY `productsId` (`productsId`),
  KEY `cardServicesId` (`cardServicesId`),
  KEY `comboProductsId` (`comboProductsId`),
  KEY `servicesId` (`servicesId`),
  KEY `comboServicesId` (`comboServicesId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='bảng thưởng hoa hồng cho kỹ thuật viên/ chuyên viên tư vấn';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bonus`
--

LOCK TABLES `bonus` WRITE;
/*!40000 ALTER TABLE `bonus` DISABLE KEYS */;
INSERT INTO `bonus` VALUES (1,1,10000,0,1,0,0,0,0,0,1),(9,0,0,0.1,0,0,0,0,0,0,6),(10,1,0,0.1,0,0,0,0,0,0,7),(11,1,0,0.2,0,0,0,0,0,0,8),(12,0,200000,0,1,0,0,0,0,0,0),(13,0,200000,0,1,0,1,0,0,0,0),(14,1,185000,0,1,0,2,0,0,0,0),(15,0,175000,0,1,0,2,0,0,0,0),(16,1,0,0.1,0,0,0,0,0,0,9),(17,1,0,0.1,0,0,0,0,0,0,10);
/*!40000 ALTER TABLE `bonus` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:16:31
