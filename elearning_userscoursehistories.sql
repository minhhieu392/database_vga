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
-- Table structure for table `userscoursehistories`
--

DROP TABLE IF EXISTS `userscoursehistories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userscoursehistories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `usersId` bigint(20) NOT NULL,
  `coursesId` bigint(20) NOT NULL,
  `status` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `coursesId` (`coursesId`),
  KEY `usersId` (`usersId`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='lịch sử bài giảng/video đã xem của học viên';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userscoursehistories`
--

LOCK TABLES `userscoursehistories` WRITE;
/*!40000 ALTER TABLE `userscoursehistories` DISABLE KEYS */;
INSERT INTO `userscoursehistories` VALUES (1,1,1,0),(2,509,1,1),(3,509,29,1),(4,514,35,0),(5,517,46,0),(6,517,43,1),(7,517,42,1),(8,509,35,1),(9,517,49,0),(10,517,53,1),(11,517,32,1),(12,517,33,1),(13,518,53,0),(14,519,53,0),(15,520,41,0),(16,520,32,1),(17,509,30,0),(18,1,29,0),(19,522,33,0),(20,532,53,0),(21,530,54,1),(22,530,55,1),(23,524,42,0),(24,524,231,0),(25,509,243,0),(26,538,231,0),(27,539,253,0),(28,524,253,0),(29,546,231,0),(30,538,253,0),(31,538,254,0),(32,538,199,0),(33,554,59,0),(34,557,231,0),(35,557,232,0),(36,557,215,0),(37,557,216,0),(38,557,277,0),(39,557,253,0),(40,557,163,0),(41,557,243,0),(42,542,215,1),(43,561,277,0),(44,561,279,0),(45,557,203,0),(46,532,243,0);
/*!40000 ALTER TABLE `userscoursehistories` ENABLE KEYS */;
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
