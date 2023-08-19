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
-- Table structure for table `histories`
--

DROP TABLE IF EXISTS `histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `histories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL COMMENT '1:tạo sp.            2: kiểm hàng .                   3: nhận đặt hàng. 4: bán hàng.            5: nhận trả hàng.\\n6: nhập hàng .\\n7: trả nhập hàng.\\n8:tạo phiếu thu.\\n9: tạo phiếu chi',
  `usersCreatorId` bigint(20) DEFAULT NULL,
  `dateCreated` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='thuộc tính';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `histories`
--

LOCK TABLES `histories` WRITE;
/*!40000 ALTER TABLE `histories` DISABLE KEYS */;
INSERT INTO `histories` VALUES (1,9,1,'2023-01-20 07:17:08'),(2,6,1,'2023-01-20 07:17:08'),(3,9,1,'2023-01-20 07:27:26'),(4,6,1,'2023-01-20 07:27:26'),(5,9,1,'2023-01-20 07:57:50'),(6,6,1,'2023-01-20 07:57:50'),(7,9,1,'2023-01-20 08:04:55'),(8,6,1,'2023-01-20 08:04:55'),(9,8,1,'2023-01-20 08:12:35'),(10,6,1,'2023-01-20 08:12:35'),(11,8,1,'2023-01-20 08:13:22'),(12,6,1,'2023-01-20 08:13:22'),(13,8,1,'2023-01-20 08:19:39'),(14,6,1,'2023-01-20 08:19:39'),(15,8,1,'2023-01-20 08:24:54'),(16,6,1,'2023-01-20 08:24:54'),(17,8,1,'2023-01-20 08:32:44'),(18,6,1,'2023-01-20 08:32:44'),(19,8,1,'2023-01-20 08:33:56'),(20,6,1,'2023-01-20 08:33:56'),(21,8,1,'2023-01-20 09:23:44'),(22,6,1,'2023-01-20 09:23:44');
/*!40000 ALTER TABLE `histories` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:16:21
