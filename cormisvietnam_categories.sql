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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `sitesId` bigint(20) NOT NULL,
  `url` varchar(500) DEFAULT NULL,
  `image` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`image`)),
  `seoKeywords` varchar(200) DEFAULT NULL,
  `seoDescriptions` varchar(200) DEFAULT NULL,
  `parentId` bigint(20) NOT NULL,
  `usersCreatorId` bigint(20) NOT NULL,
  `createDate` datetime NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL,
  `isHome` bit(1) DEFAULT b'0',
  `descriptions` varchar(500) DEFAULT NULL,
  `orderBy` int(11) DEFAULT 0,
  `urlSlugs` varchar(500) DEFAULT NULL,
  `typesId` bigint(20) DEFAULT 1 COMMENT '1- tin tức\n2- sản phẩm\n',
  `orderHome` varchar(20) DEFAULT NULL,
  `languagesId` bigint(20) DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_sites_index` (`name`,`sitesId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Danh mục chuyên mục tin tức';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Sản phẩm nông sản',2,'undefined-1','[{\"file\": \"/images/20210526/ezgif_com_gif_maker.png\", \"extension\": \"png\"}]','','',0,1,'2021-05-25 17:20:03',0,_binary '\0','',1,'san-pham-nong-san-2',1,'999',1),(2,'Nấu ăn & Làm bánh',2,'undefined-2','[]','','',0,1,'2021-05-25 21:58:56',0,_binary '\0','',1,'nau-an-lam-banh',2,'999',1),(3,'Sản phẩm',2,'undefined-3','[]','','',0,1,'2021-05-28 10:08:20',0,_binary '\0','',3,'san-pham',2,'999',1),(4,'Hôm nay có gì hay?',2,'undefined-4','[]','','',0,1,'2021-05-28 13:40:18',1,_binary '','',4,'hom-nay-co-gi-hay',2,'999',1),(5,'Sản phẩm phổ biến',2,'undefined-5','[]','','',0,1,'2021-05-28 13:40:36',1,_binary '','',5,'san-pham-pho-bien',2,'999',1),(6,'Đặc sản Hà Giang',2,'undefined-6','[]','','',2,1,'2021-05-30 16:38:52',0,_binary '\0','',6,'dac-san-ha-giang',2,'999',1),(7,'động đất',2,'undefined_7','[]',NULL,NULL,16,1,'2021-05-31 14:52:15',0,_binary '\0',NULL,1,'dong-dat',2,'999',1),(8,'Đóng gói sẵn',2,'undefined-8','[]','','',0,1,'2021-05-31 14:54:29',1,_binary '\0','',6,'dong-goi-san',2,'999',1),(9,'Nhỏ lẻ',2,'undefined-9','[]','','',0,1,'2021-05-31 14:54:55',1,_binary '\0','',7,'nho-le',2,'999',1),(10,'Tất cả',2,'undefined-10','[]',NULL,NULL,0,1,'2021-05-31 14:56:55',0,_binary '\0',NULL,8,'tat-ca',2,'999',1),(11,'Thực phẩm tươi sống',2,'undefined-11','[]','','',0,1,'2021-05-31 14:57:47',1,_binary '\0','',9,'thuc-pham-tuoi-song',2,'999',1),(12,'Rau củ quả',2,'undefined-12','[]','','',0,1,'2021-05-31 14:58:18',1,_binary '\0','',10,'rau-cu-qua',2,'999',1),(13,'Thực phẩm khô và chế biến',2,'undefined-13','[]','','',0,1,'2021-05-31 14:59:06',1,_binary '\0','',11,'thuc-pham-kho-va-che-bien',2,'999',1),(14,'Đồ uống',2,'undefined-14','[]','','',0,1,'2021-05-31 14:59:32',1,_binary '\0','',12,'do-uong',2,'999',1),(15,'Search',2,'undefined-15','[]',NULL,NULL,0,1,'2021-06-03 16:42:31',0,_binary '\0',NULL,13,'search',2,'999',1),(16,'Gợi ý tìm kiếm',2,'undefined_16','[]',NULL,NULL,15,1,'2021-06-03 16:50:32',0,_binary '\0',NULL,2,'goi-y-tim-kiem',2,'999',1),(17,'Tìm kiếm phổ biến',2,'undefined_17','[]',NULL,NULL,16,1,'2021-06-03 16:50:52',0,_binary '\0',NULL,2,'tim-kiem-pho-bien',2,'999',1),(18,'Chợ số',2,'undefined-18','[]','','',0,1,'2021-06-24 10:04:25',1,_binary '\0','',14,'cho-so',1,'999',1);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:18:41
