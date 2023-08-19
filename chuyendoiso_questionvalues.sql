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
-- Table structure for table `questionvalues`
--

DROP TABLE IF EXISTS `questionvalues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questionvalues` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `questionsId` bigint(20) NOT NULL,
  `questionSuggestionsId` bigint(20) NOT NULL,
  `doSurveysId` bigint(20) NOT NULL,
  `value` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `questionSuggestionsId` (`questionSuggestionsId`),
  KEY `index2` (`questionsId`,`doSurveysId`),
  KEY `customersId` (`doSurveysId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionvalues`
--

LOCK TABLES `questionvalues` WRITE;
/*!40000 ALTER TABLE `questionvalues` DISABLE KEYS */;
INSERT INTO `questionvalues` VALUES (1,1,1,1,'Đất bằng ,vàn'),(2,1,1,2,'Đất bằng ,vàn'),(3,1,1,3,'Đất bằng ,vàn'),(4,3,11,4,'Đất bằng ,vàn'),(5,4,14,4,'Đáp án 12'),(6,3,11,5,'Đất bằng ,vàn'),(7,4,14,5,'Đáp án 12'),(8,3,12,6,'Khác'),(9,4,13,6,'Đáp án 1'),(10,3,12,7,'Khác'),(11,4,13,7,'Đáp án 1'),(12,3,12,8,'Khác'),(13,4,13,8,'Đáp án 1'),(14,2,7,9,'Đất bằng ,vàn'),(15,2,7,10,'Đất bằng ,vàn'),(16,2,7,11,'Đất bằng ,vàn'),(17,2,7,12,'Đất bằng ,vàn'),(18,5,16,13,'Rất hài lòng'),(19,6,19,13,'Rất hài lòng'),(20,7,22,13,'Rất hài lòng'),(21,8,25,13,'Đúng hẹn'),(22,9,29,13,'Cần giảm giấy tờ'),(23,10,32,13,'Cần giảm giấy tờ'),(24,1,6,14,'Khác 3');
/*!40000 ALTER TABLE `questionvalues` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:18:53
