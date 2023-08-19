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
-- Table structure for table `productcancels`
--

DROP TABLE IF EXISTS `productcancels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productcancels` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `productCancelsCode` varchar(45) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `userCreatorsId` bigint(20) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `dateCreated` datetime DEFAULT current_timestamp() COMMENT 'ngày tạo',
  `dateUpdated` datetime DEFAULT current_timestamp(),
  `medFacilitysId` bigint(20) DEFAULT NULL,
  `totalMoney` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `createDate` (`dateCreated`),
  KEY `usersCreatorId` (`userCreatorsId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='hủy sản phẩm ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productcancels`
--

LOCK TABLES `productcancels` WRITE;
/*!40000 ALTER TABLE `productcancels` DISABLE KEYS */;
INSERT INTO `productcancels` VALUES (1,'HSP0000001','',1,-1,'2022-11-15 16:48:48','2022-11-15 16:54:21',1,17500),(2,'HSP0000001','',1,-1,'2022-11-15 16:48:48','2022-11-15 16:54:39',1,175000),(3,'HSP0000001','',1,-1,'2022-11-15 16:48:48','2022-11-16 14:19:22',1,17500),(4,'HSP0000004','',1,-1,'2022-11-15 17:40:14','2022-11-15 17:41:44',1,35000),(5,'HSP0000005','',1,-1,'2022-11-15 17:41:44','2022-12-15 10:52:16',1,17500),(6,'HSP0000006','',1,-1,'2022-11-16 14:19:22','2022-11-19 09:32:05',1,41000),(11,'HSP0000006','',1,1,'2022-11-16 14:19:22','2022-11-19 09:32:05',1,41000),(12,'HSP0000012','',1,1,'2022-12-16 15:38:47','2022-12-16 15:38:54',1,25000);
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

-- Dump completed on 2023-08-19 16:16:32
