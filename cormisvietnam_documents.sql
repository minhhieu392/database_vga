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
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `documentsCode` varchar(500) DEFAULT NULL COMMENT 'số, ký hiệu',
  `documentsName` varchar(500) DEFAULT NULL,
  `descriptions` longtext DEFAULT NULL,
  `documentGroupsId` bigint(20) DEFAULT 0,
  `downloads` int(11) DEFAULT 0,
  `views` int(11) DEFAULT 0,
  `files` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`files`)),
  `url` varchar(500) DEFAULT NULL,
  `userCreatorsId` bigint(20) DEFAULT NULL,
  `dateCreated` datetime DEFAULT current_timestamp(),
  `dateUpdated` datetime DEFAULT current_timestamp(),
  `status` int(11) DEFAULT NULL,
  `languagesId` bigint(20) DEFAULT 1,
  `parentId` bigint(20) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `contents_documentGroupsId_IDX` (`documentGroupsId`) USING BTREE,
  KEY `languagesId` (`languagesId`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='tài liệu';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (12,'1123','tài liêu document sequelize','Sequelize là một TypeScript và Node.js ORM hiện đại dành cho Oracle, Postgres, MySQL, MariaDB, SQLite và SQL Server, v.v. Với tính năng hỗ trợ giao dịch vững chắc, các mối quan hệ, tải háo hức và lười biếng, sao chép đọc và hơn thế nữa.',12,155,3000,'[]','sequelize/doc',1,'2022-09-09 00:00:00','2022-12-30 06:43:21',0,1,0),(13,'223','Tai lieu cong dong','',13,8,7,'[]','tai-lieu-cong-dong',1,'2022-12-27 06:44:11','2023-01-05 09:33:40',1,1,0),(14,'1923','tài liêu document sequelize hieutrinh',NULL,12,155,3000,'[]','sequelize/doc',122,'2022-12-30 09:33:03','2022-12-30 09:33:52',0,1,12),(15,'1923','tài liêu Python',NULL,12,155,3000,'[]','apple.com',122,'2022-12-30 09:43:51','2022-12-30 09:44:28',0,1,12),(16,'1923','tài liêu document lập trinh java 1998',NULL,12,155,3000,'[]','oracle.com/java',1,'2022-12-30 10:03:39','2022-12-30 10:03:39',0,1,12),(17,'aaa1234','TEST01 TIENG VIET','ok',8,0,0,'{}','http',1,'2022-12-30 14:14:40','2022-12-30 14:14:40',1,1,0),(18,'aaa1234','TEST01 TIENG ANH','ok',8,0,0,'{}','http',1,'2022-12-30 14:14:40','2022-12-30 14:14:40',1,1,17),(19,'aaa1234','TEST02 TIENG VIET','ok',8,0,0,'{}','http',1,'2022-12-30 14:27:15','2022-12-30 14:27:15',1,1,0),(20,'aaa1234','TEST02 TIENG ANH','ok',8,0,0,'{}','http',1,'2022-12-30 14:27:15','2022-12-30 14:27:15',1,1,19),(21,' 51/2010/QH12','LUẬT NGƯỜI KHUYẾT TẬT','<p><strong>S&ocirc;́ văn bản:</strong>&nbsp;51/2010/QH12</p>\n\n<p><strong>Nội dung t&oacute;m tắt:</strong></p>\n\n<p>Vào ngày 17/6/2010, Qu&ocirc;́c h&ocirc;̣i nước C&ocirc;̣ng hoà xã h&ocirc;̣i chủ nghĩa Vi&ecirc;̣t Nam đã th&ocirc;ng qua Lu&acirc;̣t người khuy&ecirc;́t t&acirc;̣t (s&ocirc;́ 51/2010/QH12) với sự đ&ocirc;̀ng ý của 431 đại bi&ecirc;̉u (chi&ecirc;́m 87,2%). G&ocirc;̀m có 10 chương, 53 điều, Luật Người khuyết tật sẽ c&oacute; hiệu lực thi h&agrave;nh từ ng&agrave;y 1/1/2011.</p>\n\n<p>Có giá trị thay th&ecirc;́ Pháp L&ecirc;̣nh v&ecirc;̀ người tàn t&acirc;̣t năm 1998, với những n&ocirc;̣i dung mở r&ocirc;̣ng hơn v&ecirc;̀ quy&ecirc;̀n của người khuy&ecirc;́t t&acirc;̣t, vi&ecirc;̣c chăm s&oacute;c sức khỏe, gi&aacute;o dục, dạy nghề v&agrave; việc l&agrave;m đối với người khuyết tật; bảo trợ x&atilde; hội đối với người khuyết tật; tr&aacute;ch nhiệm của c&aacute;c cơ quan nh&agrave; nước về c&ocirc;ng t&aacute;c người khuyết tật&hellip; Lu&acirc;̣t Người khuy&ecirc;́t t&acirc;̣t được kỳ vọng sẽ ph&aacute;t huy được vai tr&ograve;, tr&aacute;ch nhiệm của cộng đồng, gia đ&igrave;nh v&agrave; x&atilde; hội đối với những đối tượng thiệt th&ograve;i l&agrave; người khuyết tật.</p>\n',18,0,9,'[]','luat-nguoi-khuyet-tat',1,'2022-12-30 16:33:38','2023-01-05 09:42:04',1,1,0),(22,' 51/2010/QH12','THE LAW ON PERSONS WITH DISABILITIES','<p style=\"margin-left:0px; margin-right:0px; text-align:justify\"><span style=\"font-size:16.896px\"><span style=\"color:#333333\"><span style=\"font-family:Bookman,SVN-Helves,&quot;Open Sans&quot;,sans-serif\"><span style=\"background-color:#ffffff\"><strong>Summary:</strong></span></span></span></span></p>\n\n<ul style=\"margin-left:0px; margin-right:0px\">\n	<li>General Provisions</li>\n	<li>Disability certification</li>\n	<li>Health care</li>\n	<li>Education</li>\n	<li>Employment and vocational trainung</li>\n	<li>Culture, physical education, Sports, Entertainment and Tourism</li>\n	<li>Housing, public buidings, public transportation and information technology and communication&nbsp;</li>\n	<li>Social Protection</li>\n	<li>State responsibilities on disability work</li>\n	<li>State Responsibilities&nbsp;on disability work</li>\n</ul>\n\n<p>&nbsp;</p>\n\n<p style=\"margin-left:0px; margin-right:0px; text-align:justify\"><span style=\"font-size:16.896px\"><span style=\"color:#333333\"><span style=\"font-family:Bookman,SVN-Helves,&quot;Open Sans&quot;,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"font-family:Times New Roman\">&nbsp;</span></span></span></span></span></p>\n\n<p style=\"margin-left:0px; margin-right:0px\"><span style=\"font-size:16.896px\"><strong>THE LAW ON PERSONS WITH DISABILITIES</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>\n\n<p style=\"margin-left:0px; margin-right:0px\">&nbsp;</p>\n\n<p style=\"margin-left:0px; margin-right:0px\"><span style=\"font-size:16.896px\">Pursuant to the Constitution of the Socialist Republic of Vietnam in 1992 which has been amended and supplemented by a number of articles of the Resolution No. 51/2001/QH10;</span></p>\n\n<p style=\"margin-left:0px; margin-right:0px\"><span style=\"font-size:16.896px\">The National Assembly of Vietnam promulgates the National Law on Persons with disability.</span></p>\n',19,0,0,'[]','the-law-on-persons-with-disabilities',1,'2022-12-30 16:33:38','2022-12-30 16:33:38',1,2,21);
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:18:42
