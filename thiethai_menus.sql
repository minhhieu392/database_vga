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
) ENGINE=InnoDB AUTO_INCREMENT=318 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (3,'Tài khoản',1,'/system/users',NULL,37,1,7,1,'2019-09-14 11:07:31',1,NULL,1,_binary ''),(4,'Chỉ tiêu',1,'/system/targets',NULL,37,1,1,1,'2019-09-14 11:08:11',1,NULL,1,_binary ''),(7,'Nhập dữ liệu nhu cầu/đáp ứng',1,'/category/demand','fas fa-chart-pie',0,1,3,1,'2019-09-18 10:28:34',1,NULL,1,_binary ''),(8,'Nhóm tài khoản',1,'/system/groupUsers',NULL,37,1,8,1,'2019-09-18 10:30:59',1,NULL,1,_binary ''),(9,'Quản lý tỉnh - thành phố',1,'/category/province',NULL,37,1,10,1,'2019-09-18 10:33:01',1,NULL,1,_binary ''),(10,'Quản lý quận - huyện',1,'/category/district',NULL,37,1,11,1,'2019-09-18 10:33:57',1,NULL,1,_binary ''),(11,'Quản lý phường - xã',1,'/category/ward',NULL,37,1,12,1,'2019-09-18 10:35:00',1,NULL,1,_binary ''),(15,'Biểu mẫu',1,'/category/menuUser',NULL,37,1,2,1,'2019-09-18 10:38:37',1,NULL,1,_binary ''),(17,'Nhóm thống kê',1,'/category/news',NULL,37,1,4,1,'2019-09-18 10:40:13',1,NULL,1,_binary ''),(22,'Thiết lập báo cáo nhanh',1,'/category/templateLayouts',NULL,37,1,6,1,'2019-09-18 10:45:37',1,NULL,1,_binary ''),(37,'Quản lý hệ thống',1,'##','',0,1,4,1,'2019-09-25 08:36:21',1,NULL,1,_binary ''),(46,'Danh mục chung',1,'/general','',37,1,5,1,'2019-09-30 09:23:28',1,NULL,1,_binary ''),(243,'Thanh công cụ',1,'/category/menuDashboard',NULL,37,1,9,1,'2020-12-08 11:21:32',1,NULL,1,_binary ''),(244,'Loại nhu cầu',1,'/category/requestGroups',NULL,37,1,3,1,'2020-12-09 12:10:06',1,'/category/disasterevent',1,_binary ''),(264,'eva',208,NULL,NULL,0,41,2,1,'2021-05-27 16:58:23',1,'test',1,_binary ''),(268,'Trang chủ',2,NULL,NULL,0,42,1,1,'2021-06-04 10:00:08',1,'Home',1,_binary ''),(269,'Ưa thích',2,NULL,NULL,0,42,2,1,'2021-06-04 10:00:47',1,'FavouriteScreen',1,_binary ''),(271,'Giỏ hàng',2,NULL,NULL,0,42,4,1,'2021-06-04 10:01:32',1,'CartScreen',1,_binary ''),(272,'Tài khoản',2,NULL,NULL,0,42,5,1,'2021-06-04 10:01:53',1,'UserScreen',1,_binary ''),(273,'Xem chợ có gì',2,NULL,'CategoryIcon',0,43,1,1,'2021-06-04 10:54:09',1,'ResultSearch',1,_binary ''),(274,'Tôi có hàng để bán',2,NULL,'PaymentIcon',0,43,2,1,'2021-06-04 10:54:40',1,'/',1,_binary ''),(275,'Khuyến mại gần đây',2,NULL,'VoucherIcon',0,43,3,1,'2021-06-04 10:54:58',1,'/',1,_binary ''),(280,'Nhập dữ liệu thiệt hại',1,'/category/damages','fas fa-house-damage',0,1,2,1,'2021-09-15 15:15:31',1,NULL,1,_binary ''),(295,'Video',2,NULL,NULL,0,42,3,1,'2021-10-04 13:42:36',1,'VideoList',1,_binary ''),(297,'Nhập sự kiện thiên tai',1,'/category/disasters','fas fa-cloud-showers-heavy',0,1,1,1,'2021-11-01 11:18:22',1,NULL,1,_binary ''),(298,'Shop của tôi',3,'Thông tin cửa hàng, …','MyShop',0,42,2,1,'2021-11-17 12:02:13',1,'ShopInformation',1,_binary ''),(299,'Hồ sơ cá nhân',3,'Email, số điện thoại, …','UserAdmin',0,42,1,1,'2021-11-20 09:04:05',1,'UserInformation',1,_binary ''),(300,'Duyệt sản phẩm',3,'Xem và duyệt yêu cầu đăng sản phẩm','ProductApproval',0,42,3,1,'2021-11-20 09:05:08',1,'ProductionsApproved',1,_binary ''),(301,'Đơn hàng',3,'Xem đơn hàng','HistoryAdmin',0,42,4,1,'2021-11-20 09:05:59',1,'Orders',1,_binary ''),(302,'Đơn mua',3,'Xem lại đơn hàng đã mua','HistoryAdmin',0,42,5,1,'2021-11-20 09:06:27',1,'MyOrder',1,_binary ''),(303,'Liên hệ',3,'Liên lạc với kiểm duyệt viên','Contact',0,42,6,1,'2021-11-20 09:06:59',1,'UsersApprovedLocations',1,_binary ''),(304,'Quản lý người dùng',3,'Xem danh sách người dùng trong khu vực','addusergroup',0,42,7,1,'2021-11-20 09:07:45',1,'AcountUsers',1,_binary ''),(305,'Quản lý cán bộ',3,'Xem danh sách cán bộ trong khu vực','addusergroup',0,42,8,1,'2021-11-20 09:08:11',1,'AcountCanbo',1,_binary ''),(306,'Quản lý TK vận chuyển',3,'Xem danh sách người vận chuyển trong khu vực','addusergroup',0,42,9,1,'2021-11-20 09:08:44',1,'AcountVanChuyen',1,_binary ''),(313,'Danh mục',1,'##',NULL,0,1,4,1,'2022-12-09 08:46:49',-1,NULL,1,_binary ''),(314,'Loại thiên tai',1,'/category/disasterGroups',NULL,37,1,1,1,'2022-12-09 08:52:42',1,NULL,1,_binary ''),(315,'Nhóm yêu cầu',1,'/category/requestGroups',NULL,313,1,2,1,'2022-12-09 08:53:23',-1,NULL,1,_binary ''),(316,'Đối tượng dễ bị tổn thương',1,'/category/vulnerablePersons',NULL,37,1,1,1,'2022-12-09 09:02:17',1,NULL,1,_binary ''),(317,'Nguồn hỗ trợ',1,'/category/supportSources',NULL,37,1,1,1,'2022-12-09 15:03:37',1,NULL,1,_binary '');
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

-- Dump completed on 2023-08-19 16:15:47
