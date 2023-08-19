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
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `units` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `unitsName` varchar(200) NOT NULL COMMENT 'a',
  `exchangeValue` double DEFAULT 1,
  `isCore` tinyint(1) DEFAULT 0 COMMENT 'đơn vị cơ bản isCore = 1',
  `directSales` tinyint(1) DEFAULT 1 COMMENT 'bán trực tiếp directSales = 1',
  `parentId` bigint(20) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='đơn vị tính';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` VALUES (1,'cái',1,1,1,0),(2,'cái',1,1,1,0),(3,'hộp',10,0,1,2),(4,'cái 3',1,1,1,0),(5,'cái',1,1,1,0),(6,'cái',1,1,1,0),(7,'cái',1,1,1,0),(8,'hộp',10,0,1,4),(9,'hộp',10,0,1,5),(10,'hộp',10,0,1,6),(11,'hộp',10,0,1,7),(14,'hộp 24',24,0,1,0),(15,'hộp 24',24,0,1,0),(16,'hộp 24',24,0,1,0),(17,'Lon',1,1,1,0),(18,'Thùng',24,0,1,17),(19,'Hộp',1,1,1,0),(20,'Thùng',30,0,1,19),(21,'Hộp',1,1,1,0),(22,'Vỉ',4,0,1,21),(23,'Thùng',20,0,1,21),(24,'Hộp',1,1,1,0),(25,'thùng',24,0,1,24),(26,'Túi',1,1,1,0),(27,'Thùng',10,0,1,26),(28,'Túi',1,1,1,0),(29,'Thùng',10,0,1,28),(34,'cái',1,1,1,0),(35,'cái',1,1,1,0),(36,'cái',1,1,1,0),(37,'cái',1,1,1,0),(38,'hộp',10,0,1,34),(39,'hộp',10,0,1,35),(40,'hộp',10,0,1,36),(41,'hộp',10,0,1,37),(42,'cái',1,1,1,0),(43,'cái',1,1,1,0),(44,'cái',1,1,1,0),(45,'cái',1,1,1,0),(46,'hộp',10,0,1,42),(47,'hộp',10,0,1,43),(48,'hộp',10,0,1,44),(49,'hộp',10,0,1,45),(50,'cái',1,1,1,0),(51,'cái',1,1,1,0),(52,'cái',1,1,1,0),(53,'cái',1,1,1,0),(54,'hộp',10,0,1,50),(55,'hộp',10,0,1,51),(56,'hộp',10,0,1,52),(57,'hộp',10,0,1,53),(58,'cái',1,1,1,0),(59,'hộp',10,0,1,58),(60,'cái',1,1,1,0),(61,'hộp',10,0,1,60),(62,'Lon',1,1,1,0),(63,'Thùng',24,0,1,62),(64,'Cốc',1,1,1,0),(65,'Chai',2,0,1,64),(66,'lon',1,1,1,0),(67,'thùng',24,0,1,66),(68,'cốc',1,1,1,0),(69,'Lọ',1,1,1,0),(70,'Lọ',1,1,1,0),(71,'Thùng',10,0,1,69),(72,'Thùng',10,0,1,70);
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:16:18
