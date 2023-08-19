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
-- Table structure for table `contenttargetaudiences`
--

DROP TABLE IF EXISTS `contenttargetaudiences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contenttargetaudiences` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `targetAudiencesId` bigint(20) DEFAULT NULL,
  `contentsId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenttargetaudiences`
--

LOCK TABLES `contenttargetaudiences` WRITE;
/*!40000 ALTER TABLE `contenttargetaudiences` DISABLE KEYS */;
INSERT INTO `contenttargetaudiences` VALUES (59,4,1),(61,20,4),(65,4,7),(69,4,2),(71,1,8),(72,1,9),(73,2,9),(74,1,3),(75,3,8),(76,3,10),(78,3,11),(79,1,11),(80,3,10),(82,3,10),(84,2,11),(85,3,12),(86,1,12),(87,3,13),(89,2,13),(90,3,14),(91,2,14),(92,3,15),(93,3,16),(94,2,16),(95,1,17),(96,4,18),(97,4,19),(98,3,5),(99,3,20),(100,3,4),(101,3,21),(102,4,21),(103,2,21),(104,1,21),(105,3,22),(106,3,23),(107,3,24),(108,3,25),(109,3,26),(110,1,25),(111,1,27),(112,1,28),(113,3,28),(114,1,6),(115,3,29),(116,1,30),(117,1,31),(118,2,31),(119,2,32),(120,1,32),(121,4,32),(122,3,32),(123,4,33),(124,1,33),(125,1,34),(126,4,34),(127,1,35),(128,3,35),(129,1,36),(130,3,36),(131,3,37),(132,3,38),(133,1,38),(134,3,39),(135,1,39),(136,2,40),(137,3,40),(138,2,41),(139,3,41),(140,3,42),(141,4,42),(142,2,43),(143,3,43),(144,2,44),(145,1,44),(146,2,45),(147,1,45),(148,3,46),(149,3,47),(151,3,48);
/*!40000 ALTER TABLE `contenttargetaudiences` ENABLE KEYS */;
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
