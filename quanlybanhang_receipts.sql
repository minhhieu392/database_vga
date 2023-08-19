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
-- Table structure for table `receipts`
--

DROP TABLE IF EXISTS `receipts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receipts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customersId` bigint(20) DEFAULT NULL,
  `receiptsCode` varchar(45) DEFAULT NULL,
  `amountPaid` double DEFAULT 0 COMMENT 'số tiền khách đã trả',
  `discount` double DEFAULT 0 COMMENT 'Giảm giá của hóa đơn',
  `totalMoney` double DEFAULT NULL COMMENT 'Tiền sau khi giảm giá',
  `money` double DEFAULT NULL COMMENT 'Số tiền trước khi giảm giá',
  `status` int(11) DEFAULT NULL,
  `usersCreatorId` bigint(20) DEFAULT NULL COMMENT 'người tạo/Người bán',
  `dateUpdated` datetime DEFAULT current_timestamp(),
  `dateCreated` datetime DEFAULT current_timestamp() COMMENT 'ngày tạo',
  `ordersId` bigint(20) DEFAULT 0,
  `note` text DEFAULT NULL,
  `bankAccountsId` bigint(20) DEFAULT 0,
  `pricelistId` bigint(20) DEFAULT NULL COMMENT 'Id bảng giá',
  `totalSurchageMoney` double DEFAULT 0 COMMENT 'tổng tiền phí thu khác',
  `currentDebt` double DEFAULT 0 COMMENT 'công nợ của nhà cc / khách hàng sau khi tạo phiếu',
  `staticDay` date DEFAULT current_timestamp(),
  `branchesId` bigint(20) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `usersCreatorId` (`usersCreatorId`),
  KEY `customersId` (`customersId`),
  KEY `staticDay` (`staticDay`),
  KEY `branchesId` (`branchesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='hóa đơn của khách hàng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipts`
--

LOCK TABLES `receipts` WRITE;
/*!40000 ALTER TABLE `receipts` DISABLE KEYS */;
/*!40000 ALTER TABLE `receipts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:16:19
