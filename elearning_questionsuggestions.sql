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
-- Table structure for table `questionsuggestions`
--

DROP TABLE IF EXISTS `questionsuggestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questionsuggestions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `questionSuggestionsName` varchar(500) DEFAULT NULL COMMENT 'tên  thuộc tính',
  `questionsId` bigint(20) NOT NULL,
  `correctAnswer` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questionsId` (`questionsId`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionsuggestions`
--

LOCK TABLES `questionsuggestions` WRITE;
/*!40000 ALTER TABLE `questionsuggestions` DISABLE KEYS */;
INSERT INTO `questionsuggestions` VALUES (1,'C',1,0),(2,'JAVA',1,0),(3,'Javasrcipt',1,0),(4,'HTML',1,1),(5,'C 2',2,0),(6,'JAVA',2,0),(7,'CSS',2,1),(8,'HTML',2,1),(9,'C',3,1),(10,'JAVA',3,1),(11,'Javasrcipt',3,0),(12,'HTML',3,1),(17,'C',5,0),(18,'JAVA',5,0),(19,'Javasrcipt',5,0),(20,'HTML',5,1),(37,'Đáp án 1',12,0),(38,'Đáp án 1',12,1),(39,'Đáp án 1',13,1),(40,'Đáp án 12',13,1),(41,'correct ',14,0),(42,'right',14,0),(43,'exact',14,0),(44,'suitable',14,1),(45,'developing',15,0),(46,'technologies',15,0),(47,'are',15,1),(48,'time-consuming',15,0),(49,'sold',16,0),(50,'had sold',16,1),(51,'sells',16,0),(52,'has sold',16,0),(53,'harvested',17,0),(54,'had harvested',17,1),(55,'harvest',17,0),(56,'are harvested',17,0),(57,'Bill said that he had never been to Russia and he thought he would go there the next year.',18,1),(58,'Bill said that he would have never been to Russia and he thinks he would go there the next year.',18,0),(59,'Bill said that he had never been to Russia and he thinks he will go there the next year.',18,0),(60,'Bill said that he has never been to Russia and he thinks he would go there the next year.',18,0),(81,'Đáp án 1',46,1),(82,'Đáp án 12',46,0);
/*!40000 ALTER TABLE `questionsuggestions` ENABLE KEYS */;
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
