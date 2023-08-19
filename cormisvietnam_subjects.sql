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
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subjectsName` varchar(200) DEFAULT NULL,
  `descriptions` text DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `videoLink` varchar(500) DEFAULT NULL,
  `userCreatorsId` bigint(20) DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateUpdated` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `languagesId` bigint(20) DEFAULT 1,
  `parentId` bigint(20) DEFAULT 0,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='bộ môn học';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (34,'Dạy yoga có hướng dẫn','<p><img alt=\"Tìm hiểu về yoga: lợi ích, nguồn gốc, triết lý và tư thế tập luyện\" data-src=\"https://storage.googleapis.com/leep_app_website/2020/05/image6-6-e1589689908434.png\" data-was-processed=\"true\" src=\"https://storage.googleapis.com/leep_app_website/2020/05/image6-6-e1589689908434.png\" /></p>\n\n<p>&nbsp;\n<div>\n<div class=\"content-blog line-height-lg text-component v-space-md\">\n<p><strong>Bạn nghe n&oacute;i rất nhiều về yoga v&agrave; đang c&oacute; &yacute; định tập thử nhưng chưa biết bắt đầu từ đ&acirc;u? C&ugrave;ng t&igrave;m hiểu kiến thức cơ bản cho việc tập luyện yoga v&agrave; lợi &iacute;ch mang lại cho sức khoẻ v&agrave; t&acirc;m tr&iacute; nh&eacute;!</strong></p>\n\n<h2>Yoga l&agrave; bộ m&ocirc;n thể thao g&igrave;?</h2>\n\n<p><a data-wpel-link=\"internal\" href=\"https://leep.app/blog/yoga/tim-hieu-ve-yoga-hieu-dung-de-tap-chuan.html\" rel=\"noopener\" target=\"_blank\">Yoga l&agrave; g&igrave;?</a> Đ&acirc;y l&agrave; chuỗi c&aacute;c động t&aacute;c luyện tập gi&uacute;p kết nối cơ thể, t&acirc;m tr&iacute;, tinh thần th&ocirc;ng qua việc kiểm so&aacute;t c&aacute;c tư thế, hơi thở v&agrave; thiền định. Đ&acirc;y l&agrave; bộ m&ocirc;n thể thao cổ xưa c&oacute; nguồn gốc từ Ấn Độ từ khoảng 5.000 năm trước.</p>\n\n<p>Luyện tập yoga thường xuy&ecirc;n gi&uacute;p bạn tạo nền tảng x&acirc;y dựng c&aacute;c th&oacute;i quen tốt, chẳng hạn như kỷ luật, tự gi&aacute;c v&agrave; kh&ocirc;ng phụ thuộc. Yoga cũng l&agrave; c&aacute;ch gi&uacute;p bạn đưa ra những lựa chọn ph&ugrave; hợp nhất để sống một cuộc sống khỏe mạnh v&agrave; trọn vẹn hơn.</p>\n\n<p>Ở Việt Nam, mặc d&ugrave; chỉ mới du nhập trong thời gian gần đ&acirc;y nhưng yoga hiện đang nhận được rất nhiều lời đ&aacute;nh gi&aacute; t&iacute;ch cực về những <a data-wpel-link=\"internal\" href=\"https://leep.app/blog/yoga/9-loi-ich-cua-yoga-doi-voi-suc-khoe-phu-nu.html\" rel=\"noopener\" target=\"_blank\">lợi &iacute;ch sức khỏe</a> m&agrave; n&oacute; mang lại. Nhiều nghi&ecirc;n cứu đ&atilde; chứng minh yoga thật sự c&oacute; thể gi&uacute;p kiểm so&aacute;t căng thẳng, giảm trầm cảm, lo lắng, cải thiện t&acirc;m trạng v&agrave; gi&uacute;p ngủ ngon hơn.</p>\n\n<p>Kh&ocirc;ng những vậy, yoga c&ograve;n được chứng minh l&agrave; c&oacute; khả năng tăng cường sự linh hoạt, cải thiện khả năng c&acirc;n bằng, phối hợp của cơ thể. Ngo&agrave;i ra, n&oacute; c&ograve;n gi&uacute;p giảm đau v&agrave; tăng cường sức mạnh. Mời bạn c&ugrave;ng t&igrave;m hiểu chi tiết về lợi &iacute;ch của Yoga:</p>\n\n<h2>Lợi &iacute;ch của yoga đối với sức khỏe khi luyện tập thường xuy&ecirc;n</h2>\n\n<p>X&atilde; hội ng&agrave;y c&agrave;ng văn minh, hiện đại, nhịp sống của ch&uacute;ng ta cũng ng&agrave;y một nhanh hơn, điều n&agrave;y khiến t&acirc;m tr&iacute; v&agrave; hệ thần kinh bị k&iacute;ch th&iacute;ch li&ecirc;n tục. Yoga sẽ cung cấp kh&ocirc;ng gian để l&agrave;m chậm t&acirc;m tr&iacute; v&agrave; gi&uacute;p ch&uacute;ng ta kh&ocirc;i phục cảm gi&aacute;c c&acirc;n bằng.</p>\n\n<p><img alt=\"tập yoga\" data-src=\"https://storage.googleapis.com/leep_app_website/2020/05/MAN_7426-2.jpg\" data-srcset=\"https://leep.imgix.net/2020/05/MAN_7426-2.jpg?auto=compress&amp;fit=scale&amp;fm=pjpg&amp;h=200&amp;ixlib=php-1.2.1&amp;w=300&amp;wpsize=medium 300w, https://storage.googleapis.com/leep_app_website/2020/05/MAN_7426-2.jpg 750w\" data-was-processed=\"true\" height=\"500\" loading=\"lazy\" sizes=\"(max-width: 750px) 100vw, 750px\" src=\"https://storage.googleapis.com/leep_app_website/2020/05/MAN_7426-2.jpg\" srcset=\"https://leep.imgix.net/2020/05/MAN_7426-2.jpg?auto=compress&amp;fit=scale&amp;fm=pjpg&amp;h=200&amp;ixlib=php-1.2.1&amp;w=300&amp;wpsize=medium 300w, https://storage.googleapis.com/leep_app_website/2020/05/MAN_7426-2.jpg 750w\" width=\"750\" /></p>\n\n<p style=\"text-align:center\"><em>Tập yoga gi&uacute;p tăng độ dẻo dai, sự linh hoạt của cơ thể</em></p>\n\n<p>Trong năm 2016, tạp ch&iacute; Yoga v&agrave; Hiệp hội Yoga đ&atilde; tiến h&agrave;nh một nghi&ecirc;n cứu ở Mỹ v&agrave; nhận thấy rằng 36,7 triệu người đang tập yoga, tăng 50% so với năm 2012. Mặc d&ugrave; vẫn chưa l&yacute; giải ch&iacute;nh x&aacute;c được nguy&ecirc;n nh&acirc;n dẫn đến sự b&ugrave;ng nổ n&agrave;y, nhưng theo c&aacute;c chuy&ecirc;n gia, điều n&agrave;y c&oacute; thể l&agrave; do những&nbsp;<a data-wpel-link=\"internal\" href=\"https://leep.app/blog/yoga/kham-pha-nhung-loi-ich-cua-yoga-dem-lai-cho-suc-khoe.html\" rel=\"noopener noreferrer\" target=\"_blank\">lợi &iacute;ch của yoga</a>&nbsp;đối với sức khỏe:</p>\n\n<ul>\n	<li>Tăng cường tuần ho&agrave;n m&aacute;u của cơ thể</li>\n	<li>Tăng cường hệ miễn dịch</li>\n	<li>Gi&uacute;p cơ thể đ&agrave;o thải độc tố</li>\n	<li>Chống l&atilde;o h&oacute;a</li>\n	<li>Bảo vệ v&agrave; gi&uacute;p cột sống chắc khỏe</li>\n	<li>Tăng cường sức khỏe xương khớp</li>\n	<li>Hỗ trợ<a data-wpel-link=\"internal\" href=\"https://leep.app/blog/yoga/4-tu-the-tap-yoga-giup-giam-can-hieu-qua.html\" rel=\"noopener\" target=\"_blank\"> giảm c&acirc;n to&agrave;n th&acirc;n</a></li>\n</ul>\n\n<p>Kh&ocirc;ng chỉ c&oacute; lợi cho thể chất, tập yoga thường xuy&ecirc;n sẽ gi&uacute;p bạn giảm stress, cải thiện giấc ngủ, tăng khả năng tập trung của t&acirc;m tr&iacute; th&ocirc;ng qua c&aacute;c b&agrave;i tập thở, thiền định. Yoga mang đến nhiều lợi &iacute;ch như thế nhưng bạn c&oacute; biết, loại h&igrave;nh n&agrave;y lại bắt nguồn từ việc luyện tập khắc nghiệt c&oacute; nguồn gốc từ Ấn Độ.</p>\n\n<p><strong>&gt;&gt;&gt; Xem th&ecirc;m:</strong> 10 dấu hiệu cho thấy bạn <a data-wpel-link=\"internal\" href=\"https://leep.app/blog/yoga/10-dau-hieu-cho-thay-ban-nen-hoc-yoga-ngay-hom-nay.html\" rel=\"noopener\" target=\"_blank\">n&ecirc;n học yoga</a> ngay h&ocirc;m nay</p>\n\n<p>10 l&yacute; do khiến bộ m&ocirc;n <a data-wpel-link=\"internal\" href=\"https://leep.app/blog/yoga/10-ly-do-khien-bo-mon-yoga-phu-hop-voi-tat-ca-moi-nguoi.html\" rel=\"noopener\" target=\"_blank\">yoga ph&ugrave; hợp cho tất cả mọi người</a></p>\n\n<h2>Nguồn gốc của yoga</h2>\n\n<p>Theo cuốn yoga sutra của nh&agrave; hiền triết Patanjali,&nbsp; yoga được định nghĩa l&agrave; &ldquo;khả năng chấm dứt việc suy nghĩ lang mang của t&acirc;m tr&iacute;&rdquo;. Trong quyển s&aacute;ch n&agrave;y, yoga được chia th&agrave;nh 8 con đường luyện tập kh&aacute;c nhau:</p>\n\n<ul>\n	<li>Yamas &ndash; Tiết chế</li>\n	<li>Niyamas &ndash; Quy tắc ứng xử</li>\n	<li>Asana &ndash; Tư thế</li>\n	<li>Pranayama&nbsp; &ndash; Kiểm so&aacute;t hơi thở</li>\n	<li>Pratyahara &ndash; L&agrave;m chủ cảm x&uacute;c</li>\n	<li>Dharana &ndash; Tập trung</li>\n	<li>Dhyani &ndash; Thiền định</li>\n	<li>Samadhi &ndash; Trạng th&aacute;i ph&uacute;c lạc</li>\n</ul>\n\n<p>Ng&agrave;y nay, Asana yoga được ch&uacute; trọng nhiều nhất trong 8 nh&aacute;nh yoga tr&ecirc;n. Asana yoga được ph&aacute;t triển v&agrave;o đầu thế kỷ 20 bởi Sri Tirumalai Krishnamacharya.&nbsp; Sau đ&oacute;, ba học tr&ograve; nổi tiếng nhất của &ocirc;ng đ&atilde; ph&aacute;t triển th&ecirc;m c&aacute;c phong c&aacute;ch yoga đặc biệt kh&aacute;c. Mỗi phong c&aacute;ch đều c&oacute; những đặc điểm v&agrave; lợi &iacute;ch kh&aacute;c nhau.</p>\n\n<p>Nh&igrave;n chung, yoga l&agrave; bộ m&ocirc;n c&oacute; lịch sử l&acirc;u đời v&agrave; trải qua rất nhiều giai đoạn ph&aacute;t triển. Thế nhưng, d&ugrave; ở giai đoạn n&agrave;o mục ti&ecirc;u ch&iacute;nh của yoga vẫn l&agrave; gi&uacute;p người tập tăng cường sức mạnh từ thể chất đến tinh thần.</p>\n\n<h2>C&aacute;c loại h&igrave;nh triết l&yacute; yoga</h2>\n\n<p>Yoga c&oacute; nhiều loại v&agrave; b&agrave;i tập kh&aacute;c nhau, mỗi loại sẽ mang những đặc trưng ri&ecirc;ng. Do đ&oacute;, bạn cần t&igrave;m hiểu kỹ về c&aacute;c <a data-wpel-link=\"internal\" href=\"https://leep.app/blog/yoga/hieu-ro-8-loai-yoga-de-lua-chon-tap-luyen-dung-dan.html\" rel=\"noopener\" target=\"_blank\">loại yoga</a> để c&oacute; thể đưa ra một lựa chọn ph&ugrave; hợp.</p>\n\n<ul>\n	<li><strong>Hatha yoga: </strong>C&aacute;c <a data-wpel-link=\"internal\" href=\"https://leep.app/blog/yoga/6-bai-tap-hatha-yoga-nguoi-moi-bat-dau-khong-the-bo-qua.html\" rel=\"noopener\" target=\"_blank\">b&agrave;i tập hatha yoga</a> rất ph&ugrave; hợp với người mới bắt đầu tập v&igrave; c&aacute;c động t&aacute;c di chuyển chậm hơn so với những loại h&igrave;nh kh&aacute;c.</li>\n	<li><strong>Vinyasa, ashtanga v&agrave; power yoga:</strong> Những loại h&igrave;nh yoga n&agrave;y sẽ c&oacute; mức độ &ldquo;thử th&aacute;ch&rdquo; cao hơn so với <a data-wpel-link=\"internal\" href=\"https://leep.app/blog/yoga/hatha-yoga-la-gi-an-so-voi-nguoi-moi-tap-yoga.html\" rel=\"noopener noreferrer\" target=\"_blank\">Hatha yoga</a>. Tuy nhi&ecirc;n, độ kh&oacute; sẽ phụ thuộc v&agrave;o gi&aacute;o vi&ecirc;n hướng dẫn của bạn.</li>\n	<li><strong>Iyengar yoga:</strong> Gồm c&aacute;c động t&aacute;c được thực hiện chậm r&atilde;i, với nhiều chi tiết. Loại h&igrave;nh n&agrave;y tập trung v&agrave;o chi tiết của từng tư thế, sự điều chỉnh cơ thể v&agrave; c&oacute; sử dụng c&aacute;c dụng cụ yoga hỗ trợ.</li>\n	<li><strong>Bikram hay hot yoga:</strong> Gồm hai kỹ thuật thở v&agrave; 26 tư thế lặp lại theo thứ tự trong 90 ph&uacute;t, kết hợp với m&ocirc;i trường tập luyện ở nhiệt độ cao khoảng từ 35 &ndash; 40 độ C. Tuy nhi&ecirc;n một số người nhạy cảm với nhiệt độ hoặc đang gặp phải một số vấn đề về sức khỏe c&oacute; thể thấy hot yoga kh&ocirc;ng thoải m&aacute;i.</li>\n	<li><strong><a data-wpel-link=\"internal\" href=\"https://leep.app/blog/yoga/kundalini-yoga-la-gi-thac-mac-se-duoc-leep-app-giai-dap.html\" rel=\"noopener\" target=\"_blank\">Kundalini yoga</a>:</strong> Thường được sử dụng như một loại yoga chữa bệnh. Loại h&igrave;nh yoga n&agrave;y c&oacute; sự kết hợp giữa thiền, tụng kinh v&agrave; c&aacute;c yếu tố t&acirc;m linh.</li>\n	<li><strong>Viniyoga: </strong>Loại h&igrave;nh yoga n&agrave;y tập trung v&agrave;o qu&aacute; tr&igrave;nh h&iacute;t thở v&agrave; thiền định. Viniyoga ph&ugrave; hợp với những người bị giới hạn trong việc vận động, những người muốn luyện tập từ trong ra ngo&agrave;i, những người muốn trải nghiệm cảm gi&aacute;c thư gi&atilde;n, muốn nhận thức r&otilde; hơn về cơ thể v&agrave; tư thế.</li>\n	<li><strong>Jivanmukti:</strong> L&agrave; một chuỗi c&aacute;c động t&aacute;c kết hợp thiền, đồng cảm, tụng kinh v&agrave; lắng nghe.&nbsp; Jivanmukti ph&ugrave; hợp với những người muốn kết hợp yếu tố t&acirc;m linh v&agrave; gi&aacute;o l&yacute; cổ xưa của yoga v&agrave;o trong qu&aacute; tr&igrave;nh luyện tập.</li>\n	<li><strong>Yin</strong>: Một chuỗi c&aacute;c động t&aacute;c chủ yếu ở tư thế nằm v&agrave; ngồi, mỗi tư thế được giữ y&ecirc;n từ 3 &ndash; 5 ph&uacute;t. Loại h&igrave;nh yoga n&agrave;y ph&ugrave; hợp với những người bị đau mạn t&iacute;nh, căng cơ hoặc trầm cảm. <a data-wpel-link=\"internal\" href=\"https://leep.app/blog/yoga/yin-yoga-loi-ich-va-nhung-trai-nghiem-ma-ban-co-the-chua-biet.html\" rel=\"noopener noreferrer\" target=\"_blank\" title=\"Yin yoga\">Yin yoga</a>&nbsp;c&oacute; t&aacute;c dụng giải ph&oacute;ng căng thẳng, t&aacute;i tạo, trẻ h&oacute;a phạm vi hoạt động của c&aacute;c cơ v&agrave; m&ocirc; li&ecirc;n kết.</li>\n	<li><strong>Restorative:</strong> Gồm c&aacute;c tư thế rất nhẹ nh&agrave;ng được giữ y&ecirc;n trong 10 ph&uacute;t c&ugrave;ng với sự hỗ trợ của c&aacute;c dụng cụ tập yoga như chăn, đệm v&agrave; d&acirc;y đai. Tương tự như yin yoga, loại h&igrave;nh yoga n&agrave;y c&oacute; t&aacute;c dụng l&agrave;m dịu hệ thần kinh, ph&ugrave; hợp với những người bị đau mạn t&iacute;nh, trầm cảm.</li>\n</ul>\n\n<p><img alt=\"các loại hình yoga\" data-src=\"https://storage.googleapis.com/leep_app_website/2020/05/image3-6-e1589690452377.jpg\" data-srcset=\"https://leep.imgix.net/2020/05/image3-6-e1589690452377.jpg?auto=compress&amp;fit=scale&amp;fm=pjpg&amp;h=228&amp;ixlib=php-1.2.1&amp;w=300&amp;wpsize=medium 300w, https://storage.googleapis.com/leep_app_website/2020/05/image3-6-e1589690452377.jpg 750w\" data-was-processed=\"true\" height=\"570\" loading=\"lazy\" sizes=\"(max-width: 750px) 100vw, 750px\" src=\"https://storage.googleapis.com/leep_app_website/2020/05/image3-6-e1589690452377.jpg\" srcset=\"https://leep.imgix.net/2020/05/image3-6-e1589690452377.jpg?auto=compress&amp;fit=scale&amp;fm=pjpg&amp;h=228&amp;ixlib=php-1.2.1&amp;w=300&amp;wpsize=medium 300w, https://storage.googleapis.com/leep_app_website/2020/05/image3-6-e1589690452377.jpg 750w\" width=\"750\" /></p>\n\n<h2>&nbsp;</h2>\n</div>\n</div>\n</p>\n','day-yoga-co-huong-dan','https://youtu.be/YzJPMGHfn3M?list=PLMG8i-w8rYWlvOzfYH_JJrGjTKhdGy4Kk',1,'2022-12-30 12:35:15','2023-01-10 17:18:42',1,1,0,'[{\"file\":\"/images/1024_auto/lop_yoga_tot_1.jpg\",\"extension\":\"jpg\"}]'),(35,'Guided yoga teaching','<h2>Health benefits of yoga when practiced regularly</h2>\n\n<p>As society is becoming more and more civilized and modern, our pace of life is also getting faster and faster, which causes the mind and nervous system to be constantly stimulated. Yoga will provide space to slow down the mind and help us restore a sense of balance.</p>\n\n<p><img alt=\"yoga\" data-src=\"https://storage.googleapis.com/leep_app_website/2020/05/MAN_7426-2.jpg\" data-srcset=\"https://leep.imgix.net/2020/05/MAN_7426-2.jpg?auto=compress&amp;fit=scale&amp;fm=pjpg&amp;h=200&amp;ixlib=php-1.2.1&amp;w=300&amp;wpsize=medium 300w, https://storage.googleapis.com/leep_app_website/2020/05/MAN_7426-2.jpg 750w\" data-was-processed=\"true\" height=\"500\" loading=\"lazy\" sizes=\"(max-width: 750px) 100vw, 750px\" src=\"https://storage.googleapis.com/leep_app_website/2020/05/MAN_7426-2.jpg\" srcset=\"https://leep.imgix.net/2020/05/MAN_7426-2.jpg?auto=compress&amp;fit=scale&amp;fm=pjpg&amp;h=200&amp;ixlib=php-1.2.1&amp;w=300&amp;wpsize=medium 300w, https://storage.googleapis.com/leep_app_website/2020/05/MAN_7426-2.jpg 750w\" width=\"750\" /></p>\n\n<p style=\"text-align:center\"><em>Practicing yoga helps to increase flexibility and flexibility of the body</em></p>\n\n<p>In 2016, the Yoga Journal and the Yoga Association conducted a study in the US and found that 36.7 million people were practicing yoga, a 50% increase from 2012. Although the exact cause is still unclear. This is the cause of this boom, but according to experts, this may be due to the&nbsp; <a data-wpel-link=\"internal\" href=\"https://leep-app.translate.goog/blog/yoga/kham-pha-nhung-loi-ich-cua-yoga-dem-lai-cho-suc-khoe.html?_x_tr_sl=auto&amp;_x_tr_tl=vi&amp;_x_tr_hl=vi\" rel=\"noopener noreferrer\" target=\"_blank\">health benefits of yoga</a> &nbsp;:</p>\n\n<ul>\n	<li>Enhance the body&#39;s blood circulation</li>\n	<li>Improve immune system</li>\n	<li>Helps the body eliminate toxins</li>\n	<li>Against aging</li>\n	<li>Protect and strengthen the spine</li>\n	<li>Improve bone health</li>\n	<li><a data-wpel-link=\"internal\" href=\"https://leep-app.translate.goog/blog/yoga/4-tu-the-tap-yoga-giup-giam-can-hieu-qua.html?_x_tr_sl=auto&amp;_x_tr_tl=vi&amp;_x_tr_hl=vi\" rel=\"noopener\" target=\"_blank\">Full body weight loss</a> support</li>\n</ul>\n\n<p>Not only is it beneficial for the body, regular yoga practice will help you reduce stress, improve sleep, increase the concentration of the mind through breathing exercises, meditation. Yoga brings so many benefits, but did you know, this form originates from the harsh practice that originated in India.</p>\n\n<p><strong>&gt;&gt;&gt; See also:</strong> 10 signs that you <a data-wpel-link=\"internal\" href=\"https://leep-app.translate.goog/blog/yoga/10-dau-hieu-cho-thay-ban-nen-hoc-yoga-ngay-hom-nay.html?_x_tr_sl=auto&amp;_x_tr_tl=vi&amp;_x_tr_hl=vi\" rel=\"noopener\" target=\"_blank\">should learn yoga</a> today</p>\n\n<p>10 reasons why <a data-wpel-link=\"internal\" href=\"https://leep-app.translate.goog/blog/yoga/10-ly-do-khien-bo-mon-yoga-phu-hop-voi-tat-ca-moi-nguoi.html?_x_tr_sl=auto&amp;_x_tr_tl=vi&amp;_x_tr_hl=vi\" rel=\"noopener\" target=\"_blank\">yoga is right for everyone</a></p>\n\n<h2>The Origin of Yoga</h2>\n\n<p>According to the yoga sutra of the sage Patanjali, yoga is defined as &quot;the ability to put an end to the wandering thoughts of the mind&quot;. In this book, yoga is divided into eight different paths of practice:</p>\n\n<ul>\n	<li>Yamas &ndash; Moderation</li>\n	<li>Niyamas &ndash; Code of Conduct</li>\n	<li>Asana &ndash; Posture</li>\n	<li>Pranayama &ndash; Controlling the breath</li>\n	<li>Pratyahara &ndash; Mastering your emotions</li>\n	<li>Dharana &ndash; Concentration</li>\n	<li>Dhyani &ndash; Meditation</li>\n	<li>Samadhi &ndash; The state of bliss</li>\n</ul>\n\n<p>Today, Asana yoga is the most focused on the above 8 branches of yoga. Asana yoga was developed in the early 20th century by Sri Tirumalai Krishnamacharya. Later, his three most famous students developed other distinctive styles of yoga. Each style has different characteristics and benefits.</p>\n\n<p>In general, yoga is a discipline with a long history and many stages of development. However, at any stage, the main goal of yoga is to help the practitioner increase strength from physical to mental.</p>\n\n<h2>Types of yoga philosophies</h2>\n\n<p>Yoga has many different types and exercises, each with its own characteristics. Therefore, you need to learn carefully about the <a data-wpel-link=\"internal\" href=\"https://leep-app.translate.goog/blog/yoga/hieu-ro-8-loai-yoga-de-lua-chon-tap-luyen-dung-dan.html?_x_tr_sl=auto&amp;_x_tr_tl=vi&amp;_x_tr_hl=vi\" rel=\"noopener\" target=\"_blank\">types of yoga</a> to be able to make a suitable choice.</p>\n\n<ul>\n	<li><strong>Hatha yoga: Hatha yoga</strong> exercises <a data-wpel-link=\"internal\" href=\"https://leep-app.translate.goog/blog/yoga/6-bai-tap-hatha-yoga-nguoi-moi-bat-dau-khong-the-bo-qua.html?_x_tr_sl=auto&amp;_x_tr_tl=vi&amp;_x_tr_hl=vi\" rel=\"noopener\" target=\"_blank\">are</a> very suitable for beginners because the movements are slower than other types.</li>\n	<li><strong>Vinyasa, ashtanga and power yoga:</strong> These types of yoga will have a higher level of &quot;challenging&quot; than <a data-wpel-link=\"internal\" href=\"https://leep-app.translate.goog/blog/yoga/hatha-yoga-la-gi-an-so-voi-nguoi-moi-tap-yoga.html?_x_tr_sl=auto&amp;_x_tr_tl=vi&amp;_x_tr_hl=vi\" rel=\"noopener noreferrer\" target=\"_blank\">Hatha yoga</a> . However, the difficulty will depend on your instructor.</li>\n	<li><strong>Iyengar yoga:</strong> Includes movements performed slowly, with lots of detail. This type focuses on the details of each pose, body adjustment and the use of supportive yoga tools.</li>\n	<li><strong>Bikram or hot yoga:</strong> Includes two breathing techniques and 26 postures repeated in sequence for 90 minutes, combined with a high-temperature training environment of about 35-40 degrees Celsius. However, some people are sensitive to the heat. temperature or are experiencing some health problems may find hot yoga uncomfortable.</li>\n	<li><strong><a data-wpel-link=\"internal\" href=\"https://leep-app.translate.goog/blog/yoga/kundalini-yoga-la-gi-thac-mac-se-duoc-leep-app-giai-dap.html?_x_tr_sl=auto&amp;_x_tr_tl=vi&amp;_x_tr_hl=vi\" rel=\"noopener\" target=\"_blank\">Kundalini yoga</a> :</strong> Often used as a type of healing yoga. This type of yoga has a combination of meditation, chanting and spiritual elements.</li>\n	<li><strong>Viniyoga:</strong> This type of yoga focuses on breathing and meditation. Viniyoga is suitable for people with limited mobility, those who want to practice from the inside out, those who want to experience relaxation, who want to be more aware of their body and posture.</li>\n	<li><strong>Jivanmukti:</strong> A series of movements that combine meditation, empathy, chanting, and listening. Jivanmukti is suitable for those who want to incorporate the spiritual elements and ancient teachings of yoga into their practice.</li>\n	<li><strong>Yin</strong> : A series of movements mainly in lying and sitting positions, each position is held for 3-5 minutes. This type of yoga is suitable for people with chronic pain, muscle tension or depression. <a data-wpel-link=\"internal\" href=\"https://leep-app.translate.goog/blog/yoga/yin-yoga-loi-ich-va-nhung-trai-nghiem-ma-ban-co-the-chua-biet.html?_x_tr_sl=auto&amp;_x_tr_tl=vi&amp;_x_tr_hl=vi\" rel=\"noopener noreferrer\" target=\"_blank\" title=\"Yin yoga\">Yin yoga</a> &nbsp;has the effect of releasing tension, regenerating, rejuvenating the working range of muscles and connective tissues.</li>\n	<li><strong>Restorative:</strong> Includes very gentle poses that are held for 10 minutes with the help of yoga equipment such as blankets, cushions and straps. Similar to yin yoga, this type of yoga has a calming effect on the nervous system, suitable for people with chronic pain and depression.</li>\n</ul>\n\n<p><img alt=\"Types of yoga\" data-src=\"https://storage.googleapis.com/leep_app_website/2020/05/image3-6-e1589690452377.jpg\" data-srcset=\"https://leep.imgix.net/2020/05/image3-6-e1589690452377.jpg?auto=compress&amp;fit=scale&amp;fm=pjpg&amp;h=228&amp;ixlib=php-1.2.1&amp;w=300&amp;wpsize=medium 300w, https://storage.googleapis.com/leep_app_website/2020/05/image3-6-e1589690452377.jpg 750w\" data-was-processed=\"true\" height=\"570\" loading=\"lazy\" sizes=\"(max-width: 750px) 100vw, 750px\" src=\"https://storage.googleapis.com/leep_app_website/2020/05/image3-6-e1589690452377.jpg\" srcset=\"https://leep.imgix.net/2020/05/image3-6-e1589690452377.jpg?auto=compress&amp;fit=scale&amp;fm=pjpg&amp;h=228&amp;ixlib=php-1.2.1&amp;w=300&amp;wpsize=medium 300w, https://storage.googleapis.com/leep_app_website/2020/05/image3-6-e1589690452377.jpg 750w\" width=\"750\" /></p>\n\n<h2>&nbsp;</h2>\n','guided-yoga-teaching','https://youtu.be/YzJPMGHfn3M?list=PLMG8i-w8rYWlvOzfYH_JJrGjTKhdGy4Kk',1,'2022-12-30 12:35:16','2023-01-10 17:20:17',1,2,34,'[{\"file\":\"/images/1024_auto/lop_yoga_tot_1.jpg\",\"extension\":\"jpg\"}]'),(39,'Dạy gym','<div class=\"content-article content-article-table\">\n<p style=\"text-align:justify\"><a href=\"https://www.bodyfit.vn/pt-gym-la-gi\"><span style=\"font-family:Arial,Helvetica,sans-serif; font-size:14px\"><strong><span style=\"color:#e25041\">PT gym</span></strong></span></a><span style=\"font-family:Arial,Helvetica,sans-serif; font-size:14px\">&nbsp;l&agrave; cụm từ viết tắt của từ Personal Trainer, hay c&ograve;n được gọi l&agrave;&nbsp;</span><a href=\"https://www.bodyfit.vn/huan-luyen-vien-ca-nhan\"><span style=\"font-family:Arial,Helvetica,sans-serif; font-size:14px\"><strong><span style=\"color:#e25041\">huấn luyện vi&ecirc;n c&aacute; nh&acirc;n</span></strong></span></a><span style=\"font-family:Arial,Helvetica,sans-serif; font-size:14px\">&nbsp;tập gym trong c&aacute;c ph&ograve;ng tập gym hiện nay.&nbsp;</span><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">V&igrave; thế hiểu đơn giản th&igrave; <strong>PT gym l&agrave; một c&aacute; nh&acirc;n đ&atilde; đạt được những bằng cấp, chứng nhận chuy&ecirc;n nghiệp trong lĩnh vực gym v&agrave; trở th&agrave;nh chuy&ecirc;n gia huấn luyện, thiết kế c&aacute;c chương tr&igrave;nh tập hỗ trợ học vi&ecirc;n đạt được những hiệu quả trong tập luyện.</strong></span></span></p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"https://www.bodyfit.vn/uploads/contents/pt-gym-la-gi-1_1608984608.jpg\" width=\"662\" /></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">C&oacute; rất nhiều loại h&igrave;nh PT gym kh&aacute;c nhau như l&agrave;: PT Gym cho cả ph&ograve;ng tập, PT Gym theo nh&oacute;m, PT Gym c&aacute; nh&acirc;n - người trực tiếp hướng dẫn 1:1 cho mỗi học vi&ecirc;n. T&ugrave;y v&agrave;o nhu cầu của học vi&ecirc;n m&agrave; lựa chọn loại h&igrave;nh PT Gym ph&ugrave; hợp.</span></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:14px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">Ng&agrave;y nay, PT Gym được xem l&agrave; một nghề rất được y&ecirc;u th&iacute;ch của giới trẻ v&igrave; vừa được thỏa đam m&ecirc; tập luyện mang lại v&oacute;c d&aacute;ng đẹp cho bản th&acirc;n v&agrave; học vi&ecirc;n, vừa mang lại thu nhập cao.</span></span></p>\n</div>\n','day-gym',NULL,1,'2023-01-11 10:00:13','2023-01-11 10:00:13',1,1,0,'[{\"file\":\"/images/20230111/xkfei1be33.jpg\",\"extension\":\"jpg\"}]'),(40,'Teaching gym','<div class=\"F0azHf tw-nfl tw-ta-container\" id=\"tw-target-text-container\">\n<pre style=\"text-align:left\">\nPT gym&nbsp;is an acronym for Personal Trainer, also known as &nbsp;personal trainer&nbsp;exercise in gyms today. Therefore, to put it simply, PT gym is an individual who has obtained professional degrees and certifications in the field of gymnastics and has become an expert in training and designing training programs to help students achieve effective results. in exercise.</pre>\n</div>\n','teaching-gym',NULL,1,'2023-01-11 10:00:13','2023-01-11 10:00:13',1,2,39,'[{\"file\":\"/images/20230111/xkfei1be33.jpg\",\"extension\":\"jpg\"}]');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:18:45
