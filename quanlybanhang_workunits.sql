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
-- Table structure for table `workunits`
--

DROP TABLE IF EXISTS `workunits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workunits` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain` varchar(200) DEFAULT NULL,
  `workUnitsName` varchar(200) DEFAULT NULL COMMENT 'Tên đơn vị',
  `workUnitsDescription` text DEFAULT NULL,
  `workUnitsAddress` varchar(200) DEFAULT NULL COMMENT 'Địa chỉ',
  `wardsId` bigint(20) DEFAULT NULL COMMENT 'Phường/Xã',
  `workUnitsMobile` varchar(200) DEFAULT NULL,
  `workUnitsFax` varchar(200) DEFAULT NULL,
  `workUnitsEmail` varchar(100) DEFAULT NULL,
  `usersCreatorId` bigint(20) DEFAULT NULL,
  `dateCreated` datetime DEFAULT current_timestamp(),
  `dateUpdated` datetime DEFAULT current_timestamp(),
  `status` int(11) DEFAULT NULL,
  `image` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`image`)),
  `logo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`logo`)),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Đơn vị công tác';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workunits`
--

LOCK TABLES `workunits` WRITE;
/*!40000 ALTER TABLE `workunits` DISABLE KEYS */;
INSERT INTO `workunits` VALUES (5,'quanlycongviec.vgasoft.vn','Trung tâm chính sách và kỹ thuật phòng chống thiên tai','<p>Nhiệm vụ, quyền hạn của Tổng cục Ph&ograve;ng, chống thi&ecirc;n tai</p>','địa chỉ',NULL,'12','12.12','email',1,'2022-06-01 10:20:22','2022-06-01 10:20:22',1,'{}','{}');
/*!40000 ALTER TABLE `workunits` ENABLE KEYS */;
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
