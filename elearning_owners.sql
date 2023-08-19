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
-- Table structure for table `owners`
--

DROP TABLE IF EXISTS `owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owners` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) DEFAULT NULL,
  `villagesId` varchar(45) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `userCreatorsId` bigint(20) DEFAULT NULL,
  `dateCreated` datetime DEFAULT current_timestamp(),
  `dateUpdated` datetime DEFAULT NULL,
  `points` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`points`)),
  `ethnic` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='cơ sở lưu giữ(nuôi)  cá thể , nguồn gen quý hiếm';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owners`
--

LOCK TABLES `owners` WRITE;
/*!40000 ALTER TABLE `owners` DISABLE KEYS */;
INSERT INTO `owners` VALUES (1,'Viện nghiên cứu cây ăn quả miền Bắc','2074','ghi chú',1,1,'2022-04-04 09:07:19','2022-09-10 12:44:48','[105.85323257857294,20.014424548836008]',NULL),(2,'Viện nghiên cứu thủy sản miền Trung','2074','ghi chú',1,1,'2022-04-04 13:48:31','2022-09-10 12:43:54','[105.63911200696157,20.050621635590815]',NULL),(3,'Viện nghiên cứu miền Trung','2079','Ghi chú',1,1,'2022-04-04 14:00:57','2022-09-10 12:52:11','[105.7955880742785,19.932136511310453]',NULL),(4,'Viện nghiên cứu thủy sản miền Bắc','2078','ghi chú',1,1,'2022-04-05 13:53:23','2022-09-10 12:52:00','[105.7598406030812,19.807965656866354]',NULL),(5,'Viện nghiên cứu thủy sản miền Nam','2077','ghi chú',1,1,'2022-04-05 13:53:31','2022-09-10 12:51:49','[105.8230597304613,19.851997752025063]',NULL),(6,'Viện bảo vệ thực vật','2076','ghi chú',1,1,'2022-04-05 14:03:12','2022-09-10 12:51:39','[105.80383171095241,19.81952779114279]',NULL),(7,'Hội gỗ và lâm sản','2075','ghi chú',1,1,'2022-04-05 14:03:46','2022-09-10 12:51:24','[105.60333154688624,20.016026414755284]',NULL),(8,'Ông Phạn Văn A','247','ghi chú',1,NULL,'2022-11-08 10:46:12','2022-11-08 10:46:12',NULL,'Mường'),(9,'Viện nghiên cứu cây ăn quả miền Bắc 2','247','ghi chú',1,NULL,'2022-11-11 11:34:06','2022-11-11 11:34:06',NULL,'Kinh');
/*!40000 ALTER TABLE `owners` ENABLE KEYS */;
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
