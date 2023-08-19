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
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `sitesId` bigint(20) NOT NULL,
  `url` varchar(300) DEFAULT NULL,
  `icon` varchar(200) DEFAULT NULL,
  `parentId` bigint(20) NOT NULL,
  `menuPositionsId` bigint(20) NOT NULL,
  `orderBy` int(11) NOT NULL,
  `usersCreatorId` bigint(20) NOT NULL,
  `createDate` datetime DEFAULT current_timestamp(),
  `status` int(11) NOT NULL,
  `urlSlugs` varchar(500) DEFAULT NULL,
  `languagesId` bigint(20) DEFAULT 1,
  `displayChild` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Thanh công cụ',1,'/system/menus','',25,1,5,1,'2020-12-09 07:00:00',1,'/system/menus',1,_binary '\0'),(2,'Tài khoản',1,'/system/users','',25,1,1,1,'2020-12-09 17:59:22',1,'/system/users',1,_binary '\0'),(3,'Nhóm tài khoản',1,'/system/groupUsers','',25,1,3,1,'2020-12-10 13:39:59',1,'/system/groupUsers',1,_binary '\0'),(6,'Loại thiên tai',1,'/category/disasterGroups','',14,1,8,1,'2020-12-11 08:50:45',1,'/category/disasters',1,_binary '\0'),(8,'Quản lý Tỉnh/Thành phố',1,'/category/province',NULL,25,1,7,1,'2020-12-11 08:56:42',1,'/category/province',1,_binary '\0'),(9,'Quản lý Quận/Huyện',1,'/category/district',NULL,25,1,8,1,'2020-12-11 08:57:33',1,'/category/district',1,_binary '\0'),(10,'Quản lý Phường/Xã',1,'/category/ward',NULL,25,1,9,1,'2020-12-11 08:58:12',1,'/category/ward',1,_binary '\0'),(14,'Danh mục',1,'##','fas fa-cube',0,1,5,1,'2020-12-11 16:17:04',1,'##',1,_binary '\0'),(17,'Văn bản',1,'/category/documents','',82,1,3,1,'2020-12-11 16:30:14',1,'/category/documents',1,_binary '\0'),(22,'Tài khoản quản lý',1,'/system/usersAdmin','',25,1,2,1,'2020-12-13 21:39:14',1,'/system/usersAdmin',1,_binary '\0'),(24,'Cài đặt thông tin web',1,'/system/config','',25,1,6,1,'2020-12-14 09:49:09',1,'/system/config',1,_binary '\0'),(25,'Hệ thống',1,'#','fas fa-cog',0,1,2,1,'2020-12-16 08:37:40',1,'#',1,_binary '\0'),(31,'Bài viết tin tức',1,'/category/contents','',83,1,1,1,'2020-12-16 09:35:28',1,'/category/contents',1,_binary '\0'),(32,'Thống kê',1,'/system/dashboard','fas fa-chart-line',0,1,1,1,'2020-12-16 14:26:35',1,'/system/dashboard',1,_binary '\0'),(36,'Phiếu khảo sát',1,'/category/surveys','fas fa-poll-h',0,1,6,1,'2021-01-06 11:43:48',1,'/category/surveys',1,_binary '\0'),(50,'Loại văn bản',1,'/category/documentGroups','',14,1,7,1,'2021-07-12 11:41:19',1,'/category/documentGroups',1,_binary '\0'),(59,'Chuyên mục tin',1,'/category/contentGroups','',14,1,5,1,'2022-12-13 15:27:02',1,'/category/contentGroups',1,_binary '\0'),(60,'Câu hỏi và góp ý',1,'/category/problems','far fa-question-circle',0,1,7,1,'2022-12-15 08:51:49',1,NULL,1,_binary ''),(61,'Ứng dụng đã triển khai',1,'/category/apps','',83,1,4,1,'2022-12-19 11:07:48',1,NULL,1,_binary ''),(62,'Tài liệu',1,'/category/literatures','',82,1,2,1,'2022-12-21 08:44:14',1,NULL,1,_binary ''),(63,'Loại tài liệu',1,'/category/literatureGroups','',14,1,6,1,'2022-12-21 08:44:53',1,NULL,1,_binary ''),(64,'Đối tượng sử dụng',1,'/category/objectUsers','',14,1,10,1,'2022-12-21 08:45:27',1,NULL,1,_binary ''),(65,'Đơn vị làm tài liệu',1,'/category/units','',14,1,9,1,'2022-12-21 08:45:51',1,NULL,1,_binary ''),(66,'Thanh công cụ web',1,'/category/menusWeb','',25,1,4,1,'2022-12-22 01:51:03',1,NULL,1,_binary ''),(67,'Trang chủ',1,'/','fas fa-home',0,2,1,1,'2022-12-22 01:55:50',1,NULL,1,_binary ''),(68,'Thông tin chuyển đổi số',1,'/thong-tin-ve-chuyen-doi-so/tat-ca','fas fa-newspaper',0,2,2,1,'2022-12-22 01:56:25',1,NULL,1,_binary ''),(69,'Kiến thức về chuyển đổi số',1,'/kien-thuc-ve-chuyen-doi-so/tat-ca','fas fa-user-graduate',0,2,3,1,'2022-12-22 01:57:48',1,NULL,1,_binary ''),(70,'Văn bản',1,'/van-ban/tat-ca','fas fa-file-signature',0,2,4,1,'2022-12-22 01:58:38',1,NULL,1,_binary ''),(71,'Tài liệu',1,'/tai-lieu/tat-ca','fas fa-file-invoice',0,2,5,1,'2022-12-22 01:59:01',1,NULL,1,_binary ''),(72,'Liên  hệ',1,'/lien-he','fas fa-phone-volume',0,2,7,1,'2022-12-22 01:59:22',1,NULL,1,_binary ''),(73,'Khảo sát',1,'/khao-sat','fas fa-poll-h',0,2,6,1,'2022-12-22 01:59:40',1,NULL,1,_binary ''),(74,'Tài liệu khác',1,'/tai-lieu/tai-lieu-khac','',71,2,4,1,'2022-12-22 02:02:41',1,NULL,1,_binary ''),(75,'Tài liệu kỹ thuật',1,'/tai-lieu/tai-lieu-ky-thuat','',71,2,2,1,'2022-12-22 02:03:10',1,NULL,1,_binary ''),(76,'Văn bản đến',1,'/van-ban/van-ban-den','',70,2,2,1,'2022-12-22 02:03:58',1,NULL,1,_binary ''),(77,'Văn bản đi',1,'/van-ban/van-ban-di','',70,2,1,1,'2022-12-22 02:04:21',1,NULL,1,_binary ''),(78,'Tin chuyển đổi số',1,'/thong-tin-ve-chuyen-doi-so/chuyen-doi-so','',68,2,1,1,'2022-12-22 02:05:22',1,NULL,1,_binary ''),(79,'Tin trong nước',1,'/thong-tin-ve-chuyen-doi-so/tin-trong-nuoc','',68,2,2,1,'2022-12-22 02:05:40',1,NULL,1,_binary ''),(80,'Tin nước ngoài',1,'/thong-tin-ve-chuyen-doi-so/tin-nuoc-ngoai','',68,2,3,1,'2022-12-22 02:06:09',1,NULL,1,_binary ''),(81,'Tài liệu dự án',1,'/tai-lieu/tai-lieu-du-an','',71,2,1,1,'2022-12-23 16:04:56',1,NULL,1,_binary ''),(82,'Văn bản tài liệu',1,'###','fas fa-file',0,1,3,1,'2023-01-13 14:20:43',1,NULL,1,_binary ''),(83,'Bài viết',1,'####','fas fa-newspaper',0,1,4,1,'2023-01-13 14:21:45',1,NULL,1,_binary ''),(84,'Bài viết cẩm nang',1,'/category/handbook','',83,1,2,1,'2023-01-13 14:22:42',1,NULL,1,_binary ''),(85,'Dự án đã triển khai',1,'/category/project','',83,1,3,1,'2023-01-13 14:23:19',1,NULL,1,_binary ''),(86,'Kế hoạch chuyển đổi số cấp bộ',1,'/van-ban/ke-hoach-chuyen-doi-so-cap-bo','',70,2,3,1,'2023-01-13 15:17:43',1,NULL,1,_binary ''),(87,'Kế hoạch chuyển đổi số cấp tỉnh',1,'/van-ban/ke-hoach-chuyen-doi-so-cap-tinh','',70,2,4,1,'2023-01-13 15:18:07',1,NULL,1,_binary ''),(88,'Tài liệu tham khảo',1,'/tai-lieu/tai-lieu-tham-khao','',71,2,3,1,'2023-01-13 15:20:16',1,NULL,1,_binary '');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
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
