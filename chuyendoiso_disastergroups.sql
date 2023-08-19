-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: chuyendoiso
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
-- Table structure for table `disastergroups`
--

DROP TABLE IF EXISTS `disastergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disastergroups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `disasterGroupsName` varchar(500) DEFAULT NULL,
  `icon` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`icon`)),
  `userCreatorsId` bigint(20) DEFAULT NULL,
  `dateCreated` datetime DEFAULT current_timestamp(),
  `dateUpdated` datetime DEFAULT current_timestamp(),
  `status` int(11) DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disastergroups`
--

LOCK TABLES `disastergroups` WRITE;
/*!40000 ALTER TABLE `disastergroups` DISABLE KEYS */;
INSERT INTO `disastergroups` VALUES (1,'Bão','{\"file\":\"/images/icon/icon1/bao.png\",\"extension\":\"png\"}',1,'2022-12-06 08:47:37','2022-12-11 18:05:23',1),(2,'Sạt lở đất','{\"file\":\"/images/icon/icon2/Sat_lo_dat.png\",\"extension\":\"png\"}',1,'2022-12-06 08:47:37','2022-12-11 18:05:38',1),(3,'Cháy rừng','{\"file\":\"/images/icon/icon1/Chay_rung_TN.png\",\"extension\":\"png\"}',1,'2022-12-06 08:47:37','2022-12-11 18:05:49',1),(4,'Lũ quét','{\"file\":\"/images/icon/icon1/Lu_quet.png\",\"extension\":\"png\"}',1,'2022-12-06 08:47:37','2022-12-11 18:06:04',1),(5,'Dông, lốc, sét, mưa đá','{\"file\":\"/images/icon/icon1/D_L_S_MuaDa.png\",\"extension\":\"png\"}',1,'2022-12-06 08:47:37','2022-12-11 18:06:17',1),(6,'Mưa lớn','{\"file\":\"/images/icon/icon2/Mua_lon.png\",\"extension\":\"png\"}',1,'2022-12-06 08:47:37','2022-12-11 18:06:29',1),(7,'Sét','{\"file\":\"/images/icon/icon2/Set.png\",\"extension\":\"png\"}',1,'2022-12-06 08:47:37','2022-12-11 18:06:40',1),(8,'Sụt lún đất','{\"file\":\"/images/icon/icon3/Sut_lun_dat.png\",\"extension\":\"png\"}',1,'2022-12-06 08:47:37','2022-12-11 18:06:56',1),(9,'Ngập lụt','{\"file\":\"/images/icon/icon2/Ngap_lut.png\",\"extension\":\"png\"}',1,'2022-12-06 08:47:37','2022-12-11 18:07:08',1),(10,'Lốc','{\"file\":\"/images/icon/icon1/Loc.png\",\"extension\":\"png\"}',1,'2022-12-06 08:47:37','2022-12-11 18:07:17',1),(11,'Sương muối','{\"file\":\"/images/icon/icon3/Suong_muoi.png\",\"extension\":\"png\"}',1,'2022-12-06 08:47:37','2022-12-11 18:07:38',1),(12,'Mưa đá','{\"file\":\"/images/icon/icon2/Mua_da.png\",\"extension\":\"png\"}',1,'2022-12-06 08:47:37','2022-12-11 18:07:49',1),(13,'Hạn hán','{\"file\":\"/images/icon/icon1/Han_han.png\",\"extension\":\"png\"}',1,'2022-12-06 08:47:37','2022-12-11 18:07:59',1),(14,'Động đất','{\"file\":\"/images/icon/icon1/Dong_dat.png\",\"extension\":\"png\"}',1,'2022-12-06 08:47:37','2022-12-11 18:08:18',1),(15,'Nắng nóng','{\"file\":\"/images/icon/icon2/Nang_nong.png\",\"extension\":\"png\"}',1,'2022-12-06 08:47:37','2022-12-11 18:08:30',1),(16,'Sóng thần','{\"file\":\"/images/icon/icon2/Song_than.png\",\"extension\":\"png\"}',1,'2022-12-06 08:47:37','2022-12-11 18:08:40',1),(17,'Lũ','{\"file\":\"/images/icon/icon1/Lu.png\",\"extension\":\"png\"}',1,'2022-12-06 08:47:37','2022-12-11 18:09:34',1),(18,'Nước dâng','{\"file\":\"/images/icon/icon2/Nuoc_dang.png\",\"extension\":\"png\"}',1,'2022-12-06 08:47:37','2022-12-11 18:09:44',1),(19,'Gió mạnh trên biển','{\"file\":\"/images/icon/icon1/GM_tren_bien.png\",\"extension\":\"png\"}',1,'2022-12-06 08:47:37','2022-12-11 18:10:04',1),(20,'Rét hại','{\"file\":\"/images/icon/icon2/Ret_hai.png\",\"extension\":\"png\"}',1,'2022-12-06 08:47:37','2022-12-11 18:10:33',1),(21,'Sương mù','{\"file\":\"/images/icon/icon3/suong_mu.png\",\"extension\":\"png\"}',1,'2022-12-06 08:47:37','2022-12-11 18:10:41',1),(22,'Xâm nhập mặn','{\"file\":\"/images/icon/icon3/xam_nhap_man.png\",\"extension\":\"png\"}',1,'2022-12-06 08:47:37','2022-12-11 18:10:48',1),(36,'ATNĐ','{\"file\":\"/images/icon/icon1/ATND.png\",\"extension\":\"png\"}',1,'2022-12-09 09:53:01','2022-12-15 08:50:01',1),(37,'Khác test2','{\"file\":\"/images/20220905/tree_2089418_1759027.png\",\"extension\":\"png\"}',1,'2022-12-13 18:06:15','2022-12-15 08:49:19',0);
/*!40000 ALTER TABLE `disastergroups` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:18:49
