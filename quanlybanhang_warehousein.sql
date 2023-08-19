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
-- Table structure for table `warehousein`
--

DROP TABLE IF EXISTS `warehousein`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehousein` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `warehouseInCode` varchar(45) DEFAULT NULL,
  `branchesId` bigint(20) DEFAULT 1,
  `customersId` bigint(20) NOT NULL,
  `amountPaid` double DEFAULT 0 COMMENT 'số tiền đã trả nhà cung cấp với type = 0.\\nsố tiền nhà cung cấp đã trả với type = 1.',
  `totalMoney` double DEFAULT NULL COMMENT 'số tiền phải trả nhà cung cấp với type = 0.\\nsố tiền nhà cung cấp phải trả với type = 1.',
  `note` text DEFAULT NULL,
  `usersCreatorId` bigint(20) DEFAULT NULL COMMENT 'người tạo/Người bán',
  `status` int(11) DEFAULT NULL,
  `dateCreated` datetime DEFAULT current_timestamp() COMMENT 'ngày tạo',
  `dateUpdated` datetime DEFAULT current_timestamp(),
  `discount` double DEFAULT 0 COMMENT 'Số tiền giảm trên toàn bộ hóa đơn',
  `money` double DEFAULT NULL COMMENT 'số tiền trước khi giảm giá',
  `bankAccountsId` bigint(20) DEFAULT 0,
  `staticDay` date DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `usersCreatorId` (`usersCreatorId`),
  KEY `customersId` (`customersId`),
  KEY `staticDay` (`staticDay`),
  KEY `branchesId` (`branchesId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='nhập hàng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehousein`
--

LOCK TABLES `warehousein` WRITE;
/*!40000 ALTER TABLE `warehousein` DISABLE KEYS */;
INSERT INTO `warehousein` VALUES (1,'PN0000001',1,2,20000000,20000000,'',1,-1,'2023-01-20 07:16:57','2023-01-20 07:57:50',0,20000000,0,'2023-01-20'),(2,'PN0000002',1,20,1900000,1900000,'',1,-1,'2023-01-20 07:27:08','2023-01-20 08:08:58',100000,2000000,0,'2023-01-20'),(3,'PN0000003',1,2,1800000,1800000,'',1,1,'2023-01-20 07:57:40','2023-01-20 07:57:50',0,1800000,0,'2023-01-20'),(4,'PN0000004',1,70,5650000,5650000,'',1,1,'2023-01-20 08:04:49','2023-01-20 08:04:55',0,5650000,0,'2023-01-20');
/*!40000 ALTER TABLE `warehousein` ENABLE KEYS */;
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
