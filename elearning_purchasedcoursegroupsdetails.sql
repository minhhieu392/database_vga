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
-- Table structure for table `purchasedcoursegroupsdetails`
--

DROP TABLE IF EXISTS `purchasedcoursegroupsdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchasedcoursegroupsdetails` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `purchasedCourseGroupsId` bigint(20) NOT NULL,
  `money` int(11) DEFAULT 0,
  `servicesId` bigint(20) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `servicesId` (`servicesId`),
  KEY `purchasedCourseGroupsId` (`purchasedCourseGroupsId`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='chi tiết lịch sử mua/ đăng ký gói khóa học ,dịch vụ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchasedcoursegroupsdetails`
--

LOCK TABLES `purchasedcoursegroupsdetails` WRITE;
/*!40000 ALTER TABLE `purchasedcoursegroupsdetails` DISABLE KEYS */;
INSERT INTO `purchasedcoursegroupsdetails` VALUES (1,25,100000,1),(2,23,100000,1),(3,26,100000,1),(5,28,100000,1),(6,29,100000,1),(7,30,100000,1),(8,35,50000,2),(9,36,100000,1),(10,37,100000,1),(11,38,100000,1),(12,39,100000,1),(13,40,100000,1),(14,43,50000,2),(15,44,50000,2),(19,48,100000,1),(20,49,100000,1),(21,50,100000,1),(22,51,50000,2),(23,52,50000,2),(24,57,100000,1),(25,58,100000,1),(26,59,100000,1),(27,60,100000,1),(28,61,100000,1),(29,62,100000,1),(30,64,100000,1),(31,70,50000,2),(32,70,100000,1),(33,72,100000,1);
/*!40000 ALTER TABLE `purchasedcoursegroupsdetails` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:15:59
