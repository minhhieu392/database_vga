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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `medFacilitysId` bigint(20) DEFAULT NULL,
  `usersId` bigint(20) DEFAULT NULL,
  `vouchersId` bigint(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `userCreatorsId` bigint(20) DEFAULT NULL COMMENT 'người tạo/Người bán',
  `dateUpdated` datetime DEFAULT current_timestamp(),
  `dateCreated` datetime DEFAULT current_timestamp() COMMENT 'ngày tạo',
  `ordersCode` varchar(45) DEFAULT NULL,
  `tax` double DEFAULT 0,
  `totalMoney` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `amountPaid` double DEFAULT NULL,
  `bankAccountsId` bigint(20) DEFAULT NULL,
  `pricelistId` bigint(20) DEFAULT NULL,
  `money` double DEFAULT NULL,
  `note` text DEFAULT NULL,
  `VAT` double DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `createDate` (`dateCreated`),
  KEY `status` (`status`),
  KEY `usersCreatorId` (`userCreatorsId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='đặt hàng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,609,NULL,1,1,'2022-11-15 16:49:24','2022-11-15 16:48:17','DH0000001',0,35000,0,20000,0,1,35000,'',0),(2,1,609,NULL,0,1,'2022-12-22 18:10:49','2022-11-16 11:16:06','DH0000002',0,2550,0,2550,0,1,2550,'',0),(3,1,617,NULL,0,1,'2022-12-29 15:17:57','2022-12-29 15:17:57','DH0000003',0,3280,0,3280,-1,1,3280,'',0),(4,1,617,NULL,0,1,'2022-12-29 16:02:24','2022-12-29 16:02:24','DH0000004',0,11200,0,11200,-1,1,11200,'',0),(5,1,617,NULL,0,1,'2022-12-29 16:06:58','2022-12-29 16:06:58','DH0000005',0,39000,0,39000,-1,1,39000,'',0),(6,1,611,NULL,0,1,'2022-12-29 17:08:26','2022-12-29 17:08:26','DH0000006',0,55000,0,55000,-1,1,55000,'',0),(7,1,618,NULL,0,1,'2022-12-29 17:17:34','2022-12-29 17:17:34','DH0000007',0,24300,0,22329,1,1,24300,'',0),(8,1,618,NULL,0,1,'2022-12-29 17:39:26','2022-12-29 17:39:26','DH0000008',0,11200,0,11200,1,1,11200,'',0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:16:47
