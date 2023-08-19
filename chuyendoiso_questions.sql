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
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `questionsName` varchar(500) DEFAULT NULL COMMENT 'tên  thuộc tính',
  `dataType` int(11) DEFAULT 0 COMMENT '0 : number , 1: string',
  `viewType` int(11) DEFAULT 0 COMMENT '0 : checkbox , 1: select , 2; input',
  `selectType` int(11) DEFAULT 0 COMMENT '0 : chọn một , 1: chọn nhiều',
  `surveysId` bigint(20) DEFAULT NULL,
  `order` int(11) DEFAULT 0,
  `filterStatus` int(1) DEFAULT 0,
  `placeholder` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `surveysId` (`surveysId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'Địa hình nơi cây sinh trưởng, trồng trọt',0,0,0,3,0,0,NULL),(2,'Địa hình nơi cây sinh trưởng, trồng trọt',0,0,0,5,0,1,'abc'),(3,'Địa hình nơi cây sinh trưởng, trồng trọt',0,0,0,6,0,1,'abc'),(4,'Câu hỏi số 2',0,0,0,6,1,0,NULL),(5,'Nơi đón tiếp của Văn phòng Sở',0,0,0,7,0,0,NULL),(6,'Thái độ phục vụ, hướng dẫn giải quyết thủ tục hành chính của người hướng dẫn làm thủ tục',0,0,0,7,1,0,NULL),(7,'Thái độ tiếp nhận, trả kết quả của giải quyết thủ tục hành chính của người tiếp nhận, trả kết quả',0,0,0,7,2,0,NULL),(8,'Thời gian xử lý, hoàn trả kết quả giải quyết thủ tục hành chính',0,0,0,7,3,0,NULL),(9,'Hồ sơ thủ tục hành chính thuộc phòng Kế hoạch - Tài chính',0,0,0,7,4,0,NULL),(10,'Hồ sơ thủ tục hành chính thuộc phòng Quản lý xây dựng công trình',0,0,0,7,5,0,NULL);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:18:50
