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
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `userCreatorsId` bigint(20) DEFAULT NULL,
  `dateCreated` datetime DEFAULT current_timestamp(),
  `status` int(11) DEFAULT 0,
  `sendAll` int(1) DEFAULT 0,
  `notificationTime` datetime DEFAULT current_timestamp(),
  `notInUsersId` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`notInUsersId`)),
  `courseGroupsId` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`courseGroupsId`)),
  `sendStatus` int(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='thông báo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (2,'Bạn đã đăng ký khóa học thành công','Bạn đã đăng ký khóa học thành công',1,'2022-12-01 14:44:39',1,0,'2022-12-05 11:10:45',NULL,NULL,1),(3,'Bạn đã đăng ký khóa học thành công','Bạn đã đăng ký khóa học thành công',1,'2022-12-01 15:06:42',1,0,'2022-12-05 11:10:45',NULL,NULL,1),(6,'Thông báo khuyến mãi tất cả khóa học','Thông báo khuyến mãi tất cả khóa học',1,'2022-12-05 11:18:15',1,0,'2022-12-05 07:00:00',NULL,NULL,1),(7,'Thông báo khuyến mãi tất cả khóa học','Thông báo khuyến mãi tất cả khóa học',1,'2022-12-05 11:19:05',1,0,'2022-12-05 12:00:00',NULL,NULL,1),(8,'Thông báo khuyến mãi tất cả khóa học','Thông báo khuyến mãi tất cả khóa học',1,'2022-12-05 11:19:52',1,0,'2022-12-05 12:00:00',NULL,NULL,1),(9,'Thông báo khuyến mãi tất cả khóa học','Thông báo khuyến mãi tất cả khóa học',1,'2022-12-05 11:20:07',1,0,'2022-12-05 12:00:00',NULL,NULL,1),(10,'Thông báo khuyến mãi tất cả khóa học','Thông báo khuyến mãi tất cả khóa học Thông báo khuyến mãi tất cả khóa học Thông báo khuyến mãi tất cả khóa học Thông báo khuyến mãi tất cả khóa học Thông báo khuyến mãi tất cả khóa học',1,'2022-12-07 17:50:42',1,0,'2032-12-05 12:00:00','[]','[]',1),(11,'tuy','das',1,'2022-12-07 22:02:49',1,1,'2022-12-07 23:00:00','[]','[]',1),(12,'Tặng bạn khóa học khuyễn mãi 20%','Khóa học 123',1,'2022-12-08 08:42:13',1,1,'2022-12-08 08:42:11','[]','[]',1),(17,'Test','test2 ',1,'2022-12-08 09:08:39',1,0,'2022-12-08 09:07:00','[]','[]',1),(18,'Test','test2 ',1,'2022-12-08 09:09:29',1,0,'2022-12-08 09:07:00','[]','[]',1),(19,'ok1','ok la',1,'2022-12-08 09:12:21',1,1,'2022-12-08 09:15:00','[]','[]',1),(20,'ok2','ok la',1,'2022-12-08 09:20:53',1,1,'2022-12-08 09:15:00','[]','[]',1),(21,'ok2','ok la',1,'2022-12-08 09:22:21',1,1,'2022-12-08 09:15:00','[]','[]',1),(22,'ok2','ok la',1,'2022-12-08 09:24:22',1,1,'2022-12-08 09:15:00','[]','[]',1),(23,'ok2','ok la',1,'2022-12-08 09:24:44',1,1,'2022-12-08 09:15:00','[]','[]',1),(24,'sadas','dsadas',1,'2022-12-08 10:50:08',1,0,'2022-12-08 11:00:00','[]','[]',1),(25,'hfhhfgyhtf','kk',1,'2022-12-14 12:04:43',1,0,'2022-12-14 12:05:00','[]','[]',1),(26,'Success','Oke',1,'2022-12-14 13:48:50',1,0,'2022-12-14 13:49:00','[]','[]',1),(27,'trtrte','ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff \n aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\n ffffffffffffffffffffffffffffffffffffffffffffffffffffffffff ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff fffffffffffffffffffffffffffffffffffffffffffffffffffff',1,'2022-12-15 14:53:46',1,0,'2022-12-15 14:56:00','[]','[]',1),(28,'expo','If you do not specify a notification channel, expo-notifications will create a fallback channel for you, named Miscellaneous. We encourage you to always ensure appropriate channels with informative names are set up for the application and to always send notifications to these channels.\n\nCalling these methods is a no-op for platforms that do not support this feature (iOS, Web and Android below version 8.0 (26)).',1,'2022-12-15 14:59:26',1,0,'2022-12-15 15:00:00','[]','[]',1),(29,'test thong bao','thong bao nay rat dai thong bao nay rat dai\nthong bao nay rat dai thong bao nay rat dai\nthong bao nay rat dai thong bao nay rat dai\nthong bao nay rat dai thong bao nay rat dai\nthong bao nay rat dai thong bao nay rat dai',1,'2022-12-15 15:18:38',1,1,'2022-12-15 15:24:00','[]','[]',1),(30,'dgdggd','dgdfgdgdg dgdfgdgdg dgdfgdgdg dgdfgdgdg dgdfgdgdg\ndgdfgdgdg dgdfgdgdg\ndgdfgdgdg dgdfgdgdg dgdfgdgdg dgdfgdgdg dgdfgdgdg\n',1,'2022-12-15 15:25:37',1,1,'2022-12-15 15:26:00','[]','[]',1),(31,'tesst thong bao','noi dung rat dai noi dung rat dai noi dung rat dai\nnoi dung rat dai noi dung rat dai noi dung rat dai\nnoi dung rat dai noi dung rat dai noi dung rat dai',1,'2022-12-15 15:28:58',1,1,'2022-12-15 15:29:00','[]','[]',1),(32,'test thogn bao','noi dung rat dai noi dung rat dai noi dung rat dai\nnoi dung rat dai noi dung rat dai noi dung rat dai\nnoi dung rat dai noi dung rat dai noi dung rat dai',1,'2022-12-15 15:30:21',1,1,'2022-12-15 15:31:00','[]','[]',1);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:18:39
