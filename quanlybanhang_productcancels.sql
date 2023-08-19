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
-- Table structure for table `productcancels`
--

DROP TABLE IF EXISTS `productcancels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productcancels` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `productCancelsCode` varchar(45) DEFAULT NULL,
  `totalMoney` double DEFAULT NULL COMMENT 'số tiền phải trả nhà cung cấp với type = 0.\\nsố tiền nhà cung cấp phải trả với type = 1.',
  `note` text DEFAULT NULL,
  `usersCreatorId` bigint(20) DEFAULT NULL COMMENT 'người tạo/Người bán',
  `status` int(11) DEFAULT NULL,
  `dateCreated` datetime DEFAULT current_timestamp() COMMENT 'ngày tạo',
  `dateUpdated` datetime DEFAULT current_timestamp(),
  `staticDay` date DEFAULT current_timestamp(),
  `branchesId` bigint(20) DEFAULT 1,
  `productsBatchsId` bigint(20) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `createDate` (`dateCreated`),
  KEY `usersCreatorId` (`usersCreatorId`),
  KEY `staticDay` (`staticDay`),
  KEY `productsBatchsId` (`productsBatchsId`),
  KEY `branchesId` (`branchesId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='hủy sản phẩm ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productcancels`
--

LOCK TABLES `productcancels` WRITE;
/*!40000 ALTER TABLE `productcancels` DISABLE KEYS */;
INSERT INTO `productcancels` VALUES (1,'HSP0000001',113000,'',1,-1,'2023-01-20 08:37:11','2023-01-20 08:55:15','2023-01-20',1,0),(2,'HSP0000002',90000,'',1,-1,'2023-01-20 08:42:18','2023-01-20 08:52:09','2023-01-20',1,0),(3,'HSP0000003',900000,'',1,1,'2023-01-20 08:52:09','2023-01-20 08:52:09','2023-01-20',1,0);
/*!40000 ALTER TABLE `productcancels` ENABLE KEYS */;
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
