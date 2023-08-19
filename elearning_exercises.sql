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
-- Table structure for table `exercises`
--

DROP TABLE IF EXISTS `exercises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exercises` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `exercisesName` text DEFAULT NULL COMMENT 'tên  thuộc tính',
  `courseLevelsId` bigint(20) DEFAULT NULL,
  `order` int(11) DEFAULT 0,
  `time` int(11) DEFAULT 0 COMMENT 'thời gian tính theo giây',
  `countQuestions` int(11) DEFAULT 0,
  `dateCreated` datetime DEFAULT current_timestamp(),
  `dateUpdated` datetime DEFAULT current_timestamp(),
  `status` int(11) DEFAULT 1,
  `userCreatorsId` bigint(20) DEFAULT NULL,
  `countQuestionsStatus` int(1) DEFAULT 0,
  `type` int(11) DEFAULT NULL,
  `linkVideo` varchar(500) DEFAULT NULL,
  `files` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`files`)),
  `descriptions` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courseLevelsId` (`courseLevelsId`),
  KEY `exercises_countQuestionsStatus_IDX` (`countQuestionsStatus`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercises`
--

LOCK TABLES `exercises` WRITE;
/*!40000 ALTER TABLE `exercises` DISABLE KEYS */;
INSERT INTO `exercises` VALUES (1,'Bài tập 1',2,1,120,2,'2022-11-30 11:56:05','2022-12-27 15:48:03',1,1,1,0,NULL,NULL,'mô tả'),(2,'Bài tập 2 232',3,2,120,2,'2022-12-02 08:58:56','2022-12-27 15:39:26',1,1,1,2,NULL,NULL,'đs'),(4,'Bài tập 3',1,0,120,1,'2022-12-02 09:07:45','2022-12-05 09:38:25',1,1,1,0,NULL,NULL,NULL),(10,'Bài tập 1',5,0,200,1,'2022-12-07 09:04:08','2022-12-07 09:07:46',1,1,1,0,NULL,NULL,NULL),(11,'dsa',8,0,2112,1,'2022-12-07 09:09:10','2022-12-09 10:14:22',0,1,1,0,NULL,NULL,NULL),(12,'Trắc nghiệm',11,0,300,5,'2022-12-09 09:28:34','2022-12-09 09:28:34',1,1,1,0,NULL,NULL,NULL),(67,'Câu hỏi tự luận',1,0,100,0,'2022-12-28 09:39:03','2022-12-28 09:45:10',1,1,0,2,NULL,'[{\"files\":\"userfiles/adminadmin/files/20221228/2022_12_28_9_44_46_728_qrformattcv10vn092021.pdf\",\"extension\":\"pdf\"},{\"files\":\"userfiles/adminadmin/files/20221228/2022_12_28_9_45_7_989_yuculmappstem.docx\",\"extension\":\"userfiles/adminadmin/files/20221228/2022_12_28_9_45_7_989_yuculmappstem.docx\"}]','Hãy nêu cảm nhận về khóa học'),(68,'Câu hỏi video',1,0,10,0,'2022-12-28 09:40:26','2022-12-28 09:40:26',1,1,0,1,'https://www.youtube.com/watch?v=YSk3Quqf-4Q','[]',NULL);
/*!40000 ALTER TABLE `exercises` ENABLE KEYS */;
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
