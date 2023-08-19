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
-- Table structure for table `productreturns`
--

DROP TABLE IF EXISTS `productreturns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productreturns` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `productReturnsCode` varchar(45) DEFAULT NULL,
  `customersId` bigint(20) DEFAULT NULL,
  `amountPaid` double DEFAULT 0 COMMENT 'số tiền đã trả nhà cung cấp với type = 0.\\nsố tiền nhà cung cấp đã trả với type = 1.',
  `totalMoney` double DEFAULT NULL COMMENT 'số tiền phải trả nhà cung cấp với type = 0.\\nsố tiền nhà cung cấp phải trả với type = 1.',
  `note` text DEFAULT NULL,
  `usersCreatorId` bigint(20) DEFAULT NULL COMMENT 'người tạo/Người bán',
  `status` int(11) DEFAULT NULL,
  `dateCreated` datetime DEFAULT current_timestamp() COMMENT 'ngày tạo',
  `dateUpdated` datetime DEFAULT current_timestamp(),
  `type` int(11) DEFAULT NULL COMMENT '0: nhập hàng\n1: trả hàng',
  `discount` double DEFAULT 0 COMMENT 'Số tiền giảm trên toàn bộ hóa đơn',
  `money` double DEFAULT NULL COMMENT 'số tiền trước khi giảm giá',
  `bankAccountsId` bigint(20) DEFAULT 0,
  `receiptsId` bigint(20) DEFAULT 0,
  `pricelistId` bigint(20) DEFAULT NULL,
  `totalSurchageMoney` double DEFAULT 0 COMMENT 'tổng tiển phí thu khác',
  `returnFee` double DEFAULT 0 COMMENT 'phí trả hàng',
  `currentDebt` double DEFAULT 0 COMMENT 'công nợ của nhà cc / khách hàng sau khi tạo phiếu',
  `staticDay` date DEFAULT current_timestamp(),
  `branchesId` bigint(20) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `usersCreatorId` (`usersCreatorId`),
  KEY `staticDay` (`staticDay`),
  KEY `branchesId` (`branchesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='khách trả hàng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productreturns`
--

LOCK TABLES `productreturns` WRITE;
/*!40000 ALTER TABLE `productreturns` DISABLE KEYS */;
/*!40000 ALTER TABLE `productreturns` ENABLE KEYS */;
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
