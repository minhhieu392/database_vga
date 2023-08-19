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
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `documentsCode` varchar(500) DEFAULT NULL COMMENT 'số, ký hiệu',
  `documentsName` varchar(500) DEFAULT NULL,
  `documentGroupsId` bigint(20) DEFAULT 0,
  `descriptions` longtext DEFAULT NULL,
  `views` bigint(20) DEFAULT 0,
  `dateIssued` datetime DEFAULT NULL COMMENT 'ngày ban hành',
  `organizationLevelIssued` varchar(100) DEFAULT NULL COMMENT 'cấp ban hành',
  `organizationIssued` varchar(100) DEFAULT NULL COMMENT 'cơ quan ban hành',
  `signer` varchar(500) DEFAULT NULL COMMENT 'người ký',
  `signDate` datetime DEFAULT NULL COMMENT 'ngày ký',
  `startDate` datetime DEFAULT NULL,
  `userCreatorsId` bigint(20) DEFAULT NULL,
  `dateCreated` datetime DEFAULT current_timestamp(),
  `dateUpdated` datetime DEFAULT current_timestamp(),
  `status` int(11) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `downloads` int(11) DEFAULT 0,
  `files` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`files`)),
  `endDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contents_documentGroupsId_IDX` (`documentGroupsId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (1,'2101/QĐ-TTg2','Công văn số 35/TT-CLT ngày 13 tháng 01 năm 2021 về việc chỉ đạo sản xuất trồng trọt các tỉnh phía Bắc',1,'<p>Theo dự b&aacute;o của Trung t&acirc;m Dự b&aacute;o Kh&iacute; tượng Thủy văn Quốc gia, trong thời gian tới do ảnh hưởng của kh&ocirc;ng kh&iacute; lạnh c&aacute;c tỉnh Bắc Bộ, Bắc Trung Bộ c&oacute; th&ecirc;̉ xảy ra nhiều đợt r&eacute;t đậm, r&eacute;t hại v̀ c&oacute; khả năng xảy ra băng gi&aacute;. Đ&ecirc;̉ sản xuất c&acirc;y trồng an tòn đạt kết quả tốt, Cục Trồng trọt đề nghị Sở N&ocirc;ng nghi&ecirc;̣p v&agrave; PTNT c&aacute;c tỉnh ph&iacute;a Bắc tập trung chỉ đạo c&aacute;c nội dung sau:</p>\n',8,'2021-01-13 18:15:38','Cục Trồng trọt','Cục Trồng trọt','Cục Trồng trọt','2021-01-13 18:15:38','2021-01-13 18:15:38',1,'2022-11-22 17:08:35','2022-12-22 14:33:03',1,'cong-van-so-35ttclt-ngay-13-thang-01-nam-2021-ve-viec-chi-dao-san-xuat-trong-trot-cac-tinh-phia-bac',5,'[]','2022-12-23 14:28:36'),(5,'test03','Công văn số 35/TT-CLT ngày 13 tháng 01 năm 2021 về việc chỉ đạo sản xuất trồng trọt các tỉnh phía Bắc',1,'<p>Theo dự b&aacute;o của Trung t&acirc;m Dự b&aacute;o Kh&iacute; tượng Thủy văn Quốc gia, trong thời gian tới do ảnh hưởng của kh&ocirc;ng kh&iacute; lạnh c&aacute;c tỉnh Bắc Bộ, Bắc Trung Bộ c&oacute; th&ecirc;̉ xảy ra nhiều đợt r&eacute;t đậm, r&eacute;t hại v̀ c&oacute; khả năng xảy ra băng gi&aacute;. Đ&ecirc;̉ sản xuất c&acirc;y trồng an tòn đạt kết quả tốt, Cục Trồng trọt đề nghị Sở N&ocirc;ng nghi&ecirc;̣p v&agrave; PTNT c&aacute;c tỉnh ph&iacute;a Bắc tập trung chỉ đạo c&aacute;c nội dung sau:</p>\n',4,'2021-01-13 18:15:38','Cục Trồng trọt','Cục Trồng trọt','Cục Trồng trọt','2021-01-13 18:15:38','2022-12-22 22:32:07',1,'2022-12-14 10:12:26','2022-12-22 14:30:15',1,'cong-van-so-35ttclt-ngay-13-thang-01-nam-2021-ve-viec-chi-dao-san-xuat-trong-trot-cac-tinh-phia-bac-3',6,'[{\"files\":\"userfiles/adminadmin/files/20221221/2022_12_21_22_29_44_193_phanmembanhangwpro201.xlsm\",\"extension\":\"xlsm\"},{\"files\":\"userfiles/adminadmin/files/20221221/2022_12_21_22_29_52_216_phanmembanhangwpro201.xlsm\",\"extension\":\"xlsm\"}]','2022-12-25 22:32:09'),(6,'test05','Công văn số 35/TT-CLT ngày 13 tháng 01 năm 2021 về việc chỉ đạo sản xuất trồng trọt các tỉnh phía Bắc2',1,'<p>Theo dự b&aacute;o của Trung t&acirc;m Dự b&aacute;o Kh&iacute; tượng Thủy văn Quốc gia, trong thời gian tới do ảnh hưởng của kh&ocirc;ng kh&iacute; lạnh c&aacute;c tỉnh Bắc Bộ, Bắc Trung Bộ c&oacute; th&ecirc;̉ xảy ra nhiều đợt r&eacute;t đậm, r&eacute;t hại v̀ c&oacute; khả năng xảy ra băng gi&aacute;. Đ&ecirc;̉ sản xuất c&acirc;y trồng an tòn đạt kết quả tốt, Cục Trồng trọt đề nghị Sở N&ocirc;ng nghi&ecirc;̣p v&agrave; PTNT c&aacute;c tỉnh ph&iacute;a Bắc tập trung chỉ đạo c&aacute;c nội dung sau:</p>\n',56,'2021-01-13 18:15:38','ds','Cục Trồng trọt','Cục Trồng trọt','2021-01-13 18:15:38','2022-12-15 22:44:57',1,'2022-12-14 11:31:14','2022-12-22 14:32:42',1,'cong-van-so-35ttclt-ngay-13-thang-01-nam-2021-ve-viec-chi-dao-san-xuat-trong-trot-cac-tinh-phia-bac2',5,'[{\"files\":\"userfiles/adminadmin/files/20221222/2022_12_22_14_32_15_400_5a1feaa5359b4d90adfa1a683a659b33cvphngchngrtchocytrongnongnghiepngay1312021banhanh1.pdf\",\"extension\":\"pdf\"}]','2022-12-10 22:44:58'),(7,'1584/TT-CCN','Công văn số 1584/TT-CCN ngày 13/12/2019 của Cục Trồng trọt về việc khắc phục thiệt hại cà phê bị sương muối gửi Sở NN&PTNT các tỉnh Tây Bắc',2,'<p><em>Đợt r&eacute;t đậm, r&eacute;t hại vừa qua đ&atilde; g&acirc;y thiệt hại đ&aacute;ng kể cho sản xuất n&ocirc;ng nghiệp&nbsp; tại c&aacute;c tỉnh T&acirc;y Bắc, trong đ&oacute; một&nbsp; số diện t&iacute;ch c&agrave; ph&ecirc; đ&atilde; xuất&nbsp; hiện hiện tượng ch&aacute;y l&aacute;, chết c&agrave;nh ảnh hưởng đến sản lượng c&agrave; ph&ecirc; ni&ecirc;n vụ tiếp theo. Cục Trồng&nbsp; trọt đề nghị Sở N&ocirc;ng&nbsp; nghiệp v&agrave; Ph&aacute;t&nbsp; triển n&ocirc;ng th&ocirc;n c&aacute;c tỉnh T&acirc;y&nbsp; Bắc c&oacute; diện t&iacute;ch c&agrave; ph&ecirc; chỉ đạo triển khai một số biện ph&aacute;p sau:</em></p>\n\n<p><br />\n<em>&nbsp;</em></p>\n\n<p>Nội dung C&ocirc;ng văn (theo file đ&iacute;nh k&egrave;m)</p>\n',7,'2022-12-15 15:53:09','','','','2022-12-13 15:53:01','2023-01-01 15:53:14',1,'2022-12-22 15:54:17','2022-12-22 15:54:17',1,'cong-van-so-1584ttccn-ngay-13122019-cua-cuc-trong-trot-ve-viec-khac-phuc-thiet-hai-ca-phe-bi-suong-muoi-gui-so-nnptnt-cac-tinh-tay-bac',0,'[{\"files\":\"userfiles/adminadmin/files/20221222/2022_12_22_15_54_3_167_5e6c68653f2c45dbbfe6fff62b817ccccvkhcphcthithicphbsngmui.pdf\",\"extension\":\"pdf\"}]','2026-02-01 15:53:41'),(8,'1252/TT-VPPN','Công văn số 1252/TT-VPPN ngày 15/10/2019 về việc chỉ đạo triển khai sản xuất vụ Đông Xuân 2019-2020 vùng Nam bộ gửi Sở NN&PTNT các tỉnh, thành Đông Nam bộ và đồng bằng sông Cửu Long',1,'',6,'2022-12-22 15:55:44','','','','2022-12-22 15:55:42','2022-12-22 15:55:46',1,'2022-12-22 15:56:27','2022-12-22 15:56:38',1,'cong-van-so-1252ttvppn-ngay-15102019-ve-viec-chi-dao-trien-khai-san-xuat-vu-dong-xuan-20192020-vung-nam-bo-gui-so-nnptnt-cac-tinh-thanh-dong-nam-bo-va-dong-bang-song-cuu-long',1,'[{\"files\":\"userfiles/adminadmin/files/20221222/2022_12_22_15_56_3_752_6fb449a26a81411881738a87d8ace721nidungcngvn1252.pdf\",\"extension\":\"pdf\"}]','2026-01-11 15:55:48'),(9,'750/TT-CLT','Công văn số 750/TT-CLT ngày 21/6/2019 của Cục Trồng trọt về việc gieo cấy, chăm sóc lúa vụ Hè Thu, Mùa 2019 gửi Sở Nông nghiệp và PTNT các tỉnh, thành phía Bắc',2,'<p><em>Theo dự b&aacute;o của Trung t&acirc;m Dự b&aacute;o Kh&iacute; tượng Thủy văn Quốc gia, trạng thái thời ti&ecirc;́t đang ở giai đoạn ENSO, nhiệt độ trung b&igrave;nh từ th&aacute;ng 7-10/2019 tr&ecirc;n phạm vi to&agrave;n quốc phổ biến ở mức cao hơn trung b&igrave;nh nhiều năm (TBNN) c&ugrave;ng thời kỳ khoảng 0,5 - 1,0<sup>0</sup>C. Ri&ecirc;ng khu vực Bắc bộ v&agrave; Bắc Trung bộ th&aacute;ng 11 - 12/2019 ở mức cao hơn so với TBNN từ 1,0 - 1,5 độ. Từ nay đến th&aacute;ng 8/2019 c&ograve;n xảy ra nắng n&oacute;ng v&agrave; c&oacute; khả năng tập trung nhiều hơn v&agrave;o nửa cuối th&aacute;ng 6 - 7/2019 tại khu vực Bắc bộ v&agrave; Trung bộ.</em></p>\n\n<p>&nbsp;Tổng lượng mưa từ th&aacute;ng 7 - 8/2019 phổ biến ở mức cao hơn so với TBNN từ 10 - 30%, ri&ecirc;ng th&aacute;ng 9 thấp hơn TBNN khoảng từ 10 - 25%, từ th&aacute;ng 10 - 12 ở mức xấp xỉ so với TBNN cùng thời kỳ. Như v&acirc;̣y thời ti&ecirc;́t vụ mùa và đ&acirc;̀u vụ đ&ocirc;ng có xu th&ecirc;́ nắng nóng, mưa lớn t&acirc;̣p trung đ&acirc;̀u vụ, kèm theo các hi&ecirc;̣n tượng b&acirc;́t thường, l&ecirc;̣ch quy lu&acirc;̣t.<br />\n&nbsp;Để sản xuất vụ H&egrave; Thu, vụ M&ugrave;a đạt thắng lợi, Cục Tr&ocirc;̀ng trọt đ&ecirc;̀ nghị Sở N&ocirc;ng nghi&ecirc;̣p và PTNT c&aacute;c tỉnh, th&agrave;nh ph&iacute;a Bắc t&acirc;̣p trung chỉ đạo một số nội dung sau:<br />\n<strong>1. Với khu vực Bắc Trung b&ocirc;̣</strong><br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Với diện t&iacute;ch l&uacute;a vụ Hè Thu đ&atilde; gieo sạ, cấy ở nơi có đi&ecirc;̀u ki&ecirc;̣n cần đảm bảo bơm, tưới đủ nước tr&ecirc;n mặt ruộng, b&oacute;n b&ocirc;̉ sung l&acirc;n đ&ecirc;̉ tăng khả năng ch&ocirc;́ng hạn của c&acirc;y, di&ecirc;̣n tích đủ nước bón thúc kịp thời khi lúa bắt đ&acirc;̀u đẻ nhánh.<br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Di&ecirc;̣n tích bị hạn, kh&ocirc;ng đủ nước tưới, khó tưới c&acirc;̀n chuy&ecirc;̉n đ&ocirc;̉i sang các c&acirc;y màu như: vừng, đ&acirc;̣u xanh, đ&acirc;̣u đen,&hellip;<br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Các ch&acirc;n ru&ocirc;̣ng còn lại, kh&acirc;̉n trương làm đ&acirc;́t và gieo c&acirc;́y lúa vụ Mùa, khuy&ecirc;́n cáo n&ocirc;ng d&acirc;n sử dụng các gi&ocirc;́ng ngắn ngày, ch&ocirc;́ng chịu t&ocirc;́t với s&acirc;u b&ecirc;̣nh hại, đặc bi&ecirc;̣t bạc lá. Kh&ocirc;ng gieo c&acirc;́y các gi&ocirc;́ng lúa m&acirc;̃n cảm với bạc lá ở vùng đ&acirc;́t trũng, h&acirc;̉u.<br />\n<strong>2. C&aacute;c tỉnh Đ&ocirc;̀ng bằng s&ocirc;ng H&ocirc;̀ng và Trung du mi&ecirc;̀n núi phía Bắc</strong><br />\n- T&acirc;̣p trung cao đ&ocirc;̣ cho c&ocirc;ng tác làm đ&acirc;́t, cày l&acirc;̣t vùi rơm rạ và sử dụng ch&ecirc;́ ph&acirc;̉m Trichoderma, các ch&ecirc;́ ph&acirc;̉m ph&acirc;n hủy xác hữu cơ đã được khuy&ecirc;́n cáo, phun trước khi l&ocirc;̀ng vùi, giữ nước n&ocirc;ng mặt ru&ocirc;̣ng đ&ecirc;̉ tránh ng&ocirc;̣ đ&ocirc;̣c hữu cơ cho lúa sau c&acirc;́y.<br />\n- Kh&acirc;̉n trương gieo c&acirc;́y trà lúa Mùa sớm, đ&acirc;̉y nhanh thời vụ trà lúa Mùa còn lại đ&ecirc;̉ lúa kịp thời sinh trướng, đẻ nhánh và vươn cao, tránh ng&acirc;̣p úng khi gặp mưa lớn vào tháng 7. Trà lúa Mùa cực sớm k&ecirc;́t thúc gieo c&acirc;́y trong tháng 6, các trà lúa còn lại n&ecirc;n k&ecirc;́t thúc gieo c&acirc;́y trước 20/7, ưu ti&ecirc;n c&acirc;́y từ ch&acirc;n th&acirc;́p trũng trước. Hạn ch&ecirc;́ gieo sạ, gieo vãi, chỉ gieo sạ ở vùng đ&acirc;́t vàn, vàn cao, chủ đ&ocirc;̣ng tưới ti&ecirc;u và được khoanh vùng. Thời vụ gieo sạ k&ecirc;́t thúc trước 5/7/2019.<br />\n- Chăm sóc và bảo v&ecirc;̣ di&ecirc;̣n tích mạ đã gieo, bón nhử đ&ecirc;̉ r&ecirc;̃ mạ ăn l&ecirc;n trước c&acirc;́y 4 - 5 ngày bằng ph&acirc;n b&oacute;n NPK hàm lượng cao đ&ecirc;̉ có b&ocirc;̣ lá cứng, mạ đanh dảnh, hạn ch&ecirc;́ thúc bằng đạm đơn, lá non, mỏng d&ecirc;̃ bị thi&ecirc;̣t hại n&ecirc;́u gặp nắng nóng.<br />\n<strong>3. Bi&ecirc;̣n pháp kỹ thu&acirc;̣t và thủy lợi</strong><br />\n- Bón lót ph&acirc;n b&oacute;n NPK h&ocirc;̃ hợp hoặc phức hợp chuy&ecirc;n dụng theo khuy&ecirc;́n cáo, bón lót s&acirc;u trước bừa l&ocirc;̀ng l&acirc;̀n cu&ocirc;́i đ&ecirc;̉ ph&acirc;n được vùi trong đ&acirc;́t, tránh bay hơi, rửa tr&ocirc;i, lãng phí ph&acirc;n bón.<br />\n- C&acirc;́y với m&acirc;̣t đ&ocirc;̣ thích hợp, tăng cường sử dụng mạ khay, máy c&acirc;́y.<br />\n- Củng c&ocirc;́ bờ bao, khơi th&ocirc;ng hệ thống k&ecirc;nh mương nội đồng v&agrave; c&aacute;c đầu kh&acirc;u, đầu cống, sẵn s&agrave;ng ti&ecirc;u nước nếu gặp mưa &uacute;ng sau gieo cấy, giữ nước n&ocirc;ng mặt ru&ocirc;̣ng, tháo cạn nước đ&ecirc;̣m ở những vùng có đi&ecirc;̀u ki&ecirc;̣n, nh&acirc;́t là trước các đợt dự báo có mưa lớn.<br />\n<strong>4.</strong>&nbsp;Chuẩn bị đủ lượng giống l&uacute;a ngắn ng&agrave;y dự ph&ograve;ng, kịp thời gieo bổ sung nếu diện t&iacute;ch l&uacute;a mới gieo, cấy bị thiệt hại do ngập &uacute;ng.<br />\n<strong>5.</strong>&nbsp;Tăng cường c&ocirc;ng t&aacute;c thanh tra, kiểm tra thị trường về giống, ph&acirc;n b&oacute;n, thuốc bảo vệ thực vật để hạn chế tối đa h&agrave;ng giả, h&agrave;ng k&eacute;m chất lượng g&acirc;y thiệt hại cho n&ocirc;ng d&acirc;n, xử l&yacute; nghi&ecirc;m c&aacute;c trường hợp vi phạm.<br />\nTr&ecirc;n đ&acirc;y l&agrave; một số nội dung cần chỉ đạo để thực hiện tốt kế hoạch sản xuất l&uacute;a vụ H&egrave; Thu, vụ M&ugrave;a 2019. Đề nghị Sở N&ocirc;ng nghiệp v&agrave; PTNT c&aacute;c tỉnh, th&agrave;nh ph&iacute;a Bắc triển khai thực hiện nghi&ecirc;m t&uacute;c, theo d&otilde;i chặt chẽ t&igrave;nh h&igrave;nh v&agrave; b&aacute;o c&aacute;o kịp thời về Bộ N&ocirc;ng nghiệp v&agrave; PTNT để thống nhất chỉ đạo./.</p>\n',4,'2022-12-22 15:57:43','','','','2022-12-22 15:57:41','2022-12-22 15:57:44',1,'2022-12-22 15:57:42','2022-12-22 15:57:42',1,'cong-van-so-750ttclt-ngay-2162019-cua-cuc-trong-trot-ve-viec-gieo-cay-cham-soc-lua-vu-he-thu-mua-2019-gui-so-nong-nghiep-va-ptnt-cac-tinh-thanh-phia-bac',0,'[]','2022-12-22 15:57:46'),(10,'581/TT-CLT','Công văn số 581/TT-CLT ngày 20/5/2019 của Cục Trồng trọt về việc tăng cường chỉ đạo sản xuất cuối vụ Đông Xuân 2018 - 2019 và Kế hoạch sản xuất vụ Hè Thu, vụ Mùa 2019 gửi Sở Nông nghiệp và PTNT các tỉnh, thành phía Bắc.',2,'',5,'2022-12-22 15:58:19','','','','2022-12-22 15:58:17','2022-12-22 15:58:20',1,'2022-12-22 15:59:31','2023-01-03 11:40:49',1,'cong-van-so-581ttclt-ngay-2052019-cua-cuc-trong-trot-ve-viec-tang-cuong-chi-dao-san-xuat-cuoi-vu-dong-xuan-2018-2019-va-ke-hoach-san-xuat-vu-he-thu-vu-mua-2019-gui-so-nong-nghiep-va-ptnt-cac-tinh-thanh-phia-bac',2,'[{\"files\":\"userfiles/adminadmin/files/20221222/2022_12_22_15_58_19_609_6fb449a26a81411881738a87d8ace721nidungcngvn1252.pdf\",\"extension\":\"pdf\"}]',NULL),(11,'4632-QĐ-BNN-KHCN','Quyết định Phê duyệt Kế hoạch ứng dụng công nghệ thông tin, phát triển Chính phủ số và bảo đảm an toàn thông tin mạng của Bộ Nông nghiệp và Phát triển nông thôn giai đoạn 2021-2025',6,'',14,'2020-11-16 00:00:00','Bộ','Bộ NN&PTNT','Thứ trưởng Hà Công Tuấn','2020-11-16 00:00:00','2020-11-16 00:00:00',29,'2023-01-03 16:49:57','2023-01-03 16:49:57',1,'quyet-dinh-phe-duyet-ke-hoach-ung-dung-cong-nghe-thong-tin-phat-trien-chinh-phu-so-va-bao-dam-an-toan-thong-tin-mang-cua-bo-nong-nghiep-va-phat-trien-nong-thon-giai-doan-20212025',8,'[{\"files\":\"userfiles/admin_qtdl/files/20230103/2023_01_03_16_49_55_541_14632qbnnkhcn16112020qpheduyetkhudcnttphattriencpsovdambaoantoanttmangcuabonn20212025.pdf\",\"extension\":\"userfiles/admin_qtdl/files/20230103/2023_01_03_16_49_55_541_14632qbnnkhcn16112020qpheduyetkhudcnttphattriencpsovdambaoantoanttmangcuabonn20212025.pdf\"}]',NULL);
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
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