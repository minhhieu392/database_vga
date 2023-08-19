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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `image` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`image`)),
  `fullname` varchar(200) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `workUnit` varchar(500) DEFAULT NULL,
  `userGroupsId` bigint(20) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `userCreatorsId` bigint(20) DEFAULT NULL,
  `dateUpdated` datetime DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '1: enabled 0: disabled -1: draf; -2: chờ duyệt',
  `provincesId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='quản lý người dùng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'adminadmin','{\"file\":\"/images/20221223/logo_white.png\",\"extension\":\"png\"}','Adminn','0972290154','',1,'670b14728ad9902aecba32e22fa4f6bd','nguyenzuanthuy2@gmail.com',0,'2022-12-23 18:26:31','2020-12-09 07:00:00',1,59),(17,'tichhop',NULL,'tk hà nội','','',3,'a0b14fca10e6765a4e22b59cbad89c7a','vuvantuyenpm@gmail.com',1,'2021-04-12 15:56:36','2020-12-12 14:59:50',1,23),(28,'tk_thanhvien',NULL,'tk bắc ninh','0981795602','',3,'e10adc3949ba59abbe56e057f20f883e','hoavu2k1@gmail.com',1,'2021-04-12 15:56:59','2020-12-18 10:20:13',1,1),(29,'admin_qtdl','{\"file\":\"/images/20221219/1670223237132hoi_nghi_thanh_uy_tphcm_lan_thu_19_bi_thu_thanh_uy_nguyen_van_nen.jpg\",\"extension\":\"jpg\"}','Quản trị dữ liệu','0589929999','',2,'e10adc3949ba59abbe56e057f20f883e','hoavu2k1111@gmail.com',1,'2022-12-26 10:39:09','2020-12-18 10:26:38',1,3),(30,'admin_qtht',NULL,'Quản trị hệ thống','0589939999','',1,'e10adc3949ba59abbe56e057f20f883e','hoavu2k111@gmail.com',1,'2021-04-10 11:27:22','2020-12-18 10:28:53',1,2),(45,'tk_angiang',NULL,'tk an giang','09372809','',3,'e10adc3949ba59abbe56e057f20f883e','ds@ds.cv',1,'2021-04-12 15:57:48','2021-04-12 15:57:48',1,2),(46,'abc_zr98',NULL,'abc','','',3,'e10adc3949ba59abbe56e057f20f883e','abcg@gmail.com',1,'2021-04-23 10:43:10','2021-04-22 17:22:12',-1,23),(47,'abczr_98',NULL,'abc','','',3,'e10adc3949ba59abbe56e057f20f883e','die@gmail.com',1,'2021-05-04 11:10:20','2021-04-22 17:24:21',1,23),(48,'abcabc',NULL,'fed','','',3,'e10adc3949ba59abbe56e057f20f883e','quyynhdaang@gmail.com',0,'2021-04-23 11:21:40','2021-04-23 10:52:55',1,23),(49,'huongtm',NULL,'Thái Minh Hương','0948202810','Vụ KHCN và HTQT',3,'85906c387f3cb488cc615c4e9b82294c','thaiminhhuong84@gmail.com',1,'2021-07-01 14:50:33','2021-06-04 13:31:54',-2,3),(50,'ngoctest',NULL,NULL,NULL,NULL,1,'670b14728ad9902aecba32e22fa4f6bd',NULL,1,'2022-12-19 11:08:31',NULL,0,NULL),(51,'bagia11',NULL,'Haha','024885256','HN',3,'96e79218965eb72c92a549dd5a330112','nguyenyen192011@gmail.com',1,'2021-07-05 11:43:59','2021-07-04 23:04:28',1,NULL),(52,'BaGia_12',NULL,'Bà Già','012345978','HN',3,'fcea920f7412b5da7be0cf42b8c93759','kenyeubins2@gmail.com',0,'2021-07-05 15:25:29','2021-07-05 15:25:16',1,NULL),(53,'Moonshine',NULL,'Moonshine','03378925','HN',3,'3838308aa1885e73f2849e0dabc7e408','hoa2412nd@gmail.com',0,'2021-07-07 23:50:21','2021-07-07 23:49:55',1,NULL),(54,'______',NULL,'dgggg','12345678','HN',3,'e10adc3949ba59abbe56e057f20f883e','nhg@gmail.com',1,'2021-07-08 00:16:21','2021-07-08 00:16:22',-2,NULL),(55,'adminnews',NULL,'Minh','0987654321','',5,'e10adc3949ba59abbe56e057f20f883e','minhadmin@gmail.com',1,'2021-07-15 16:53:19','2021-07-08 13:56:50',1,2),(56,'adminbot',NULL,'adminbot','','',6,'e10adc3949ba59abbe56e057f20f883e','adminbot@gam.com',1,'2021-08-27 08:33:13','2021-08-27 08:33:14',1,2),(57,'admincontent',NULL,'quản trị nội dung','','',7,'e10adc3949ba59abbe56e057f20f883e','admincontent@gmail.com',1,'2021-09-08 15:27:38','2021-09-08 15:27:39',1,23),(58,'admin12',NULL,'acira',NULL,NULL,1,'e10adc3949ba59abbe56e057f20f883e',NULL,1,'2020-12-09 07:00:00','2020-12-09 07:00:00',1,1),(59,'admin123',NULL,NULL,NULL,NULL,1,'e10adc3949ba59abbe56e057f20f883e',NULL,1,'2020-12-09 07:00:00','2020-12-09 07:00:00',1,1),(60,'test1@gmail.com','{\"file\":\"/images/20221219/1670224351037thu_tuong_pham_minh_chinh_techfest_2022.jpg\",\"extension\":\"jpg\"}','người đùng test','096373596',NULL,2,'e10adc3949ba59abbe56e057f20f883e','tesst1@gmail.com',1,'2022-12-26 10:40:05','2022-12-26 10:43:17',1,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:18:48
