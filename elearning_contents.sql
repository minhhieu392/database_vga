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
-- Table structure for table `contents`
--

DROP TABLE IF EXISTS `contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contents` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `contentsName` varchar(500) DEFAULT NULL,
  `contentGroupsId` bigint(20) DEFAULT 0,
  `shortDescriptions` text DEFAULT NULL,
  `descriptions` text DEFAULT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
  `userCreatorsId` bigint(20) DEFAULT NULL,
  `dateCreated` datetime DEFAULT current_timestamp(),
  `dateUpdated` datetime DEFAULT current_timestamp(),
  `status` int(11) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contents_contentGroupsId_IDX` (`contentGroupsId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contents`
--

LOCK TABLES `contents` WRITE;
/*!40000 ALTER TABLE `contents` DISABLE KEYS */;
INSERT INTO `contents` VALUES (1,'7 lời khuyên hữu ích trong quá trình nuôi dạy con, cha mẹ đừng bỏ qua',3,'Đây là điều mà cha mẹ thường đặt ra yêu cầu đối với con. Hãy nói với con rằng, thái độ học tập quan trọng hơn điểm số. Vì thế, trẻ cần nghiêm túc trong các kỳ kiểm tra để có thể đánh giá đúng năng lực của bản thân. Điểm số không quá quan trọng, điểm số có thể cải thiện nếu nắm được những lỗi sai.','<h2>1. Lời khuy&ecirc;n về điểm số</h2>\n\n<p>Đ&acirc;y l&agrave; điều m&agrave; cha mẹ thường đặt ra y&ecirc;u cầu đối với con. H&atilde;y n&oacute;i với con rằng, th&aacute;i độ học tập quan trọng hơn điểm số. V&igrave; thế, trẻ cần nghi&ecirc;m t&uacute;c trong c&aacute;c kỳ kiểm tra để c&oacute; thể đ&aacute;nh gi&aacute; đ&uacute;ng năng lực của bản th&acirc;n. Điểm số kh&ocirc;ng qu&aacute; quan trọng, điểm số c&oacute; thể cải thiện nếu nắm được những lỗi sai.</p>\n\n<p>Nhiều bậc cha mẹ thường đặt kỳ vọng qu&aacute; cao v&agrave;o điểm số khiến con c&aacute;i lo lắng, sợ h&atilde;i nếu bị điểm k&eacute;m. Thậm ch&iacute;, điều n&agrave;y c&oacute; thể ảnh hưởng xấu đến mối quan hệ giữa cha mẹ với con c&aacute;i, khiến bầu kh&ocirc;ng kh&iacute; gia đ&igrave;nh lu&ocirc;n căng thẳng.</p>\n\n<p>Điểm số quan trọng, nhưng quan trọng hơn l&agrave; th&aacute;i độ học tập v&agrave; qu&aacute; tr&igrave;nh trưởng th&agrave;nh. Việc đ&aacute;nh gi&aacute; sự th&agrave;nh c&ocirc;ng trong tương lai chỉ dựa tr&ecirc;n điểm số l&agrave; kh&ocirc;ng ch&iacute;nh x&aacute;c. Cha mẹ cần sớm nhận ra điều n&agrave;y để c&oacute; phương ph&aacute;p gi&aacute;o dục con tốt nhất.</p>\n\n<h2>2. Lời khuy&ecirc;n tận hưởng cuộc sống</h2>\n\n<p>Cha mẹ h&atilde;y khuy&ecirc;n con n&ecirc;n tận hưởng cuộc sống, đừng đợi đến khi trưởng th&agrave;nh m&agrave; h&atilde;y bắt đầu từ h&ocirc;m nay, từ ngay b&acirc;y giờ. Phần thưởng lớn nhất d&agrave;nh cho con kh&ocirc;ng phải l&agrave; vật chất ph&ugrave; phiếm m&agrave; l&agrave; sự vui vẻ, hạnh ph&uacute;c mỗi ng&agrave;y khi được kh&aacute;m ph&aacute; điều m&igrave;nh th&iacute;ch.</p>\n\n<p>Nhiều phụ huynh c&oacute; quan điểm rằng, trẻ cần chịu đựng gian khổ để r&egrave;n luyện &yacute; ch&iacute; sắt đ&aacute;. Như vậy mới c&oacute; được cuộc sống tốt đẹp trong tương lai. Nhưng đ&acirc;y l&agrave; điều ho&agrave;n to&agrave;n sai lầm. Một nh&agrave; gi&aacute;o dục nổi tiếng từng n&oacute;i:&nbsp;<em>&ldquo;C&aacute;ch tốt nhất để khiến trẻ nghe lời l&agrave; l&agrave;m cho ch&uacute;ng hạnh ph&uacute;c&rdquo;.</em></p>\n\n<p>Mục đ&iacute;ch của gi&aacute;o dục l&agrave; tạo điều kiện để trẻ c&oacute; một cuộc sống hạnh ph&uacute;c v&agrave; tận hưởng cuộc sống bằng khả năng của m&igrave;nh. L&agrave; cha mẹ, ch&uacute;ng ta n&ecirc;n gi&uacute;p trẻ t&igrave;m thấy được niềm vui trong cuộc sống, để trẻ thấy được thế giới thật tươi đẹp, c&oacute; nhiều điều &yacute; nghĩa.</p>\n\n<h2>3. Lời khuy&ecirc;n đọc những t&aacute;c phẩm kinh điển</h2>\n\n<p>Đọc t&aacute;c phẩm kinh điển l&agrave; ch&igrave;a kho&aacute; để học tốt ng&ocirc;n ngữ v&agrave; sẽ n&acirc;ng cao khả năng đọc &ndash; hiểu vượt bậc. Cha mẹ h&atilde;y khuy&ecirc;n con kh&ocirc;ng n&ecirc;n đọc những cuốn s&aacute;ch &ldquo;ăn nhanh&rdquo; m&agrave; h&atilde;y đọc những t&aacute;c phẩm kinh điển.</p>\n\n<p>C&oacute; thể mới đầu tiếp x&uacute;c với t&aacute;c phẩm kinh điển, trẻ sẽ cảm thấy nh&agrave;m ch&aacute;n, kh&oacute; tiếp thu. Nhưng h&atilde;y đi từ đơn giản đến kh&oacute;, h&atilde;y cho con đọc những t&aacute;c phẩm ngắn rồi tới những bộ s&aacute;ch nhiều phần. H&atilde;y đưa con đến thế giới tuyệt vời của văn học, để ch&uacute;ng nhận ra cuộc đời c&oacute; rất nhiều điều &yacute; nghĩa.</p>\n\n<h2>4. Lời khuy&ecirc;n cần t&ocirc;n trọng con</h2>\n\n<p>Một số cha mẹ thường đưa ra quyết định thay con. Họ nghĩ rằng con qu&aacute; nhỏ, chưa thể giải quyết được mọi thứ. Họ đ&atilde; bỏ qua những mong muốn, khao kh&aacute;t s&acirc;u b&ecirc;n trong của con, đ&oacute; l&agrave; con cần được t&ocirc;n trọng v&agrave; c&ocirc;ng nhận.</p>\n\n<p>Nh&agrave; t&acirc;m l&yacute; học Willie James từng n&oacute;i rằng:&nbsp;<em>&ldquo;Phần s&acirc;u thẳm trong bản chất con người l&agrave; mong muốn được người kh&aacute;c coi trọng&rdquo;.</em>&nbsp;L&agrave; cha mẹ, bạn n&ecirc;n d&agrave;nh sự t&ocirc;n trọng đối với con c&aacute;i, tạo cho con kh&ocirc;ng gian tự do để ph&aacute;t triển. Đừng &eacute;p buộc, đừng k&igrave;m kẹp m&agrave; h&atilde;y lắng nghe con.</p>\n\n<h2>5. Lời khuy&ecirc;n r&egrave;n luyện t&iacute;nh tự lập</h2>\n\n<p>Để r&egrave;n luyện t&iacute;nh tự lập cho con, cha mẹ cần t&ocirc;n trọng quyết định của con, đ&oacute; mới l&agrave; điều quan trọng nhất. Ch&iacute;nh bằng c&aacute;ch n&agrave;y, con mới c&oacute; ch&iacute;nh kiến của ri&ecirc;ng m&igrave;nh, d&aacute;m thực hiện ho&agrave;i b&atilde;o v&agrave; đối đấu với mọi kh&oacute; khăn.</p>\n\n<p>C&oacute; phải cha mẹ thường ph&agrave;n n&agrave;n rằng:&nbsp;<em>&ldquo;Con nh&agrave; t&ocirc;i đ&atilde; lớn nhưng chưa biết cắm cơm&rdquo;, &ldquo;Đứa trẻ chẳng bao giờ chịu dọn ph&ograve;ng, to&agrave;n để mẹ l&agrave;m hộ&rdquo;,</em>&hellip; H&atilde;y một lần để con tự l&agrave;m những việc đơn giản đ&oacute;, d&ugrave; con l&agrave;m chưa tốt th&igrave; cha mẹ cũng n&ecirc;n kệ con. Đừng bao bọc con qu&aacute; mức, h&atilde;y để con h&igrave;nh th&agrave;nh t&iacute;nh tự gi&aacute;c, tự lập ngay từ khi c&ograve;n nhỏ. Đừng l&agrave;m gi&uacute;p con những thứ ch&uacute;ng c&oacute; thể l&agrave;m.</p>\n\n<p>Trẻ c&oacute; thể ph&aacute;t triển t&iacute;nh tự lập bằng c&aacute;ch r&egrave;n luyện từ những việc nhỏ nhất thường ng&agrave;y. H&atilde;y để con tự lập trong cả suy nghĩ lẫn h&agrave;nh động, đ&acirc;y l&agrave; c&aacute;ch nhanh nhất gi&uacute;p những đứa trẻ trưởng th&agrave;nh.</p>\n\n<h2>6. Lời khuy&ecirc;n về sự bất cẩn</h2>\n\n<p>Kh&ocirc;ng cẩn thận l&agrave; biểu hiện của người năng lực k&eacute;m, kh&ocirc;ng c&oacute; tinh thần học hỏi. Cẩn thận l&agrave; một kỹ năng quan trọng trong cuộc sống, cần r&egrave;n luyện mỗi ng&agrave;y. Những sai lầm của trẻ đều phần nhiều từ sự thiếu cẩn thận như: L&agrave;m b&agrave;i kiểm tra sai, bị trượt ch&acirc;n ng&atilde;, bị mẹ mắng v&igrave; qu&eacute;t dọn nh&agrave; kh&ocirc;ng sạch,&hellip;</p>\n\n<p>Lười biếng l&agrave; nguy&ecirc;n nh&acirc;n g&acirc;y ra sự bất cẩn khi l&agrave;m việc của trẻ. Trẻ qu&aacute; lười n&ecirc;n kh&ocirc;ng muốn lắng nghe thầy c&ocirc; giảng b&agrave;i; lười n&ecirc;n kh&ocirc;ng l&agrave;m b&agrave;i tập về nh&agrave;, lười n&ecirc;n kh&ocirc;ng muốn vận động cơ thể, lười n&ecirc;n ẩu đả l&agrave;m mọi việc một c&aacute;ch nhanh ch&oacute;ng,&hellip;</p>\n\n<p>Cha mẹ cần ki&ecirc;n tr&igrave; hướng dẫn để con sửa đổi t&iacute;nh lười biếng v&agrave; bất cẩn trong cuộc sống. H&atilde;y sửa t&iacute;nh xấu n&agrave;y c&agrave;ng sớm c&agrave;ng tốt để c&oacute; cơ hội đạt điểm cao trong học tập v&agrave; th&agrave;nh c&ocirc;ng trong tương lai.</p>\n\n<h2>7. Lời khuy&ecirc;n n&ecirc;n khen ngợi con thường xuy&ecirc;n</h2>\n\n<p>Một nh&agrave; gi&aacute;o dục nổi tiếng từng n&oacute;i:&nbsp;<em>&ldquo;Kh&ocirc;ng phải điểm số quyết định đến cuộc đời của trẻ m&agrave; l&agrave; t&iacute;nh c&aacute;ch tốt&rdquo;.&nbsp;</em>Gi&aacute;o dục đạo đức con người lu&ocirc;n được ưu ti&ecirc;n h&agrave;ng đầu. Trong đ&oacute;, sự ghi nhận của cha mẹ d&agrave;nh cho con c&aacute;i l&agrave; điều v&ocirc; c&ugrave;ng quan trọng đối với sự ph&aacute;t triển của trẻ.</p>\n\n<p>Một đứa trẻ kh&ocirc;ng được cha mẹ ghi nhận, khen ngợi khi đạt th&agrave;nh t&iacute;ch cao, khi c&oacute; việc l&agrave;m tốt đ&aacute;ng tội nghiệp biết chừng n&agrave;o? V&igrave; thế, b&ecirc;n cạnh việc ph&ecirc; b&igrave;nh con khi mắc lỗi th&igrave; cha mẹ n&ecirc;n d&agrave;nh lời khen ngợi, cổ vũ khi con l&agrave;m tốt. Điều n&agrave;y sẽ gi&uacute;p trẻ cảm thấy hạnh ph&uacute;c, tự tin, tự h&agrave;o rất nhiều! Ch&uacute;ng sẽ nỗ lực nhiều hơn nữa để l&agrave;m những việc t&iacute;ch cực.</p>\n','[{\"file\":\"/images/20230103/4_quy_tac_nuoi_day_con_cua_cha_me_Nhat_de_tao_nen_nhung_dua_tre_doc_lap_va_le_phep_1_1024x768.png\",\"extension\":\"png\"}]',1,'2022-12-19 15:10:31','2020-12-19 07:00:00',1,'7-loi-khuyen-huu-ich-trong-qua-trinh-nuoi-day-con-cha-me-dung-bo-qua'),(2,'Tại sao nên sử dụng Robot để giảng dạy kiến thức về STEM',1,'Lý do đầu tiên mà việc học STEM nên bao gồm công nghệ người máy là vì nó hấp dẫn. Toán và các môn khoa học liên quan đến rất nhiều con số và lý thuyết, mà học sinh có thể cảm thấy buồn tẻ. Bắt tay vào thiết kế, chế tạo hoặc sửa chữa robot sẽ thêm trải nghiệm thực hành, thú vị hơn.','<h2>Robot thực sự l&agrave; chủ đề cực hấp dẫn</h2>\n\n<p>L&yacute; do đầu ti&ecirc;n m&agrave; việc học STEM n&ecirc;n bao gồm c&ocirc;ng nghệ người m&aacute;y l&agrave; v&igrave; n&oacute; hấp dẫn. To&aacute;n v&agrave; c&aacute;c m&ocirc;n khoa học li&ecirc;n quan đến rất nhiều con số v&agrave; l&yacute; thuyết, m&agrave; học sinh c&oacute; thể cảm thấy buồn tẻ. Bắt tay v&agrave;o thiết kế, chế tạo hoặc sửa chữa robot sẽ th&ecirc;m trải nghiệm thực h&agrave;nh, th&uacute; vị hơn.</p>\n\n<p>Chỉ 59% học sinh trung học cơ sở v&agrave; 60% học sinh trung học phổ th&ocirc;ng cảm thấy gắn b&oacute; với trường học. Đ&aacute;ng buồn thay, chỉ c&oacute; 52% trẻ em th&iacute;ch đến trường hầu hết thời gian(số liệu từ https://youthtruthsurvey.org/). Trẻ em cần nhiều trải nghiệm học tập th&uacute; vị hơn để học hiệu quả. Robot, vừa hấp dẫn vừa thực h&agrave;nh, cung cấp sự tương t&aacute;c m&agrave; họ cần</p>\n\n<h2>Người m&aacute;y bao gồm nhiều lĩnh vực</h2>\n\n<p>Một l&yacute; do kh&aacute;c khiến người m&aacute;y trở th&agrave;nh một c&ocirc;ng cụ học tập STEM tuyệt vời l&agrave; v&igrave; ch&uacute;ng li&ecirc;n quan đến rất nhiều lĩnh vực. Robot c&oacute; vẻ phức tạp v&igrave; việc x&acirc;y dựng một robot đ&ograve;i hỏi kiến thức về nhiều lĩnh vực, từ kỹ thuật đến lập tr&igrave;nh. Mặc d&ugrave; điều đ&oacute; c&oacute; vẻ l&agrave; một bất lợi, nhưng sự phức tạp n&agrave;y l&agrave; một phần l&yacute; do tại sao ch&uacute;ng l&agrave; một c&aacute;ch hữu &iacute;ch để học.</p>\n\n<p>Ngay cả ở dạng đơn giản nhất, robot vẫn cung cấp cho học sinh c&aacute;c b&agrave;i học thực h&agrave;nh trong nhiều m&ocirc;n học. Họ sẽ học c&aacute;c kh&aacute;i niệm kỹ thuật cơ kh&iacute; từ việc lắp c&aacute;c bộ phận chuyển động lại với nhau tr&ecirc;n m&aacute;y. Họ cũng sẽ chọn c&aacute;c nguy&ecirc;n tắc m&atilde; h&oacute;a cơ bản khi họ lập tr&igrave;nh n&oacute;. C&aacute;c nh&agrave; gi&aacute;o dục c&oacute; thể nhận được c&aacute;c kế hoạch b&agrave;i học hầu như kh&ocirc;ng giới hạn từ một t&agrave;i nguy&ecirc;n.</p>\n\n<h2>Robot dạy c&aacute;c b&agrave;i học thực tế</h2>\n\n<p>Giảng dạy với người m&aacute;y cũng gi&uacute;p cung cấp cho sinh vi&ecirc;n những v&iacute; dụ thực tế về c&aacute;c kh&aacute;i niệm STEM quan trọng. Một số học sinh c&oacute; thể hiểu những &yacute; tưởng n&agrave;y dễ d&agrave;ng hơn khi thấy ch&uacute;ng diễn ra trong thế giới thực. T&iacute;nh thực tế n&agrave;y c&oacute; thể l&agrave;m cho c&aacute;c kh&aacute;i niệm trừu tượng trở n&ecirc;n cụ thể hơn v&agrave; c&aacute;c b&agrave;i học c&oacute; khả năng buồn tẻ trở n&ecirc;n hấp dẫn hơn.</p>\n\n<p>V&iacute; dụ, c&aacute;c kh&oacute;a học kỹ thuật điện n&ecirc;n dạy về sự kh&aacute;c biệt giữa c&aacute;c loại d&acirc;y kh&aacute;c nhau. Sử dụng sai loại c&oacute; thể dẫn đến hệ thống d&acirc;y điện bị hư hỏng hoặc c&aacute;c mối lo ngại về an to&agrave;n, nhưng c&aacute;c b&agrave;i giảng truyền thống c&oacute; thể kh&ocirc;ng chứng minh điều n&agrave;y một c&aacute;ch hiệu quả. Khi l&agrave;m việc tr&ecirc;n robot, sinh vi&ecirc;n sẽ thấy tại sao những kh&aacute;c biệt n&agrave;y lại quan trọng v&igrave; họ c&oacute; thể thấy được hậu quả.</p>\n\n<h2>Robot th&uacute;c đẩy sự s&aacute;ng tạo trong STEM</h2>\n\n<p>Robot cũng l&agrave; c&ocirc;ng cụ l&yacute; tưởng để th&uacute;c đẩy sự s&aacute;ng tạo, một trong những kh&aacute;i niệm STEM bị bỏ qua nhiều nhất. Nếu sinh vi&ecirc;n tham gia c&aacute;c lĩnh vực STEM với tư c&aacute;ch l&agrave; chuy&ecirc;n gia, họ sẽ phải t&igrave;m ra c&aacute;c giải ph&aacute;p s&aacute;ng tạo cho những trở ngại. V&igrave; r&ocirc; bốt l&agrave; một danh mục đa dạng, rộng lớn li&ecirc;n quan đến nhiều kỹ năng, ch&uacute;ng l&agrave; một c&ocirc;ng cụ giảng dạy l&yacute; tưởng cho sự đổi mới STEM.</p>\n\n<h2>Robot l&agrave; t&agrave;i nguy&ecirc;n học tập STEM cơ bản</h2>\n\n<p>C&aacute;c lĩnh vực STEM ng&agrave;y c&agrave;ng trở th&agrave;nh một phần ph&ugrave; hợp của cuộc sống khi ảnh hưởng của c&ocirc;ng nghệ đối với mọi thứ ng&agrave;y c&agrave;ng tăng. Học sinh cần một nền gi&aacute;o dục STEM vững chắc hơn bao giờ hết, v&agrave; người m&aacute;y l&agrave; c&ocirc;ng cụ giảng dạy l&yacute; tưởng . Những m&aacute;y n&agrave;y cung cấp một c&aacute;ch hấp dẫn, dễ tiếp cận, thực tế v&agrave; c&oacute; thể mở rộng để học một loạt c&aacute;c kỹ năng v&agrave; kh&aacute;i niệm.</p>\n\n<p>Học STEM bao gồm nhiều lĩnh vực v&agrave; &yacute; tưởng kh&aacute;c nhau, thoạt đầu c&oacute; vẻ kh&oacute; khăn. Robot cung cấp cho sinh vi&ecirc;n một nơi để học c&aacute;c kỹ năng trong tất cả c&aacute;c lĩnh vực n&agrave;y, trang bị cho họ để th&agrave;nh c&ocirc;ng. D&ugrave; sinh vi&ecirc;n đi đ&acirc;u sau khi học xong, họ sẽ tốt hơn khi t&igrave;m hiểu về robot.</p>\n','[{\"file\":\"/images/20230103/Bo_Giao_duc_len_tieng_ve_ke_hoach_dieu_chinh_chuong_trinh_mon_Lich_su_bac_THPT_3.png\",\"extension\":\"png\"}]',527,'2023-01-04 16:59:31','2023-01-04 18:04:49',1,'tai-sao-nen-su-dung-robot-de-giang-day-kien-thuc-ve-stem'),(3,'7 cách dạy con lòng biết ơn cha mẹ nên áp dụng',2,'Cha mẹ chính là những người thầy đầu tiên và quan trọng nhất ảnh hưởng đến tương lai của con cái. Trẻ sẽ có xu hướng bắt chước lại những hành vi của cha mẹ và dần hình thành nhân cách của chúng. Vì vậy phụ huynh nên làm gương cho trẻ về lòng biết ơn để con noi theo.','<h2>1. Cha mẹ l&agrave;m gương cho con</h2>\n\n<p>Cha mẹ ch&iacute;nh l&agrave; những người thầy đầu ti&ecirc;n v&agrave; quan trọng nhất ảnh hưởng đến tương lai của con c&aacute;i. Trẻ sẽ c&oacute; xu hướng bắt chước lại những h&agrave;nh vi của cha mẹ v&agrave; dần h&igrave;nh th&agrave;nh nh&acirc;n c&aacute;ch của ch&uacute;ng. V&igrave; vậy phụ huynh n&ecirc;n l&agrave;m gương cho trẻ về l&ograve;ng biết ơn để con noi theo. Trong gia đ&igrave;nh, cha mẹ n&ecirc;n hiếu k&iacute;nh với &ocirc;ng b&agrave;, vợ chồng n&ecirc;n biết ơn đến nhau, thậm ch&iacute;, khi con gi&uacute;p m&igrave;nh, cha mẹ cũng n&ecirc;n n&oacute;i lời cảm ơn đến trẻ&hellip; C&oacute; như vậy con mới học tập v&agrave; l&agrave;m theo. Mặt kh&aacute;c khi được bố mẹ n&oacute;i lời cảm ơn những l&uacute;c con l&agrave;m việc tốt, trẻ rất vui v&agrave; chắc chắn sẽ ph&aacute;t huy.</p>\n\n<h2>2. Khuyến kh&iacute;ch con l&agrave;m việc nh&agrave;</h2>\n\n<p>Khi trẻ c&ugrave;ng cha mẹ l&agrave;m việc nh&agrave;, ch&uacute;ng sẽ nhận ra rằng m&igrave;nh cũng cần nỗ lực v&agrave; kh&ocirc;ng n&ecirc;n coi mọi thứ l&agrave; điều hiển nhi&ecirc;n. Con sẽ sớm tự lập v&agrave; biết ơn việc bố mẹ chăm s&oacute;c, nu&ocirc;i dưỡng m&igrave;nh l&agrave; 1 điều thi&ecirc;ng li&ecirc;ng. V&agrave; con cần đền đ&aacute;p c&ocirc;ng ơn nu&ocirc;i dưỡng, gi&aacute;o dục đ&oacute; của cha mẹ.</p>\n\n<h2>3. Dạy trẻ gi&uacute;p đỡ người kh&aacute;c</h2>\n\n<p>Một c&aacute;ch kh&aacute;c để dạy trẻ về l&ograve;ng biết ơn đ&oacute; l&agrave; cha mẹ h&atilde;y c&ugrave;ng trẻ gi&uacute;p đỡ những người kh&oacute; khăn hơn m&igrave;nh. Những h&agrave;nh động nhỏ như hỏi thăm, ủng hộ người ngh&egrave;o,&hellip; sẽ tập cho trẻ th&oacute;i quen hỗ trợ ho&agrave;n cảnh khốn kh&oacute;, yếu thế trong cuộc sống. Ngo&agrave;i ra, việc nhận được lời cảm ơn từ người m&agrave; m&igrave;nh gi&uacute;p đỡ sẽ gi&uacute;p trẻ dần hiểu rằng, l&agrave;m việc tốt sẽ mang đến nhiều &yacute; nghĩa, gi&aacute; trị tốt đẹp cho x&atilde; hội.</p>\n\n<p>Cha mẹ cũng đừng qu&ecirc;n d&agrave;nh lời khen ngợi hoặc phần thưởng nhỏ nếu trẻ c&oacute; những h&agrave;nh động gi&uacute;p đỡ người kh&aacute;c để khuyến kh&iacute;ch c&aacute;c con duy tr&igrave; trong việc chủ động gi&uacute;p đỡ mọi người.</p>\n\n<h2>4. T&acirc;m sự với b&eacute; về những vất vả của cha mẹ</h2>\n\n<p>Nhiều phụ huynh thương con n&ecirc;n thường giấu sự vất vả của m&igrave;nh, chỉ để con c&aacute;i thấy được những l&uacute;c m&igrave;nh an nh&agrave;n, kh&ocirc;ng vất vả. Điều đ&oacute; l&agrave; ho&agrave;n to&agrave;n sai lầm. Con sẽ cảm thấy cha mẹ l&agrave;m việc qu&aacute; dễ d&agrave;ng, kiếm tiền kh&ocirc;ng mất nhiều c&ocirc;ng sức như ch&uacute;ng nghĩ&hellip; Từ đ&oacute; con kh&ocirc;ng coi trọng c&ocirc;ng sức của cha mẹ.</p>\n\n<p>Phụ huynh h&atilde;y thường xuy&ecirc;n t&acirc;m sự với con về nỗi vất vả của m&igrave;nh. T&acirc;m sự kh&aacute;c với lời than v&atilde;n. Nếu điều kiện cho ph&eacute;p, bạn cũng c&oacute; thể đưa b&eacute; đến nơi l&agrave;m việc để trẻ tận mắt chứng kiến c&ocirc;ng việc của m&igrave;nh. Một khi hiểu được cha mẹ kiếm tiền vất vả, b&eacute; sẽ biết y&ecirc;u thương cha mẹ hơn v&agrave; tr&acirc;n trọng những thứ được đổi lấy bằng mồ h&ocirc;i, c&ocirc;ng sức của cha mẹ.</p>\n\n<h2>5. Đừng đ&aacute;p ứng mọi đ&ograve;i hỏi của con qu&aacute; dễ d&agrave;ng</h2>\n\n<p>Nhiều cha mẹ dễ d&agrave;ng &ldquo;đầu h&agrave;ng&rdquo; khi con m&egrave; nheo muốn đ&ograve;i hỏi 1 thứ g&igrave; đ&oacute;. Th&aacute;i độ n&agrave;y của phụ huynh sẽ l&agrave;m ảnh hưởng đến việc nu&ocirc;i dưỡng l&ograve;ng biết ơn ở con bạn. Cảm gi&aacute;c thỏa m&atilde;n dễ d&agrave;ng sẽ khiến b&eacute; mất đi l&ograve;ng biết ơn với những người đ&atilde; l&agrave;m ra thứ m&igrave;nh th&iacute;ch, những người đ&atilde; đ&aacute;p ứng m&igrave;nh.&nbsp;</p>\n\n<p>Khi cảm thấy y&ecirc;u cầu của b&eacute; kh&ocirc;ng hợp l&yacute;, cha mẹ cũng nhớ phải giải th&iacute;ch l&yacute; do nhẹ nh&agrave;ng rồi từ chối chứ đừng lập tức n&oacute;i &ldquo;kh&ocirc;ng&rdquo;. V&igrave; như vậy con sẽ cảm thấy oan ức, phi l&yacute;.</p>\n\n<h2>6. Cha mẹ h&atilde;y dạy con n&oacute;i lời cảm ơn</h2>\n\n<p>Cảm ơn, xin lỗi, vui l&ograve;ng l&agrave; c&acirc;u n&oacute;i m&agrave; cha mẹ cần phải dạy trẻ khi c&ograve;n nhỏ. Dạy trẻ lu&ocirc;n phải cảm ơn người kh&aacute;c khi họ mang lại cho ta một điều tốt đẹp. Dạy trẻ n&oacute;i lời xin lỗi khi l&agrave;m phiền hoặc c&oacute; lỗi với người kh&aacute;c. V&agrave; gi&uacute;p con biết c&aacute;ch n&oacute;i c&acirc;u &ldquo;vui l&ograve;ng&rdquo; khi muốn nhờ vả người ta l&agrave;m điều g&igrave; đ&oacute; cho m&igrave;nh. Những h&agrave;nh động cụ thể như thế sẽ gi&uacute;p trẻ t&ocirc;n trọng người kh&aacute;c, thể hiện sự ch&acirc;n th&agrave;nh, v&agrave; th&ecirc;m qu&yacute; trọng t&igrave;nh cảm của mọi người xung quanh.</p>\n\n<h2>7. Cha mẹ h&atilde;y ki&ecirc;n nhẫn</h2>\n\n<p>Trẻ kh&ocirc;ng thể đột nhi&ecirc;n thấm nhuần những lời răn dạy của bố mẹ v&agrave; ch&uacute;ng cần thời gian trải nghiệm, t&iacute;ch lũy kinh nghiệm sống. V&igrave; vậy cha mẹ h&atilde;y b&igrave;nh tĩnh v&agrave; gi&uacute;p trẻ h&igrave;nh th&agrave;nh th&oacute;i quen về sự cảm k&iacute;ch, l&ograve;ng biết ơn với những thứ m&igrave;nh nhận được.</p>\n','[{\"file\":\"/images/20230103/4_quy_tac_nuoi_day_con_cua_cha_me_Nhat_de_tao_nen_nhung_dua_tre_doc_lap_va_le_phep_2_1024x768.png\",\"extension\":\"png\"}]',1,'2023-01-04 16:59:53','2023-01-04 16:59:53',1,'7-cach-day-con-long-biet-on-cha-me-nen-ap-dung'),(4,'Trao giải cuộc thi lập trình “code to lead” – Học viện Kidstem cùng PGD&ĐT Thành phố Bắc Kạn phối hợp tổ chức',3,'Trao giải cuộc thi lập trình “code to lead” – Học viện Kidstem cùng PGD&ĐT Thành phố Bắc Kạn phối hợp tổ chức','<p>Kết quả trao giải cuộc thi như sau:</p>\n\n<p>BẢNG A: Lập tr&igrave;nh 2D Scratch</p>\n\n<ul>\n	<li>Giải nhất: Đỗ H&agrave; Minh Ho&agrave;ng &ndash; Trường tiểu học Đức Xu&acirc;n</li>\n	<li>Giải nh&igrave;: Phạm Minh Minh &ndash; Trường tiểu học Đức Xu&acirc;n</li>\n	<li>Giải khuyến kh&iacute;ch 1: L&ecirc; Thanh Thủy &ndash; Trường tiểu học Đức Xu&acirc;n</li>\n	<li>Giải khuyến kh&iacute;ch 2: Nguyễn Viết Cường &ndash; Trường tiểu học Đức Xu&acirc;n</li>\n</ul>\n\n<p><img alt=\"\" data-src=\"https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/source/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design.png\" data-srcset=\"https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/source/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design.png 900w, https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/source/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-300x151.png 300w, https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/source/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-768x386.png 768w, https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/source/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-600x301.png 600w\" height=\"452\" id=\"NTYyOjY3NQ==-1\" nitro-lazy-empty=\"\" nitro-lazy-src=\"https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/source/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design.png\" nitro-lazy-srcset=\"https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/source/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design.png 900w, https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/source/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-300x151.png 300w, https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/source/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-768x386.png 768w, https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/source/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-600x301.png 600w\" sizes=\"(max-width: 900px) 100vw, 900px\" src=\"https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/source/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design.png\" srcset=\"https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/source/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design.png 900w, https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/source/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-300x151.png 300w, https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/source/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-768x386.png 768w, https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/source/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-600x301.png 600w\" width=\"900\" /></p>\n\n<p>BẢNG B: Lập tr&igrave;nh 3D CoderZ Adventure</p>\n\n<ul>\n	<li>Giải nhất: Nguyễn C&ocirc;ng Ho&agrave;ng L&acirc;n &ndash; Trường tiểu học Ph&ugrave;ng Ch&iacute; Ki&ecirc;n</li>\n	<li>Giải nh&igrave;: Nguyễn Bảo Nam &ndash; Trường tiểu học S&ocirc;ng Cầu</li>\n	<li>Giải khuyến kh&iacute;ch 1: Vũ Th&aacute;i Dương &ndash; Trường tiểu học S&ocirc;ng Cầu</li>\n	<li>Giải khuyến kh&iacute;ch 2: Phạm Quang Minh &ndash; Trường tiểu học Huyền Tụng</li>\n</ul>\n\n<p><img alt=\"\" data-src=\"https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/optimized/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-1.png\" data-srcset=\"https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/optimized/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-1.png 900w, https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/optimized/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-1-300x300.png 300w, https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/optimized/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-1-150x150.png 150w, https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/optimized/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-1-768x768.png 768w, https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/optimized/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-1-600x600.png 600w, https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/optimized/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-1-100x100.png 100w\" height=\"900\" id=\"NTc0Ojg1Nw==-1\" nitro-lazy-empty=\"\" nitro-lazy-src=\"https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/optimized/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-1.png\" nitro-lazy-srcset=\"https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/optimized/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-1.png 900w, https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/optimized/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-1-300x300.png 300w, https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/optimized/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-1-150x150.png 150w, https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/optimized/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-1-768x768.png 768w, https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/optimized/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-1-600x600.png 600w, https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/optimized/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-1-100x100.png 100w\" sizes=\"(max-width: 900px) 100vw, 900px\" src=\"https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/optimized/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-1.png\" srcset=\"https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/optimized/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-1.png 900w, https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/optimized/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-1-300x300.png 300w, https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/optimized/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-1-150x150.png 150w, https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/optimized/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-1-768x768.png 768w, https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/optimized/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-1-600x600.png 600w, https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/optimized/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-1-100x100.png 100w\" width=\"900\" /></p>\n\n<p>BẢNG C: Lập tr&igrave;nh 3D CoderZ Cyber Robotics 101</p>\n\n<ul>\n	<li>Giải nhất: Nguyễn Quang Th&agrave;nh &ndash; Trường THCS Huyền Tụng</li>\n	<li>Giải nh&igrave;: Kiều Tuệ Minh &ndash; Trường THCS Đức Xu&acirc;n</li>\n	<li>Giải khuyến kh&iacute;ch 1: Trần Minh Thư &ndash; Trường THCS Đức Xu&acirc;n</li>\n	<li>Giải khuyến kh&iacute;ch 2: Nguyễn Minh Th ư &ndash; Trường THCS Đức Xu&acirc;n</li>\n</ul>\n\n<p><img alt=\"\" data-src=\"https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/source/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-2.png\" data-srcset=\"https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/source/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-2.png 900w, https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/source/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-2-300x300.png 300w, https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/source/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-2-150x150.png 150w, https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/source/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-2-768x768.png 768w, https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/source/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-2-600x600.png 600w, https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/source/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-2-100x100.png 100w\" height=\"900\" id=\"NTg2Ojg1Nw==-1\" nitro-lazy-empty=\"\" nitro-lazy-src=\"https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/source/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-2.png\" nitro-lazy-srcset=\"https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/source/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-2.png 900w, https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/source/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-2-300x300.png 300w, https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/source/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-2-150x150.png 150w, https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/source/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-2-768x768.png 768w, https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/source/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-2-600x600.png 600w, https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/source/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-2-100x100.png 100w\" sizes=\"(max-width: 900px) 100vw, 900px\" src=\"https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/source/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-2.png\" srcset=\"https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/source/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-2.png 900w, https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/source/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-2-300x300.png 300w, https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/source/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-2-150x150.png 150w, https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/source/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-2-768x768.png 768w, https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/source/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-2-600x600.png 600w, https://cdn-fbadm.nitrocdn.com/mbYkMyPqdjasGrXGLTmudxSPkPvWQMnv/assets/static/source/rev-da8f2fb/wp-content/uploads/2022/09/Untitled-design-2-100x100.png 100w\" width=\"900\" /></p>\n\n<p>CH&Uacute;C MỪNG TẤT CẢ C&Aacute;C BẠN HỌC SINH Đ&Atilde; HO&Agrave;N TH&Agrave;NH SUẤT SẮC PHẦN THI V&Agrave; GI&Agrave;NH ĐƯỢC NHỮNG KẾT QUẢ ẤN TƯỢNG.</p>\n\n<p>MỘT LẦN NỮA HỌC VIỆN KIDSTEM XIN GỬI LỜI CẢM ƠN PGD&amp;ĐT TH&Agrave;NH PHỐ BẮC KẠN Đ&Atilde; TẠO ĐIỀU KIỆN GI&Uacute;P CUỘC THI TH&Agrave;NH C&Ocirc;NG TỐT ĐẸP.</p>\n\n<p>&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&mdash;&ndash;</p>\n\n<p>Học viện Kidstem &ndash; X&acirc;y dựng nền tảng &ndash; Khơi gợi đam m&ecirc;.</p>\n\n<p>LI&Ecirc;N HỆ ĐĂNG K&Yacute; HỌC:</p>\n\n<p>Học viện Kidstem &ndash; Số 5 Nguyễn Qu&yacute; Đức, Thanh Xu&acirc;n Bắc &ndash; Thanh Xu&acirc;n &ndash; H&agrave; Nội.</p>\n','[{\"file\":\"/images/20230103/Untitled_design_3.png\",\"extension\":\"png\"}]',1,'2023-01-04 17:02:40','2023-01-04 17:02:40',1,'trao-giai-cuoc-thi-lap-trinh-code-to-lead-hoc-vien-kidstem-cung-pgddt-thanh-pho-bac-kan-phoi-hop-to-chuc');
/*!40000 ALTER TABLE `contents` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 16:15:56
