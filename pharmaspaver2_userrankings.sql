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
-- Table structure for table `userrankings`
--

DROP TABLE IF EXISTS `userrankings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userrankings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `usersRankingsName` varchar(200) DEFAULT NULL COMMENT 'số tiền\\\\\\\\n >0 : phiếu thu\\\\\\\\n  <0 : phiếu chi',
  `discountServices` double DEFAULT NULL COMMENT '0-> 1 (100%)',
  `discountProducts` double DEFAULT 0 COMMENT 'id hóa đơn',
  `totalMoneyCondition` double DEFAULT 0 COMMENT 'điều kiện tổng tiên để nhận ưu đãi',
  `dateCreated` datetime DEFAULT current_timestamp(),
  `dateUpdated` datetime DEFAULT current_timestamp(),
  `status` int(11) NOT NULL,
  `userCreatorsId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `receiptsId` (`discountProducts`),
  KEY `billsId` (`discountServices`),
  KEY `warehouseInOutId` (`totalMoneyCondition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='hạng users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userrankings`
--

LOCK TABLES `userrankings` WRITE;
/*!40000 ALTER TABLE `userrankings` DISABLE KEYS */;
/*!40000 ALTER TABLE `userrankings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:16:35
