-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: thiethai
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
-- Table structure for table `disasters`
--

DROP TABLE IF EXISTS `disasters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disasters` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `disastersName` varchar(300) DEFAULT NULL COMMENT 'Tên sự kiện',
  `address` varchar(300) DEFAULT NULL,
  `disasterTimeStart` datetime DEFAULT NULL,
  `disasterTimeEnd` datetime DEFAULT NULL,
  `userCreatorsId` bigint(20) DEFAULT NULL,
  `dateCreated` datetime DEFAULT current_timestamp(),
  `dateUpdated` datetime DEFAULT current_timestamp(),
  `status` int(11) DEFAULT NULL,
  `point` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`point`)),
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `disasters_disasterTimeStart_IDX` (`disasterTimeStart`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Sự kiện thiên tai';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disasters`
--

LOCK TABLES `disasters` WRITE;
/*!40000 ALTER TABLE `disasters` DISABLE KEYS */;
INSERT INTO `disasters` VALUES (1,'Động đất tại Kon Tum','Xã Măng Buk - huyện Kon Plông - tỉnh Kon Tum','2022-12-16 00:11:41','2022-12-16 00:11:38',1,'2022-12-20 09:34:36','2022-12-20 09:38:29',1,'{\"lat\":14.923,\"long\":108.184}'),(2,'Động đất tại Kon Tum','Xã Đắk Ring - huyện Kon Plông - tỉnh Kon Tum','2022-12-15 14:30:42','2022-12-15 14:30:13',1,'2022-12-20 09:38:12','2022-12-20 09:38:13',1,'{\"lat\":14.936,\"long\":108.226}'),(3,'Động đất tại Kon Tum','Xã Đắk Ring - huyện Kon Plông - tỉnh Kon Tum','2022-12-15 08:07:54','2022-12-15 08:07:39',1,'2022-12-20 09:40:20','2022-12-20 09:40:21',1,'{\"lat\":14.925,\"long\":108.23}'),(4,'Động đất tại Kon Tum','Xã Đắk Ring - huyện Kon Plông - tỉnh Kon Tum','2022-12-14 21:09:36','2022-12-14 21:09:09',1,'2022-12-20 09:42:47','2022-12-20 09:42:48',1,'{\"lat\":14.82,\"long\":108.243}'),(5,'Động đất tại Hoà Bình','Xã Trung Thành - huyện Đà Bắc - tỉnh Hòa Bình','2022-12-14 15:08:58','2022-12-14 15:08:29',1,'2022-12-20 09:44:05','2022-12-20 09:44:06',1,'{\"lat\":20.861,\"long\":105.112}'),(6,'Động đất tại Kon Tum','Xã Măng Búk - huyện Kon Plông - tỉnh Kon Tum','2022-12-14 09:40:17','2022-12-14 09:40:38',1,'2022-12-20 09:46:09','2022-12-20 09:46:10',1,'{\"lat\":14.904,\"long\":108.22}'),(7,'Động đất tại Kon Tum','Xã Ngọk Tem, huyện Kon Plông, tỉnh Kon Tum','2022-12-14 02:01:11','2022-12-14 02:01:51',1,'2022-12-20 09:47:23','2022-12-20 09:47:24',1,'{\"lat\":14.798,\"long\":108.315}'),(8,'Động đất tại Kon Tum','Xã Đắk Tăng, huyện Kon Plông, tỉnh Kon Tum','2022-12-14 01:50:47','2022-12-14 01:50:05',1,'2022-12-20 09:48:30','2022-12-20 09:48:31',1,'{\"lat\":14.812,\"long\":108.28}'),(9,'Động đất tại Kon Tum','Xã Ngọk Tem, huyện Kon Plông, tỉnh Kon Tum','2022-12-13 09:45:44','2022-12-13 09:45:03',1,'2022-12-20 09:49:30','2022-12-20 09:49:31',1,'{\"lat\":14.828,\"long\":108.306}'),(10,'Động đất tại Kon Tum','Xã Ngọk Tem - huyện Kon Plông - tỉnh Kon Tum','2022-12-11 23:23:49','2022-12-11 23:23:12',1,'2022-12-20 09:50:40','2022-12-20 09:50:41',1,'{\"lat\":14.782,\"long\":108.321}'),(11,'Động đất tại Kon Tum','Xã Đắk Ring - huyện Kon Plông - tỉnh Kon Tum','2022-12-11 05:40:48','2022-12-11 05:40:22',1,'2022-12-20 09:58:48','2022-12-20 09:58:49',1,'{\"lat\":14.851,\"long\":108.246}'),(12,'Động đất tại Kon Tum','Xã Ngọk Tem - huyện Kon Plông - tỉnh Kon Tum','2022-12-11 02:28:01','2022-12-11 02:28:19',1,'2022-12-20 09:59:51','2022-12-20 09:59:52',1,'{\"lat\":14.733,\"long\":108.398}'),(13,'Động đất tại Kon Tum','Xã Ngọk Tem - huyện Kon Plông - tỉnh Kon Tum','2022-12-11 00:45:08','2022-12-11 00:45:31',1,'2022-12-20 10:00:58','2022-12-20 10:00:58',1,'{\"lat\":14.738,\"long\":108.412}'),(14,'Động đất tại Kon Tum','Xã Ngọk Tem - huyện Kon Plông - tỉnh Kon Tum','2022-12-11 00:41:15','2022-12-11 00:41:44',1,'2022-12-20 10:02:13','2022-12-20 10:02:14',1,'{\"lat\":14.738,\"long\":108.412}'),(15,'Lũ quét tại Bình Thuận','Các xã Thắng Hải và Tân Thắng - huyện Hàm Tân - tỉnh Bình Thuận','2022-10-19 10:00:14','2022-10-20 17:00:30',1,'2022-12-20 10:28:18','2022-12-20 10:28:19',1,'{\"lat\":10.603366,\"long\":107.596749}'),(16,'Lũ quét tại Nghệ An','Xã Tà Cạ và Thị trấn Mường Xén - huyện Kỳ Sơn - tỉnh Nghệ An','2022-10-03 10:00:30','2022-10-03 10:00:48',1,'2022-12-20 10:29:20','2022-12-20 10:29:20',1,'{\"lat\":19.400608,\"long\":104.090198}'),(17,'Mưa lớn gây lũ quét và sạt lở đất tại Nghệ  An','Các huyện Kỳ Sơn, Tương Dương - tỉnh Nghệ An','2022-09-04 19:00:31','2022-09-05 07:00:56',1,'2022-12-20 10:30:53','2022-12-20 10:30:54',1,'{\"lat\":19.378518,\"long\":104.288965}'),(18,'Lũ quét tại Bình Thuận','Xã Phan Sơn - huyện Bắc Bình - tỉnh Bình Thuận','2022-08-01 16:00:30','2022-08-01 21:00:00',1,'2022-12-20 10:32:35','2022-12-20 10:32:36',1,'{\"lat\":11.430545,\"long\":108.325452}'),(19,'Lũ quét tại Sơn La','Bản Huổi Pá - xã Mường Lạn - huyện Sốp Cộp - tỉnh Sơn La','2022-07-07 15:00:43','2022-07-15 15:00:04',1,'2022-12-20 10:33:46','2022-12-20 10:33:47',1,'{\"lat\":20.803726,\"long\":103.722613}');
/*!40000 ALTER TABLE `disasters` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:15:51
