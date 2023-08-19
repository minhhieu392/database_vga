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
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bills` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `billTypesId` bigint(20) DEFAULT NULL,
  `billsCode` varchar(200) DEFAULT NULL,
  `planningStatus` int(11) DEFAULT NULL COMMENT '1 hoạch toán\n0 - không hoạch toán ',
  `totalMoney` double DEFAULT NULL COMMENT 'số tiền\\n >0 : phiếu thu\\n  <0 : phiếu chi',
  `status` int(11) DEFAULT NULL,
  `usersCreatorId` bigint(20) DEFAULT NULL COMMENT 'người tạo/Người bán',
  `dateUpdated` datetime DEFAULT current_timestamp(),
  `dateCreated` datetime DEFAULT current_timestamp() COMMENT 'ngày tạo',
  `customersId` bigint(20) DEFAULT 0 COMMENT 'id khách hàng',
  `usersId` bigint(20) DEFAULT 0 COMMENT 'id nhân viên',
  `otherPeoplesId` bigint(20) DEFAULT 0 COMMENT 'id đối tượng khác',
  `note` text DEFAULT NULL,
  `bankAccountsId` bigint(20) DEFAULT 0,
  `currentDebt` double DEFAULT 0 COMMENT 'công nợ của nhà cc / khách hàng sau khi tạo phiếu',
  `submitter` int(11) DEFAULT NULL COMMENT 'nếu customersId > 0\nvà submitter = 0  => kách hàng\n    submitter  = 1  => nhà cung cấp',
  `staticDay` date DEFAULT current_timestamp(),
  `branchesId` bigint(20) DEFAULT 1,
  `billsId` bigint(20) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `usersCreatorId` (`usersCreatorId`),
  KEY `customersId` (`customersId`),
  KEY `usersId` (`usersId`),
  KEY `billTypesId` (`billTypesId`),
  KEY `bankAccountsId` (`bankAccountsId`),
  KEY `staticDay` (`staticDay`),
  KEY `branchesId` (`branchesId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='phiếu thu , phiếu chi';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
INSERT INTO `bills` VALUES (1,4,'PCPN0000051',1,-20000000,-1,1,'2023-01-20 07:17:08','2023-01-20 07:17:08',0,0,0,'Phiếu thanh toán được tạo tự động khi tạo đơn nhập hàng có mã là PN0000001',0,0,NULL,'2023-01-20',1,0),(2,4,'PCPN0000052',1,-1900000,-1,1,'2023-01-20 07:27:26','2023-01-20 07:27:26',0,0,0,'Phiếu thanh toán được tạo tự động khi tạo đơn nhập hàng có mã là PN0000002',0,0,NULL,'2023-01-20',1,0),(3,4,'PCPN0000053',1,-1800000,1,1,'2023-01-20 07:57:50','2023-01-20 07:57:50',0,0,0,'Phiếu thanh toán được tạo tự động khi tạo đơn nhập hàng có mã là PN0000003',0,0,NULL,'2023-01-20',1,0),(4,4,'PCPN0000054',1,-5650000,1,1,'2023-01-20 08:04:55','2023-01-20 08:04:55',0,0,0,'Phiếu thanh toán được tạo tự động khi tạo đơn nhập hàng có mã là PN0000004',0,0,NULL,'2023-01-20',1,0),(5,3,'TTTHN0000019',1,565000,-1,1,'2023-01-20 08:12:35','2023-01-20 08:12:35',0,0,0,'Phiếu thanh toán được tạo tự động khi tạo đơn trả hàng nhập có mã là PTH0000001',0,0,NULL,'2023-01-20',1,0),(6,3,'TTTHN0000020',1,113000,-1,1,'2023-01-20 08:13:22','2023-01-20 08:13:22',0,0,0,'Phiếu thanh toán được tạo tự động khi tạo đơn trả hàng nhập có mã là PTH0000002',0,0,NULL,'2023-01-20',1,0),(7,3,'TTTHN0000021',1,900000,-1,1,'2023-01-20 08:19:39','2023-01-20 08:19:39',0,0,0,'Phiếu thanh toán được tạo tự động khi tạo đơn trả hàng nhập có mã là PTH0000003',0,0,NULL,'2023-01-20',1,0),(8,3,'TTTHN0000022',1,90000,-1,1,'2023-01-20 08:24:54','2023-01-20 08:24:54',0,0,0,'Phiếu thanh toán được tạo tự động khi tạo đơn trả hàng nhập có mã là PTH0000004',0,0,NULL,'2023-01-20',1,0),(9,3,'TTTHN0000023',1,900000,-1,1,'2023-01-20 08:32:44','2023-01-20 08:32:44',0,0,0,'Phiếu thanh toán được tạo tự động khi tạo đơn trả hàng nhập có mã là PTH0000005',0,0,NULL,'2023-01-20',1,0),(10,3,'TTTHN0000024',1,90000,-1,1,'2023-01-20 08:33:56','2023-01-20 08:33:56',0,0,0,'Phiếu thanh toán được tạo tự động khi tạo đơn trả hàng nhập có mã là PTH0000006',0,0,NULL,'2023-01-20',1,0),(11,3,'TTTHN0000025',1,890000,1,1,'2023-01-20 09:23:44','2023-01-20 09:23:44',0,0,0,'Phiếu thanh toán được tạo tự động khi tạo đơn trả hàng nhập có mã là PTH0000007',0,0,NULL,'2023-01-20',1,0);
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:16:16
