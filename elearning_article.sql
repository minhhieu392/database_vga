-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: elearning
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
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `shortDescription` varchar(500) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `image` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`image`)),
  `author` varchar(100) DEFAULT NULL,
  `source` varchar(200) DEFAULT NULL,
  `tag` varchar(300) DEFAULT NULL,
  `seoKeywords` varchar(200) DEFAULT NULL,
  `seoDescriptions` varchar(200) DEFAULT NULL,
  `categoriesId` bigint(20) NOT NULL,
  `usersCreatorId` bigint(20) NOT NULL,
  `createDate` datetime DEFAULT current_timestamp(),
  `status` int(11) NOT NULL,
  `urlSlugs` varchar(500) DEFAULT NULL,
  `languagesId` bigint(20) DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title_categories_index` (`title`,`categoriesId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,'test 22222','sadasfsesaf','<p>sấdfsafsfs</p>','[{\"file\": \"/images/20210527/background_login.png\", \"extension\": \"png\"}]','Hoàng Ngọc Anh','26/09/2019','ádfsafsfsf','sádsadfsfsf','ấddfsafsf',1,1,'2021-05-25 18:40:37',1,'test-22222',1),(2,'Tổng quan phần mềm quản lý phòng khám GPP Pharma',NULL,NULL,'[]',NULL,NULL,NULL,NULL,NULL,1,1,'2021-05-27 16:28:11',1,'tong-quan-phan-mem-quan-ly-phong-kham-gpp-pharma',1),(3,'Giới thiệu về Chợ số',NULL,'<figure class=\"image\"><img src=\"https://img./get/images/choso/images/20210625/onlogo.png\"></figure><p><span style=\"color:rgba(0,0,0,0.85);\">Chợ Số là giải pháp công nghệ thông tin giúp người dân ở các vùng nông thôn, miền núi có thêm một kênh mua bán các sản vật của địa phương. Việc điều hành, giám sát số lượng và chất lượng các mặt hàng của người dân sẽ trực tiếp do lãnh đạo địa phương chủ động phân bổ.</span><br>&nbsp;</p><figure class=\"image\"><img src=\"https://img./get/images/choso/images/20210625/Bitmap_2x.jpg\"></figure><p><span style=\"color:rgba(0,0,0,0.85);\">Người bán hàng chủ yếu sẽ là các hộ gia đình cá thể, họ không có nhiều điều kiện tiếp cận với công nghệ thông tin, kỹ năng sử dụng các thiết bị công nghệ còn hạn chế. Do vậy, chính quyền sẽ đóng vai trò quyết định trong việc hướng dẫn và trợ giúp bà con đưa sản vật của họ lên khu chợ thời đại số. Việc này cũng đáp ứng nhu cầu tiêu thụ hàng hoá của người dân ngay cả khi chưa đến phiên chợ truyền thống ở từng địa phương. Chợ Số bao gồm: Ứng dụng trên điện thoại thông minh (chạy trên cả nền tảng Apple iOS và Android) cùng với website dành cho người quản trị.</span><br><br><span style=\"color:rgba(0,0,0,0.85);\">Chợ Số được xây dựng, phát triển và duy trì bởi công ty Công nghệ Gia Hoàng - một doanh nghiệp đa ngành nghề có uy tín, đặc biệt trong lĩnh vực thương mại điện tử.</span><br>&nbsp;</p><figure class=\"image\"><img src=\"https://img./get/images/choso/images/20210625/Bitmap_2x.png\"></figure>','[{\"file\": \"/images/20210625/onlogo.png\", \"extension\": \"png\"}]',NULL,NULL,NULL,NULL,NULL,18,1,'2021-06-25 13:49:17',1,'gioi-thieu-ve-cho-so',1);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:15:56
