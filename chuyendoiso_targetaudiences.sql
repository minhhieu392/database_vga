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
-- Table structure for table `targetaudiences`
--

DROP TABLE IF EXISTS `targetaudiences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `targetaudiences` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `targetAudienceName` varchar(200) DEFAULT NULL COMMENT 'Tên đối tượng truyền thông',
  `targetAudienceDescriptions` varchar(500) DEFAULT NULL COMMENT 'Mô tả',
  `userCreatorsId` bigint(20) DEFAULT NULL COMMENT 'người tạo',
  `dateCreated` datetime DEFAULT NULL COMMENT 'ngày tạo',
  `dateUpdated` datetime DEFAULT NULL COMMENT 'ngày cập nhật',
  `status` int(11) DEFAULT NULL COMMENT 'trạng thái',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `targetaudiences`
--

LOCK TABLES `targetaudiences` WRITE;
/*!40000 ALTER TABLE `targetaudiences` DISABLE KEYS */;
INSERT INTO `targetaudiences` VALUES (1,'Thành viên Ban Chỉ đạo TW về PCTT 1','Mô tả Thành viên Ban Chỉ đạo TW về PCTT 1',1,'2020-12-09 07:00:00','2021-02-26 16:37:36',1),(2,'Văn phòng thường trực Ban Chỉ đạo TW về PCTT','Mô tả Văn phòng thường trực Ban Chỉ đạo TW về PCTT',1,'2020-12-09 07:00:00','2021-02-25 10:47:49',1),(3,'Ban Chỉ huy PCTT và TKCN cấp huyện, Ban Chỉ huy PCTT và TKCN cấp xã','Mô tả Ban Chỉ huy PCTT và TKCN cấp huyện, Ban Chỉ huy PCTT và TKCN cấp xã',1,'2020-12-09 07:00:00','2020-12-09 07:00:00',1),(4,'Thành viên Ban Chỉ đạo TW về PCTT 2','Thành viên Ban Chỉ đạo TW về PCTT 1',1,'2021-02-24 15:32:32','2021-02-25 17:36:54',1),(5,'Ban Trung ương','',1,'2021-02-25 14:43:51','2021-03-01 17:20:19',-1),(6,'124asfg>>','',1,'2021-02-25 14:44:01','2021-02-25 14:44:56',-1),(7,'abcvbndg','HAR(size): Lưu trữ một chuỗi có độ dài cố định (có thể chứa chữ cái, số và ký tự đặc biệt). Kích t\nTINYTEXT: Lưu trữ một chuỗi có độ dài tối đa 255 ký tự.\n\nTEXT: Lưu trữ một chuỗi có độ dài tối đa 65.535 ký tự',1,'2021-02-25 14:44:38','2021-02-25 14:44:49',-1),(8,'nhân dân','',1,'2021-02-26 09:34:27','2021-02-26 16:37:30',0),(9,'Người dùng','',1,'2021-02-26 09:34:33','2021-02-26 16:37:28',0),(10,'nhà nc','',1,'2021-02-26 09:34:40','2021-02-26 11:49:10',0),(11,'ng nghèo','',1,'2021-02-26 09:34:46','2021-03-01 17:20:05',0),(12,'aaa','',29,'2021-02-26 15:58:53','2021-03-01 10:21:20',-1),(13,'thiếu niên','',29,'2021-03-01 09:23:28','2021-03-01 10:20:49',-1),(14,'!@!$#%@^%','',30,'2021-04-23 11:56:23','2021-04-23 11:56:25',0);
/*!40000 ALTER TABLE `targetaudiences` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:18:52
