-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: thiethai
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
-- Table structure for table `categories_urlslugs`
--

DROP TABLE IF EXISTS `categories_urlslugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_urlslugs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `urlSlug` varchar(500) DEFAULT NULL,
  `sitesId` bigint(20) DEFAULT NULL,
  `categoriesId` bigint(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT 'trạng thái:\\n1: open ( active)\\n2: deactive( or closed)',
  `create_date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_urlslugs`
--

LOCK TABLES `categories_urlslugs` WRITE;
/*!40000 ALTER TABLE `categories_urlslugs` DISABLE KEYS */;
INSERT INTO `categories_urlslugs` VALUES (1,'san-pham-nong-san',1,1,1,'2021-05-25 17:20:03'),(2,'test',208,2,1,'2021-05-25 21:58:56'),(3,'san-pham',2,3,1,'2021-05-28 10:08:20'),(4,'hom-nay-co-gi-hay',2,4,1,'2021-05-28 13:40:18'),(5,'san-pham-pho-bien',2,5,1,'2021-05-28 13:40:36'),(6,'nau-an-lam-banh',2,2,1,'2021-05-30 16:37:34'),(7,'dac-san-ha-giang',2,6,1,'2021-05-30 16:38:52'),(8,'dong-dat',2,7,1,'2021-05-31 14:52:15'),(9,'dong-goi-san',2,8,1,'2021-05-31 14:54:29'),(10,'nho-le',2,9,1,'2021-05-31 14:54:55'),(11,'tat-ca',2,10,1,'2021-05-31 14:56:55'),(12,'thuc-pham-tuoi-song',2,11,1,'2021-05-31 14:57:47'),(13,'rau-cu-qua',2,12,1,'2021-05-31 14:58:18'),(14,'thuc-pham-kho-va-che-bien',2,13,1,'2021-05-31 14:59:06'),(15,'do-uong',2,14,1,'2021-05-31 14:59:32'),(16,'search',2,15,1,'2021-06-03 16:42:31'),(17,'goi-y-tim-kiem',2,16,1,'2021-06-03 16:50:32'),(18,'tim-kiem-pho-bien',2,17,1,'2021-06-03 16:50:52'),(19,'cho-so',2,18,1,'2021-06-24 10:04:25'),(20,'san-pham-nong-san-2',2,1,1,'2021-09-22 17:31:01');
/*!40000 ALTER TABLE `categories_urlslugs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:15:49
