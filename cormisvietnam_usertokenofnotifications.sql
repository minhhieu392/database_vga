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
-- Table structure for table `usertokenofnotifications`
--

DROP TABLE IF EXISTS `usertokenofnotifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usertokenofnotifications` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `usersId` bigint(20) DEFAULT NULL,
  `clientId` text DEFAULT NULL,
  `dateCreated` datetime DEFAULT current_timestamp(),
  `status` int(1) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertokenofnotifications`
--

LOCK TABLES `usertokenofnotifications` WRITE;
/*!40000 ALTER TABLE `usertokenofnotifications` DISABLE KEYS */;
INSERT INTO `usertokenofnotifications` VALUES (10,1,'ExponentPushToken[LfSgncH9KB9QuPu9545sgk]','2022-12-05 13:51:56',0),(92,517,'ExponentPushToken[9BjTLcAuk4kV8iSvA1sgkd]','2022-12-13 10:40:07',1),(94,517,'ExponentPushToken[HdzDnvNNPwwxv5kYHjDWOa]','2022-12-15 17:04:50',1),(98,517,'ExponentPushToken[LfSgncH9KB9QuPu9545sgk]','2022-12-16 14:16:27',1),(101,509,'ExponentPushToken[LfSgncH9KB9QuPu9545sgk]','2022-12-19 14:41:24',1),(107,518,'ExponentPushToken[HdzDnvNNPwwxv5kYHjDWOa]','2022-12-20 13:36:47',1),(110,518,'ExponentPushToken[1FOqraJs-5Ci7BXdvgsWvd]','2022-12-21 08:23:55',1),(111,519,'ExponentPushToken[J3mbn9IwBiDcA3rGrtAKJ4]','2022-12-21 11:18:34',1);
/*!40000 ALTER TABLE `usertokenofnotifications` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:18:35
