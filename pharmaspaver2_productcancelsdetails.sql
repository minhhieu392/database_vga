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
-- Table structure for table `productcancelsdetails`
--

DROP TABLE IF EXISTS `productcancelsdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productcancelsdetails` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `productCancelsId` bigint(20) DEFAULT NULL,
  `productsMedFacilitysId` bigint(20) DEFAULT NULL,
  `quantity` double DEFAULT NULL COMMENT 'số lượng',
  `productsId` bigint(20) DEFAULT NULL,
  `importPrice` double DEFAULT NULL COMMENT 'giá vốn nhập 1  sản phẩm lần cuốii khi hủy',
  `unitsId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productCancelsId` (`productCancelsId`),
  KEY `productsMedFacilitysId` (`productsMedFacilitysId`),
  KEY `productsId` (`productsId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productcancelsdetails`
--

LOCK TABLES `productcancelsdetails` WRITE;
/*!40000 ALTER TABLE `productcancelsdetails` DISABLE KEYS */;
INSERT INTO `productcancelsdetails` VALUES (1,1,142,1,145,17500,260),(2,2,142,1,145,175000,261),(3,3,142,1,145,17500,260),(4,4,142,2,145,17500,260),(5,5,142,1,145,17500,260),(6,6,142,2,145,17500,260),(7,6,156,2,159,20500,263),(8,11,142,3,145,17500,260),(9,11,156,2,159,20500,263),(10,12,188,10,172,2500,297);
/*!40000 ALTER TABLE `productcancelsdetails` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:16:38
