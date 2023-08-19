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
-- Table structure for table `producttypes`
--

DROP TABLE IF EXISTS `producttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producttypes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `productTypesName` varchar(200) NOT NULL,
  `userCreatorsId` bigint(20) NOT NULL,
  `dateCreated` datetime DEFAULT current_timestamp(),
  `dateUpdated` datetime DEFAULT NULL,
  `status` int(11) DEFAULT 1 COMMENT '1: enabled 0: disabled -1: draf; -2: chờ duyệt',
  `isMedicine` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='loại sản phẩm ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producttypes`
--

LOCK TABLES `producttypes` WRITE;
/*!40000 ALTER TABLE `producttypes` DISABLE KEYS */;
INSERT INTO `producttypes` VALUES (1,'Chăm sóc cá nhân',1,'2022-09-09 02:35:23','2022-11-12 08:29:50',1,0),(2,'Thực phẩm chức năng',1,'2022-09-09 02:37:34','2022-11-12 08:28:47',1,0),(3,'Dược mỹ phẩm',1,'2022-10-10 09:29:18','2022-11-12 08:29:12',1,0),(4,'Thiết bị y tế',1,'2022-10-13 02:59:56','2022-11-12 08:30:09',1,0),(5,'Thuốc',1,'2022-10-13 03:02:11','2022-11-12 08:29:37',1,1),(9,'Skincare',1,'2022-10-28 10:23:10','2022-11-12 10:36:54',1,0),(10,'không phải là thuốc',591,'2022-11-11 23:25:02','2022-12-13 14:56:56',0,0),(11,'Thuốc kháng sinh',591,'2022-11-11 23:30:39','2022-11-12 10:37:01',1,1),(12,'Hóa mỹ phẩm',591,'2022-11-11 23:32:44','2022-11-12 10:37:03',1,0),(13,'Thuốc kháng viêm',591,'2022-11-11 23:33:36','2022-11-12 10:37:05',1,1),(14,'Thuốc chống dị ứng',591,'2022-11-11 23:34:11','2022-11-12 10:37:07',1,1),(15,'Thuốc giảm đau - Hạ sốt',591,'2022-11-11 23:34:54','2022-11-12 10:37:10',1,1),(16,'Thuốc ho',591,'2022-11-11 23:35:26','2022-11-12 10:37:12',1,1),(17,'Thuốc ho - long đờm',591,'2022-11-11 23:35:52','2022-11-12 10:37:14',1,1);
/*!40000 ALTER TABLE `producttypes` ENABLE KEYS */;
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
