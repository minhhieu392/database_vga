-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cormisvietnam
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
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banners` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'tiêu đề',
  `link` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'link',
  `image` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`image`)),
  `status` int(11) DEFAULT NULL COMMENT 'trạng thái:\\\\nFalse: ẩn sản phẩm\\\\nTrue: hiển thị sản phẩm',
  `userCreatorsId` bigint(20) NOT NULL COMMENT 'người tạo/Người bán',
  `dateCreated` datetime DEFAULT current_timestamp() COMMENT 'ngày tạo',
  `dateUpdated` datetime DEFAULT current_timestamp(),
  `descriptions` text DEFAULT NULL,
  `languagesId` bigint(20) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='banner';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners`
--

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
INSERT INTO `banners` VALUES (1,'Chạy bộ 1km đóng góp 1000 đồng ủng hộ người khó khăn','\'','{\"file\":\"/images/20230110/banner_ha_noi.png\",\"extension\":\"png\"}',1,1,'2023-01-10 17:49:58','2023-01-10 17:51:04','Mục tiêu chạy bộ ủng 5 tỷ đồng cho người có hoàn cảnh khó khăn',1),(2,'Run 1km, donate 1000 VND to support the needy','\'','{\"file\":\"/images/20230110/banner_ha_noi.png\",\"extension\":\"png\"}',1,1,'2023-01-10 17:49:58','2023-01-10 17:51:09','The goal of jogging is 5 billion VND for people in difficult circumstances',2),(3,'Trao tặng xe lăn cho người khuyết tật ở Quảng Bình','\'','{\"file\":\"/images/20230110/banner_05.jpg\",\"extension\":\"jpg\"}',1,1,'2023-01-10 17:57:51','2023-01-10 18:00:36','Trong chương trình “Cấp phát xe lăn nhân đạo”,  có 529 xe lăn dành tặng cho người khuyết tật trên địa bàn tỉnh Quảng Bình. Do tình hình dịch bệnh đang diễn biến phức tạp nên chương trình sẽ được chia làm  2 đợt. Đợt 1 cấp phát 270 chiếc xe lăn và đợt hai sẽ cấp phát 259 chiếc xe lăn còn lại',1),(4,'Donating wheelchairs to people with disabilities in Quang Binh','\'','{\"file\":\"/images/20230110/banner_05.jpg\",\"extension\":\"jpg\"}',1,1,'2023-01-10 17:57:51','2023-01-10 18:00:49','In the program \"Delivering wheelchairs for humanity\", there are 529 wheelchairs for people with disabilities in Quang Binh province. Due to the complicated situation of the epidemic, the program will be divided into 2 phases. Phase 1 will provide 270 wheelchairs and the second phase will distribute the remaining 259 wheelchairs',2);
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:18:38
