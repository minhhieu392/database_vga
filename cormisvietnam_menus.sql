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
) ENGINE=InnoDB AUTO_INCREMENT=369 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (3,'Tài khoản học viên',1,'/system/users','',37,1,6,1,'2019-09-14 11:07:31',1,NULL,1,_binary ''),(8,'Nhóm tài khoản',1,'/system/groupUsers',NULL,37,1,10,1,'2019-09-18 10:30:59',1,NULL,1,_binary ''),(9,'Quản lý tỉnh - thành phố',1,'/category/province',NULL,37,1,11,1,'2019-09-18 10:33:01',1,NULL,1,_binary ''),(10,'Quản lý quận - huyện',1,'/category/district',NULL,37,1,12,1,'2019-09-18 10:33:57',1,NULL,1,_binary ''),(11,'Quản lý phường - xã',1,'/category/ward',NULL,37,1,13,1,'2019-09-18 10:35:00',1,NULL,1,_binary ''),(37,'Quản lý hệ thống',1,'##','',0,1,9,1,'2019-09-25 08:36:21',1,NULL,1,_binary ''),(243,'Thanh công cụ',1,'/category/menuDashboard',NULL,37,1,9,1,'2020-12-08 11:21:32',1,NULL,1,_binary ''),(264,'eva',208,NULL,NULL,0,41,2,1,'2021-05-27 16:58:23',1,'test',1,_binary ''),(268,'Trang chủ',2,NULL,NULL,0,42,1,1,'2021-06-04 10:00:08',1,'Home',1,_binary ''),(269,'Ưa thích',2,NULL,NULL,0,42,2,1,'2021-06-04 10:00:47',1,'FavouriteScreen',1,_binary ''),(271,'Giỏ hàng',2,NULL,NULL,0,42,4,1,'2021-06-04 10:01:32',1,'CartScreen',1,_binary ''),(272,'Tài khoản',2,NULL,NULL,0,42,5,1,'2021-06-04 10:01:53',1,'UserScreen',1,_binary ''),(273,'Xem chợ có gì',2,NULL,'CategoryIcon',0,43,1,1,'2021-06-04 10:54:09',1,'ResultSearch',1,_binary ''),(274,'Tôi có hàng để bán',2,NULL,'PaymentIcon',0,43,2,1,'2021-06-04 10:54:40',1,'/',1,_binary ''),(275,'Khuyến mại gần đây',2,NULL,'VoucherIcon',0,43,3,1,'2021-06-04 10:54:58',1,'/',1,_binary ''),(282,'Đơn hàng mua khóa học',1,'/category/coursesRe','fas fa-exchange-alt',0,1,7,1,'2021-09-15 15:17:45',0,NULL,1,_binary ''),(283,'Danh mục',1,'#','fas fa-cube',0,1,4,1,'2021-09-15 15:18:24',1,NULL,1,_binary ''),(289,'Thể loại khóa học',1,'/category/courseTypes','',37,1,5,1,'2021-09-16 12:34:00',0,NULL,1,_binary ''),(295,'Video',2,NULL,NULL,0,42,3,1,'2021-10-04 13:42:36',1,'VideoList',1,_binary ''),(298,'Shop của tôi',3,'Thông tin cửa hàng, …','MyShop',0,42,2,1,'2021-11-17 12:02:13',1,'ShopInformation',1,_binary ''),(299,'Hồ sơ cá nhân',3,'Email, số điện thoại, …','UserAdmin',0,42,1,1,'2021-11-20 09:04:05',1,'UserInformation',1,_binary ''),(300,'Duyệt sản phẩm',3,'Xem và duyệt yêu cầu đăng sản phẩm','ProductApproval',0,42,3,1,'2021-11-20 09:05:08',1,'ProductionsApproved',1,_binary ''),(301,'Đơn hàng',3,'Xem đơn hàng','HistoryAdmin',0,42,4,1,'2021-11-20 09:05:59',1,'Orders',1,_binary ''),(302,'Đơn mua',3,'Xem lại đơn hàng đã mua','HistoryAdmin',0,42,5,1,'2021-11-20 09:06:27',1,'MyOrder',1,_binary ''),(303,'Liên hệ',3,'Liên lạc với kiểm duyệt viên','Contact',0,42,6,1,'2021-11-20 09:06:59',1,'UsersApprovedLocations',1,_binary ''),(304,'Quản lý người dùng',3,'Xem danh sách người dùng trong khu vực','addusergroup',0,42,7,1,'2021-11-20 09:07:45',1,'AcountUsers',1,_binary ''),(305,'Quản lý cán bộ',3,'Xem danh sách cán bộ trong khu vực','addusergroup',0,42,8,1,'2021-11-20 09:08:11',1,'AcountCanbo',1,_binary ''),(306,'Quản lý TK vận chuyển',3,'Xem danh sách người vận chuyển trong khu vực','addusergroup',0,42,9,1,'2021-11-20 09:08:44',1,'AcountVanChuyen',1,_binary ''),(313,'Video bài giảng',1,'/category/courses','fas fa-video',283,1,3,1,'2022-12-01 11:03:37',0,NULL,1,_binary ''),(314,'Bài tập',1,'/category/exercises','fas fa-briefcase',283,1,2,1,'2022-12-01 11:04:48',0,NULL,1,_binary ''),(315,'Tổng quan',1,'/system/dashboard','fas fa-chart-line',0,1,1,1,'2022-12-01 11:12:24',1,NULL,1,_binary ''),(316,'Thông báo',1,'/category/notifications','fas fa-bell',0,1,8,1,'2022-12-05 10:10:46',0,NULL,1,_binary ''),(317,'Tài khoản nhận tiền',1,'/category/bankAccounts','',37,1,4,1,'2022-12-05 10:11:42',0,NULL,1,_binary ''),(318,'Hình thức chuyển khoản',1,'/category/bankAccountTypes','',37,1,3,1,'2022-12-05 10:12:34',0,NULL,1,_binary ''),(319,'Quảng cáo bìa',1,'/category/banner','',37,1,1,1,'2022-12-05 10:13:45',1,NULL,1,_binary ''),(320,'Tài khoản quản trị',1,'/system/usersAdmin','',37,1,8,1,'2022-12-06 08:52:21',1,NULL,1,_binary ''),(321,'Tài khoản giáo viên',1,'/system/usersTeacher','',37,1,7,1,'2022-12-06 12:09:28',0,NULL,1,_binary ''),(322,'Sự kiện',1,'/category/events','',368,1,1,1,'2022-12-08 11:32:06',1,NULL,1,_binary ''),(323,'Thiết lập giá',1,'/category/priceList','fa fa-tags',283,1,4,1,'2022-12-08 11:32:36',0,NULL,1,_binary ''),(324,'Cài đặt thông tin ứng dụng',1,'####','',37,1,2,1,'2022-12-08 11:48:06',0,NULL,1,_binary ''),(325,'Dịch vụ',1,'/category/services','fab fa-ups',283,1,5,1,'2022-12-20 15:52:27',0,NULL,1,_binary ''),(326,'Quản lý trang',1,'/category/sites','',37,1,1,1,'2022-12-27 11:03:48',0,NULL,1,_binary ''),(327,'Loại tài liệu',1,'/category/documentGroups','',37,1,1,1,'2022-12-27 13:57:09',1,NULL,1,_binary ''),(328,'Chuyên mục tin',1,'/category/contentGroups','',283,1,2,1,'2022-12-27 14:24:26',1,NULL,1,_binary ''),(329,'Loại sự kiện',1,'/category/eventGroups','',37,1,1,1,'2022-12-27 14:25:41',1,NULL,1,_binary ''),(330,'Loại chỉ tiêu trạng thái',1,'/category/evaluationCriteriaGroups','',37,1,1,1,'2022-12-27 14:42:32',1,NULL,1,_binary ''),(331,'Chỉ tiêu trạng thái',1,'/category/evaluationCriteria','',283,1,1,1,'2022-12-27 14:43:07',1,NULL,1,_binary ''),(332,'Tin tức',1,'/category/contents?id=12.26','',368,1,2,1,'2022-12-28 22:35:32',1,NULL,1,_binary ''),(333,'Bộ môn',1,'/category/subjects','',359,1,2,1,'2022-12-29 23:22:03',1,NULL,1,_binary ''),(334,'Đối tượng',1,'/category/jobs','',283,1,3,1,'2022-12-29 23:24:01',1,NULL,1,_binary ''),(335,'Dạng khuyết tật',1,'/category/usertypes','',283,1,3,1,'2022-12-29 23:24:43',1,NULL,1,_binary ''),(336,'Quản lý quốc gia',1,'/category/countries','',37,1,14,1,'2022-12-29 23:25:36',1,NULL,1,_binary ''),(337,'Tài liệu',1,'/category/documents','',368,1,3,1,'2022-12-30 00:30:08',1,NULL,1,_binary ''),(338,'Ngôn ngữ',1,'/category/languages','',37,1,1,1,'2022-12-30 11:42:53',1,NULL,1,_binary ''),(339,'Câu hỏi',1,'/category/questions','',283,1,1,1,'2022-12-30 17:23:52',0,NULL,1,_binary ''),(340,'Tổ chức bình chọn',1,'/category/votes','',359,1,5,1,'2023-01-03 17:41:11',1,NULL,1,_binary ''),(341,'Cẩm nang',1,'/category/handbooks?id=21.36','',368,1,4,1,'2023-01-04 02:11:47',1,NULL,1,_binary ''),(342,'Dự án',1,'/category/projects?id=23.33','',368,1,5,1,'2023-01-04 02:12:35',1,NULL,1,_binary ''),(343,'Nhà tài trợ / đối tác',1,'/category/partners?id=22.35.13.42','',368,1,6,1,'2023-01-04 02:13:36',1,NULL,1,_binary ''),(344,'Tập huấn viên / cộng tác viên',1,'/category/trainers?id=34.25.44.43','',368,1,8,1,'2023-01-04 02:14:43',1,NULL,1,_binary ''),(345,'Ủng hộ',1,'/category/donate?id=24.14','',368,1,7,1,'2023-01-04 02:15:26',1,NULL,1,_binary ''),(346,'Thanh công cụ web',1,'/category/menusWeb','',37,1,4,1,'2023-01-04 17:17:08',1,NULL,1,_binary ''),(347,'Trang chủ',1,'/','home',0,2,1,1,'2023-01-04 17:35:33',1,NULL,1,_binary ''),(348,'Sự kiện',1,'/events-list/all','event',0,2,2,1,'2023-01-04 17:37:35',1,NULL,1,_binary ''),(349,'Bài viết',1,'/article-list/all','newspaper',0,2,3,1,'2023-01-04 17:38:25',1,NULL,1,_binary ''),(350,'Tài liệu',1,'/document-list/all','document',0,2,6,1,'2023-01-04 17:40:19',1,NULL,1,_binary ''),(351,'Cẩm nang',1,'/handbook/all','handbook',0,2,5,1,'2023-01-04 17:40:59',1,NULL,1,_binary ''),(352,'Cài đặt thông tin web',1,'/system/config','',37,1,6,1,'2023-01-05 11:43:00',1,NULL,1,_binary ''),(353,'Liên hệ',1,'/contact','contact',0,2,9,1,'2023-01-05 13:57:30',1,NULL,1,_binary ''),(354,'Câu hỏi và góp ý',1,'/category/problems','',0,1,6,1,'2023-01-05 13:59:51',1,NULL,1,_binary ''),(355,'Nhà tài trợ',1,'/donors','donors',0,2,4,1,'2023-01-06 00:50:45',1,NULL,1,_binary ''),(356,'Ủng hộ',1,'/donate','donate',0,2,8,1,'2023-01-06 00:51:02',1,NULL,1,_binary ''),(357,'Dự án',1,'/project-list/all','project',0,2,7,1,'2023-01-06 01:04:30',1,NULL,1,_binary ''),(358,'Home',1,'/','home',0,2,1,1,'2023-01-06 01:16:57',1,NULL,2,_binary ''),(359,'Bình chọn',1,'###','',0,1,5,1,'2023-01-06 01:50:16',1,NULL,1,_binary ''),(360,'Documents',1,'/document-list/all','document',0,2,6,1,'2023-01-06 09:54:41',1,NULL,2,_binary ''),(361,'Events',1,'/events-list/all','event',0,2,2,1,'2023-01-06 09:56:43',1,NULL,2,_binary ''),(362,'Articles',1,'/article-list/all','newspaper',0,2,3,1,'2023-01-06 09:57:21',1,NULL,2,_binary ''),(363,'Handbooks',1,'/handbook/all','handbook',0,2,4,1,'2023-01-06 09:57:48',1,NULL,2,_binary ''),(364,'Projects',1,'/project-list/all','project',0,2,7,1,'2023-01-06 09:58:11',1,NULL,2,_binary ''),(365,'Donate',1,'/donate','donate',0,2,8,1,'2023-01-06 09:58:35',1,NULL,2,_binary ''),(366,'Donors',1,'/donors','donors',0,2,5,1,'2023-01-06 09:58:54',1,NULL,2,_binary ''),(367,'Contact',1,'/contact','contact',0,2,9,1,'2023-01-06 09:59:14',1,NULL,2,_binary ''),(368,'Nhập liệu web',1,'####','1',0,1,2,1,'2023-01-06 11:17:29',1,NULL,1,_binary '');
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

-- Dump completed on 2023-08-19 16:18:35
