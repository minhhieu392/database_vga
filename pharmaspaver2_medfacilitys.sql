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
-- Table structure for table `medfacilitys`
--

DROP TABLE IF EXISTS `medfacilitys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medfacilitys` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `branchesId` bigint(20) NOT NULL,
  `userCreatorsId` bigint(20) NOT NULL,
  `dateCreated` datetime DEFAULT current_timestamp(),
  `dateUpdated` datetime DEFAULT NULL,
  `status` int(11) DEFAULT 1 COMMENT '1: enabled 0: disabled -1: draf; -2: chờ duyệt',
  `email` varchar(200) DEFAULT NULL,
  `mobile` varchar(200) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `isPharma` int(1) DEFAULT NULL COMMENT 'là cửa hang thuốc',
  `medFacilitysName` varchar(200) DEFAULT NULL,
  `wardsId` bigint(20) DEFAULT NULL,
  `code` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='chi nhánh';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medfacilitys`
--

LOCK TABLES `medfacilitys` WRITE;
/*!40000 ALTER TABLE `medfacilitys` DISABLE KEYS */;
INSERT INTO `medfacilitys` VALUES (1,1,1,'2022-09-09 01:48:32','2022-11-11 23:20:44',1,'letam219@gmail.com','0333688212','Số 109 đường Tô Hiệu',1,'Nhà Thuốc TAM LEE',4100,NULL),(2,3,1,'2022-09-09 01:54:14','2022-11-11 23:19:25',1,'mail@com','09328932','Tổ 2',0,'Spa HHH - HN',2,NULL),(3,1,1,'2022-11-17 08:32:38','2022-11-17 08:32:38',1,'','','',0,'spa -test ',498,NULL),(4,1,1,'2022-11-17 08:33:18','2022-11-17 08:33:18',1,'','','',1,'nhà thuốc - test',884,NULL);
/*!40000 ALTER TABLE `medfacilitys` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:17:01
