-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: quanlybanhang
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
  `mobile` varchar(200) DEFAULT NULL,
  `userGroupsId` bigint(20) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `userCreatorsId` bigint(20) DEFAULT NULL,
  `dateUpdated` datetime DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '1: enabled 0: disabled -1: draf; -2: chờ duyệt',
  `referralSocial` varchar(45) DEFAULT NULL COMMENT 'facebook/gmail/zalo',
  `idSocial` varchar(100) DEFAULT NULL,
  `note` text DEFAULT NULL COMMENT 'ghi chú',
  `birthday` datetime DEFAULT NULL,
  `wardsId` bigint(20) DEFAULT NULL,
  `userAddress` varchar(500) DEFAULT NULL,
  `branchesId` bigint(20) DEFAULT NULL,
  `CCCD` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `facebook` varchar(200) DEFAULT NULL,
  `officesId` bigint(20) DEFAULT NULL,
  `positionsId` bigint(20) DEFAULT NULL,
  `usersCode` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=545 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='quản lý người dùng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'adminadmin','{\"file\":\"/images/20220620/nentoi.png\",\"extension\":\"image/png\"}','admin nbm','0973290154',1,'670b14728ad9902aecba32e22fa4f6bd','nguyenzuanthuy@gmail.com',1,'2023-01-18 16:35:17',NULL,1,NULL,NULL,NULL,'2022-06-08 11:09:05',3,'',1,'122112','1',NULL,1,1,NULL),(534,'anhquan','{}','Anh Quân','0977365365',18,'e10adc3949ba59abbe56e057f20f883e','',1,'2022-06-23 10:22:33','2022-05-04 09:48:44',1,'',NULL,NULL,'2016-06-07 10:16:02',3970,'',1,'','1',NULL,1,1,NULL),(535,'tessttt','{\"file\": \"userfiles/adminadmin/files/20220620/2022_06_20_16_4_36_568_received5287223177987316.jpeg\", \"extension\": \"image/jpeg\"}','Nguyễn Tuấn Anh','0971221120',18,'e10adc3949ba59abbe56e057f20f883e','Amacao@gmail.com',1,'2022-06-20 16:05:48','2022-05-06 11:54:57',1,'',NULL,NULL,'1997-01-02 07:00:00',3970,NULL,1,'092367','1','facebook.com',1,1,NULL),(541,'0999999999','{}','Nhà bán hàng','',2,'1e184ab537f0d6d6d94bbb5790b1fee0','',1,'2022-06-28 09:37:38','2022-06-28 09:37:38',1,'',NULL,NULL,NULL,3925,'',1,'','1',NULL,NULL,NULL,NULL),(542,'0978442609','{}','Ms Tâm','0978442609',2,'133f5a0bd2eb996594a977f826fc2dac','',1,'2022-07-05 09:21:05','2022-07-05 09:21:06',1,'',NULL,NULL,NULL,4127,'',1,'','1',NULL,NULL,NULL,NULL),(543,'vuminhtoan','{\"file\":\"userfiles/adminadmin/files/20221216/2022_12_16_11_15_31_799_screenshot20221105113557galaxystore.jpg\",\"extension\":\"image/jpeg\"}','Vũ Minh Toán','0869762869',18,'d2f79161ed64cf4e2be5ff0be62501fe','vuminhtoan2001@gmail.com',1,'2023-01-18 14:06:54','2022-12-16 11:27:56',1,'',NULL,NULL,'2022-12-16 11:19:17',6450,NULL,1,'0362011188','1',NULL,NULL,1,NULL),(544,'test1@gmail.com','{\"file\":\"/images/20221219/1670224351037thu_tuong_pham_minh_chinh_techfest_2022.jpg\",\"extension\":\"jpg\"}','người đùng test','096373596',2,'fcea920f7412b5da7be0cf42b8c93759','tesst1@gmail.com',1,'2022-12-26 10:40:05','2023-01-18 15:22:40',1,'',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'NV0000544');
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

-- Dump completed on 2023-08-19 16:16:20
