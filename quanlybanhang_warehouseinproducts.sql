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
-- Table structure for table `warehouseinproducts`
--

DROP TABLE IF EXISTS `warehouseinproducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouseinproducts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `warehouseInId` bigint(20) DEFAULT NULL,
  `productsId` bigint(20) DEFAULT NULL,
  `amount` double DEFAULT NULL COMMENT 'số lượng',
  `price` double DEFAULT NULL COMMENT 'giá 1 sp ',
  `dealPrice` double DEFAULT NULL COMMENT 'số tiền 1sp sau khi  giảm giá',
  `discount` double DEFAULT 0 COMMENT 'giảm giá , 2000 => giảm 2000 vnđ',
  `importPrice` double DEFAULT NULL COMMENT 'giá được tính sau khi nhập hàng/trả nhập hàng lần này.\\\\\\\\ndùng để lưu vết',
  `productsBatchsId` bigint(20) DEFAULT 0,
  `manufactureDate` date DEFAULT NULL,
  `expirationDate` date DEFAULT NULL,
  `productsBatchsCode` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `warehouseInId` (`warehouseInId`),
  KEY `productsId` (`productsId`),
  KEY `productsBatchsId` (`productsBatchsId`),
  KEY `customersId` (`productsBatchsCode`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouseinproducts`
--

LOCK TABLES `warehouseinproducts` WRITE;
/*!40000 ALTER TABLE `warehouseinproducts` DISABLE KEYS */;
INSERT INTO `warehouseinproducts` VALUES (1,1,82,200,100000,100000,0,100000,1,NULL,NULL,NULL),(2,2,81,200,12000,10000,2000,10000,2,NULL,NULL,NULL),(3,3,80,200,9000,9000,0,9000,1,'2023-01-02','2023-01-31',NULL),(4,4,23,50,115000,113000,2000,113000,3,NULL,NULL,NULL);
/*!40000 ALTER TABLE `warehouseinproducts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:16:25
