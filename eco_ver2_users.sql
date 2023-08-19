-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: eco_ver2
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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userName` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL,
  `firstName` varchar(225) DEFAULT NULL,
  `lastName` varchar(225) DEFAULT NULL,
  `address` varchar(225) DEFAULT NULL,
  `email` varchar(225) NOT NULL,
  `gender` varchar(225) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `shopId` bigint(20) DEFAULT NULL,
  `city_id` int(15) DEFAULT NULL,
  `image` varchar(225) DEFAULT 'image',
  `re_token` varchar(500) DEFAULT NULL,
  `status` int(15) NOT NULL DEFAULT 1,
  `description` varchar(500) DEFAULT NULL,
  `phone` varchar(225) DEFAULT NULL,
  `shopStatus` int(15) NOT NULL DEFAULT 1,
  `shopToken` varchar(500) DEFAULT NULL,
  `dateUpdated` datetime DEFAULT current_timestamp(),
  `dateCreated` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `shopId` (`shopId`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`shopId`) REFERENCES `shops` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'acira0309','e10adc3949ba59abbe56e057f20f883e','Nguyen Ngoc',NULL,NULL,'test02@gmail.com',NULL,NULL,NULL,NULL,'image',NULL,0,NULL,NULL,1,NULL,'2022-12-05 13:26:32','2022-12-05 13:26:32'),(2,'acira1111','e10adc3949ba59abbe56e057f20f883e','lim lim',NULL,NULL,'',NULL,NULL,NULL,NULL,'image',NULL,0,NULL,'09327493',1,NULL,'2022-12-05 13:48:22','2022-12-05 13:48:22');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:16:07
