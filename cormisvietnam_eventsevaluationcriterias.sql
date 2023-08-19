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
-- Table structure for table `eventsevaluationcriterias`
--

DROP TABLE IF EXISTS `eventsevaluationcriterias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventsevaluationcriterias` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `evaluationCriteriasId` bigint(20) NOT NULL,
  `eventsId` bigint(20) NOT NULL,
  `type` int(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `eventsId` (`eventsId`),
  KEY `evaluationCriterias` (`evaluationCriteriasId`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='bảng liên kết event và chỉ tiêu';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventsevaluationcriterias`
--

LOCK TABLES `eventsevaluationcriterias` WRITE;
/*!40000 ALTER TABLE `eventsevaluationcriterias` DISABLE KEYS */;
INSERT INTO `eventsevaluationcriterias` VALUES (1,523,1,1),(2,524,1,1),(3,525,1,1),(4,523,1,0),(5,524,1,0),(6,525,1,0),(7,520,1,0),(8,519,1,0),(9,521,1,0),(10,22,1,0),(11,23,1,0),(12,526,2,1),(13,527,2,1),(14,528,2,1),(15,522,2,0),(16,12,2,0),(17,13,2,0),(18,1,2,0),(19,24,2,0),(20,526,2,0),(21,527,2,0),(22,528,2,0),(23,523,3,1),(24,524,3,1),(25,525,3,1),(26,523,3,0),(27,524,3,0),(28,525,3,0),(29,520,3,0),(30,519,3,0),(31,521,3,0),(32,22,3,0),(33,23,3,0),(38,523,5,1),(39,524,5,1),(40,525,5,1),(41,523,5,0),(42,524,5,0),(43,525,5,0),(44,520,5,0),(45,519,5,0),(46,521,5,0),(47,22,5,0),(48,23,5,0),(53,523,7,1),(54,524,7,1),(55,525,7,1),(56,523,7,0),(57,524,7,0),(58,525,7,0),(59,520,7,0),(60,519,7,0),(61,521,7,0),(62,22,7,0),(63,23,7,0),(68,523,9,1),(69,524,9,1),(70,525,9,1),(71,523,9,0),(72,524,9,0),(73,525,9,0),(74,520,9,0),(75,519,9,0),(76,521,9,0),(77,22,9,0),(78,23,9,0),(83,526,2,1),(84,527,2,1),(85,528,2,1),(86,522,2,0),(87,12,2,0),(88,13,2,0),(89,1,2,0),(90,24,2,0),(91,526,2,0),(92,527,2,0),(93,528,2,0),(98,526,4,1),(99,527,4,1),(100,528,4,1),(101,522,4,0),(102,12,4,0),(103,13,4,0),(104,1,4,0),(105,24,4,0),(106,526,4,0),(107,527,4,0),(108,528,4,0),(113,526,6,1),(114,527,6,1),(115,528,6,1),(116,522,6,0),(117,12,6,0),(118,13,6,0),(119,1,6,0),(120,24,6,0),(121,526,6,0),(122,527,6,0),(123,528,6,0),(128,526,8,1),(129,527,8,1),(130,528,8,1),(131,522,8,0),(132,12,8,0),(133,13,8,0),(134,1,8,0),(135,24,8,0),(136,526,8,0),(137,527,8,0),(138,528,8,0),(143,526,10,1),(144,527,10,1),(145,528,10,1),(146,522,10,0),(147,12,10,0),(148,13,10,0),(149,1,10,0),(150,24,10,0),(151,526,10,0),(152,527,10,0),(153,528,10,0);
/*!40000 ALTER TABLE `eventsevaluationcriterias` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:18:42
