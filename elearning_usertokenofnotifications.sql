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
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertokenofnotifications`
--

LOCK TABLES `usertokenofnotifications` WRITE;
/*!40000 ALTER TABLE `usertokenofnotifications` DISABLE KEYS */;
INSERT INTO `usertokenofnotifications` VALUES (10,1,'ExponentPushToken[LfSgncH9KB9QuPu9545sgk]','2022-12-05 13:51:56',0),(94,517,'ExponentPushToken[HdzDnvNNPwwxv5kYHjDWOa]','2022-12-15 17:04:50',1),(98,517,'ExponentPushToken[LfSgncH9KB9QuPu9545sgk]','2022-12-16 14:16:27',1),(111,519,'ExponentPushToken[J3mbn9IwBiDcA3rGrtAKJ4]','2022-12-21 11:18:34',1),(113,517,'ExponentPushToken[9BjTLcAuk4kV8iSvA1sgkd]','2022-12-23 08:24:11',1),(114,518,'ExponentPushToken[HdzDnvNNPwwxv5kYHjDWOa]','2022-12-23 15:06:54',1),(115,509,'ExponentPushToken[J3mbn9IwBiDcA3rGrtAKJ4]','2022-12-27 17:59:40',1),(116,517,'ExponentPushToken[mzyP3bAQDhAnTx6eCNqneu]','2022-12-27 22:39:24',1),(120,509,'ExponentPushToken[LfSgncH9KB9QuPu9545sgk]','2022-12-28 17:55:48',1),(131,517,'ExponentPushToken[5E_l5eCS9qC_qAcVvgoKNW]','2022-12-29 22:30:49',1),(149,509,'ExponentPushToken[HdzDnvNNPwwxv5kYHjDWOa]','2022-12-30 16:07:46',1),(154,524,'ExponentPushToken[NxUIGWP7ubA9i31ZacZOcF]','2023-01-04 15:15:38',1),(157,524,'ExponentPushToken[aNlApLIIyFAOYPyXq5OjRT]','2023-01-06 22:15:18',1),(158,538,'ExponentPushToken[Jo-TlpM_MqU1k61K824Qm5]','2023-01-11 10:26:10',1),(172,552,'ExponentPushToken[iBcbsuI4XSoZaXnpmGbF0i]','2023-01-11 16:16:41',1),(175,557,'ExponentPushToken[OStUPiP415cWx2vzO7gs_6]','2023-01-11 16:33:13',1),(183,532,'ExponentPushToken[1FOqraJs-5Ci7BXdvgsWvd]','2023-01-11 16:54:49',1),(184,524,'ExponentPushToken[0AP10kGJ135XOkGtTjk82X]','2023-01-12 07:07:52',1),(185,542,'ExponentPushToken[T27eYJPJhja7ahkl9dNqrH]','2023-01-12 09:08:44',1),(186,524,'ExponentPushToken[qC0iCvLMlrK_ru22mRpMCV]','2023-01-12 18:40:43',1),(187,561,'ExponentPushToken[xh319DM6Dr_RrTABvQx5OR]','2023-01-15 17:40:27',1),(188,557,'ExponentPushToken[HxJbjHJqSX_0Qho5aHwJNj]','2023-01-16 08:24:30',1),(189,538,'ExponentPushToken[R0CvrtCrIk11iiA4bmQOXr]','2023-01-16 08:59:17',1),(190,532,'ExponentPushToken[NxUIGWP7ubA9i31ZacZOcF]','2023-01-16 10:03:09',1),(191,524,'ExponentPushToken[g2AuJLO9tfHIPAYj1yXKit]','2023-01-17 10:48:09',1);
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

-- Dump completed on 2023-08-19 16:15:57
