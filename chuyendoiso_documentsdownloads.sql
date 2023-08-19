-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: chuyendoiso
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
-- Table structure for table `documentsdownloads`
--

DROP TABLE IF EXISTS `documentsdownloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documentsdownloads` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `downloads` int(11) DEFAULT 0 COMMENT 'số lượt truy cập trong ngày',
  `documentsId` bigint(20) NOT NULL,
  `statisticalDay` date DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `statisticalDay` (`statisticalDay`),
  KEY `documentsId` (`documentsId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='thống kê dowloads documentsId';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentsdownloads`
--

LOCK TABLES `documentsdownloads` WRITE;
/*!40000 ALTER TABLE `documentsdownloads` DISABLE KEYS */;
INSERT INTO `documentsdownloads` VALUES (1,2,1,'2022-12-19'),(2,3,6,'2022-12-21'),(3,5,5,'2022-12-21'),(4,2,6,'2022-12-22'),(5,3,1,'2022-12-22'),(6,1,5,'2022-12-22'),(7,8,11,'2023-01-11'),(8,1,8,'2023-01-11'),(9,2,10,'2023-01-11');
/*!40000 ALTER TABLE `documentsdownloads` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:18:49
