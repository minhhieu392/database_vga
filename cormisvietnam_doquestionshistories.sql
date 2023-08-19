-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cormisvietnam
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
-- Table structure for table `doquestionshistories`
--

DROP TABLE IF EXISTS `doquestionshistories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doquestionshistories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `eventsId` bigint(20) NOT NULL,
  `usersId` bigint(20) NOT NULL,
  `dateCreated` datetime DEFAULT current_timestamp(),
  `doQuestionsHistoriesDate` date DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `eventsId` (`eventsId`),
  KEY `usersId` (`usersId`),
  KEY `doQuestionsHistoriesDate` (`doQuestionsHistoriesDate`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='lưu vết thời gian khảo sát';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doquestionshistories`
--

LOCK TABLES `doquestionshistories` WRITE;
/*!40000 ALTER TABLE `doquestionshistories` DISABLE KEYS */;
INSERT INTO `doquestionshistories` VALUES (1,1,1,'2023-01-03 17:10:48','2023-01-03'),(24,1,1,'2023-01-03 17:44:13','2023-01-03'),(25,1,1,'2023-01-03 17:51:56','2023-01-03');
/*!40000 ALTER TABLE `doquestionshistories` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:18:37
