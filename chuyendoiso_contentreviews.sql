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
-- Table structure for table `contentreviews`
--

DROP TABLE IF EXISTS `contentreviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contentreviews` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `valueVoted` int(11) DEFAULT NULL,
  `contentsId` bigint(20) DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateUpdated` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentreviews`
--

LOCK TABLES `contentreviews` WRITE;
/*!40000 ALTER TABLE `contentreviews` DISABLE KEYS */;
INSERT INTO `contentreviews` VALUES (1,'nguyễn văn a','nguyenvana@gmail.com','bài viết rất hay',5,17,'2021-04-10 15:23:25','2020-12-14 07:00:00',1),(2,'nguyễn văn b','nguyenvanb@gmail.com','bài viết rất hay 1',4,17,'2021-04-10 15:24:12','2021-04-10 15:24:12',0),(3,'nguyễn văn c','nguyenvanc@gmail.com','bài viết rất hay 2',2,17,'2021-04-10 15:24:31','2021-04-10 15:24:31',0),(4,'nguyễn văn d','nguyenvand@gmail.com','bài viết rất hay 3',4,17,'2021-04-10 15:24:45','2021-04-10 15:24:45',0),(6,'minh','hm1061998@gmail.com','12312',4,25,'2021-04-13 14:07:32','2021-05-17 11:18:14',1),(11,'Thuy','nguyenzuanthuy@gmail.com','nnm',5,26,'2021-05-17 08:47:32','2021-05-17 08:47:32',0),(12,'Tuấn Anh','ntuananh@gmail.com','Comment 2',3,47,'2021-05-17 11:45:21','2021-07-07 13:37:50',0),(13,'Tuấn Anh','ntuananh11@gmail.com','Comment 1',3,47,'2021-05-17 11:46:44','2021-07-07 13:38:02',1),(14,'phiphuong','nguyenyen192011@gmail.com','1',5,25,'2021-07-05 15:17:47','2021-07-05 15:17:47',0),(15,'NguyenHoa','nguyenyen192011@gmail.com','11111',5,47,'2021-07-05 15:18:20','2021-07-06 17:44:12',1),(17,'BaGia','kenyeubins2@gmail.com','1111',5,25,'2021-07-06 10:39:06','2021-07-06 10:39:06',0),(18,'nguyenhoaấd','hoa2412nd@gmail.com','a12@',0,25,'2021-07-06 17:43:28','2021-07-06 17:43:28',0),(19,'Moonshine','kenyeubins2@gmail.com','1',5,25,'2021-07-07 11:35:46','2021-07-07 11:35:46',0);
/*!40000 ALTER TABLE `contentreviews` ENABLE KEYS */;
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
