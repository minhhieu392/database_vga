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
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (3,'Danh mục',1,'/system/products','fa-fw fa fa-th',280,1,1,1,'2019-09-14 11:07:31',1,NULL,1,_binary ''),(7,'Quản lý tài khoản',1,'/system/usersAdmin','fas fa-user-circle',37,1,8,1,'2019-09-18 10:28:34',1,NULL,1,_binary ''),(8,'Nhóm tài khoản',1,'/system/groupUsers','fas fa-users',37,1,10,1,'2019-09-18 10:30:59',1,NULL,1,_binary ''),(9,'Quản lý tỉnh - thành phố',1,'/category/province','fas fa-cog',37,1,12,1,'2019-09-18 10:33:01',1,NULL,1,_binary ''),(10,'Quản lý quận - huyện',1,'/category/district','fas fa-cog',37,1,13,1,'2019-09-18 10:33:57',1,NULL,1,_binary ''),(11,'Quản lý phường - xã',1,'/category/ward','fas fa-cog',37,1,14,1,'2019-09-18 10:35:00',1,NULL,1,_binary ''),(17,'Thuộc tính sản phẩm',1,'/category/properties','fas fa-atom',37,1,2,1,'2019-09-18 10:40:13',1,NULL,1,_binary ''),(22,'Phí dịch vụ',1,'/category/surcharge','fas fa-money-check-alt',37,1,9,1,'2019-09-18 10:45:37',0,NULL,1,_binary ''),(37,'Hệ thống',1,'##','',0,1,8,1,'2019-09-25 08:36:21',1,NULL,1,_binary ''),(151,'Tổng quan',1,'/system/dashboard','fas fa-eye',0,1,1,1,'2020-03-09 16:01:17',1,NULL,1,_binary ''),(243,'Thanh công cụ',1,'/category/menuDashboard','fas fa-bars',37,1,11,1,'2020-12-08 11:21:32',1,NULL,1,_binary ''),(264,'eva',208,NULL,NULL,0,41,2,1,'2021-05-27 16:58:23',1,'test',1,_binary ''),(268,'Trang chủ',2,NULL,NULL,0,42,1,1,'2021-06-04 10:00:08',1,'Home',1,_binary ''),(269,'Ưa thích',2,NULL,NULL,0,42,2,1,'2021-06-04 10:00:47',1,'FavouriteScreen',1,_binary ''),(270,'Chợ số',2,NULL,NULL,0,42,3,1,'2021-06-04 10:01:07',-1,'ShopScreen',1,_binary ''),(271,'Giỏ hàng',2,NULL,NULL,0,42,4,1,'2021-06-04 10:01:32',1,'CartScreen',1,_binary ''),(272,'Tài khoản',2,NULL,NULL,0,42,5,1,'2021-06-04 10:01:53',1,'UserScreen',1,_binary ''),(273,'Xem chợ có gì',2,NULL,'CategoryIcon',0,43,1,1,'2021-06-04 10:54:09',1,'ResultSearch',1,_binary ''),(274,'Tôi có hàng để bán',2,NULL,'PaymentIcon',0,43,2,1,'2021-06-04 10:54:40',1,'/',1,_binary ''),(275,'Khuyến mại gần đây',2,NULL,'VoucherIcon',0,43,3,1,'2021-06-04 10:54:58',1,'/',1,_binary ''),(277,'Vị trí sản phẩm',1,'/category/productPlacements','fas fa-map-pin',37,1,3,1,'2021-07-12 11:18:36',1,NULL,1,_binary ''),(280,'Hàng hoá',1,'###','fas fa-cube',0,1,2,1,'2021-09-15 15:15:31',1,NULL,1,_binary ''),(282,'Nhóm sản phẩm',1,'/category/productGroups','fas fa-layer-group',37,1,1,1,'2021-09-15 15:17:45',1,NULL,1,_binary ''),(289,'Thương hiệu',1,'/category/brands','fas fa-store',37,1,4,1,'2021-09-16 12:34:00',1,NULL,1,_binary ''),(290,'Chi nhánh',1,'/category/branches','fas fa-code-branch',37,1,6,1,'2021-09-16 12:35:38',1,NULL,1,_binary ''),(292,'Khách hàng',1,'/system/customers','fas fa-user',308,1,1,1,'2021-09-24 14:54:55',1,NULL,1,_binary ''),(295,'Video',2,NULL,NULL,0,42,3,1,'2021-10-04 13:42:36',1,'VideoList',1,_binary ''),(298,'Shop của tôi',3,'Thông tin cửa hàng, …','MyShop',0,42,2,1,'2021-11-17 12:02:13',1,'ShopInformation',1,_binary ''),(299,'Hồ sơ cá nhân',3,'Email, số điện thoại, …','UserAdmin',0,42,1,1,'2021-11-20 09:04:05',1,'UserInformation',1,_binary ''),(300,'Duyệt sản phẩm',3,'Xem và duyệt yêu cầu đăng sản phẩm','ProductApproval',0,42,3,1,'2021-11-20 09:05:08',1,'ProductionsApproved',1,_binary ''),(301,'Đơn hàng',3,'Xem đơn hàng','HistoryAdmin',0,42,4,1,'2021-11-20 09:05:59',1,'Orders',1,_binary ''),(302,'Đơn mua',3,'Xem lại đơn hàng đã mua','HistoryAdmin',0,42,5,1,'2021-11-20 09:06:27',1,'MyOrder',1,_binary ''),(303,'Liên hệ',3,'Liên lạc với kiểm duyệt viên','Contact',0,42,6,1,'2021-11-20 09:06:59',1,'UsersApprovedLocations',1,_binary ''),(304,'Quản lý người dùng',3,'Xem danh sách người dùng trong khu vực','addusergroup',0,42,7,1,'2021-11-20 09:07:45',1,'AcountUsers',1,_binary ''),(305,'Quản lý cán bộ',3,'Xem danh sách cán bộ trong khu vực','addusergroup',0,42,8,1,'2021-11-20 09:08:11',1,'AcountCanbo',1,_binary ''),(306,'Quản lý TK vận chuyển',3,'Xem danh sách người vận chuyển trong khu vực','addusergroup',0,42,9,1,'2021-11-20 09:08:44',1,'AcountVanChuyen',1,_binary ''),(307,'Giao dịch',1,'####','fas fa-exchange-alt',0,1,3,1,'2022-06-07 16:47:22',1,NULL,1,_binary ''),(308,'Đối tác',1,'#######','fas fa-user-tie',0,1,4,1,'2022-06-07 16:47:45',1,NULL,1,_binary ''),(309,'Nhân viên',1,'/system/users','fas fa-user-friends',0,1,5,1,'2022-06-07 16:48:24',1,NULL,1,_binary ''),(310,'Báo cáo',1,'########','fas fa-chart-bar',0,1,7,1,'2022-06-07 16:49:23',1,NULL,1,_binary ''),(311,'Nhà cung cấp',1,'/system/supplies','fas fa-industry',308,1,2,1,'2022-06-07 17:57:46',1,NULL,1,_binary ''),(312,'Tài khoản ngân hàng',1,'/system/banks','fas fa-university',37,1,7,1,'2022-06-07 17:58:26',1,NULL,1,_binary ''),(313,'Thiết lập giá',1,'/category/pricelist','fa fa-tags',280,1,2,1,'2022-06-07 18:02:01',1,NULL,1,_binary ''),(314,'Kiểm kho',1,'/category/warehouseCheck','fas fa-clipboard-check',280,1,3,1,'2022-06-07 18:03:19',1,NULL,1,_binary ''),(315,'Đặt hàng',1,'/system/orders','fa-fw fas fa-inbox',307,1,2,1,'2022-06-07 18:07:49',1,NULL,1,_binary ''),(316,'Hóa đơn',1,'/system/receipts','fa-fw fas fa-file-invoice-dollar',307,1,1,1,'2022-06-07 18:08:17',1,NULL,1,_binary ''),(317,'Trả hàng',1,'/system/productReturns','fa-fw fa fa-reply-all',307,1,3,1,'2022-06-07 18:09:26',1,NULL,1,_binary ''),(318,'Nhập hàng',1,'/system/warehouseIn','fas fa-dolly-flatbed',307,1,4,1,'2022-06-07 18:09:54',1,NULL,1,_binary ''),(319,'Trả nhập hàng',1,'/system/warehouseOut','fas fa-backspace',307,1,5,1,'2022-06-07 18:10:23',1,NULL,1,_binary ''),(320,'Quản lý mẫu in',1,'/category/printedForms','fas fa-print',37,1,5,1,'2022-06-08 08:34:39',1,NULL,1,_binary ''),(321,'Sổ quỹ',1,'/category/bills','fas fa-money-check-alt',0,1,6,1,'2022-06-08 08:39:16',1,NULL,1,_binary ''),(322,'Bán hàng',1,'/category/saleReport','fas fa-paste',310,1,4,1,'2022-06-09 12:08:26',1,NULL,1,_binary ''),(323,'Nhân viên',1,'/category/userReport','fas fa-user-friends',310,1,7,1,'2022-06-09 12:08:44',0,NULL,1,_binary ''),(324,'Nhà cung cấp',1,'/category/supplierReport','fas fa-industry',310,1,6,1,'2022-06-09 15:08:26',1,NULL,1,_binary ''),(325,'Khách hàng',1,'/category/customerReport','fas fa-user',310,1,8,1,'2022-06-09 15:08:56',1,NULL,1,_binary ''),(326,'Đặt hàng',1,'/category/orderReport','fa-fw fas fa-inbox',310,1,5,1,'2022-06-09 15:09:21',0,NULL,1,_binary ''),(327,'Cuối ngày',1,'/category/dayReport','fas fa-chart-pie',310,1,1,1,'2022-06-09 15:11:32',1,NULL,1,_binary ''),(328,'Tài chính',1,'/category/financialReport','fas fa-chart-line',310,1,2,1,'2022-06-09 15:12:07',0,NULL,1,_binary ''),(329,'Hàng hóa',1,'/category/productReport','fas fa-cube',310,1,3,1,'2022-06-09 15:12:48',1,NULL,1,_binary ''),(330,'Xuất hủy',1,'/system/productCancels','fas fa-window-close',307,1,6,1,'2022-06-13 09:23:13',1,NULL,1,_binary '');
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

-- Dump completed on 2023-08-19 16:16:21
