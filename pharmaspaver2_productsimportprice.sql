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
-- Table structure for table `productsimportprice`
--

DROP TABLE IF EXISTS `productsimportprice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productsimportprice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `productsId` bigint(20) DEFAULT NULL,
  `medFacilitysId` bigint(20) DEFAULT NULL,
  `quantityOutIn` double DEFAULT 0,
  `totalImportPriceOutIn` double DEFAULT 0 COMMENT 'tổng giá vốn chỉ tính nhập hàng và trả nhập hàng',
  `importPrice` double DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `productsId` (`productsId`),
  KEY `medFacilitysId` (`medFacilitysId`)
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productsimportprice`
--

LOCK TABLES `productsimportprice` WRITE;
/*!40000 ALTER TABLE `productsimportprice` DISABLE KEYS */;
INSERT INTO `productsimportprice` VALUES (1,1,1,280,2358000,0),(2,2,1,5,130000,0),(3,3,1,5,135000,0),(4,4,1,3,66000,0),(5,5,1,50,142500,0),(6,6,1,50,115000,0),(7,7,1,50,75000,0),(8,8,1,50,150000,0),(9,9,1,6,249000,0),(10,10,1,24,195000,0),(11,11,1,10,55000,0),(12,12,1,20,210000,0),(13,13,1,42,297024,0),(14,14,1,150,96000,0),(15,15,1,30,174000,0),(16,16,1,15,93000,0),(17,17,1,36,114012,0),(18,18,1,5,97500,0),(19,19,1,5,77500,0),(20,20,1,100,27000,0),(21,21,1,40,48000,0),(22,22,1,40,90000,0),(23,23,1,50,95000,0),(24,24,1,50,100000,0),(25,25,1,50,100000,0),(26,26,1,70,180600,0),(27,27,1,25,192500,0),(28,28,1,25,135000,0),(29,29,1,80,38000,0),(30,30,1,20,34000,0),(31,31,1,18,108000,0),(32,32,1,25,82000,0),(33,33,1,21,28120,7.5),(34,34,1,20,50000,0),(35,35,1,100,27500,0),(36,36,1,200,156000,0),(37,37,1,50,225000,0),(38,38,1,200,620000,0),(39,39,1,200,22000,0),(40,40,1,25,2205000,0),(41,41,1,50,180000,0),(42,42,1,3,106500,0),(43,43,1,10,59000,0),(44,44,1,10,45000,0),(45,45,1,14,53200,0),(46,46,1,10,37000,0),(47,47,1,10,19000,0),(48,48,1,10,44000,0),(49,49,1,10,48000,0),(50,50,1,5,112500,0),(51,51,1,200,33000,0),(52,52,1,36,231120,0),(53,53,1,10,65000,0),(54,54,1,100,90000,0),(55,55,1,100,178000,0),(56,56,1,50,130000,0),(57,57,1,4,53000,0),(58,58,1,100,52000,0),(59,59,1,20,104000,0),(60,60,1,12,245040,0),(61,61,1,12,255000,0),(62,62,1,10,68000,0),(63,63,1,20,150000,0),(64,64,1,20,146000,0),(65,65,1,5,100000,0),(66,66,1,30,75000,0),(67,67,1,20,50000,0),(68,68,1,20,39000,0),(69,69,1,5,47500,0),(70,70,1,20,36000,0),(71,71,1,10,55000,0),(72,72,1,10,28000,0),(73,73,1,10,58000,0),(74,74,1,35,85050,0),(75,75,1,30,38010,0),(76,76,1,10,56000,0),(77,77,1,3,267000,0),(78,78,1,100,25000,0),(79,79,1,3,34500,0),(80,80,1,3,85500,0),(81,81,1,10,52000,0),(82,82,1,5,235000,0),(83,83,1,30,117510,0),(84,84,1,162,567000,0),(85,85,1,10,75000,0),(86,86,1,10,205000,0),(87,87,1,10,106000,0),(88,88,1,20,68000,0),(89,89,1,50,127500,0),(90,90,1,10,75000,0),(91,91,1,3,24000,0),(92,92,1,180,180000,0),(93,93,1,3,129000,0),(94,94,1,3,129000,0),(95,95,1,1,68000,0),(96,96,1,0,0,0),(97,97,1,1,63000,0),(98,98,1,5,85000,0),(99,99,1,20,40000,0),(100,100,1,10,120000,0),(101,101,1,10,95000,0),(102,102,1,156,891540,0),(103,103,1,28,85008,0),(104,104,1,150,120000,0),(105,105,1,50,55000,0),(106,106,1,5,195000,0),(107,107,1,5,85000,0),(108,108,1,5,55000,0),(109,109,1,10,260000,0),(110,110,1,3,144000,0),(111,111,1,3,414000,0),(112,112,1,2,98000,0),(113,113,1,20,170000,0),(114,114,1,20,220000,0),(115,115,1,3,135000,0),(116,116,1,30,1350000,0),(117,117,1,3,288000,0),(118,118,1,5,180000,0),(119,119,1,2,90000,0),(120,120,1,2,76000,0),(121,121,1,3,204000,0),(122,122,1,3,111000,0),(123,123,1,5,160000,0),(124,124,1,10,75000,0),(125,125,1,3,240000,0),(126,126,1,5,120000,0),(127,127,1,10,135000,0),(128,128,1,2,78000,0),(129,129,1,2,112000,0),(130,130,1,2,74000,0),(131,131,1,3,37500,0),(132,132,1,32,56000,0),(133,133,1,0,0,0),(134,134,1,200,92000,0),(135,135,1,5,90000,0),(136,136,1,20,90000,0),(137,137,1,200,122000,0),(138,138,1,200,72000,0),(139,139,1,100,57000,0),(140,140,1,20,124000,0),(141,141,1,2,68000,0),(142,142,1,5,82500,0),(143,143,1,40,22000,0),(144,144,1,97,105000,0),(145,145,1,200,175000,0),(146,146,1,200,310000,1550),(147,147,1,10,100000,0),(148,148,1,5,132500,0),(149,149,1,5,125000,0),(150,150,1,2,94000,0),(151,151,1,5,80000,0),(152,152,1,500,47500,0),(153,153,1,100,20000,0),(154,154,1,10,145000,0),(155,155,1,10,42000,0),(156,156,1,50,97500,0),(157,157,1,1,19500,0),(158,158,1,62,452600,0),(159,159,1,5,102500,0),(160,160,1,0,0,0),(161,161,1,100,1000000,0),(162,162,1,250,2500000,0),(163,163,1,22,1260000,0),(164,164,1,21,420000,20000),(165,165,1,0,0,0),(166,166,1,0,0,0),(167,167,1,0,0,0),(168,168,1,0,0,0),(169,169,1,0,0,0),(170,170,1,0,0,0),(171,171,1,10,55000,0),(259,172,1,300,700000,2333.33),(260,174,1,1,100,100),(261,175,1,1,55000,55000),(287,146,4,0,0,0),(291,172,4,0,0,0),(295,164,3,0,0,0),(296,185,1,0,0,1),(297,186,1,10,20,2),(298,187,1,30,90,3),(299,189,1,10,50,5),(300,190,1,10,50,5);
/*!40000 ALTER TABLE `productsimportprice` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:16:57
