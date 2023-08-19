-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pharmaspaver2
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
  `fullname` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `userGroupsId` bigint(20) DEFAULT NULL,
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `userCreatorsId` bigint(20) DEFAULT NULL,
  `dateUpdated` datetime DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '1: enabled 0: disabled -1: draf; -2: chờ duyệt',
  `referralSocial` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'facebook/gmail/zalo',
  `idSocial` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ghi chú',
  `medFacilitysId` bigint(20) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `wardsId` bigint(20) DEFAULT NULL,
  `userAddress` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `debt` double DEFAULT 0 COMMENT 'công nợ.\\\\\\\\\\\\\\\\\\\\n debt > 0  => nợ khách hàng                                           \\\\\\\\\\\\\\\\n debt < 0 => khách hàng nợ',
  `userRankingsId` bigint(20) DEFAULT NULL COMMENT 'nếu >0 => hạng khách hàng được xét thủ công',
  `usersCode` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=619 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='quản lý người dùng / nhân viên';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'adminadmin','{\"file\":\"/images/20221022/FB_IMG_1584599160636.jpg\",\"extension\":\"image/jpeg\"}','admin nbm','0973290154',1,'670b14728ad9902aecba32e22fa4f6bd','nguyenzuanthuy@gmail.com',1,'2022-11-15 14:07:26',NULL,1,NULL,NULL,NULL,1,'2022-06-08 11:09:05',3,'','1',0,NULL,NULL,'Quản trị viên'),(541,'0977005537','{}','Đỗ Thu Trang','',2,'1e184ab537f0d6d6d94bbb5790b1fee0','',1,'2022-06-28 09:37:38','2022-06-28 09:37:38',1,'',NULL,NULL,1,NULL,3925,'','1',0,NULL,NULL,NULL),(542,'0978442609','{}','Ms Tâm','0978442609',3,'133f5a0bd2eb996594a977f826fc2dac','',1,'2022-11-11 23:50:29','2022-07-05 09:21:06',-1,'',NULL,'',1,NULL,4127,'','1',0,NULL,'','Nv'),(546,'0362010069','{\"file\":\"userfiles/adminadmin/files/20221010/2022_10_10_15_48_14_88_23b45206335e41a79295b28dcb548189.jpg\",\"extension\":\"jpg\"}','Nguyễn Văn B','0362010068',4,'4515b42c823635c07ddbbca00518f9f8','a@gmail.com',1,'2022-11-11 23:50:22','2022-10-10 07:51:30',-1,'',NULL,'',1,NULL,NULL,'Mễ trì Hà Nội','1',0,NULL,NULL,''),(547,'0869762836','{}','Vũ Minh Toán','0869762836',4,'e10adc3949ba59abbe56e057f20f883e','toan@gmail.com',1,'2022-11-11 23:50:18','2022-10-10 08:27:24',-1,'',NULL,'',1,NULL,NULL,'Mỹ Đình Hà Nội','1',0,NULL,NULL,''),(548,'0963118093','{}','Trần Tuấn Tài','0963118093',4,'e10adc3949ba59abbe56e057f20f883e','tai@gmail.com',1,'2022-11-11 23:50:13','2022-10-10 08:28:11',-1,'',NULL,'',1,NULL,NULL,'Cầu Giấy Hà Nội','1',0,NULL,NULL,''),(559,'093829238','{}','vũ tuyển','093829238',7,'404f639aeed3d83bd4d4afe75e16acd9','vutuye@fdf.fdf',1,'2022-11-11 23:50:07','2022-10-18 07:44:46',-1,'',NULL,'',1,NULL,NULL,'','1',0,NULL,'NV093829238','Quản lý'),(562,'nhavien_spa','{\"file\":\"userfiles/adminadmin/files/20221026/2022_10_26_17_36_9_483_e8db6a5938ca4595b33b8c2bf2c27f0c.jpg\",\"extension\":\"jpg\"}','Hoàng Minh','0987653214',3,'e10adc3949ba59abbe56e057f20f883e','minh@gmail.com',1,'2022-11-03 11:19:45','2022-10-20 14:38:37',1,'',NULL,'',2,NULL,3927,'','1',0,NULL,'NV','Kỹ thuật'),(563,'nhavien_nhathuoc','{}','Khánh ly','0336043214',4,'e10adc3949ba59abbe56e057f20f883e','',1,'2022-11-11 23:50:03','2022-10-20 14:39:08',-1,'',NULL,'',1,NULL,190,'',NULL,0,NULL,'','Nhân viên'),(564,'0981098329','{\"file\":\"/images/20221021/hinh2_tuyen_dung_spa_o_hoi_an.jpg\",\"extension\":\"jpg\"}','thủy nguyễn','0981098329',3,'9a269eeca28fe21a8635817e481aa639','',1,'2022-10-21 14:48:06','2022-10-21 10:58:35',1,'',NULL,'',2,NULL,NULL,'','1',0,NULL,'NV0981098329',NULL),(567,'09281122','{\"file\":\"/images/20221021/dong_phuc_spa.png\",\"extension\":\"png\"}','Linh kute','09281122',3,'96e79218965eb72c92a549dd5a330112','',1,'2022-10-21 14:47:59','2022-10-21 11:23:52',1,'',NULL,'',2,NULL,NULL,'','1',0,NULL,'NV09281122',NULL),(568,'090328092','{\"file\":\"/images/20221021/5_li_do_nen_hoc_nhan_vien_spa_hinh.png\",\"extension\":\"png\"}','Trang đen','090328092',3,'c74ca1359eaa6294afc6b9c781d39e13','',1,'2022-10-21 14:47:48','2022-10-21 11:24:05',1,'',NULL,'',2,NULL,NULL,'','1',0,NULL,'NV090328092',NULL),(572,'0812345698','{}','Minh Hiếu','0812345698',4,'e10adc3949ba59abbe56e057f20f883e','',1,'2022-10-25 14:15:24','2022-10-25 14:14:02',0,'',NULL,'',1,NULL,NULL,'',NULL,0,NULL,'NV0812345698','Nhân viên'),(575,'0987654321','{}','Minh Toán','0187654322',4,'c33367701511b4f6020ec61ded352059','',1,'2022-11-11 23:49:59','2022-10-25 14:28:05',-1,'',NULL,'',1,NULL,NULL,'',NULL,0,NULL,'NV0987654321','Nhân viên'),(576,'0929911828','{}','Quang Thiều','0929911828',3,'a53ce97125efec7b77ab236b428eec3d','quangthieu@gmail.com',1,'2022-10-25 23:24:40','2022-10-25 17:07:43',1,'',NULL,'note1',2,'2022-10-12 17:05:35',866,'','1',0,NULL,'NV0929911828',NULL),(578,'0938383823','{}','Lê Hoàng Ngọc Thanh  Thời','0938383823',3,'19fd471e51ea8aa918fd0db3d7f26fd8','thoi@gmail.com',1,'2022-11-01 11:33:12','2022-10-25 23:26:54',1,'',NULL,'',2,'2010-02-04 23:25:50',3936,'','1',0,NULL,'NV0938383823',''),(579,'093287273','{}','Thịnh','093287273',6,'d09eebe9c7219839c106c5e1998961bb','',1,'2022-10-27 14:25:47','2022-10-25 23:28:18',1,'',NULL,'note3',2,'2022-10-04 23:28:03',507,'','0',0,NULL,'NV093287273',''),(585,'0987123456','{}','Anh Hùng','0987123456',6,'3f048c04538ddc423f0ba11022388d07','',1,'2022-10-27 15:49:09','2022-10-27 14:56:35',1,'',NULL,'',2,NULL,NULL,'',NULL,0,NULL,'NV0987123456','Quản lý'),(586,'0987612345','{}','Anh Chiến','0987612345',7,'d18ae09dab03d5797e7ba5fd88fb8af3','',1,'2022-11-12 08:23:20','2022-10-27 15:02:20',-1,'',NULL,'',1,NULL,NULL,'',NULL,0,NULL,'KH0987612345','Quản lý'),(591,'0123456789','{\"file\":\"userfiles/adminadmin/files/20221027/2022_10_27_16_0_26_218_0cce3e37c2ee4b46a14571a2e368fd14.png\",\"extension\":\"png\"}','TamLee','0123456789',2,'781e5e245d69b566979b86e28d23f2c7','',1,'2022-11-11 23:11:35','2022-10-27 16:00:28',1,'',NULL,'',0,NULL,4100,'','0',0,NULL,'','Sếp'),(592,'0987654123','{}','Minh Hoàng','0987654123',4,'1d70f688bec61f0e4417677184a4280a','',586,'2022-11-12 08:18:33','2022-10-28 14:12:37',1,'',NULL,'',1,NULL,NULL,'',NULL,0,NULL,'NV0987654123','Nhân viên'),(606,'0987666499','{}','Hoàng','0987666499',7,'4aa3aedc033b68853092a8898774d004','',1,'2022-11-12 08:23:09','2022-11-12 08:23:09',1,'',NULL,'',1,NULL,NULL,'','1',0,NULL,'',''),(607,'0333688212','{}','chị tâm','0333688212',4,'e10adc3949ba59abbe56e057f20f883e','',1,'2022-11-12 09:07:29','2022-11-12 09:07:29',1,'',NULL,'',1,NULL,NULL,'','1',370000,NULL,'NV0333688212',''),(608,'0987666499','{}','admin','0987666499',2,'4aa3aedc033b68853092a8898774d004','',1,'2022-11-12 09:52:30','2022-11-12 09:52:31',1,'',NULL,'',0,NULL,NULL,'','1',0,NULL,'',''),(609,'0963735961','{}','ngoc_test1','0963735961',5,'bf302aa0d935f5469dfd6cff7b20b638','',1,'2022-11-15 14:00:41','2022-11-15 14:00:43',1,'',NULL,'',1,NULL,NULL,'','1',-5000000,NULL,'KH10963735961',''),(610,'0963735962','{}','ngoc_test2','0963735962',5,'fe5fc104172e71400c0d328e18e1d38e','',1,'2022-11-15 16:21:13','2022-11-15 16:21:15',1,'',NULL,'',1,NULL,NULL,'','1',0,NULL,'KH10963735962',''),(611,'0963739673','{}','ngoc_test3','0963739673',5,'09b00601a1f73b6927eccfb0426a1a23','',1,'2022-11-16 10:16:34','2022-11-16 10:16:36',1,'',NULL,'',1,NULL,NULL,'','1',39250,NULL,'KH10963739673',''),(612,'09631234','{}','nv_test1','09631234',4,'efa983b247ea93ac9d8273e26a6fe0c5','',1,'2022-11-17 11:41:50','2022-11-17 11:41:51',1,'',NULL,'',4,NULL,NULL,'','1',0,NULL,'NV09631234',''),(613,'093175214','{}','nv_spa_test1','093175214',3,'8c747ad78349f1b20d581214b2be068d','',1,'2022-11-17 11:42:15','2022-11-17 11:42:16',1,'',NULL,'',3,NULL,NULL,'','1',0,NULL,'NV093175214',''),(614,'0987654322','{}','Minh nhân viên','0987654322',4,'f3bb48979f578c630ec41b44a20e4288','',1,'2022-12-09 15:58:12','2022-12-09 15:58:13',1,'',NULL,'',1,NULL,NULL,'','1',0,NULL,'NV0987654322',''),(615,'0987654333','{}','Minh qly','0987654333',2,'b619154e8d8061bf211581aa447d33c0','',1,'2022-12-09 15:58:57','2022-12-09 15:58:57',1,'',NULL,'',0,NULL,NULL,'','1',0,NULL,'',''),(616,'0987607077','{}','test1','0987607077',4,'e677b797e0d76c7e35a48a163065ded5','',1,'2022-12-09 16:04:41','2022-12-09 16:04:42',1,'',NULL,'',1,NULL,NULL,'','1',0,NULL,'NV0987607077',''),(617,'0987607073','{}','NGỌC TEST3','0987607073',5,'81b4a4eabb464d9aa73809dad2d34403','',1,'2022-12-16 11:24:51','2022-12-16 11:24:51',1,'',NULL,'',1,NULL,NULL,'','1',63200,NULL,'KH10987607073',''),(618,'01234568','{}','test order','01234568',5,'3959db51d59bcae9e0e9d04e71253637','',1,'2022-12-29 17:03:31','2022-12-29 17:03:32',1,'',NULL,'',1,NULL,NULL,'','1',20001,NULL,'KH101234568','');
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

-- Dump completed on 2023-08-19 16:16:38
