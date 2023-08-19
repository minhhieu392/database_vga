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
-- Table structure for table `ordersdetails`
--

DROP TABLE IF EXISTS `ordersdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordersdetails` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ordersId` bigint(20) DEFAULT NULL,
  `productsId` bigint(20) DEFAULT NULL,
  `quantity` double DEFAULT NULL COMMENT 'số lượng',
  `price` double DEFAULT NULL COMMENT 'giá 1 sp ',
  `dealPrice` double DEFAULT NULL COMMENT 'giá cuối cùng của 1 sp',
  `discount` double DEFAULT NULL COMMENT 'giảm giá , 2000 => giảm 2000 vnđ',
  `type` int(11) DEFAULT 0 COMMENT '0: sản phẩm, 1:gói sản phẩm',
  `comboProductsId` bigint(20) DEFAULT NULL,
  `unitsId` bigint(20) DEFAULT NULL,
  `isTotal` int(1) DEFAULT 1 COMMENT '1: những sản phẩm , gói sp đính trực tiếp vói hóa đơn',
  PRIMARY KEY (`id`),
  KEY `productsId` (`productsId`),
  KEY `ordersId` (`ordersId`),
  KEY `isTotal` (`isTotal`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordersdetails`
--

LOCK TABLES `ordersdetails` WRITE;
/*!40000 ALTER TABLE `ordersdetails` DISABLE KEYS */;
INSERT INTO `ordersdetails` VALUES (2,1,84,10,3500,3500,0,0,NULL,174,1),(11,2,89,1,2550,2550,0,0,NULL,179,1),(12,3,32,1,3280,3280,0,0,NULL,122,1),(13,4,33,10,1120,1120,0,0,NULL,123,1),(14,5,106,1,39000,39000,0,0,NULL,196,1),(15,6,175,1,55000,55000,0,0,NULL,302,1),(16,7,74,10,2430,2430,0,0,NULL,164,1),(17,8,33,10,1120,1120,0,0,NULL,123,1);
/*!40000 ALTER TABLE `ordersdetails` ENABLE KEYS */;
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
