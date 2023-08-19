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
-- Table structure for table `warehouseout`
--

DROP TABLE IF EXISTS `warehouseout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouseout` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `warehouseOutCode` varchar(45) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='trả hàng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouseout`
--

LOCK TABLES `warehouseout` WRITE;
/*!40000 ALTER TABLE `warehouseout` DISABLE KEYS */;
INSERT INTO `warehouseout` VALUES (1,'PTH0000001',1,39,565000,565000,'',1,-1,'2023-01-20 08:12:28','2023-01-20 08:13:22',0,565000,0,'2023-01-20'),(2,'PTH0000002',1,39,113000,1130000,'',1,-1,'2023-01-20 08:13:15','2023-01-20 08:18:16',0,1130000,0,'2023-01-20'),(3,'PTH0000003',1,70,900000,900000,'',1,-1,'2023-01-20 08:19:32','2023-01-20 08:31:58',0,900000,0,'2023-01-20'),(4,'PTH0000004',1,20,90000,90000,'',1,-1,'2023-01-20 08:24:46','2023-01-20 08:32:03',0,90000,0,'2023-01-20'),(5,'PTH0000005',1,20,900000,900000,'',1,-1,'2023-01-20 08:32:33','2023-01-20 08:33:56',0,900000,0,'2023-01-20'),(6,'PTH0000006',1,20,90000,90000,'',1,-1,'2023-01-20 08:33:51','2023-01-20 09:23:44',0,90000,0,'2023-01-20'),(7,'PTH0000007',1,20,890000,890000,'',1,1,'2023-01-20 09:23:38','2023-01-20 09:23:44',0,890000,0,'2023-01-20');
/*!40000 ALTER TABLE `warehouseout` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:16:27
