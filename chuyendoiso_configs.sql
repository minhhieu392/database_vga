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
-- Table structure for table `configs`
--

DROP TABLE IF EXISTS `configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `configs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '{}' CHECK (json_valid(`config`)),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='config';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configs`
--

LOCK TABLES `configs` WRITE;
/*!40000 ALTER TABLE `configs` DISABLE KEYS */;
INSERT INTO `configs` VALUES (1,'{\"logo\":{\"file\":\"/images/20221223/logo_white.png\",\"extension\":\"png\"},\"icon\":{\"file\":\"/images/20221223/logo_white.png\",\"extension\":\"png\"},\"banner\":{\"file\":\"/images/Banner/z4042252195438_8f2f2191bb93c5737144074cf3f16d7b.jpg\",\"extension\":\"jpg\"},\"bannerearth\":{\"file\":\"/images/20230113/bg_banner.png\",\"extension\":\"png\"},\"nameSite\":\"Cổng thông tin chuyển đổi số\",\"name\":\"Cục Quản lý đề điều và Phòng chống thiên tai\",\"mobile\":\"09382938\",\"FACEBOOK_PAGE_ID\":\"489843628041584\",\"header\":\"Chuyển đổi số trong phòng chống thiên tai\",\"content\":\"\",\"contentFooter\":\"Cơ quan quản lý Cổng thông tin điện tử: Sở Thông tin và Truyền thông Tổng cục phòng chống thiên tai\\nGiấy phép số 16/GP-STTTT do Sở Thông tin và Truyền thông TP. Hà Nội cấp ngày 16 tháng 03 năm 2022\",\"keywordsSeo\":\"chuyển đổi số, tổng cục phòng chống thiên tai\",\"descriptionSeo\":\"Đến năm 2030 Tổng cục phòng chống thiên tai sẽ trở thành một bộ máy thông minh với sự đổi mới căn bản, toàn diện. Áp dụng công nghệ thông tin vào quản lý và vận hành số hóa đáp ứng chỉ tiêu của xã hội số.\"}');
/*!40000 ALTER TABLE `configs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:18:55
