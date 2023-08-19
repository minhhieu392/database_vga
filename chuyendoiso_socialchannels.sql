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
-- Table structure for table `socialchannels`
--

DROP TABLE IF EXISTS `socialchannels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialchannels` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `socialsId` bigint(20) DEFAULT NULL,
  `socialChannelName` varchar(200) DEFAULT NULL,
  `socialChannelType` int(11) DEFAULT NULL COMMENT '0: youtube , zalo page ,facebook page\\n1: zalo group, facebook group',
  `socialChannelImages` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`socialChannelImages`)),
  `socialChannelUrl` varchar(1000) DEFAULT NULL,
  `socialChannelToken` varchar(1000) DEFAULT NULL,
  `socialChannelTokenExpired` datetime DEFAULT NULL,
  `userCreatorsId` bigint(20) DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateUpdated` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialchannels`
--

LOCK TABLES `socialchannels` WRITE;
/*!40000 ALTER TABLE `socialchannels` DISABLE KEYS */;
INSERT INTO `socialchannels` VALUES (1,3,'Tổng cục phòng chống thiên tai',0,'[{\"file\": \"https://s160-ava-talk.zadn.vn/7/d/1/8/1/160/bd99020b3d80ebe49b926c12388cfe44.jpg\", \"extension\": \"jpg\"}]','280555573236572442','KuB_68PCVmnQWFWRXajx25c3_Xo6KpzABCFgAu592ZyiykTtzsW207dPWcN7J5G5SToIR_mHTs52jhO4u7vL5tlXYd7HSr1gMCEfBzjHUMjFuwmwvt5lIJp6hpYTTbThGgM96-WCKK1YYz0XqGKxG72z-mxwUYHNRi3EDzHND5XFvlvMZduw8n3IsZYZQX5M7zpI1hqMCMOMqCe0ZNGdSHNVy1x9R3PxQztSODPHAGbtmUz-_4auDaY1mNtb4nKaUhpBDiK1L2n5kO4wo2HrVNsDZocd8tT1SUp-iYECKdy3',NULL,1,'2021-07-08 16:23:47','2021-07-08 16:23:47',1),(2,1,'Test thủy - Đồ chơi công nghệ',0,'[{\"file\": \"https://scontent.fhan14-2.fna.fbcdn.net/v/t1.6435-1/cp0/p50x50/135248479_2469218920047011_2657786698220863896_n.jpg?_nc_cat=111&ccb=1-5&_nc_sid=dbb9e7&_nc_ohc=JXR8AD0B3asAX9EpnGs&_nc_ht=scontent.fhan14-2.fna&edm=AJdBtusEAAAA&oh=2258a848522f6d9dafa5cc0e30aeb876&oe=6184FF22\", \"extension\": \"fna&edm=AJdBtusEAAAA&oh=2258a848522f6d9dafa5cc0e30aeb876&oe=6184FF22\"}]','2055625158073058','EAABzfngi3EgBAD4kuHAwZBg0HnjFMPREbsCWN7zTxL86jjO03EQzADTrlP5zK49FZCu7HsTS6ObGGWcEJeknPZBbASCGVz38xozqPxr2QPg6guPUo8yydZCpLrSxZAEQ6T91wWmKzU3FQrhSPMzbqU5ASEZAOJNy5xn5vOjHKRWkjuYlNqIhZAN','2021-10-07 12:11:15',1,'2021-07-08 16:24:28','2021-10-07 18:01:57',1),(3,2,'X. Thủy',0,'[{\"file\": \"https://yt3.ggpht.com/ytc/AKedOLRAEyhrgNvt5d5gZCdxUs5ccSrQJqpn946k36Df=s800-c-k-c0x00ffffff-no-rj\", \"extension\": \"com/ytc/AKedOLRAEyhrgNvt5d5gZCdxUs5ccSrQJqpn946k36Df=s800-c-k-c0x00ffffff-no-rj\"}]','UCwKDSJqItTgV1VhJaAehRig','1//0eLtpFxgy_vhGCgYIARAAGA4SNwF-L9Irj4QT-lxcHh2Dn2vuUbhtuF9pvxUvpAGrt3LY_D8VXR6pA83BqS48cwcWqjGfdPnBuK4','2021-07-08 17:35:03',1,'2021-07-08 16:35:04','2021-07-08 16:35:04',1),(4,1,'Hội cuồng X.Thủy',1,'[{\"file\": \"https://scontent.fhan14-1.fna.fbcdn.net/v/t1.6435-9/205998030_192015526196176_8314128152982161737_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=1091cb&_nc_ohc=HRcrTDscKwUAX_kLruC&_nc_ht=scontent.fhan14-1.fna&edm=AA1JIJ8EAAAA&oh=7ee9debc64fd9e3b26a57c9d9c080fdd&oe=615664D2\", \"extension\": \"jpg\"}]','451472912350232','EAABzfngi3EgBAMTlclOFt5V4tEhuGem0ZBBC9ZAdKZA45Gr0ZAzYmXyDp7uuEcdhDhnI84McseAwXDTjNvFNc7ploSOAOd7Hll0afQDJUDpkoPz7KwXz5Gh5z3TGfIc348HO8WO4JkRxjoMMFITEMDgrR5L0kZBMOGxSC3CE82FZA0oZABW9XC9','2021-10-07 11:38:34',1,'2021-07-08 16:35:35','2021-09-01 08:53:32',1),(5,1,'Bibi store - Phụ kiện đẳng cấp',0,'[{\"file\": \"https://scontent.fhan2-2.fna.fbcdn.net/v/t1.6435-1/cp0/p50x50/151282902_117468496984213_3812044883473911674_n.jpg?_nc_cat=102&ccb=1-3&_nc_sid=dbb9e7&_nc_ohc=93MRVQMhjysAX_OrgnG&_nc_ht=scontent.fhan2-2.fna&oh=78b9e70a8cc8b286312171a2d12243ed&oe=60ECE50C\", \"extension\": \"fna&oh=78b9e70a8cc8b286312171a2d12243ed&oe=60ECE50C\"}]','104158768315186','EAABzfngi3EgBANxRai3UVvZB4QBYJyjc6asAJj77xHTNA1FBiigEzW5NbA6WKLZC22u66z0e1ScD467t7LZBmIKzZBcai9t3GSKu2Vq45un12Alivlyuhcn5ZBz31Vlf7FKfN9ISeRmRGSuHfFTfhFjBE2iHvZCjLfuggKBDhsXE1JUvdxgqnG','2021-10-07 11:55:18',1,'2021-07-08 17:33:36','2021-07-09 11:55:26',1),(6,1,'Aaaaaaaa',0,'[{\"file\": \"https://scontent.fhan2-2.fna.fbcdn.net/v/t1.6435-1/cp0/p50x50/175881226_107277774830728_9040320223709683956_n.png?_nc_cat=102&ccb=1-3&_nc_sid=dbb9e7&_nc_ohc=MWxulQK2xs0AX9VUiT_&_nc_ht=scontent.fhan2-2.fna&oh=f55d4d6645a8bda55a748dded34b7343&oe=60EFEDEB\", \"extension\": \"fna&oh=f55d4d6645a8bda55a748dded34b7343&oe=60EFEDEB\"}]','107277721497400','EAAEZAEom8DEwBAN2tqimiAw42gZBuxkDC17vT146DHewkitZBo7pwGRlZAETorWLlF3qdAvAxtwJLJS55CsX3YjBn07tNzpLwN9TgROZCK96Nb2LKjaKJrOqYUu4kXm1oklf9ErWm5GSOk1TwThBk2BcFFSl5vP5GICBoaxsLl8hH6c8UYS0BvK5wfLgGAkxoyE6yNZCwOUgZDZD','2021-07-12 14:27:51',1,'2021-07-08 17:41:24','2021-07-12 14:27:51',1),(7,1,'test api',1,'[{\"extension\": \"jpg\"}]','1162831910861034','EAAEZAEom8DEwBAJ170klE97yZC2rlGOaGVxXZATca3P6rp2XYKOSPxcgZCZApFHFeI5ZCYz7Xho3uV4LOBpFQZAyC8PE3KFHm1fQSB6QkWVrZBFPbV6FOBuvVkkMojoaRptO62Lb7UinF51W5HqMzeHSS5DSf0XZBNhYvwCw1pp5MXZACuZCPwzq36zP6lb2uZCBxZAPAwN36dtnJigZDZD','2021-07-12 14:26:48',1,'2021-07-08 17:41:54','2021-07-19 10:46:13',1),(11,3,'Diamond White viên uống trắng da',0,'[{\"file\": \"https://s160-ava-talk.zadn.vn/4/e/8/3/1/160/2a9a8c5e09d483bdc57f1d69cd6d3d5b.jpg\", \"extension\": \"jpg\"}]','3454415701652785432','k0Y175Gu84kn2eOVL3yaJx89W1XK9oeCotFE83C6CtUsQP9440fJO9Tdyp0dDmbeasJhRN9JBcEG5jvB8IyW6v9_zm8q52qjqc3iELy21Wt1LV4LM0Oc1y0_nr5sUZD0x0xe6MPNBZlG7FHjDKW1J88N-qi0S51AlHka6I4iHZ2mOO0K4WXM984-zZLXTmaZXH-eC35NT7tT0uHgOcnaUSGjhbrNP10Fmnss5rzPG3B4F-SHGcW22A0yo2qXP3PujYlIJJ4QBHwnO_C63oeF3QD6orynT186jXR88TK0as1U9Y14',NULL,1,'2021-07-08 18:10:04','2021-07-08 18:10:04',1),(12,3,'NBM Production',0,'[{\"file\": \"https://s160-ava-talk.zadn.vn/d/9/8/8/2/160/dcfe9f38bb6640b3ff46513153a34a08.jpg\", \"extension\": \"jpg\"}]','3861154206582011756','dkDHKpxH_nQNuLPGFjRx4fJYK5S-pe5puejlIZcmgd3LyMndVgAZHBBQRm5YZQmXiBvLAaVG-GYFuGCzMvR50lhtC4XHl-9MfFeuIacprdpWw3ju2DxhSDEG64zvzEiEXgGQBrdGqXcue0qiTylYPfpa4tv9ZiXblySuNNJno1k4nJihM8ALCwxeN0aEZfC9nFfBC1EXX2JTzqa44PQ7JlpcGamkXxzP-zDDQ0s2acdZnLPNLuIGORVHE2fxdUXXWUaC8oo7v3dzonm2D8hKAUN50mufegSxcGASSZJF_na','2021-07-12 14:42:45',1,'2021-07-08 18:29:11','2021-07-08 18:29:11',1),(13,1,'Vietnamobile - Giải Đáp Online',1,'[{\"file\": \"https://scontent.fhan2-2.fna.fbcdn.net/v/t1.6435-9/36413491_103703263880262_761622281402187776_n.jpg?_nc_cat=102&ccb=1-3&_nc_sid=1091cb&_nc_ohc=ta1GqB-MiJAAX8yG2eu&_nc_ht=scontent.fhan2-2.fna&oh=7bdea0da16321c3f544bd20a9d2020da&oe=60ECFCE1\", \"extension\": \"jpg\"}]','625512484478576','EAABzfngi3EgBAKm2ieUtCDbYubzYy3vikdoJftZC7ZBZBAAmZC9NpsScimBmpCIR2WZCg6P7aVfN9cf9QnnwVueYsj2eCfdmxa0NdMP4cbvhMbtUDc8koeqcLMkZCoZCpV9TSadCrIJk9DxPvCPHa9KQVxMT3jkadL3VmZBCgbnFDgZDZD','2021-07-08 23:06:55',30,'2021-07-08 23:06:55','2021-07-08 23:06:55',1),(14,1,'Tattoo',1,'[{\"file\": \"https://scontent.fhan2-4.fna.fbcdn.net/v/t1.6435-9/59662908_798174687221912_4063264414655053824_n.jpg?_nc_cat=100&_nc_rgb565=1&ccb=1-3&_nc_sid=1091cb&_nc_ohc=_Ro4rDzF-bQAX_Bh3N3&_nc_ht=scontent.fhan2-4.fna&oh=93368cb0ac99399c705ee4c8aff730ec&oe=60F02B42\", \"extension\": \"jpg\"}]','835505140145458','EAABzfngi3EgBAMpTQH49L7c2bQ5TEZCslrWWnMhACBnn9fpbo4Tsbld7m9HAWCR7SvneOYL7rDWehVzzYpLdXZBFmBSw9ZCXGZBNfApaSKbE7Ntvb9CwYiSgyESeR0aODZAq6Doaqv2AdiNENSeUvaltNEXtOAADY1qJ8O8ZAarwZDZD','2021-07-12 08:33:57',1,'2021-07-12 08:33:57','2021-07-13 00:08:45',-1),(15,1,'Tattoo độc ,chất',0,'[{\"file\": \"https://scontent.fhan2-4.fna.fbcdn.net/v/t1.6435-1/cp0/p50x50/59390639_436460443813040_5820116560836034560_n.jpg?_nc_cat=105&ccb=1-3&_nc_sid=dbb9e7&_nc_ohc=rp4yEC8MEhQAX-P-fmv&_nc_ht=scontent.fhan2-4.fna&oh=53a28279bf97759def17285a38de1920&oe=60F11522\", \"extension\": \"fna&oh=53a28279bf97759def17285a38de1920&oe=60F11522\"}]','436459430479808','EAABzfngi3EgBAGLr87V2Xd3gwyxP4jjr1UVzEneAKLMZA67ZBtEUO1U5F1mquXppPxEF5hZAORJ3AQ6gx8ZCmttgZAvKBZBr7QDfojg4PM2iWe2MI3gbLjpmAAwBxhU9lmOy66CJgvYMhKZC9QDIVmfYm42DFET0IXTwJESUJ5BCsWWmftOouNq','2021-07-12 10:41:27',1,'2021-07-12 08:36:16','2021-07-13 00:09:12',-1),(16,2,'Hoa Nguyễn',0,'[{\"file\": \"https://yt3.ggpht.com/ytc/AKedOLRjLBmJyMJ1FfSgli3zbFz8pgq7jPlLol5umv6E=s800-c-k-c0x00ffffff-no-rj\", \"extension\": \"com/ytc/AKedOLRjLBmJyMJ1FfSgli3zbFz8pgq7jPlLol5umv6E=s800-c-k-c0x00ffffff-no-rj\"}]','UCe5-NAT61PfBzHWyw56h6SA','1//0eFEzkwcFbjUFCgYIARAAGA4SNwF-L9IraOOmmMyTJBesXgnJoKijKO2lN2-7qn2G69QRPlmWyh88PXBjO9E-zAhZ4fb8oG2_CHs','2021-07-12 09:55:50',1,'2021-07-12 08:55:51','2021-07-13 00:08:20',0),(19,1,'test public group api',1,'[{\"extension\": \"jpg\"}]','293336442477730','EAABzfngi3EgBAIkBvanuBGo82uzVP0t415xJqgi6peDdY5XKva9ACgfQRHcHXWfkWnh3KsmH8nOZAYQXVBu32m2u6E9Y0l9suQSfFBwft7iGodlT7zMXRNsk7sTmMJDe4H0lzxZCZB8JnPDUpwDnBafNZClhfz1VodtV1bvG4PHF12RUBZBan','2021-07-12 14:26:48',1,'2021-07-12 14:26:48','2021-07-19 10:46:13',1),(20,1,'Thông tin Phòng chống thiên tai',0,'[{\"file\": \"https://scontent.fhan14-2.fna.fbcdn.net/v/t1.6435-1/cp0/p50x50/34445964_180242289356875_9169904568807456768_n.png?_nc_cat=102&ccb=1-3&_nc_sid=dbb9e7&_nc_ohc=3OHSuXRt3EMAX9x3Z-z&_nc_oc=AQnzOLHfcZc-9LFj9CQM-OqlHIcNopzY5q5Co8gidaUTmAbR7cHudal4gfCltbabrXU&_nc_ht=scontent.fhan14-2.fna&oh=f0c9bf1ec0e5a6e7dba5c06e454e625e&oe=60F557A1\", \"extension\": \"fna&oh=f0c9bf1ec0e5a6e7dba5c06e454e625e&oe=60F557A1\"}]','121652791882492','EAABzfngi3EgBAN6c1ouB0DAMIa8ab915tECeQgD77Ng7m6MBmMLHGnSfYONzRsqTa4ZBZBd8YluKBo1Ag3uRPBznZBMJDtJgwiZCGzoOVlg8tFZCkPQxA8SZCZCo1k18NVLconxOpIic6zHRjgNqLJuSxdaeoB6dr7xOWiExpf0ZBIJUMI1yarAR',NULL,1,'2021-07-16 13:52:25','2021-07-16 13:52:25',1),(21,1,'Cuộc thi \"Đội Xung kích trong Phòng chống thiên tai\"',1,'[{\"file\": \"https://scontent.fhan14-2.fna.fbcdn.net/v/t1.6435-9/116594003_3137428832978110_2456522472226006140_n.jpg?_nc_cat=103&ccb=1-3&_nc_sid=1091cb&_nc_ohc=JVTFA6H7t5MAX-0DgWg&_nc_ht=scontent.fhan14-2.fna&oh=2b11cc32d05a3a5eeb53effebd6d5f5c&oe=60F5B4FF\", \"extension\": \"jpg\"}]','385330211948013','EAABzfngi3EgBAPYeD5UgDjRjX85qo4iHdp7CfBuyFzw3Nan164zV0PHleqMiC1r0lSHmUueBPqG4z2hun9l2A7Hj9Ch90nFpSCk72ZAfw9m15k03GxKtO8i5EWnJnKQQDsvpI0MGsoyC6W6qDXZAUa4zlfZAf9uZCTORpujMHAZDZD',NULL,1,'2021-07-16 13:58:58','2021-07-16 13:58:58',1),(22,1,'Tử Vi Sơ Sơ Cấp - 2015',1,'[{\"file\": \"https://scontent.fhan14-2.fna.fbcdn.net/v/t31.18172-8/11703238_963584500330740_7530717811178449835_o.jpg?_nc_cat=111&ccb=1-3&_nc_sid=1091cb&_nc_ohc=75y5-dTzNfwAX_lZHLO&_nc_ht=scontent.fhan14-2.fna&edm=AA1JIJ8EAAAA&oh=17b9701a70f938a072b8fe4dc9623552&oe=60F56538\", \"extension\": \"jpg\"}]','1700747386811766','EAABzfngi3EgBAPYeD5UgDjRjX85qo4iHdp7CfBuyFzw3Nan164zV0PHleqMiC1r0lSHmUueBPqG4z2hun9l2A7Hj9Ch90nFpSCk72ZAfw9m15k03GxKtO8i5EWnJnKQQDsvpI0MGsoyC6W6qDXZAUa4zlfZAf9uZCTORpujMHAZDZD',NULL,1,'2021-07-16 13:58:58','2021-07-16 13:58:58',1),(23,1,'Đi tìm cái lý của số!',1,'[{\"file\": \"https://scontent.fhan14-2.fna.fbcdn.net/v/t1.18169-9/12742051_179483712427620_6247967030599603539_n.jpg?_nc_cat=105&ccb=1-3&_nc_sid=1091cb&_nc_ohc=6K9JEHXPkVMAX82sBg7&_nc_ht=scontent.fhan14-2.fna&oh=a4e25399296206391581bfb0f6d23e7e&oe=60F6DEB3\", \"extension\": \"jpg\"}]','1028425453897069','EAABzfngi3EgBAPYeD5UgDjRjX85qo4iHdp7CfBuyFzw3Nan164zV0PHleqMiC1r0lSHmUueBPqG4z2hun9l2A7Hj9Ch90nFpSCk72ZAfw9m15k03GxKtO8i5EWnJnKQQDsvpI0MGsoyC6W6qDXZAUa4zlfZAf9uZCTORpujMHAZDZD',NULL,1,'2021-07-16 13:58:58','2021-07-16 13:58:58',1),(24,1,'VDMA Content',1,'[{\"file\": \"https://scontent.fhan14-2.fna.fbcdn.net/v/t1.6435-9/52932967_10213067181657395_3662092195508256768_n.jpg?_nc_cat=103&ccb=1-3&_nc_sid=1091cb&_nc_ohc=w_I3FaWG62YAX-SxD1E&_nc_ht=scontent.fhan14-2.fna&oh=81b683277d9711a06fe2a9cf724b1524&oe=60F5A393\", \"extension\": \"jpg\"}]','853701801649249','EAABzfngi3EgBAPYeD5UgDjRjX85qo4iHdp7CfBuyFzw3Nan164zV0PHleqMiC1r0lSHmUueBPqG4z2hun9l2A7Hj9Ch90nFpSCk72ZAfw9m15k03GxKtO8i5EWnJnKQQDsvpI0MGsoyC6W6qDXZAUa4zlfZAf9uZCTORpujMHAZDZD',NULL,1,'2021-07-16 13:58:58','2021-07-16 13:58:58',1),(25,1,'Tử Vi',1,'[{\"file\": \"https://scontent.fhan14-2.fna.fbcdn.net/v/t1.18169-9/10649707_10202859660799652_1747093098621160328_n.jpg?_nc_cat=101&ccb=1-3&_nc_sid=1091cb&_nc_ohc=dsr_omfdrooAX-tSAA3&_nc_ht=scontent.fhan14-2.fna&oh=31bfb49fcbe263d67abbc6337b82aae7&oe=60F5BE8D\", \"extension\": \"jpg\"}]','249612895122409','EAABzfngi3EgBAPYeD5UgDjRjX85qo4iHdp7CfBuyFzw3Nan164zV0PHleqMiC1r0lSHmUueBPqG4z2hun9l2A7Hj9Ch90nFpSCk72ZAfw9m15k03GxKtO8i5EWnJnKQQDsvpI0MGsoyC6W6qDXZAUa4zlfZAf9uZCTORpujMHAZDZD',NULL,1,'2021-07-16 13:58:59','2021-07-16 13:58:59',1),(26,1,'Quỹ Hỗ Trợ Bệnh Nhân Xươnq Khớp Thần Kinh Toạ CKCS1',0,'[{\"file\": \"https://scontent.fhan2-3.fna.fbcdn.net/v/t1.6435-1/cp0/p50x50/157309882_101041635394352_2901404760685726359_n.png?_nc_cat=108&ccb=1-3&_nc_sid=dbb9e7&_nc_ohc=PmF13l5TcPUAX9G5YsG&_nc_ht=scontent.fhan2-3.fna&oh=7585554d2efa3f15266bcb3dfbb93e86&oe=612BA985\", \"extension\": \"fna&oh=7585554d2efa3f15266bcb3dfbb93e86&oe=612BA985\"}]','101041578727691','EAABzfngi3EgBAIZBQngpndkESE7UrvRqUFtOq3EZBwdtDjkt0gIWaEGvdh3UqnGC4l15oqnLJ0TTSTwgZAKn4Kg8gp317GoqXWpZAhpRaJMEUHivyzeFRzBQkfMqf9VN48Kagg0GAHbseYyY7tRA8gjBsD9cJuZCSJUywUp5ROYz8SZCR5pHmi',NULL,1,'2021-07-21 08:51:57','2021-08-02 16:59:30',1),(27,1,'Nhóm test của Tuấn Anh',1,'[{\"extension\": \"jpg\"}]','671093497620381','EAABzfngi3EgBAKVqPqBDT1oEHoX4kQGfJrPNgVBWBxAE8ItqEL9UeXrUwmq36hspXWC0rZACkhjPg23aMOSCnGQsZBrOUTOK2KT5jP32pApjEB5uDxAgv1wiD6lUjJypLqIy7RONdECbZAtRtTZAmx0zXcfO8PzPNcPsL0DAZBlQgGRLEGxP5',NULL,1,'2021-07-21 09:17:24','2021-07-21 15:43:49',1),(28,1,'Nhóm test page',1,'[{\"extension\": \"jpg\"}]','246885227247859','EAABzfngi3EgBAMSc9JIAhnDfPb8TIgIA0arncd2ovGHwg29RFCxhqGahzFjkjHLvXdaZB6Q1ev9EbpkR70H5C2bKJe92QLSQhv3judlD3G76wPZBZA0lwwwfuakFiBrYjXCPIYBZAiPxZAW6eot3wN28gRJTiZBDYIM3qnI3pm0LuT5AQ790ty',NULL,1,'2021-07-21 14:03:15','2021-07-21 14:27:03',1),(29,1,'Trang abc',0,'[{\"file\": \"https://scontent.fhan2-1.fna.fbcdn.net/v/t1.6435-1/cp0/p50x50/153037585_104775638332601_8852853080199267008_n.png?_nc_cat=101&ccb=1-3&_nc_sid=dbb9e7&_nc_ohc=3TVm4FnBbqsAX81e4ZI&_nc_ht=scontent.fhan2-1.fna&edm=AJdBtusEAAAA&oh=9acfb1db8f0391a9894bf85d4a1fc620&oe=612BC073\", \"extension\": \"fna&edm=AJdBtusEAAAA&oh=9acfb1db8f0391a9894bf85d4a1fc620&oe=612BC073\"}]','104775574999274','EAABzfngi3EgBADVXw7KObgcJYSWgZBfz9zf7h73ZBYcNMTZAfYVfJ3bL0fpYtHsRATmLk4DVKreTWqbKB5ZCrl5hHd9DNZAk8fAV9gTPa9ihHEK8diBZChoph61HkkYpu6oSGmtf6mTGLTft0sZBNiZBrdVyQjdnLHW8VJE8BinzkJZAhJxFImZAkD',NULL,1,'2021-07-21 14:27:41','2021-08-23 11:11:54',0),(30,2,'osama binladen',0,'[{\"file\": \"https://yt3.ggpht.com/ytc/AKedOLQ_Gun6F8JrDnFLBwP42ILlBoOKVYNSDO9PCw=s800-c-k-c0x00ffffff-no-rj\", \"extension\": \"com/ytc/AKedOLQ_Gun6F8JrDnFLBwP42ILlBoOKVYNSDO9PCw=s800-c-k-c0x00ffffff-no-rj\"}]','UCBFs2WKvYES9h4VVin-6Mkw','1//0eiD3K4TeV7ScCgYIARAAGA4SNwF-L9Ir8JTBXT2VM2eZzVr2TcCI9G9VEPJxLJyMjbUoqAEqD_BnSVvif4I7ms91BLV_-kLHMpo','2021-07-21 15:56:41',1,'2021-07-21 14:56:42','2021-07-21 14:56:42',1),(31,2,'Ngọc Nguyễn',0,'[{\"file\": \"https://yt3.ggpht.com/ytc/AKedOLR_k5ESEuNNnp0u--mI-ptda0laK-qNeUB3JHBV1g=s800-c-k-c0x00ffffff-no-rj\", \"extension\": \"com/ytc/AKedOLR_k5ESEuNNnp0u--mI-ptda0laK-qNeUB3JHBV1g=s800-c-k-c0x00ffffff-no-rj\"}]','UCc_0u3akfvtac8vOM9Kockg','1//0e-qvvONNpVGvCgYIARAAGA4SNwF-L9IrmP-4NhabJfaN3r2vD3CSBRv4zFP8nMMxlZlAvlVRw1RRI84IQmKcmPxEqPWcxzRMdqI','2021-09-01 18:11:07',1,'2021-09-01 17:11:08','2021-09-01 17:11:08',1);
/*!40000 ALTER TABLE `socialchannels` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:18:52
