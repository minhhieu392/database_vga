-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: elearning
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
-- Table structure for table `userscoursegroups`
--

DROP TABLE IF EXISTS `userscoursegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userscoursegroups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `usersId` bigint(20) NOT NULL,
  `courseGroupsId` bigint(20) NOT NULL,
  `expiredDate` date DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `coursesId` (`courseGroupsId`),
  KEY `usersId` (`usersId`),
  KEY `expiredDate` (`expiredDate`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='học viên đã mua khóa học';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userscoursegroups`
--

LOCK TABLES `userscoursegroups` WRITE;
/*!40000 ALTER TABLE `userscoursegroups` DISABLE KEYS */;
INSERT INTO `userscoursegroups` VALUES (7,1,1,'2023-12-06'),(8,509,3,'2023-03-06'),(9,512,1,'2022-12-14'),(10,510,1,'2022-12-14'),(12,509,9,NULL),(13,515,3,'2023-12-07'),(14,514,3,'2023-03-07'),(15,516,3,NULL),(16,513,3,NULL),(17,517,11,'2023-12-14'),(18,517,4,NULL),(19,517,12,NULL),(20,512,8,'2023-03-19'),(21,518,12,NULL),(22,519,12,NULL),(23,519,11,'2023-12-21'),(24,520,12,NULL),(25,520,11,'2023-12-26'),(26,520,1,'2023-01-03'),(27,520,4,NULL),(28,509,1,'2023-03-28'),(29,530,12,'2023-01-10'),(30,518,11,NULL),(37,524,26,'2024-01-04'),(38,542,23,'2024-01-05'),(39,539,26,'2024-01-05'),(40,540,22,'2024-01-05'),(41,509,12,'2023-01-19'),(42,509,4,NULL),(48,516,8,'2022-04-05'),(49,511,9,NULL),(50,514,27,'2022-04-05');
/*!40000 ALTER TABLE `userscoursegroups` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:16:00
