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
-- Table structure for table `evaluationcriterias`
--

DROP TABLE IF EXISTS `evaluationcriterias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluationcriterias` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `evaluationCriteriasName` varchar(200) DEFAULT NULL,
  `evaluationCriteriaGroupsId` bigint(20) NOT NULL,
  `value` int(11) DEFAULT 0 COMMENT 'giá trị quy đổi : ví dụ -1: không hài lòng,0 : bình thường : 1 hài lòng',
  `userCreatorsId` bigint(20) DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateUpdated` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `languagesId` bigint(20) DEFAULT 1,
  `icon` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`icon`)),
  PRIMARY KEY (`id`),
  KEY `evaluationCriteriaGroupsId` (`evaluationCriteriaGroupsId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=529 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT=' tiêu chí đánh giá';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluationcriterias`
--

LOCK TABLES `evaluationcriterias` WRITE;
/*!40000 ALTER TABLE `evaluationcriterias` DISABLE KEYS */;
INSERT INTO `evaluationcriterias` VALUES (1,'Fine',27,3,1,'2022-12-30 15:26:07','2023-01-03 13:46:40',1,2,NULL),(12,'Fun',27,4,1,'2022-12-28 11:07:24','2023-01-10 18:07:14',1,2,NULL),(13,'Well',27,5,1,'2022-12-28 11:18:38','2023-01-03 13:48:29',1,2,NULL),(22,'Tiêu cực',37,1,1,'2022-12-30 15:26:06','2023-01-03 13:47:02',1,1,NULL),(23,'Buồn',37,2,1,'2022-12-30 15:26:06','2023-01-03 13:46:55',1,1,NULL),(24,'Bad',27,2,1,'2022-12-30 15:26:07','2023-01-03 13:46:26',1,2,NULL),(519,'Vui vẻ',37,4,519,'2022-12-30 15:17:25','2023-01-03 13:47:51',1,1,NULL),(520,'Yêu đời',37,5,1,'2022-12-28 18:12:34','2023-01-03 13:48:02',1,1,NULL),(521,'Bình thường',37,3,520,'2022-12-30 15:17:25','2023-01-03 13:47:29',1,1,NULL),(522,'negative',27,1,1,NULL,NULL,1,2,NULL),(523,'Mệt mỏi',2,1,1,'2023-01-06 16:57:59','2023-01-10 18:04:41',1,1,NULL),(524,'Bình thường',2,3,1,'2023-01-10 18:05:32','2023-01-10 18:11:38',1,1,NULL),(525,'Khỏe mạnh',2,5,1,'2023-01-10 18:06:00','2023-01-10 18:06:00',1,1,NULL),(526,'Tired',28,1,1,'2023-01-10 18:06:28','2023-01-10 18:06:28',1,2,NULL),(527,'Normal',28,3,1,'2023-01-10 18:06:47','2023-01-10 18:06:47',1,2,NULL),(528,'Strong',28,5,1,'2023-01-10 18:07:05','2023-01-10 18:07:05',1,2,NULL);
/*!40000 ALTER TABLE `evaluationcriterias` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:18:43
