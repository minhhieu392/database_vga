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
-- Table structure for table `bankaccounts`
--

DROP TABLE IF EXISTS `bankaccounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bankaccounts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bankAccountsName` varchar(500) NOT NULL,
  `bankAccountsNumber` varchar(45) DEFAULT NULL,
  `bankName` varchar(500) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `medFacilitysId` bigint(20) DEFAULT NULL,
  `userCreatorsId` bigint(20) NOT NULL,
  `dateCreated` datetime DEFAULT current_timestamp(),
  `dateUpdated` datetime DEFAULT NULL,
  `status` int(11) DEFAULT 1 COMMENT '1: enabled 0: disabled -1: draf; -2: chờ duyệt',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='thương hiệu';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bankaccounts`
--

LOCK TABLES `bankaccounts` WRITE;
/*!40000 ALTER TABLE `bankaccounts` DISABLE KEYS */;
INSERT INTO `bankaccounts` VALUES (1,'Lê Thị Tâm','0912999281','MB bank','Tài khoản ngân hàng Quân Đội',1,1,'2022-06-03 16:30:37','2022-11-11 23:18:31',1),(2,'Nguyễn xuân thủy','05675667545','Viettinbank','ghi chú',5,1,'2022-06-03 16:35:03','2022-06-14 12:17:54',1),(3,'NGUYEN TUAN ANH','0971221203112','MB bank','',NULL,1,'2022-06-08 14:56:12','2022-06-08 14:56:18',1),(4,'NGUYEN TUAN ANH','01231564654655646','MB Bank',NULL,5,1,'2022-06-10 14:49:28','2022-06-10 14:49:28',1),(5,'Nguyễn anh minh','0215456313232','MBank','',5,1,'2022-06-10 14:51:28','2022-07-13 18:57:18',1),(6,'Nguyễn bình','09327283732231123','Vietcombank','',NULL,1,'2022-06-14 13:52:36','2022-06-14 14:14:24',1),(7,'nguyễn xuân thuy','0823094832','MB bank','',NULL,1,'2022-07-13 19:00:56','2022-07-13 19:00:56',1),(8,'NGUYEN VIET DUC','123456789','VietinBank',NULL,1,586,'2022-11-03 12:02:28','2022-11-11 23:17:44',-1),(9,'nguyễn xuân thủy','099382738','mb bank',NULL,2,562,'2022-11-07 11:08:18','2022-11-07 11:08:18',1);
/*!40000 ALTER TABLE `bankaccounts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:16:40
