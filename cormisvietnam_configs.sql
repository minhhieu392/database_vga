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
INSERT INTO `configs` VALUES (1,'{\"listCoflict\":[{\"logo\":{\"file\":\"/images/20230110/logotransparent.png\",\"extension\":\"png\"},\"logoFooter\":{\"file\":\"/images/20230111/400_filter_nobg_60f855a029060.png\",\"extension\":\"png\"},\"icon\":{\"file\":\"/images/20230110/logotransparent.png\",\"extension\":\"png\"},\"nameSite\":\"Chăm sóc sức khoẻ tâm trí cho cộng đồng\",\"name\":\"Trung tâm nghiên cứu và hỗ trợ hòa nhập cộng đồng\",\"address\":\"Số 76 Võ Trưởng Toản, phường Nại Hiên Đông, quận Sơn Trà, tp Đà Nẵng, Việt Nam\",\"mobile\":\"0905987927\",\"email\":\"info@cormis.org\",\"contentFooter\":\"\",\"languageId\":\"1\",\"point\":{\"lat\":16.14345385320097,\"long\":108.0230712890625}},{\"logo\":{\"file\":\"/images/20230110/logotransparent.png\",\"extension\":\"png\"},\"logoFooter\":{\"file\":\"/images/20230111/400_filter_nobg_60f855a029060.png\",\"extension\":\"png\"},\"icon\":{\"file\":\"/images/20230110/logotransparent.png\",\"extension\":\"png\"},\"nameSite\":\"Mental health care for the community\",\"name\":\"Center for Research and Community Integration Support\",\"address\":\"No. 76 Vo Truong Toan, Nai Hien Dong ward, Son Tra district, Da Nang city, Vietnam\",\"mobile\":\"0905987927\",\"email\":\"info@cormis.org\",\"FACEBOOK_PAGE_ID\":\"e\",\"contentFooter\":\"\",\"languageId\":\"2\",\"point\":{\"lat\":16.14345385320097,\"long\":108.0230712890625}}]}');
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

-- Dump completed on 2023-08-19 16:18:46
