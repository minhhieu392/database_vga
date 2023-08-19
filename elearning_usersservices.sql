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
-- Table structure for table `usersservices`
--

DROP TABLE IF EXISTS `usersservices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usersservices` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `teachersId` bigint(20) DEFAULT 0,
  `usersId` int(11) NOT NULL,
  `servicesId` bigint(20) NOT NULL,
  `courseGroupsId` bigint(20) NOT NULL,
  `expiredDate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `servicesId` (`servicesId`),
  KEY `courseGroupsId` (`courseGroupsId`),
  KEY `usersId` (`usersId`),
  KEY `teachersId` (`teachersId`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='học viên mua dịch vụ và giáo viên dạy kèm';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usersservices`
--

LOCK TABLES `usersservices` WRITE;
/*!40000 ALTER TABLE `usersservices` DISABLE KEYS */;
INSERT INTO `usersservices` VALUES (1,533,512,1,8,'2023-03-19'),(2,533,517,1,4,NULL),(4,0,509,1,11,'2022-12-20'),(5,0,518,1,12,'2022-12-20'),(6,0,509,2,1,'2022-12-22'),(7,528,520,1,12,NULL),(8,0,520,1,11,'2022-12-26'),(9,0,530,2,12,'2023-01-03'),(21,0,524,2,26,'2024-01-04'),(22,0,542,2,23,'2024-01-05'),(23,0,539,1,26,'2024-01-05'),(24,0,540,2,22,'2024-01-05'),(25,528,509,1,12,'2023-01-19'),(27,0,516,1,8,'2023-04-05'),(28,0,516,1,8,'2023-04-05'),(29,0,516,1,8,'2023-04-05'),(30,0,516,1,8,'2023-04-05'),(31,0,516,1,8,'2023-04-05');
/*!40000 ALTER TABLE `usersservices` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:16:03
