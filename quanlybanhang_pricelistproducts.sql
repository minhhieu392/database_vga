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
-- Table structure for table `pricelistproducts`
--

DROP TABLE IF EXISTS `pricelistproducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pricelistproducts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `productsId` bigint(20) NOT NULL,
  `pricelistId` bigint(20) NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pricelistId` (`pricelistId`),
  KEY `productsId` (`productsId`)
) ENGINE=InnoDB AUTO_INCREMENT=310 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='giá sp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pricelistproducts`
--

LOCK TABLES `pricelistproducts` WRITE;
/*!40000 ALTER TABLE `pricelistproducts` DISABLE KEYS */;
INSERT INTO `pricelistproducts` VALUES (2,1,1,2000),(3,2,1,1500),(4,3,1,1500),(9,4,1,0),(10,5,1,0),(11,6,1,0),(12,7,1,0),(13,8,1,0),(14,9,1,0),(15,10,1,0),(16,11,1,0),(39,14,1,0),(41,15,1,0),(43,16,1,20000),(45,17,1,25000),(47,18,1,50000),(49,19,1,18000),(51,20,1,68000),(53,21,1,0),(54,22,1,0),(59,23,1,0),(60,24,1,0),(61,25,1,0),(62,26,1,0),(73,27,1,7000),(74,28,1,168000),(79,29,1,10000),(81,30,1,7000),(82,31,1,210000),(87,32,1,5400),(88,33,1,21600),(89,34,1,108000),(93,35,1,9000),(94,36,1,216000),(99,37,1,5000),(100,38,1,50000),(105,39,1,2000),(106,40,1,20000),(111,45,1,0),(112,46,1,0),(113,47,1,0),(114,48,1,0),(115,49,1,0),(116,50,1,0),(117,51,1,0),(118,52,1,0),(141,53,1,0),(142,54,1,0),(143,55,1,0),(144,56,1,0),(145,57,1,0),(146,58,1,0),(147,59,1,0),(148,60,1,0),(171,61,1,0),(172,62,1,0),(173,63,1,0),(174,64,1,0),(175,65,1,0),(176,66,1,0),(177,67,1,0),(178,68,1,0),(201,69,1,1500),(202,70,1,15000),(207,71,1,1500),(208,72,1,15000),(213,1,143,550),(214,2,143,88),(215,3,143,0),(216,4,143,1025),(217,5,143,3300),(218,6,143,1650),(219,7,143,2558),(220,9,143,0),(221,10,143,0),(222,11,143,0),(223,16,143,0),(224,17,143,19800),(225,18,143,1100),(226,19,143,13200),(227,20,143,66000),(228,21,143,0),(229,22,143,0),(230,23,143,0),(231,24,143,0),(232,25,143,0),(233,26,143,0),(234,27,143,0),(235,28,143,0),(236,29,143,0),(237,30,143,0),(238,31,143,0),(239,32,143,6600),(240,33,143,0),(241,34,143,0),(242,35,143,9648),(243,36,143,0),(244,37,143,16500),(245,38,143,0),(246,39,143,0),(247,40,143,0),(248,61,143,1100),(249,62,143,3300),(250,63,143,1650),(251,64,143,3300),(252,65,143,0),(253,66,143,0),(254,67,143,0),(255,68,143,0),(256,69,143,0),(257,70,143,0),(258,71,143,550),(259,72,143,0),(260,8,143,0),(276,73,1,8000),(277,74,1,192000),(279,73,143,0),(280,74,143,0),(282,75,1,3000),(283,76,1,6000),(285,75,143,0),(286,76,143,0),(288,77,1,12000),(289,78,1,288000),(291,77,143,0),(292,78,143,0),(294,79,1,20000),(295,79,143,0),(296,80,1,10000),(297,81,1,12000),(298,82,1,100000),(299,83,1,120000),(303,80,143,0),(304,81,143,0),(305,82,143,0),(306,83,143,0);
/*!40000 ALTER TABLE `pricelistproducts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:16:22