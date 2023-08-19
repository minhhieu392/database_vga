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
-- Table structure for table `serviceshistories`
--

DROP TABLE IF EXISTS `serviceshistories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serviceshistories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `servicesId` bigint(20) DEFAULT 0,
  `comboServicesId` bigint(20) DEFAULT 0,
  `cardServicesId` bigint(20) DEFAULT 0,
  `type` int(11) DEFAULT 0 COMMENT '2: dịch vụ,3:gói dịch vụ,4:thẻ dịch vụ',
  `status` int(1) DEFAULT NULL COMMENT '0:đang làm dịch vụ , 1: đã hoàn thành',
  `currentNumber` int(11) DEFAULT 0 COMMENT 'số lần thực lần hiện tại',
  `dateCreated` datetime DEFAULT NULL,
  `medFacilitysId` bigint(20) DEFAULT NULL,
  `startTime` datetime DEFAULT NULL COMMENT '11:30',
  `endTime` datetime DEFAULT NULL,
  `usersId` bigint(20) DEFAULT NULL,
  `techniciansId` bigint(20) DEFAULT 0,
  `dateUpdated` datetime DEFAULT NULL,
  `userCreatorsId` bigint(20) DEFAULT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  `purchasedServicesId` bigint(20) DEFAULT NULL,
  `originalServiceId` bigint(20) DEFAULT 0,
  `totalNumber` int(11) DEFAULT 0,
  `booksId` bigint(20) DEFAULT 0,
  `qualityEvalution` int(11) DEFAULT NULL COMMENT '0: không hài lòn,1: hài lòng, 2 : rất tốt',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `cardServicesId` (`cardServicesId`),
  KEY `servicesId` (`servicesId`),
  KEY `comboServicesId` (`comboServicesId`),
  KEY `techniciansId` (`techniciansId`),
  KEY `usersId` (`usersId`),
  KEY `originalServiceId` (`originalServiceId`),
  KEY `booksId` (`booksId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serviceshistories`
--

LOCK TABLES `serviceshistories` WRITE;
/*!40000 ALTER TABLE `serviceshistories` DISABLE KEYS */;
/*!40000 ALTER TABLE `serviceshistories` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:16:38
