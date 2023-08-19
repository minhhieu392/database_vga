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
-- Table structure for table `usertokens`
--

DROP TABLE IF EXISTS `usertokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usertokens` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `usersId` bigint(20) DEFAULT NULL,
  `userTokenCode` varchar(4) DEFAULT NULL,
  `dateExpired` datetime DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '1: GỬI QUA MAIL\n2: GỬI QUA SĐT',
  `resultId` bigint(20) DEFAULT 0 COMMENT 'mail : 0\\nmoblie :-1 thất bại\\nmoblie: >=0 : ok',
  `status` int(11) DEFAULT 0 COMMENT '0: đã tạo , chưa gửi\n1: gửi thành công , chưa sử dụng\\n2: đã sử dụng',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Bảng chưa token lấy mật khẩu, đăng ký kích hoạt user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertokens`
--

LOCK TABLES `usertokens` WRITE;
/*!40000 ALTER TABLE `usertokens` DISABLE KEYS */;
INSERT INTO `usertokens` VALUES (1,502,'9620','2022-11-30 17:47:03',1,0,1),(2,503,'3362','2022-11-30 18:04:21',1,0,1),(3,504,'1435','2022-11-30 18:06:06',1,0,1),(4,505,'9020','2022-11-30 18:07:13',1,0,1),(5,506,'2586','2022-11-30 18:07:43',1,0,1),(6,507,'4406','2022-11-30 18:08:26',1,0,1),(7,508,'1109','2022-11-30 18:09:02',1,0,1),(8,509,'2569','2022-12-02 08:45:48',1,0,1),(9,510,'5452','2022-12-02 08:49:45',1,0,1),(10,514,'1772','2022-12-07 10:16:46',1,0,1),(11,515,'7447','2022-12-07 11:39:46',1,0,1),(12,516,'9890','2022-12-07 11:52:10',1,0,1),(13,517,'3387','2022-12-13 10:42:35',1,0,1),(14,518,'1287','2022-12-20 10:55:21',1,0,1),(15,519,'6443','2022-12-21 11:23:11',1,0,1),(16,520,'2798','2022-12-23 14:44:12',1,0,1),(17,566,'6521','2023-01-11 11:33:39',1,0,1);
/*!40000 ALTER TABLE `usertokens` ENABLE KEYS */;
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
