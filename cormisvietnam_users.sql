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
  `userGroupsId` bigint(20) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `userCreatorsId` bigint(20) DEFAULT NULL,
  `dateUpdated` datetime DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '1: enabled 0: disabled -1: draf; -2: chờ duyệt',
  `referralSocial` varchar(45) DEFAULT NULL COMMENT 'facebook/gmail/zalo',
  `idSocial` varchar(100) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL COMMENT 'null : chưa nhập, 0 : nam, 1: nữ, 2 : khác',
  `countriesId` bigint(20) DEFAULT 0,
  `wardsId` bigint(20) DEFAULT 0 COMMENT '0',
  `userTypesId` bigint(20) DEFAULT 0 COMMENT '0',
  `jobsId` bigint(20) DEFAULT 0,
  `address` varchar(200) DEFAULT NULL,
  `yearOfBirth` int(11) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=570 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='quản lý người dùng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'adminadmin','{\"file\":\"/images/lop_yoga_tot_1.jpg\",\"extension\":\"jpg\"}','admin','0123456789',1,'e10adc3949ba59abbe56e057f20f883e','nguyenzuanthuy@gmail.com',NULL,'2023-01-11 09:47:55',NULL,1,NULL,NULL,1,12,866,0,13,'Ha Noi',1990,'1990-01-19'),(501,'nguongen_dev1','{}','Nguyễn Tuấn Anh','0971221121',2,'e10adc3949ba59abbe56e057f20f883e','',1,'2022-04-04 09:30:07','2022-11-08 10:45:00',1,'',NULL,0,0,0,0,0,NULL,NULL,NULL),(508,'ngocnk99@gmail.com',NULL,'nguyễn Ngọc',NULL,2,'e10adc3949ba59abbe56e057f20f883e','ngocnk99@gmail.com',1,'2020-12-09 07:00:00','2022-12-09 07:00:00',1,'',NULL,1,0,0,0,0,NULL,1992,NULL),(509,'minh123','{\"file\":\"userfiles/minh123/images/20221216/2022_12_16_11_8_6_289_img0014.JPG\",\"extension\":\"image/jpeg\"}','Hoàng Minh','0364269595',2,'e10adc3949ba59abbe56e057f20f883e','hm1061998@gmail.com',1,'2022-12-16 11:08:06','2022-12-02 08:40:48',1,'',NULL,1,0,0,0,0,NULL,1991,NULL),(510,'ngocnk992@gmail.com',NULL,'nguyễn Ngọc 2',NULL,2,'e10adc3949ba59abbe56e057f20f883e','ngocnk992@gmail.com',1,'2020-12-09 07:00:00','2020-12-09 07:00:00',1,'',NULL,1,0,0,0,0,NULL,1990,NULL),(511,'ducvietducivet',NULL,'Đức Việt','',2,'670b14728ad9902aecba32e22fa4f6bd','',1,'2022-12-05 23:21:01','2022-12-05 23:21:01',1,'',NULL,2,12,0,0,0,NULL,1989,NULL),(512,'nguond','{}','nguồn','',2,'e10adc3949ba59abbe56e057f20f883e','',1,'2022-12-06 08:53:52','2022-12-06 08:53:52',1,'',NULL,1,13,2,0,0,NULL,1988,NULL),(513,'0938383823','{}','Linh','',3,'19fd471e51ea8aa918fd0db3d7f26fd8','',1,'2022-12-06 14:53:28','2022-12-06 14:53:28',1,'',NULL,1,14,0,0,0,NULL,1987,NULL),(514,'minhhocvien',NULL,'Minh Minh','0987364595',2,'e10adc3949ba59abbe56e057f20f883e','minhhocvien@gmail.com',1,'2022-12-07 10:11:46','2022-12-07 10:11:46',1,'',NULL,0,12,2,0,0,NULL,1986,NULL),(515,'minhhocvien2',NULL,'Minh Học Viên','0987456321',2,'e10adc3949ba59abbe56e057f20f883e','minhhocvien2@gmail.com',1,'2022-12-07 11:34:46','2022-12-07 11:34:46',1,'',NULL,0,12,0,0,0,NULL,1985,NULL),(516,'ngocnk993@gmail.com',NULL,'nguyễn Ngọc 2',NULL,2,'e10adc3949ba59abbe56e057f20f883e','ngocnk993@gmail.com',1,'2020-12-09 07:00:00','2020-12-09 07:00:00',1,'',NULL,0,12,0,0,0,NULL,1984,NULL),(517,'vuminhtoan2001','{\"file\":\"userfiles/vuminhtoan2001/images/20221215/2022_12_15_15_9_50_402_img16612687311141661269885543.jpg\",\"extension\":\"image/jpeg\"}','Vũ Minh Toán','0869762836',2,'d2f79161ed64cf4e2be5ff0be62501fe','vuminhtoan2001@gmail.com',1,'2022-12-15 15:09:51','2022-12-13 10:37:35',1,'',NULL,0,12,0,0,0,NULL,1983,NULL),(518,'minh1234',NULL,'Minh Minh','0369876543',2,'e10adc3949ba59abbe56e057f20f883e','minh1234@gmail.com',1,'2022-12-20 10:50:20','2022-12-20 10:50:21',1,'',NULL,0,12,0,0,14,NULL,NULL,NULL),(519,'duc30012001','{}','Viet Duc','0985677235',2,'670b14728ad9902aecba32e22fa4f6bd','nguyenvietduc3001@gmail.com',124,'2023-01-06 02:19:05','2022-12-21 11:18:11',1,'',NULL,1,12,0,519,14,'Le Van Hien Street, Bac Tu Liem District',1981,NULL),(520,'hieuone','{\"file\":\"/images/20230105/5bcd3b439fc08.png\",\"extension\":\"png\"}','Trinh Minh Hieu','0123456788',2,'e10adc3949ba59abbe56e057f20f883e','hieukkkk@gmail.com',123,'2023-01-06 02:20:03','2022-12-09 07:00:00',1,'',NULL,1,12,2,520,14,'Le Van Hien Street, Bac Tu Liem District',1980,NULL),(521,'aciratest01',NULL,'hieu',NULL,2,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,1,0,0,15,0,NULL,2000,NULL),(522,'aciratest02',NULL,'hieu',NULL,2,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,1,0,0,15,0,NULL,1990,NULL),(524,'thuynguyen','{}','thủy','03809283',2,'e10adc3949ba59abbe56e057f20f883e','',1,'2023-01-05 09:04:36','2023-01-05 09:04:36',1,'',NULL,NULL,0,0,0,0,NULL,NULL,NULL),(525,'hocvien1','{}','adminadmin','0123654789',2,'e10adc3949ba59abbe56e057f20f883e','',1,'2023-01-06 02:20:53','2023-01-06 02:20:53',1,'',NULL,1,16,0,0,13,'Le Van Hien Street, Bac Tu Liem District',1999,NULL),(531,'test09',NULL,NULL,NULL,1,'e10adc3949ba59abbe56e057f20f883e',NULL,1,'2020-12-09 07:00:00','2020-12-09 07:00:00',1,'',NULL,NULL,0,0,0,0,NULL,2000,'2000-09-03'),(532,'test01',NULL,NULL,NULL,1,'e10adc3949ba59abbe56e057f20f883e',NULL,1,'2020-12-09 07:00:00','2020-12-09 07:00:00',1,'',NULL,NULL,0,0,0,0,NULL,2023,'2000-09-03'),(566,'vuong1234',NULL,'Vượng Hoàng','0886795658',2,'e10adc3949ba59abbe56e057f20f883e','hoang_vuong@gmail.com',1,'2023-01-11 11:28:11','2023-01-11 11:28:39',1,'',NULL,NULL,0,0,0,0,NULL,NULL,NULL),(567,'100572762253103038499','{\"file\":\"https://lh3.googleusercontent.com/a/AEdFTp4WYCO5AYqFWhFYEOUG2cXsTw-Kht2KnmQwSs89=s96-c\",\"extension\":\"\"}','Hoàng Minh',NULL,2,'e10adc3949ba59abbe56e057f20f883e','hm1061998@gmail.com',1,'2023-01-11 11:34:05','2023-01-11 11:34:32',1,'google','100572762253103038499',NULL,0,0,0,0,NULL,NULL,NULL),(568,'1587957354980771','{\"file\":\"https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=1587957354980771&height=50&width=50&ext=1676004142&hash=AeR37LMffzOxibv_3NY\",\"extension\":\"\"}','Hoàng Minh',NULL,2,'e10adc3949ba59abbe56e057f20f883e','hm1061998@gmail.com',1,'2023-01-11 11:41:56','2023-01-11 11:42:23',1,'facebook','1587957354980771',NULL,0,0,0,0,NULL,NULL,NULL),(569,'admin_web','{}','admin','09898989',19,'e10adc3949ba59abbe56e057f20f883e','',1,'2023-01-12 16:14:33','2023-01-12 16:14:26',1,'',NULL,1,12,1,0,16,'admin',NULL,NULL);
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

-- Dump completed on 2023-08-19 16:18:46
