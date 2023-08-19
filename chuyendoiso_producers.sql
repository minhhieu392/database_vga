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
-- Table structure for table `producers`
--

DROP TABLE IF EXISTS `producers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `producerName` varchar(200) DEFAULT NULL COMMENT 'Tên vị sản xuất',
  `producerDescriptions` varchar(500) DEFAULT NULL COMMENT 'mô tả',
  `userCreatorsId` bigint(20) DEFAULT NULL COMMENT 'người tạo',
  `dateCreated` datetime DEFAULT NULL COMMENT 'ngày tạo',
  `dateUpdated` datetime DEFAULT NULL COMMENT 'ngày cập nhật',
  `status` int(11) DEFAULT NULL COMMENT 'trạng thái',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producers`
--

LOCK TABLES `producers` WRITE;
/*!40000 ALTER TABLE `producers` DISABLE KEYS */;
INSERT INTO `producers` VALUES (1,'Ban Chỉ đạo Trung ương về Phòng chống thiên tai','Ban chỉ đạo',1,'2020-12-09 07:00:00','2021-07-06 10:51:13',1),(2,'Bộ Nông nghiệp và Phát triển nông thôn','Mô tả Bộ Nông nghiệp và Phát triển nông thôn',1,'2020-12-09 07:00:00','2021-03-01 10:03:37',1),(3,'Tổng cục Phòng chống thiên tai','Mô tả tổng cục Phòng chống thiên tai',1,'2020-12-09 07:00:00','2021-07-02 10:04:31',1),(4,'Ban chỉ huy quân sự tỉnh','Mô tả dễ hiểu',1,'2021-02-24 15:16:57','2021-05-04 13:59:33',1),(5,'Bộ khoa học và công nghệ','',1,'2021-02-25 14:30:51','2021-02-25 14:36:22',0),(6,'Bộ khoa học','+ Theo kiểu dữ liệu varchar(200) -> Hiện đang cho nhập tối đa 300 kí tự \n				 -> Mong muốn: Nếu nhập >200 kí tự -> Hiển thị dòng thông báo \"Vui lòng nhập đúng định dạng tối đa 200 kí tự\"\n+ Theo kiểu dữ liệu varchar(200)',1,'2021-02-25 14:36:17','2021-02-25 14:36:20',0),(7,'123cdfđs>>>>','+ Theo kiểu dữ liệu varchar(200) -> Hiện đang cho nhập tối đa 300 kí tự \n				 -> Mong muốn: Nếu nhập >200 kí tự -> Hiển thị dòng thông báo \"Vui lòng nhập đúng định dạng tối đa 200 kí tự\"',1,'2021-02-25 14:36:56','2021-02-26 17:50:28',0),(8,'.','',1,'2021-02-26 09:33:10','2021-02-26 17:50:26',0),(9,'..','',1,'2021-02-26 09:33:13','2021-02-26 11:43:13',0),(10,'...','',1,'2021-02-26 09:33:18','2021-02-26 11:43:09',0),(11,'aaaa','',1,'2021-02-26 15:54:15','2021-03-01 17:28:07',0),(12,'aaaaa','',1,'2021-02-26 15:54:42','2021-02-26 16:35:51',0),(13,'dv1','abcbcbc\nsdafdas',1,'2021-02-26 16:07:17','2021-02-27 20:07:58',0),(14,'bfdbf','',1,'2021-03-01 09:18:11','2021-03-02 09:31:20',-1),(15,'@$@#%#','',1,'2021-04-23 11:53:58','2021-07-02 16:14:01',-1),(16,'fd','',1,'2021-07-05 11:49:51','2021-07-09 08:31:20',0);
/*!40000 ALTER TABLE `producers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:18:51
