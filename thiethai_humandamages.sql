-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: thiethai
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
-- Table structure for table `humandamages`
--

DROP TABLE IF EXISTS `humandamages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `humandamages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(200) DEFAULT NULL,
  `yearOfBirth` int(11) DEFAULT NULL,
  `disastersId` bigint(20) DEFAULT NULL,
  `vulnerablePersonsId` bigint(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `ethnic` varchar(200) DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `time` datetime DEFAULT current_timestamp(),
  `type` int(11) DEFAULT NULL COMMENT '0: mất tích, 1 chết',
  `wardsId` bigint(20) NOT NULL,
  `gender` int(11) NOT NULL COMMENT '0: nữ, 1: nam',
  PRIMARY KEY (`id`),
  KEY `disastersId` (`disastersId`),
  KEY `wardsId` (`wardsId`),
  KEY `vulnerablePersonsId` (`vulnerablePersonsId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='thiệt hại về người';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `humandamages`
--

LOCK TABLES `humandamages` WRITE;
/*!40000 ALTER TABLE `humandamages` DISABLE KEYS */;
INSERT INTO `humandamages` VALUES (1,'x',2022,16,3,'Xã Tà Cạ huyện Kỳ Sơn tỉnh Nghệ An','Thái','Không','Lũ Cuốn','2022-12-20 10:38:56',1,6844,1),(2,'Sộng Ka Dênh',2011,19,6,'bản Huổi Pá xã Mường Lạn, huyện Sốp Cộp, tỉnh Sơn La','Không rõ','Không','Lũ cuốn trôi','2022-12-20 10:41:19',1,8885,1);
/*!40000 ALTER TABLE `humandamages` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:15:47
