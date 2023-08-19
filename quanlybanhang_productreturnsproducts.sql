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
-- Table structure for table `productreturnsproducts`
--

DROP TABLE IF EXISTS `productreturnsproducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productreturnsproducts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `productReturnsId` bigint(20) DEFAULT NULL,
  `productsId` bigint(20) DEFAULT NULL,
  `amount` bigint(20) DEFAULT NULL COMMENT 'số lượng',
  `price` double DEFAULT NULL COMMENT 'giá 1 sp ',
  `dealPrice` double DEFAULT NULL COMMENT 'số tiền 1sp sau khi  tăng/ giảm giá ',
  `discount` double DEFAULT 0 COMMENT 'số tiền giảm 1 sp',
  `productsBatchsId` bigint(20) DEFAULT 0,
  `importPrice` double DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `productsBatchsId` (`productsBatchsId`),
  KEY `productReturnsId` (`productReturnsId`),
  KEY `productsId` (`productsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productreturnsproducts`
--

LOCK TABLES `productreturnsproducts` WRITE;
/*!40000 ALTER TABLE `productreturnsproducts` DISABLE KEYS */;
/*!40000 ALTER TABLE `productreturnsproducts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:16:16
