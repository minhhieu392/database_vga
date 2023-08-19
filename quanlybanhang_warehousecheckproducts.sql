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
-- Table structure for table `warehousecheckproducts`
--

DROP TABLE IF EXISTS `warehousecheckproducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehousecheckproducts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `productsId` bigint(20) DEFAULT NULL,
  `warehouseCheckId` bigint(20) DEFAULT NULL,
  `stockQuantity` double DEFAULT NULL COMMENT 'số lượng trong kho',
  `actualQuantity` double DEFAULT NULL COMMENT 'tổng thực tế',
  `changeNumber` double DEFAULT NULL COMMENT 'số lượng chênh lệch',
  `totalValue` double DEFAULT NULL,
  `checkStatus` int(11) DEFAULT 0,
  `productsBatchsId` bigint(20) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `productsBatchsId` (`productsBatchsId`),
  KEY `productsId` (`productsId`),
  KEY `warehouseCheckId` (`warehouseCheckId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='kiểm kho';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehousecheckproducts`
--

LOCK TABLES `warehousecheckproducts` WRITE;
/*!40000 ALTER TABLE `warehousecheckproducts` DISABLE KEYS */;
/*!40000 ALTER TABLE `warehousecheckproducts` ENABLE KEYS */;
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
