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
-- Table structure for table `literatures`
--

DROP TABLE IF EXISTS `literatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `literatures` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `literaturesCode` varchar(500) DEFAULT NULL COMMENT 'số, ký hiệu',
  `literaturesName` varchar(500) DEFAULT NULL,
  `literatureGroupsId` bigint(20) DEFAULT 0,
  `unitsId` bigint(20) DEFAULT 0,
  `objectUsersId` bigint(20) DEFAULT 0,
  `descriptions` longtext DEFAULT NULL,
  `views` bigint(20) DEFAULT 0,
  `dateIssued` datetime DEFAULT NULL COMMENT 'ngày ban hành',
  `organizationLevelIssued` varchar(100) DEFAULT NULL COMMENT 'cấp ban hành',
  `organizationIssued` varchar(100) DEFAULT NULL COMMENT 'cơ quan ban hành',
  `signer` varchar(500) DEFAULT NULL COMMENT 'người ký',
  `signDate` datetime DEFAULT NULL COMMENT 'ngày ký',
  `startDate` datetime DEFAULT NULL,
  `userCreatorsId` bigint(20) DEFAULT NULL,
  `dateCreated` datetime DEFAULT current_timestamp(),
  `dateUpdated` datetime DEFAULT current_timestamp(),
  `status` int(11) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `downloads` int(11) DEFAULT 0,
  `files` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`files`)),
  `endDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `literatureGroupsId` (`literatureGroupsId`) USING BTREE,
  KEY `unitsId` (`unitsId`) USING BTREE,
  KEY `objectUsersId` (`objectUsersId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='tài liệu';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `literatures`
--

LOCK TABLES `literatures` WRITE;
/*!40000 ALTER TABLE `literatures` DISABLE KEYS */;
INSERT INTO `literatures` VALUES (1,'test05','Tài liệu số 35/TT-CLT ngày 13 tháng 01 năm 2021 về việc chỉ đạo sản xuất trồng trọt các tỉnh phía Bắc2',1,1,1,NULL,21,'2021-01-13 18:15:38','Cục Trồng trọt','Cục Trồng trọt','Cục Trồng trọt','2021-01-13 18:15:38',NULL,1,'2022-12-20 11:48:00','2022-12-20 11:48:00',1,'cv-so-18',4,NULL,NULL),(2,'dá','d',1,2,3,'',1,'2022-12-21 09:25:42','','','','2022-12-21 09:25:45',NULL,1,'2022-12-21 09:26:34','2022-12-21 09:33:59',1,'d',1,'[]',NULL),(5,'375-CV/BTG','Hướng dẫn tuyên truyền kỷ niệm 110 năm Ngày sinh đồng chí Huỳnh Tấn Phát (15/02/1913 - 15/02/2023)',2,6,8,'',1,'2022-12-22 16:55:13','','','','2022-12-22 16:55:11','2022-12-22 16:55:14',1,'2022-12-22 16:57:12','2022-12-22 16:57:12',1,'huong-dan-tuyen-truyen-ky-niem-110-nam-ngay-sinh-dong-chi-huynh-tan-phat-15021913-15022023',0,'[{\"files\":\"userfiles/adminadmin/files/20221222/2022_12_22_16_55_19_6_ogy375cvhuongdankyniem110namngaysinhdchuynhtanphat0001pdf.pdf\",\"extension\":\"pdf\"}]','2022-12-22 16:55:16'),(6,'HVS_375-CV/BTG','Công văn về việc tuyên truyền kết quả kỳ họp thứ 4, Quốc hội khóa XV',3,6,9,'',7,'2022-12-22 17:00:46','','','','2022-12-22 17:00:45','2022-12-22 17:00:48',1,'2022-12-22 17:03:10','2022-12-23 17:15:04',1,'cong-van-ve-viec-tuyen-truyen-ket-qua-ky-hop-thu-4-quoc-hoi-khoa-xv',3,'[{\"files\":\"userfiles/adminadmin/files/20221222/2022_12_22_17_0_49_862_hvs375cvtuyentruyenketquakyhopthu4quochoikhoaxv0001pdf.pdf\",\"extension\":\"pdf\"}]',NULL);
/*!40000 ALTER TABLE `literatures` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:18:47
