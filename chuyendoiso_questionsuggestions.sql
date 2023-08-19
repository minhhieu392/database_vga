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
-- Table structure for table `questionsuggestions`
--

DROP TABLE IF EXISTS `questionsuggestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questionsuggestions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `questionSuggestionsName` varchar(500) DEFAULT NULL COMMENT 'tên  thuộc tính',
  `questionsId` bigint(20) NOT NULL,
  `editValueStatus` int(1) DEFAULT 0,
  `order` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `questionsId` (`questionsId`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionsuggestions`
--

LOCK TABLES `questionsuggestions` WRITE;
/*!40000 ALTER TABLE `questionsuggestions` DISABLE KEYS */;
INSERT INTO `questionsuggestions` VALUES (1,'Đất bằng ,vàn',1,1,0),(6,'Khác 3',1,1,1),(7,'Đất bằng ,vàn',2,0,0),(8,'Khác',2,1,1),(9,'ok',2,0,3),(10,'dsds',2,0,2),(11,'Đất bằng ,vàn',3,0,1),(12,'Khác',3,1,0),(13,'Đáp án 1',4,0,0),(14,'Đáp án 12',4,0,1),(15,'Đáp án 13',4,0,2),(16,'Rất hài lòng',5,0,0),(17,'Hài lòng',5,0,1),(18,'Không hài lòng',5,0,2),(19,'Rất hài lòng',6,0,0),(20,'Hài lòng',6,0,1),(21,'Không hài lòng',6,0,2),(22,'Rất hài lòng',7,0,0),(23,'Hài lòng',7,0,1),(24,'Không hài lòng',7,0,2),(25,'Đúng hẹn',8,0,0),(26,'Chậm hẹn nhưng chấp nhận được',8,0,1),(27,'Không đúng hẹn',8,0,2),(28,'Đơn giản',9,0,0),(29,'Cần giảm giấy tờ',9,0,1),(30,'Phức tạp',9,0,2),(31,'Đơn giản',10,0,0),(32,'Cần giảm giấy tờ',10,0,1),(33,'Phức tạp',10,0,2);
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

-- Dump completed on 2023-08-19 16:18:50
