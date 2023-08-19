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
-- Table structure for table `doquestions`
--

DROP TABLE IF EXISTS `doquestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doquestions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `questionsId` bigint(20) NOT NULL,
  `questionSuggestionsId` bigint(20) NOT NULL,
  `usersId` bigint(20) NOT NULL,
  `dateCreated` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `questionSuggestionsId` (`questionSuggestionsId`),
  KEY `index2` (`questionsId`,`usersId`),
  KEY `usersId` (`usersId`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='đáp án của học viên khi làm bài tập';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doquestions`
--

LOCK TABLES `doquestions` WRITE;
/*!40000 ALTER TABLE `doquestions` DISABLE KEYS */;
INSERT INTO `doquestions` VALUES (2,5,20,517,'2022-12-14 08:44:20'),(3,1,4,517,'2022-12-14 08:45:19'),(4,2,7,517,'2022-12-14 08:45:19'),(5,2,8,517,'2022-12-14 08:45:19'),(19,14,44,517,'2022-12-14 22:19:41'),(22,18,58,517,'2022-12-14 22:21:26'),(23,15,47,517,'2022-12-15 10:08:12'),(24,16,52,517,'2022-12-15 10:08:12'),(25,17,56,517,'2022-12-15 10:08:12'),(26,18,57,517,'2022-12-15 10:08:12'),(28,14,41,519,'2022-12-21 11:22:28'),(29,15,45,519,'2022-12-21 11:22:28'),(30,16,50,519,'2022-12-21 11:22:28'),(31,17,54,519,'2022-12-21 11:22:28'),(32,18,58,519,'2022-12-21 11:22:28'),(37,5,18,520,'2022-12-27 10:07:49'),(39,5,20,520,'2022-12-27 10:10:24'),(40,5,20,509,'2022-12-28 15:04:53');
/*!40000 ALTER TABLE `doquestions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:16:04
