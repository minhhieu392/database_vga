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
-- Table structure for table `receipts`
--

DROP TABLE IF EXISTS `receipts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receipts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `medFacilitysId` bigint(20) DEFAULT NULL,
  `usersId` bigint(20) DEFAULT NULL,
  `receiptsCode` varchar(45) DEFAULT NULL,
  `amountPaid` double DEFAULT 0 COMMENT 'số tiền khách đã trả',
  `discount` double DEFAULT 0 COMMENT 'Giảm giá của hóa đơn',
  `totalMoney` double DEFAULT NULL COMMENT 'Tiền sau khi giảm giá',
  `money` double DEFAULT NULL COMMENT 'Số tiền trước khi giảm giá',
  `status` int(11) DEFAULT NULL,
  `userCreatorsId` bigint(20) NOT NULL,
  `note` text DEFAULT NULL,
  `dateUpdated` datetime DEFAULT current_timestamp(),
  `dateCreated` datetime DEFAULT current_timestamp() COMMENT 'ngày tạo',
  `bankAccountsId` bigint(20) DEFAULT 0,
  `pricelistId` bigint(20) DEFAULT NULL COMMENT 'Id bảng giá',
  `vouchersId` bigint(20) DEFAULT NULL,
  `VAT` double DEFAULT 0 COMMENT 'vnd',
  `ordersId` bigint(20) DEFAULT NULL,
  `currentDebt` double DEFAULT NULL,
  `connectStatus` int(1) DEFAULT 0 COMMENT '0: chưa liên thông,\n1: đã liên thông',
  `productReturnsId` bigint(20) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `createDate` (`dateCreated`),
  KEY `status` (`status`),
  KEY `usersCreatorId` (`userCreatorsId`),
  KEY `customersId` (`usersId`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='hóa đơn của khách hàng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipts`
--

LOCK TABLES `receipts` WRITE;
/*!40000 ALTER TABLE `receipts` DISABLE KEYS */;
INSERT INTO `receipts` VALUES (1,1,609,'HD0000001',44000,0,44000,44000,-1,1,'','2022-11-15 17:42:26','2022-11-15 17:35:10',0,1,NULL,0,0,-44000,0,0),(2,1,609,'HD0000002',30000,0,30000,30000,1,1,'','2022-11-15 17:35:47','2022-11-15 17:35:25',0,1,NULL,0,0,-34000,0,0),(3,1,609,'HD0000003',0,0,0,0,1,1,'','2022-11-15 17:36:25','2022-11-15 17:36:06',0,1,NULL,0,0,-19000,0,0),(4,1,609,'HD0000004',0,0,1050,1050,1,1,'','2022-11-15 17:38:32','2022-11-15 17:38:17',0,1,NULL,0,0,-1050,0,0),(5,1,609,'HD0000005',0,0,0,0,1,1,'','2022-11-15 17:39:56','2022-11-15 17:39:22',0,1,NULL,0,0,-1050,0,0),(6,1,609,'HD0000001',44000,0,44000,44000,1,1,'','2022-11-15 17:42:28','2022-11-15 17:35:10',0,1,NULL,0,0,-49050,0,0),(7,1,610,'HD0000007',44000,0,44000,44000,-1,1,'','2022-11-15 17:47:00','2022-11-15 17:43:22',0,1,NULL,0,0,-44000,0,0),(8,1,610,'HD0000008',35000,0,35000,35000,-1,1,'','2022-11-15 17:59:17','2022-11-15 17:44:01',0,1,NULL,0,0,-39000,0,0),(9,1,610,'HD0000007',44000,0,44000,44000,-1,1,'','2022-11-15 17:53:45','2022-11-15 17:35:10',0,1,NULL,0,0,-48000,0,0),(10,1,609,'HD0000010',0,0,11200,11200,-1,1,'','2022-11-15 17:59:37','2022-11-15 17:51:16',0,1,NULL,0,0,-16250,0,0),(11,1,610,'HD0000007',44000,0,44000,44000,1,1,'','2022-11-15 17:53:46','2022-11-15 17:35:10',0,1,NULL,0,0,-48000,0,0),(12,1,610,'HD0000008',35000,0,35000,35000,-1,1,'','2022-11-15 18:11:52','2022-11-15 17:59:19',0,1,NULL,0,0,-35000,0,0),(13,1,609,'HD0000010',0,0,5600,5600,1,1,'','2022-11-15 17:59:37','2022-11-15 17:51:16',0,1,NULL,0,0,-5050,0,0),(14,1,609,'HD0000014',18400,2000,18400,20400,-1,1,'','2022-11-15 18:10:31','2022-11-15 18:07:42',0,1,NULL,0,0,-23450,0,0),(15,1,609,'HD0000014',9180,1020,9180,10200,1,1,'','2022-11-15 18:10:31','2022-11-15 18:07:42',0,1,NULL,0,0,-14230,0,0),(16,1,610,'HD0000008',35000,0,35000,35000,1,1,'','2022-11-15 18:11:53','2022-11-15 18:11:53',0,1,NULL,0,0,-35000,0,0),(17,1,609,'HD0000017',0,0,15500,15500,1,1,'','2022-11-15 18:23:48','2022-11-15 18:23:05',0,1,NULL,0,0,-20550,0,0),(18,1,609,'HD0000018',20000,0,32800,32800,1,1,'','2022-11-15 18:34:15','2022-11-15 18:34:02',0,1,NULL,0,0,-53350,0,0),(19,1,611,'HD0000019',9500,0,9500,9500,1,1,'','2022-11-16 10:18:31','2022-11-16 10:16:20',0,1,NULL,0,0,-9500,0,0),(20,1,611,'HD0000020',62000,0,62000,62000,-1,1,'','2022-11-16 17:54:41','2022-11-16 14:45:01',0,1,NULL,0,0,-25900,0,0),(21,1,611,'HD0000021',31000,0,31000,31000,-1,1,'','2022-11-16 17:46:41','2022-11-16 14:52:25',0,1,NULL,0,0,5100,0,0),(24,1,611,'HD0000021',31000,0,31000,31000,-1,1,'','2022-11-16 17:48:22','2022-11-16 17:46:41',0,1,NULL,0,0,12850,0,0),(25,1,611,'HD0000021',7750,0,7750,7750,1,1,'','2022-11-16 17:48:22','2022-11-16 17:48:22',0,1,NULL,0,0,36100,0,0),(27,1,611,'HD0000026',62000,0,62000,62000,-1,1,NULL,'2022-11-16 18:07:11','2022-11-16 17:54:41',0,1,NULL,0,0,-18150,0,0),(28,1,611,'HD0000026',62000,0,62000,62000,1,1,'','2022-11-16 18:07:11','2022-11-16 18:07:11',0,1,NULL,0,0,-18150,0,0),(29,1,610,'HD0000029',0,0,60900,60900,-1,1,'','2022-11-17 16:01:14','2022-11-17 15:28:12',0,1,NULL,0,0,-57400,0,0),(30,1,610,'HD0000029',0,0,60900,60900,1,1,'','2022-11-17 16:01:14','2022-11-17 15:28:12',0,1,NULL,0,0,-57400,0,0),(31,1,609,'HD0000031',0,0,6300,6300,1,591,'','2022-11-17 17:04:04','2022-11-17 17:03:56',0,1,NULL,0,0,-24900,0,0),(32,1,609,'HD0000032',0,0,267000,267000,1,591,'','2022-11-17 17:09:20','2022-11-17 17:09:10',0,1,NULL,0,0,-291900,0,0),(33,1,611,'HD0000033',35000,0,52000,52000,1,591,'','2022-11-17 17:21:43','2022-11-17 17:21:31',0,1,NULL,0,0,-35750,0,0),(34,1,609,'HD0000034',0,0,68000,68000,-1,591,'','2022-11-18 09:31:21','2022-11-17 17:46:28',0,1,NULL,0,0,-359900,0,0),(35,1,609,'HD0000035',0,0,74000,74000,-1,1,'','2022-11-18 09:33:17','2022-11-17 17:59:00',0,1,NULL,0,0,-433900,0,0),(37,1,609,'HD0000036',0,0,39000,39000,1,1,'','2022-11-17 18:02:46','2022-11-17 18:02:35',0,1,NULL,0,0,-472900,0,0),(39,1,609,'HD0000038',34000,0,34000,34000,1,1,NULL,'2022-11-18 09:31:21','2022-11-17 17:46:28',0,1,NULL,0,0,-438900,0,0),(40,1,609,'HD0000040',37000,0,37000,37000,1,1,NULL,'2022-11-18 09:33:17','2022-11-17 17:59:00',0,1,NULL,0,0,-367900,0,0),(41,1,609,'HD0000041',0,0,56700,56700,1,1,'','2022-11-18 09:51:22','2022-11-18 09:51:08',0,1,NULL,0,0,-387600,0,0),(42,1,610,'HD0000042',6300,0,6300,6300,1,1,'','2022-11-18 11:44:15','2022-11-18 09:52:31',0,1,NULL,0,0,-63700,0,0),(43,1,609,'HD0000043',500000,0,500000,500000,1,1,'','2022-11-18 11:46:35','2022-11-18 11:44:14',0,1,NULL,0,0,-887600,0,0),(44,1,609,'HD0000044',0,0,19500,19500,1,1,'','2022-11-18 14:38:04','2022-11-18 14:37:58',0,1,NULL,0,0,-407100,0,0),(45,1,609,'HD0000045',200000,0,34100,34100,-1,1,'','2022-11-18 18:10:34','2022-11-18 18:02:17',0,1,NULL,0,0,-441200,0,0),(46,1,609,'HD0000045',34100,0,34100,34100,1,591,'','2022-11-18 18:10:34','2022-11-18 18:02:17',0,1,NULL,0,0,-621200,0,0),(47,1,609,'HD0000047',50400,0,73000,73000,1,1,'','2022-11-18 18:12:48','2022-11-18 18:11:27',0,1,NULL,0,0,-660100,0,0),(48,1,609,'HD0000048',8000,0,8000,8000,1,1,'','2022-11-18 18:14:43','2022-11-18 18:13:01',0,1,NULL,0,0,-572700,0,0),(49,1,609,'HD0000049',58000,0,22936,22936,1,1,'','2022-11-19 10:00:52','2022-11-19 09:59:57',0,1,NULL,0,0,-587636,0,0),(50,1,609,'HD0000050',8000,0,8000,8000,1,1,'','2022-11-19 10:05:29','2022-11-19 10:05:16',0,1,NULL,0,0,-537636,0,0),(51,1,609,'HD0000051',5900,0,5900,5900,1,1,'','2022-11-19 10:06:03','2022-11-19 10:05:47',0,1,NULL,0,0,-535536,0,0),(52,1,609,'HD0000052',8000,0,8000,8000,1,1,'','2022-11-19 10:06:42','2022-11-19 10:06:29',0,1,NULL,0,0,-537636,0,0),(53,1,609,'HD0000053',8000,0,16000,16000,1,1,'','2022-11-19 10:07:11','2022-11-19 10:06:51',0,1,NULL,0,0,-545636,0,0),(54,1,609,'HD0000054',7300,0,7300,7300,1,1,'','2022-11-19 10:14:34','2022-11-19 10:14:04',0,1,NULL,0,0,-544936,0,0),(55,1,609,'HD0000055',7300,0,8000,8000,1,1,'','2022-11-19 10:16:21','2022-11-19 10:16:15',0,1,NULL,0,0,-545636,0,0),(56,1,609,'HD0000056',6800,0,6800,6800,1,1,'','2022-11-19 10:18:22','2022-11-19 10:18:17',0,1,NULL,0,0,-543936,0,56),(57,1,609,'HD0000057',8000,0,8000,8000,1,1,'','2022-11-19 10:19:29','2022-11-19 10:19:24',0,1,NULL,0,0,-519036,0,0),(58,1,609,'HD0000058',6800,0,6800,6800,1,1,'','2022-11-19 10:26:04','2022-11-19 10:25:59',0,1,NULL,0,0,-516636,0,0),(59,1,610,'HD0000059',0,0,3036,3036,1,1,'','2022-11-19 10:26:25','2022-11-19 10:26:04',0,1,NULL,0,0,-60436,0,0),(60,1,609,'HD0000060',35000,0,35000,35000,-1,1,'','2022-11-21 14:03:42','2022-11-21 11:23:29',0,1,NULL,0,0,-570936,0,58),(61,1,609,'HD0000061',8000,0,8000,8000,1,1,'','2022-11-21 12:16:04','2022-11-21 12:15:39',0,1,NULL,0,0,-537036,0,0),(62,1,609,'HD0000060',39000,0,38500,38500,-1,1,'','2022-11-21 14:06:50','2022-11-21 11:23:29',0,1,NULL,0,0,-567536,0,0),(63,1,609,'HD0000060',42000,0,42000,42000,-1,1,'','2022-11-21 14:07:06','2022-11-21 11:23:29',0,1,NULL,0,0,-571036,0,0),(64,1,609,'HD0000060',42000,0,45500,45500,-1,1,'','2022-11-21 14:07:20','2022-11-21 11:23:29',0,1,NULL,0,0,-574536,0,0),(65,1,609,'HD0000060',45500,0,45500,45500,-1,1,'','2022-11-21 14:07:45','2022-11-21 11:23:29',0,1,NULL,0,0,-574536,0,0),(66,1,609,'HD0000060',40500,0,42000,42000,-1,1,'','2022-11-21 14:08:41','2022-11-21 11:23:29',0,1,NULL,0,0,-571036,0,0),(67,1,609,'HD0000060',38500,0,38500,38500,1,1,'','2022-11-21 14:08:41','2022-11-21 11:23:29',0,1,NULL,0,0,-567536,0,0),(68,1,609,'HD0000068',80000,0,80000,80000,1,1,'','2022-11-21 14:09:07','2022-11-21 14:08:52',0,1,NULL,0,0,-609036,0,0),(69,1,609,'HD0000069',24000,0,24000,24000,1,1,'','2022-11-21 14:10:07','2022-11-21 14:09:24',0,1,NULL,0,0,-547036,0,0),(70,1,609,'HD0000070',8000,0,8000,8000,-1,1,'','2022-11-21 15:38:35','2022-11-21 14:18:48',0,1,NULL,0,0,-530486,0,64),(71,1,609,'HD0000071',10000,0,10000,10000,-1,1,'','2022-11-21 15:30:42','2022-11-21 14:34:08',0,1,NULL,0,0,-502486,0,67),(72,1,609,'HD0000072',40000,0,40000,40000,1,1,'Sửa đổi trả','2022-11-21 15:30:42','2022-11-21 14:34:08',0,1,NULL,0,0,-562486,0,0),(73,1,609,'HD0000073',40000,0,40000,40000,1,1,'','2022-11-21 15:38:35','2022-11-21 14:18:48',0,1,NULL,0,0,-554486,0,0),(74,1,609,'HD0000074',10000,0,10000,10000,-1,1,'','2022-11-21 15:47:42','2022-11-21 15:44:39',0,1,NULL,0,0,-524486,0,74),(75,1,609,'HD0000075',40000,0,40000,40000,1,1,'','2022-11-21 15:47:42','2022-11-21 15:44:39',0,1,NULL,0,0,-554486,0,0),(76,1,609,'HD0000076',30000,0,30000,30000,-1,1,'','2022-11-21 15:50:12','2022-11-21 15:49:24',0,1,NULL,0,0,-544486,0,76),(77,1,609,'HD0000077',20000,0,20000,20000,1,1,'','2022-11-21 15:50:12','2022-11-21 15:49:24',0,1,NULL,0,0,-534486,0,0),(78,1,609,'HD0000078',7300,0,7300,7300,-1,1,'','2022-11-21 16:52:52','2022-11-21 15:53:21',0,1,NULL,0,0,-521086,0,78),(79,1,609,'HD0000079',322400,0,322400,322400,-1,1,NULL,'2022-11-21 16:57:30','2022-11-21 15:53:21',0,1,NULL,0,0,-836186,0,0),(80,1,609,'HD0000080',176400,0,176400,176400,-1,1,NULL,'2022-11-21 16:59:52','2022-11-21 15:53:21',0,1,NULL,0,0,-690186,0,0),(81,1,609,'HD0000081',179420,0,179420,179420,-1,1,NULL,'2022-11-21 17:02:20','2022-11-21 15:53:21',0,1,NULL,0,0,-693206,0,0),(82,1,609,'HD0000082',8000,0,8000,8000,1,1,'','2022-11-21 17:01:53','2022-11-21 17:01:47',0,1,NULL,0,0,-350366,0,79),(83,1,609,'HD0000083',215520,0,215520,215520,1,1,NULL,'2022-11-21 17:02:20','2022-11-21 15:53:21',0,1,NULL,0,0,-557886,0,0),(84,1,609,'HD0000084',7300,0,7300,7300,1,1,'','2022-11-21 17:04:03','2022-11-21 17:04:00',0,1,NULL,0,0,-337966,0,80),(85,1,609,'HD0000085',7300,0,14100,14100,1,1,'','2022-11-21 17:05:48','2022-11-21 17:05:39',0,1,NULL,0,0,-344766,0,81),(86,1,609,'HD0000086',4500,0,4500,4500,1,1,'','2022-11-21 17:05:58','2022-11-21 17:05:54',0,1,NULL,0,0,-332366,0,82),(87,1,609,'HD0000087',8000,0,8000,8000,1,1,'','2022-11-21 17:07:32','2022-11-21 17:07:27',0,1,NULL,0,0,-327866,0,83),(88,1,611,'HD0000088',68000,0,68000,68000,-1,1,'','2022-11-21 17:24:42','2022-11-21 17:20:47',0,1,NULL,0,0,-103750,0,0),(89,1,611,'HD0000088',0,0,68000,68000,-1,1,'','2022-11-21 17:25:25','2022-11-21 17:20:47',0,1,NULL,0,0,-103750,0,0),(90,1,611,'HD0000088',68000,0,68000,68000,-1,1,'','2022-11-26 15:37:20','2022-11-21 17:20:47',0,1,NULL,0,0,-103750,0,0),(91,1,609,'HD0000091',0,0,100000,100000,1,1,'','2022-11-22 08:43:15','2022-11-21 17:07:34',0,1,NULL,0,0,-419866,0,0),(92,1,611,'HD0000088',68000,0,68000,68000,1,1,'','2022-11-26 15:37:20','2022-11-21 17:20:47',0,1,NULL,0,0,-103750,0,0),(93,1,610,'HD0000093',21000,0,21000,21000,1,1,'','2022-12-09 15:23:46','2022-12-08 15:23:28',0,1,NULL,0,0,-78400,0,0),(94,1,610,'HD0000094',5900,0,5900,5900,-1,1,'','2022-12-22 15:27:24','2022-12-10 22:40:06',0,1,NULL,0,0,-63300,0,0),(95,1,609,'HD0000095',39000,0,39000,39000,-1,1,'','2022-12-10 23:05:08','2022-12-10 22:45:47',-1,1,NULL,0,0,9641134,0,0),(96,1,609,'HD0000095',39000,0,39000,39000,1,1,'','2022-12-10 23:05:08','2022-12-10 22:45:47',1,1,NULL,0,0,9641134,0,0),(97,1,609,'HD0000097',1000,0,1000,1000,-1,1,'','2022-12-13 13:43:40','2022-12-12 08:29:22',0,1,NULL,0,0,-1001000,0,0),(98,1,609,'HD0000098',1000,0,1000,1000,-1,1,'','2022-12-13 11:46:04','2022-12-12 08:55:51',0,1,NULL,0,0,-1001000,0,0),(99,1,609,'HD0000099',1000,0,1000,1000,-1,1,'','2022-12-13 11:45:52','2022-12-12 08:56:09',0,1,NULL,0,0,-1001000,0,0),(100,1,609,'HD0000100',0,0,1000,1000,-1,1,'','2022-12-13 11:44:11','2022-12-12 09:02:30',-1,1,NULL,0,0,-1001000,0,0),(101,1,610,'HD0000101',60000,0,60000,60000,1,1,'','2022-12-15 10:58:02','2022-12-15 10:57:03',-1,1,NULL,0,0,-60000,0,0),(106,1,610,'HD0000102',200000,0,200000,200000,-1,1,'','2022-12-16 11:21:36','2022-12-16 11:14:06',-1,1,NULL,0,0,-200000,0,0),(107,1,610,'HD0000102',400000,0,400000,400000,1,1,'','2022-12-16 11:21:36','2022-12-16 11:14:06',-1,1,NULL,0,0,-400000,0,0),(108,1,617,'HD0000108',100000,0,200000,200000,-1,1,'','2022-12-22 15:04:18','2022-12-16 11:23:58',-1,1,NULL,0,0,-200000,0,0),(109,1,617,'HD0000108',200000,0,200000,200000,-1,1,'','2022-12-22 15:05:00','2022-12-16 11:23:58',-1,1,NULL,0,0,-200000,0,0),(110,1,617,'HD0000108',200000,0,200000,200000,-1,1,'','2022-12-22 15:10:03','2022-12-16 11:23:58',-1,1,NULL,0,0,-200000,0,0),(111,1,617,'HD0000108',200000,0,200000,200000,-1,1,'','2022-12-22 15:10:45','2022-12-22 15:10:03',-1,1,NULL,0,0,-200000,0,0),(112,1,617,'HD0000108',200000,0,200000,200000,-1,1,'','2022-12-22 15:12:56','2022-12-22 15:10:45',-1,1,NULL,0,0,-200000,0,0),(113,1,617,'HD0000108',200000,0,200000,200000,-1,1,'','2022-12-22 15:15:32','2022-12-22 15:12:57',-1,1,NULL,0,0,-200000,0,0),(114,1,617,'HD0000108',200000,0,200000,200000,-1,1,'','2022-12-22 15:24:39','2022-12-07 15:10:03',-1,1,NULL,0,0,-200000,0,0),(115,1,617,'HD0000108',200000,0,200000,200000,-1,1,'','2022-12-22 15:27:32','2022-12-06 15:10:03',-1,1,NULL,0,0,-200000,0,0),(116,1,610,'HD0000094',5900,0,5900,5900,1,1,'','2022-12-22 15:27:24','2022-12-10 22:40:06',-1,1,NULL,0,0,-5900,0,0),(117,1,617,'HD0000108',200000,0,200000,200000,-1,1,'','2022-12-22 15:28:22','2022-12-06 15:10:03',-1,1,NULL,0,0,-200000,0,0),(118,1,617,'HD0000108',200000,0,200000,200000,1,1,'','2022-12-22 15:28:22','2022-12-06 15:10:03',-1,1,NULL,0,0,-200000,0,0),(119,1,609,'HD0000119',3500,0,3500,3500,1,1,'','2022-12-22 15:29:08','2022-12-22 15:28:52',-1,1,NULL,0,0,-11002500,0,0),(120,1,617,'HD0000120',3036,0,3036,3036,-1,1,'','2022-12-22 18:11:08','2022-12-22 18:10:19',-1,1,NULL,0,0,-3036,0,0),(121,1,617,'HD0000120',0,0,3036,3036,1,1,'','2022-12-22 18:11:08','2022-12-22 18:10:19',-1,1,NULL,0,0,-3036,0,0),(122,1,617,'HD0000122',0,0,21000,21000,-1,1,'','2022-12-28 16:32:33','2022-12-28 16:32:04',-1,1,NULL,0,0,-21000,0,0),(123,1,617,'HD0000122',21000,0,21000,21000,-1,1,'','2022-12-28 16:32:59','2022-12-28 16:32:04',-1,1,NULL,0,0,-21000,0,0),(124,1,617,'HD0000122',21000,0,21000,21000,1,1,'','2022-12-28 16:32:59','2022-12-28 16:32:04',1,1,NULL,0,0,-21000,0,0),(125,1,617,'HD0000125',0,0,21000,21000,1,1,'','2022-12-29 13:36:51','2022-12-29 13:36:24',-1,1,NULL,0,0,-21000,0,0),(126,1,617,'HD0000126',0,0,21000,21000,1,1,'','2022-12-29 13:37:09','2022-12-29 13:36:52',-1,1,NULL,0,0,-42000,0,0),(127,1,617,'HD0000127',0,0,100000,100000,-1,1,'','2022-12-29 14:11:48','2022-12-29 14:10:18',1,1,NULL,0,0,-137800,0,0),(128,1,617,'HD0000127',100000,0,100000,100000,1,1,'','2022-12-29 14:11:48','2022-12-29 14:10:18',1,1,NULL,0,0,-37800,0,0),(129,1,611,'HD0000129',10000,0,10000,10000,1,1,'','2022-12-29 14:59:57','2022-12-29 14:59:37',-1,1,NULL,0,0,-10750,0,0),(130,1,617,'HD0000130',5000,0,10000,10000,1,1,'','2022-12-29 16:04:54','2022-12-29 16:02:26',-1,1,NULL,0,0,56200,0,0),(131,1,611,'HD0000131',21000,0,21000,21000,1,1,'','2022-12-29 17:00:18','2022-12-29 17:00:08',-1,1,NULL,0,0,-21750,0,0),(132,1,611,'HD0000132',5000,0,10000,10000,-1,1,'','2022-12-29 17:02:09','2022-12-29 17:01:50',-1,1,NULL,0,0,-10750,0,0),(133,1,611,'HD0000132',5000,0,10000,10000,1,1,'','2022-12-29 17:02:09','2022-12-29 17:01:50',1,1,NULL,0,0,-10750,0,0),(134,1,617,'HD0000134',21000,0,21000,21000,-1,1,'','2022-12-30 09:38:45','2022-12-30 09:37:57',-1,1,NULL,0,0,42200,0,0),(135,1,617,'HD0000134',21000,0,21000,21000,1,1,'','2022-12-30 09:38:45','2022-12-30 09:37:57',1,1,NULL,0,0,42200,0,0),(136,1,609,'HD0000136',5,0,5,5,-1,1,'','2023-01-11 22:30:14','2023-01-11 22:28:28',-1,1,NULL,0,0,-5000005,0,0),(137,1,609,'HD0000136',10,0,10,10,1,1,'','2023-01-11 22:30:14','2023-01-11 22:28:28',-1,1,NULL,0,0,-5000010,0,0);
/*!40000 ALTER TABLE `receipts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:16:36
