-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: booksdb
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add category',6,'add_category'),(22,'Can change category',6,'change_category'),(23,'Can delete category',6,'delete_category'),(24,'Can view category',6,'view_category'),(25,'Can add user',7,'add_user'),(26,'Can change user',7,'change_user'),(27,'Can delete user',7,'delete_user'),(28,'Can view user',7,'view_user'),(29,'Can add author',8,'add_author'),(30,'Can change author',8,'change_author'),(31,'Can delete author',8,'delete_author'),(32,'Can view author',8,'view_author'),(33,'Can add book',9,'add_book'),(34,'Can change book',9,'change_book'),(35,'Can delete book',9,'delete_book'),(36,'Can view book',9,'view_book'),(37,'Can add company',10,'add_company'),(38,'Can change company',10,'change_company'),(39,'Can delete company',10,'delete_company'),(40,'Can view company',10,'view_company'),(41,'Can add comment',11,'add_comment'),(42,'Can change comment',11,'change_comment'),(43,'Can delete comment',11,'delete_comment'),(44,'Can view comment',11,'view_comment'),(45,'Can add tag',12,'add_tag'),(46,'Can change tag',12,'change_tag'),(47,'Can delete tag',12,'delete_tag'),(48,'Can view tag',12,'view_tag'),(49,'Can add action',13,'add_action'),(50,'Can change action',13,'change_action'),(51,'Can delete action',13,'delete_action'),(52,'Can view action',13,'view_action'),(53,'Can add rating',14,'add_rating'),(54,'Can change rating',14,'change_rating'),(55,'Can delete rating',14,'delete_rating'),(56,'Can view rating',14,'view_rating'),(57,'Can add application',15,'add_application'),(58,'Can change application',15,'change_application'),(59,'Can delete application',15,'delete_application'),(60,'Can view application',15,'view_application'),(61,'Can add access token',16,'add_accesstoken'),(62,'Can change access token',16,'change_accesstoken'),(63,'Can delete access token',16,'delete_accesstoken'),(64,'Can view access token',16,'view_accesstoken'),(65,'Can add grant',17,'add_grant'),(66,'Can change grant',17,'change_grant'),(67,'Can delete grant',17,'delete_grant'),(68,'Can view grant',17,'view_grant'),(69,'Can add refresh token',18,'add_refreshtoken'),(70,'Can change refresh token',18,'change_refreshtoken'),(71,'Can delete refresh token',18,'delete_refreshtoken'),(72,'Can view refresh token',18,'view_refreshtoken'),(73,'Can add id token',19,'add_idtoken'),(74,'Can change id token',19,'change_idtoken'),(75,'Can delete id token',19,'delete_idtoken'),(76,'Can view id token',19,'view_idtoken'),(77,'Can add book view',20,'add_bookview'),(78,'Can change book view',20,'change_bookview'),(79,'Can delete book view',20,'delete_bookview'),(80,'Can view book view',20,'view_bookview'),(81,'Can add order_ detail',21,'add_order_detail'),(82,'Can change order_ detail',21,'change_order_detail'),(83,'Can delete order_ detail',21,'delete_order_detail'),(84,'Can view order_ detail',21,'view_order_detail'),(85,'Can add order',22,'add_order'),(86,'Can change order',22,'change_order'),(87,'Can delete order',22,'delete_order'),(88,'Can view order',22,'view_order');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_action`
--

DROP TABLE IF EXISTS `books_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books_action` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `type` smallint unsigned NOT NULL,
  `book_id` bigint NOT NULL,
  `creator_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `books_action_book_id_62ec5d29_fk_books_book_id` (`book_id`),
  KEY `books_action_creator_id_172f519c_fk_books_user_id` (`creator_id`),
  CONSTRAINT `books_action_book_id_62ec5d29_fk_books_book_id` FOREIGN KEY (`book_id`) REFERENCES `books_book` (`id`),
  CONSTRAINT `books_action_creator_id_172f519c_fk_books_user_id` FOREIGN KEY (`creator_id`) REFERENCES `books_user` (`id`),
  CONSTRAINT `books_action_chk_1` CHECK ((`type` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_action`
--

LOCK TABLES `books_action` WRITE;
/*!40000 ALTER TABLE `books_action` DISABLE KEYS */;
INSERT INTO `books_action` VALUES (1,'2022-08-22 14:58:47.055162','2022-08-22 14:58:47.055162',1,2,2);
/*!40000 ALTER TABLE `books_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_author`
--

DROP TABLE IF EXISTS `books_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books_author` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `author_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_info` longtext COLLATE utf8mb4_unicode_ci,
  `author_image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `author_name` (`author_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_author`
--

LOCK TABLES `books_author` WRITE;
/*!40000 ALTER TABLE `books_author` DISABLE KEYS */;
INSERT INTO `books_author` VALUES (1,'Nguyễn Nhật Ánh',NULL,''),(2,'Anh Thư',NULL,''),(3,'Hồ Anh Thái','ồ Anh Thái có lẽ là một trong những tác giả có sức viết dồi dào nhất nền văn học đương đại Việt Nam với tổng cộng 33 cuốn sách','author/2022/10/nguyennhatanh.jpg'),(4,'Nguyễn Vĩnh Nguyên','Nhà văn người Pháp Patrick Modiano, chủ nhân của giải Nobel Văn chương 2014 là một trong những tác giả gợi nhiều cảm hứng tới Nguyễn Vĩnh Nguyên, cùng với Italo Calvino của tác phẩm “Những thành phố vô hình”.','author/2022/10/nguyennhatanh_Mstk2XH.jpg');
/*!40000 ALTER TABLE `books_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_book`
--

DROP TABLE IF EXISTS `books_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books_book` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `book_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `public_date` date DEFAULT NULL,
  `suggest` tinyint(1) NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `publishing_house` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number_of_pages` int NOT NULL,
  `quantity` int NOT NULL,
  `price` double NOT NULL,
  `book_image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `author_id` bigint DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  `company_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `book_name` (`book_name`),
  UNIQUE KEY `books_book_category_id_book_name_22deb1a9_uniq` (`category_id`,`book_name`),
  KEY `books_book_company_id_13ac9196_fk_books_company_id` (`company_id`),
  KEY `books_book_author_id_8b91747b_fk_books_author_id` (`author_id`),
  CONSTRAINT `books_book_author_id_8b91747b_fk_books_author_id` FOREIGN KEY (`author_id`) REFERENCES `books_author` (`id`),
  CONSTRAINT `books_book_category_id_406d8649_fk_books_category_id` FOREIGN KEY (`category_id`) REFERENCES `books_category` (`id`),
  CONSTRAINT `books_book_company_id_13ac9196_fk_books_company_id` FOREIGN KEY (`company_id`) REFERENCES `books_company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_book`
--

LOCK TABLES `books_book` WRITE;
/*!40000 ALTER TABLE `books_book` DISABLE KEYS */;
INSERT INTO `books_book` VALUES (1,'Có một con đường mòn trên biển','2022-08-01',1,'','NXB Kim Đồng',100,5,62000,'books/2022/08/_ng_m_n.jpg','2022-08-17 14:39:49.647839','2022-08-20 15:07:24.552293',1,4,1),(2,'7 Kì Quan Thế Giới','2022-07-05',0,'','NXB Kim Đồng',200,10,100000,'books/2022/08/7_ki_quan_the_gioi.jpg','2022-08-17 14:52:16.947068','2022-08-20 15:09:23.045624',2,6,1),(3,'6 Thời Kỳ Quan Trọng Để Dạy Trẻ','2022-05-19',1,'','NXB Kim Đồng',100,5,200000,'books/2022/08/6-thoi-ky-quan-trong-de-day-tre_1.jpg','2022-08-17 14:53:46.472969','2022-08-17 14:53:46.472969',1,3,1),(4,'Những Mảnh Ghép Rực Rỡ','2022-08-17',1,'','VTC',290,5,250000,'books/2022/08/001.u2377.d20160714.t143629.jpg','2022-08-17 14:55:41.314579','2022-08-17 14:55:41.314579',2,11,2),(5,'Bố Mẹ Đã Cưa Đổ Tớ','2022-08-17',1,'','VTC',500,1000,300000,'books/2022/08/002.u669.d20160609.t085713.jpg','2022-08-17 14:57:00.595498','2022-08-17 14:57:00.595498',2,11,2),(6,'10 Phút Dạy Trẻ Mỗi Ngày','2022-07-05',1,'','VTC',111,12,1222222,'books/2022/08/10-phut-danh-cho-tre-moi-ngay-4.jpg','2022-08-17 14:58:11.719514','2022-08-17 14:58:11.719514',2,3,2),(7,'Tớ đã thích cậu như nào ?','2022-07-05',0,NULL,'VTC',200,10,100000,'books/2022/08/img100_12.jpg','2022-09-26 16:16:53.701129','2022-09-26 16:16:53.701129',2,1,1),(83,'Lẽ phải của phi lý trí','2022-10-04',0,'Hay','VTC',122,5,89000,'books/2022/10/002_4_7.jpg','2022-10-17 15:10:02.201863','2022-10-17 15:10:02.201863',1,2,2),(84,'Bạn có thể đàm phán bất cứ điều gì','2022-10-04',0,NULL,'',123,5,90000,'books/2022/10/ban-co-the-dam-phan-bat-cu-dieu-gi.jpg','2022-10-17 15:14:59.252479','2022-10-17 15:14:59.252479',2,6,1),(85,'Giận','2022-10-04',0,NULL,'',123,5,90000,'books/2022/10/17_3.jpeg','2022-10-17 15:19:35.708599','2022-10-17 15:19:35.708599',1,6,2),(87,'33 chiến lược của chiến tranh','2022-10-04',0,NULL,'',123,5,90000,'books/2022/10/33-chien-luoc.jpg','2022-10-17 15:21:28.214220','2022-10-17 15:21:28.214220',2,5,1),(88,'Nâng cao IQ','2022-10-04',0,NULL,'',211,5,99000,'books/2022/10/101-cach-de-trao-doi-tri-tue.jpg','2022-10-17 15:42:33.603466','2022-10-17 15:42:33.603466',1,4,2),(133,'Excel 2007','2022-10-04',0,'Hay','',155,5,89000,'books/2022/10/100-thu-thuat-can-ban-nhat-trong-microsoft-office-excel-2007_1.jpg','2022-10-17 16:55:59.360868','2022-10-17 16:55:59.360868',2,8,1),(134,'511','2022-10-04',0,NULL,'',211,5,99000,'books/2022/10/_ng_m_n_LzQreNJ.jpg','2022-10-23 16:20:34.295399','2022-10-23 16:20:34.295399',NULL,3,1),(135,'1 tư duy khác về kinh tế xã hội','2022-10-12',0,'undefined','',155,5,89000,'books/2022/10/1_tu_duy_khac_ve_kinh_te_xa_hoi_vn.jpg','2022-10-24 10:39:58.456955','2022-10-24 10:39:58.456955',3,5,4),(136,'Đề thi học sinh giỏi Toán Tiểu học','2022-10-12',0,'undefined','',155,5,89000,'books/2022/10/22132711745440.jpg','2022-10-24 10:43:37.744020','2022-10-24 10:43:37.744020',4,5,4);
/*!40000 ALTER TABLE `books_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_book_tags`
--

DROP TABLE IF EXISTS `books_book_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books_book_tags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `book_id` bigint NOT NULL,
  `tag_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `books_book_tags_book_id_tag_id_fe5260d1_uniq` (`book_id`,`tag_id`),
  KEY `books_book_tags_tag_id_c3abea8d_fk_books_tag_id` (`tag_id`),
  CONSTRAINT `books_book_tags_book_id_45714dc1_fk_books_book_id` FOREIGN KEY (`book_id`) REFERENCES `books_book` (`id`),
  CONSTRAINT `books_book_tags_tag_id_c3abea8d_fk_books_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `books_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_book_tags`
--

LOCK TABLES `books_book_tags` WRITE;
/*!40000 ALTER TABLE `books_book_tags` DISABLE KEYS */;
INSERT INTO `books_book_tags` VALUES (1,1,1),(2,1,2),(3,2,2),(4,2,3);
/*!40000 ALTER TABLE `books_book_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_bookview`
--

DROP TABLE IF EXISTS `books_bookview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books_bookview` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `views` int NOT NULL,
  `book_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `books_bookview_book_id_95acaba2_uniq` (`book_id`),
  CONSTRAINT `books_bookview_book_id_95acaba2_fk_books_book_id` FOREIGN KEY (`book_id`) REFERENCES `books_book` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_bookview`
--

LOCK TABLES `books_bookview` WRITE;
/*!40000 ALTER TABLE `books_bookview` DISABLE KEYS */;
INSERT INTO `books_bookview` VALUES (1,'2022-08-22 15:14:33.788675','2022-08-22 15:17:36.886765',21,2);
/*!40000 ALTER TABLE `books_bookview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_category`
--

DROP TABLE IF EXISTS `books_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int NOT NULL,
  `order` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_category`
--

LOCK TABLES `books_category` WRITE;
/*!40000 ALTER TABLE `books_category` DISABLE KEYS */;
INSERT INTO `books_category` VALUES (1,'Sách Tiếng Việt',0,1),(2,'Sách Tiếng Anh',0,2),(3,'Sách Nuôi Dạy Con',1,1),(4,'Sách Văn Học',1,2),(5,'Sách Kinh Tế',1,3),(6,'Sách Kỹ Năng - Sống Đẹp',1,4),(8,'Sách Tham Khảo',1,5),(9,'Sách Ngoại Ngữ',1,6),(10,'Truyện Tranh',1,7),(11,'Tiểu Thuyết',1,8);
/*!40000 ALTER TABLE `books_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_comment`
--

DROP TABLE IF EXISTS `books_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `book_id` bigint NOT NULL,
  `creator_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `books_comment_book_id_ac8af439_fk_books_book_id` (`book_id`),
  KEY `books_comment_creator_id_f64d3eeb_fk_books_user_id` (`creator_id`),
  CONSTRAINT `books_comment_book_id_ac8af439_fk_books_book_id` FOREIGN KEY (`book_id`) REFERENCES `books_book` (`id`),
  CONSTRAINT `books_comment_creator_id_f64d3eeb_fk_books_user_id` FOREIGN KEY (`creator_id`) REFERENCES `books_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_comment`
--

LOCK TABLES `books_comment` WRITE;
/*!40000 ALTER TABLE `books_comment` DISABLE KEYS */;
INSERT INTO `books_comment` VALUES (2,'Tuyệt vời quá !!!','2022-08-22 13:54:39.237686','2022-08-22 13:59:01.112728',1,2),(4,'Hay qua!','2022-10-23 15:49:30.930650','2022-10-23 15:49:30.931292',1,4),(5,'Hay qua!','2022-10-23 15:53:25.413606','2022-10-23 15:53:25.413606',1,4),(6,'Hay !','2022-10-23 15:54:59.996414','2022-10-23 15:54:59.996414',1,4),(7,'Hay quas di\n','2022-10-23 16:00:54.601143','2022-10-23 16:00:54.601143',1,4),(8,'123','2022-10-23 16:10:40.326592','2022-10-23 16:10:40.326592',1,4),(9,'Nice','2022-10-23 16:12:17.853355','2022-10-23 16:12:17.853355',1,4),(10,'123','2022-10-23 16:40:41.160156','2022-10-23 16:40:41.160279',1,4),(11,'123','2022-10-23 16:43:25.324430','2022-10-23 16:43:25.324430',1,4),(12,'123','2022-10-23 16:43:47.108835','2022-10-23 16:43:47.108835',1,4),(13,'hay','2022-10-23 16:43:50.081018','2022-10-23 16:43:50.081513',1,4),(14,'123','2022-10-23 16:45:05.310812','2022-10-23 16:45:05.310812',134,4),(15,'hay','2022-10-23 16:45:07.877097','2022-10-23 16:45:07.877097',134,4),(16,'HAy','2022-10-23 16:48:18.089102','2022-10-23 16:48:18.089581',133,4),(17,'123','2022-10-23 17:00:26.789754','2022-10-23 17:00:26.789754',88,4);
/*!40000 ALTER TABLE `books_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_company`
--

DROP TABLE IF EXISTS `books_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books_company` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `company_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_info` longtext COLLATE utf8mb4_unicode_ci,
  `company_image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `company_name` (`company_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_company`
--

LOCK TABLES `books_company` WRITE;
/*!40000 ALTER TABLE `books_company` DISABLE KEYS */;
INSERT INTO `books_company` VALUES (1,'NXB Kim Đồng','Nhà xuất bản Kim Đồng là nhà xuất bản chuyên về sách văn học thiếu nhi của Việt Nam được thành lập vào ngày 15 tháng 6 năm 1956 tại Hà Nội. Ngoài ra, Kim Đồng còn hợp tác với hơn 70 nhà xuất bản trên thế giới có thể kể đến như Dorling Kindersley, HarperCollins UK, Simon and Schuster UK, Dami International, Shogakukan, Kodansha, Shuiesha, Square Enix, nhà xuất bản Seoul và nhà xuất bản Neung-In (Hàn Quốc).','company/2022/10/fn.jpg'),(2,'VTV Game','VTC Đài Truyền hình Kỹ thuật số VTC, còn gọi là Đài Truyền hình Kỹ thuật số Việt Nam, gọi tắt là VTC hay Đài VTC, là một đài truyền hình thành viên của Đài Tiếng nói Việt Nam (VOV).[1] Đây là đài truyền hình đầu tiên tại Việt Nam phát sóng truyền hình kỹ thuật số và truyền hình kỹ thuật số mặt đất.[2] Tuy không phải là đài truyền hình quốc gia nhưng VTC lại được phủ sóng toàn quốc và thực hiện chức năng nhiệm vụ tuyên truyền về mọi mặt kinh tế, chính trị, xã hội như một đài truyền hình quốc gia.','company/2022/10/fn.jpg'),(3,'NXB Quốc Gia','Nhà xuất bản Quốc Gia','company/2022/10/nguyennhatanh.jpg'),(4,'NXB Tuổi trẻ','Nhà xuất bản Tuổi trẻ','company/2022/10/fn.jpg'),(5,'nxb xây dựng','Nhà sách NXB Xây Dựng hàng ngàn tựa sách, cam kết hoàn tiền 111% nếu sách giả, giảm giá đến 40%, nhiều mã giảm giá hôm nay, giao nhanh 2h. Mua ngay!','company/2022/10/tre.png');
/*!40000 ALTER TABLE `books_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_order`
--

DROP TABLE IF EXISTS `books_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  `shipping_fee` double NOT NULL,
  `shipping_address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_receiver` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_receiver` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `creator_id` bigint NOT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `books_order_creator_id_6763478e_fk_books_user_id` (`creator_id`),
  CONSTRAINT `books_order_creator_id_6763478e_fk_books_user_id` FOREIGN KEY (`creator_id`) REFERENCES `books_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_order`
--

LOCK TABLES `books_order` WRITE;
/*!40000 ALTER TABLE `books_order` DISABLE KEYS */;
INSERT INTO `books_order` VALUES (1,100000,10000,'Gia Lai','Chua Thanh Toan','972351922','TUong','2022-01-19 14:34:51.711566','2022-09-19 14:34:51.711566',4,NULL),(2,1000000,10000,'Gia Lai Viet Nam','Chua Thanh Toan','0972351922','Thai TUong','2022-02-19 14:36:42.069829','2022-09-19 14:36:42.069829',4,NULL),(3,2022222,0,'gia lai Hồ Chí Minh Bình Chánh An Phú Tây','chua thanh toan','0972351922','thai tuong','2022-03-21 14:21:51.795167','2022-09-21 14:21:51.795167',1,NULL),(4,800000,0,'Gia Lai Hồ Chí Minh Bình Chánh An Phú Tây','chua thanh toan','(+84) 972351922','Vuong Thai TUong','2022-09-21 14:32:15.437996','2022-09-21 14:32:15.437996',1,NULL),(5,800000,0,'Gia Lai Hồ Chí Minh Bình Chánh An Phú Tây','chua thanh toan','(+84) 972351922','Vuong Thai TUong 001','2022-04-21 14:35:16.877379','2022-09-21 14:35:16.877379',1,NULL),(6,1772222,0,'Quang Ngai Hồ Chí Minh Bình Chánh An Phú Tây','chua thanh toan','(+84) 972351922','thai tuong','2022-06-21 14:43:02.028783','2022-09-21 14:43:02.028783',1,NULL),(7,1772222,0,'Quang Ngai Hồ Chí Minh Bình Chánh An Phú Tây','chua thanh toan','(+84) 972351922','thai tuong','2022-08-21 14:49:33.478569','2022-09-21 14:49:33.478569',1,NULL),(8,1772222,0,'Quang Ngai Hồ Chí Minh Bình Chánh An Phú Tây','chua thanh toan','(+84) 972351922','thai tuong','2021-11-21 14:50:56.212325','2022-09-21 14:50:56.212325',1,NULL),(9,1772222,0,'Quang Ngai Hồ Chí Minh Bình Chánh An Phú Tây','chua thanh toan','(+84) 972351922','thai tuong','2022-09-21 14:54:53.554768','2022-09-21 14:54:53.554768',1,NULL),(10,1772222,0,'Quang Ngai Hồ Chí Minh Bình Chánh An Phú Tây','chua thanh toan','(+84) 972351922','thai tuong','2022-02-21 14:57:20.357941','2022-09-21 14:57:20.357941',1,NULL),(11,650000,0,'Gia Lai Hồ Chí Minh Bình Chánh An Phú Tây','chua thanh toan','(+84) 972351922','thai tuong','2022-08-21 14:59:34.428553','2022-09-21 14:59:34.428553',1,NULL),(12,650000,0,'Gia Lai Hồ Chí Minh Bình Chánh An Phú Tây','chua thanh toan','(+84) 972351922','thai tuong','2022-06-21 15:03:58.239917','2022-09-21 15:03:58.239917',1,NULL),(13,650000,0,'Gia Lai Hồ Chí Minh Bình Chánh An Phú Tây','chua thanh toan','(+84) 972351922','thai tuong','2022-09-21 15:08:46.034964','2022-09-21 15:08:46.034964',1,NULL),(14,650000,0,'Gia Lai Hồ Chí Minh Bình Chánh An Phú Tây','chua thanh toan','(+84) 972351922','thai tuong','2022-06-21 15:11:03.748443','2022-09-21 15:11:03.748443',1,NULL),(15,662000,0,'THôn 7 Hồ Chí Minh Bình Chánh An Phú Tây','chua thanh toan','(+84) 972351922','thai tuong','2022-09-21 15:14:38.976655','2022-09-21 15:14:38.976655',1,NULL),(16,662000,0,'THôn 7 Hồ Chí Minh Bình Chánh An Phú Tây','chua thanh toan','(+84) 972351922','thai tuong','2022-05-21 15:15:54.418661','2022-09-21 15:15:54.418661',1,NULL),(17,662000,0,'THôn 7 Hồ Chí Minh Bình Chánh An Phú Tây','chua thanh toan','(+84) 972351922','thai tuong','2022-09-21 15:17:20.329089','2022-09-21 15:17:20.329089',1,NULL),(18,1000000,10000,'Gia Lai Viet Nam','Chua Thanh Toan','0972351922','Thai TUong','2022-10-15 12:47:16.019081','2022-10-15 12:47:16.019081',2,NULL),(19,4266666,0,'Gia Lai Hồ Chí Minh Bình Chánh An Phú Tây','chua thanh toan','(+84) 972351922','thai tuong','2022-10-15 12:49:55.212070','2022-10-15 12:49:55.212070',2,NULL),(20,4266666,0,'Gia Lai Hồ Chí Minh Bình Chánh An Phú Tây','chua thanh toan','(+84) 972351922','thai tuong','2022-10-15 12:58:54.467449','2022-10-15 12:58:54.467449',2,NULL),(21,4266666,0,'THôn 7 Hồ Chí Minh Bình Chánh An Phú Tây','chua thanh toan','(+84) 972351922','thai tuong','2022-10-15 13:02:44.023123','2022-10-15 13:02:44.023123',6,NULL),(22,4266666,0,'THôn 7 Hồ Chí Minh Bình Chánh An Phú Tây','chua thanh toan','(+84) 972351922','thai tuong','2022-10-15 13:06:15.303516','2022-10-15 13:06:15.303516',6,NULL),(23,700000,0,'THôn 7 Hồ Chí Minh Bình Chánh An Phú Tây','chua thanh toan','(+84) 972351922','hung','2022-10-15 13:21:17.331541','2022-10-15 13:21:17.331541',6,NULL),(24,600000,0,'THôn 7 Hồ Chí Minh Bình Chánh An Phú Tây','chua thanh toan','(+84) 972351922','hu','2022-10-15 13:23:18.359284','2022-10-15 13:23:18.359284',6,NULL),(25,600000,0,'THôn 7 Hồ Chí Minh Bình Chánh An Phú Tây','chua thanh toan','(+84) 972351922','thai ','2022-10-15 13:24:51.747074','2022-10-15 13:24:51.747074',6,NULL),(26,277000,0,'THôn 7 Hồ Chí Minh Bình Chánh An Phú Tây','chua thanh toan','(+84) 972351922','thai tuong','2022-10-24 11:01:57.642482','2022-10-24 11:01:57.642482',4,NULL),(27,278000,0,'THôn 7 Hồ Chí Minh Bình Chánh An Phú Tây','chua thanh toan','(+84) 972351922','thai tuong','2022-10-24 11:03:00.669476','2022-10-24 11:03:00.669476',4,NULL);
/*!40000 ALTER TABLE `books_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_order_detail`
--

DROP TABLE IF EXISTS `books_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books_order_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  `quantity` int NOT NULL,
  `book` int NOT NULL,
  `order_id` bigint NOT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `books_order_detail_order_id_a6a64bdd_fk_books_order_id` (`order_id`),
  CONSTRAINT `books_order_detail_order_id_a6a64bdd_fk_books_order_id` FOREIGN KEY (`order_id`) REFERENCES `books_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_order_detail`
--

LOCK TABLES `books_order_detail` WRITE;
/*!40000 ALTER TABLE `books_order_detail` DISABLE KEYS */;
INSERT INTO `books_order_detail` VALUES (1,1000000,2,1,1,'7 kì quan thế giới'),(2,5000000,20,2,1,'12'),(3,5000000,20,2,5,'12'),(4,5000000,20,2,4,'12'),(5,5000000,20,2,2,'12'),(6,5000000,20,2,2,'12'),(7,5000000,20,2,1,'12'),(8,5000000,20,2,1,'12'),(9,5000000,20,2,1,'12'),(10,100000,1,2,6,'12'),(11,62000,1,1,15,'12'),(12,62000,1,1,16,'12'),(13,62000,1,1,17,'12'),(14,200000,1,3,17,'12'),(15,100000,1,2,17,'12'),(16,300000,1,5,17,'12'),(17,5000000,20,2,5,'12'),(18,5000000,20,2,5,'12'),(19,5000000,20,2,5,'12'),(20,5000000,20,2,5,'12'),(21,5000000,20,2,5,'12'),(22,5000000,20,2,5,''),(23,5000000,2,3,5,''),(24,5000000,2,3,5,''),(25,5000000,2,3,5,''),(26,5000000,2,3,5,'12321'),(27,5000000,2,3,5,'7 kì quan thế giới'),(28,1222222,3,6,19,'10 Phút Dạy Trẻ Mỗi Ngày'),(29,300000,2,5,19,'Bố Mẹ Đã Cưa Đổ Tớ'),(30,1222222,3,6,20,'10 Phút Dạy Trẻ Mỗi Ngày'),(31,300000,2,5,20,'Bố Mẹ Đã Cưa Đổ Tớ'),(32,1222222,3,6,22,'10 Phút Dạy Trẻ Mỗi Ngày'),(33,300000,2,5,22,'Bố Mẹ Đã Cưa Đổ Tớ'),(34,100000,1,2,23,'7 Kì Quan Thế Giới'),(35,200000,3,3,23,'6 Thời Kỳ Quan Trọng Để Dạy Trẻ'),(36,200000,3,3,24,'6 Thời Kỳ Quan Trọng Để Dạy Trẻ'),(37,200000,3,3,25,'6 Thời Kỳ Quan Trọng Để Dạy Trẻ'),(38,89000,1,136,26,'Đề thi học sinh giỏi Toán Tiểu học'),(39,89000,1,135,26,'1 tư duy khác về kinh tế xã hội'),(40,99000,1,134,26,'511'),(41,89000,1,133,27,'Excel 2007'),(42,99000,1,88,27,'Nâng cao IQ'),(43,90000,1,87,27,'33 chiến lược của chiến tranh');
/*!40000 ALTER TABLE `books_order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_rating`
--

DROP TABLE IF EXISTS `books_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books_rating` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `rate` smallint unsigned NOT NULL,
  `book_id` bigint NOT NULL,
  `creator_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `books_rating_book_id_69df80d8_fk_books_book_id` (`book_id`),
  KEY `books_rating_creator_id_932d5c00_fk_books_user_id` (`creator_id`),
  CONSTRAINT `books_rating_book_id_69df80d8_fk_books_book_id` FOREIGN KEY (`book_id`) REFERENCES `books_book` (`id`),
  CONSTRAINT `books_rating_creator_id_932d5c00_fk_books_user_id` FOREIGN KEY (`creator_id`) REFERENCES `books_user` (`id`),
  CONSTRAINT `books_rating_chk_1` CHECK ((`rate` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_rating`
--

LOCK TABLES `books_rating` WRITE;
/*!40000 ALTER TABLE `books_rating` DISABLE KEYS */;
INSERT INTO `books_rating` VALUES (1,'2022-08-22 15:04:30.141065','2022-08-22 15:04:30.141065',1,2,2),(2,'2022-10-23 16:59:13.863762','2022-10-23 16:59:13.863762',4,85,4),(3,'2022-10-23 17:00:23.138898','2022-10-23 17:00:23.139921',4,88,4),(4,'2022-10-23 17:07:37.283295','2022-10-23 17:07:37.283295',4,88,4),(5,'2022-10-23 17:22:09.612126','2022-10-23 17:22:09.612126',4,88,4),(6,'2022-10-23 17:22:23.768708','2022-10-23 17:28:14.613190',5,88,4),(7,'2022-10-23 17:28:48.707812','2022-10-23 17:28:48.707812',5,134,4),(8,'2022-10-23 17:29:05.917650','2022-10-23 17:29:05.917650',1,134,4);
/*!40000 ALTER TABLE `books_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_tag`
--

DROP TABLE IF EXISTS `books_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_tag`
--

LOCK TABLES `books_tag` WRITE;
/*!40000 ALTER TABLE `books_tag` DISABLE KEYS */;
INSERT INTO `books_tag` VALUES (2,'haihuoc'),(3,'khampha'),(1,'tinhcam');
/*!40000 ALTER TABLE `books_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_user`
--

DROP TABLE IF EXISTS `books_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `avatar` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_user`
--

LOCK TABLES `books_user` WRITE;
/*!40000 ALTER TABLE `books_user` DISABLE KEYS */;
INSERT INTO `books_user` VALUES (1,'pbkdf2_sha256$260000$dVLPEPPrNHCWeQiiDjiosr$9g+E/ivNkSXdAW7X0V9MWLl+YIhTEdQreE+GETi/OvA=','2022-10-15 15:45:56.812725',1,'admin','','','thaituong001@gmail.com',1,1,'2022-08-17 14:23:36.241873',''),(2,'pbkdf2_sha256$260000$RiT4rf0XcUfoBWtXTP84lU$V8t59/frIYMs7X6Lsmr/hq3lq333/Zd3/g26Y6sZVA8=',NULL,0,'ou1','thai','tuong','thaituog001@gmail.com',0,1,'2022-08-20 16:58:24.757858',''),(4,'pbkdf2_sha256$260000$pyS1ixDc5UUtOx9GS2AnF9$GCyNMyrJ6/VT8PIo8DjaH4rHrwbT9V+XDKksONm8QBw=',NULL,0,'ou12','','','',0,1,'2022-08-20 17:26:51.702491',''),(5,'pbkdf2_sha256$260000$7D2bdhAREuka6unpYdKTui$l9pl3l/Ou+c4UWsowAiaEU3LT5UavsPu2RRIYvg9s54=',NULL,0,'ou124','Thai','Tuong','thaituong001@gmail.com',0,1,'2022-09-12 08:22:26.289861',''),(6,'pbkdf2_sha256$260000$xTNTPB8c1ceRQih6OJxcwr$gccsPNYA4LY6mC0yi5wwxDVLWKUlb+aV7bK58O3aoG4=',NULL,0,'ou2','thanh','hung','thanhhung001@gmail.com',0,1,'2022-09-12 08:28:08.656784',''),(7,'pbkdf2_sha256$260000$GQlPGtBRXbqlaUCugxhbjh$xTQxUwk/NyNlUmX+VIJWpNZaAW/5jHUe7DFBwrJhF0A=',NULL,0,'ou3','thanh','hung','1234@gmail.com',0,1,'2022-09-12 08:29:09.975842',''),(8,'pbkdf2_sha256$260000$x7uHDVg4yZtLfeZ1anjci6$XiM69Rsd0wk6khJue3CwQhpQ+g4VutJnkZnt3yT9uwo=',NULL,0,'ou123','thai','tuong','thaituong001@gmail.com',0,1,'2022-09-12 08:31:54.261840',''),(9,'pbkdf2_sha256$260000$XCtfpzUPtz310qACMklWrS$ssfjIuzoI/bnskRvmiNssuPCMB7vk6lNWDJfwoBGs7Q=',NULL,0,'ou22','123','123','tuon2@ou.edu.vn',0,1,'2022-09-12 08:34:23.760583',''),(10,'pbkdf2_sha256$260000$0hOpaM8GmpLNmhMeCs9osS$lU07r0Uyg5if7VCdXYiXU8fTiOaB4FfVobaNbmdNPbk=',NULL,0,'ou23','123','123','t@gmaul.com',0,1,'2022-09-12 08:35:03.306662',''),(11,'pbkdf2_sha256$260000$xbWruSyfQEYfcabV8hmHnS$OKyNH0HLQJjo7KTpF9hlU9zwYzT1axZuLnRzify40O8=',NULL,0,'ou231','123','123','t@gmaul.com',0,1,'2022-09-12 08:36:11.682947',''),(12,'pbkdf2_sha256$260000$lshbfPF3SwUaa18aQ58Jee$pqhmCOD2dQPwIWX7gHDvc1nj4t0Fy5VeoUbjXeylNdg=',NULL,0,'ou121','thai','tuong','thaituong@gmail.com',0,1,'2022-09-12 08:42:05.314779',''),(13,'pbkdf2_sha256$260000$yhP2jycPgjryDzAEPyXLmU$Sv9lnMXECBAzIZ+LLTY0HVDEL2uoyRD8/Vj15T3abbE=',NULL,0,'ou125','123','123','thaituong@gmail.com',0,1,'2022-09-12 09:09:05.785107',''),(14,'pbkdf2_sha256$260000$BdRwgET3ifSDKG0TfABMgc$ci1m/+qz82lD0QDyTaa7W1J/NYmVAVO4zDSNMhNOoqo=',NULL,0,'ou1251','123','123','thaituong@gmail.com',0,1,'2022-09-12 09:10:16.005996',''),(15,'pbkdf2_sha256$260000$bh0lbCTQhwJS7pgmCy20dz$bXr2kr8w5sdh1zcqjdpKBfU2rmays2qeDcA1oW3oK9w=',NULL,0,'ou129','123','12321321','123@gmail.com',0,1,'2022-09-12 09:11:25.459024',''),(16,'pbkdf2_sha256$260000$8YeJsitLShebxCMAc1y0U8$AkKs5X9Or4Ru8YMp+gKH3/Dq22nUqzbOeqrmvzCiVnc=',NULL,0,'ou112','123','12321','thaituong001@gmail.com',0,1,'2022-09-12 09:12:26.610324',''),(17,'pbkdf2_sha256$260000$OE6bCFJmYhVf0CYYSd9JoV$oz5cn+URkKHlmS8FItdw/HOR7hNobBm0uRi+UVX6wnw=',NULL,0,'ou999','123','213213','thaituong@gmail.com',0,1,'2022-09-12 09:13:36.905199',''),(18,'pbkdf2_sha256$260000$0daZSycGqanrwJ3uQNvCt6$RDr9/2TKtgXr7ZmvNPIQZIjSNrX9a/jYNplDDEfZ4PU=',NULL,0,'ou111','','','',0,1,'2022-10-17 14:25:45.757827',''),(19,'pbkdf2_sha256$260000$e4lcrGMivbXpLCanHYR04r$6uFmBDyu+Hx4hwObS8Ln9xrxHurM7IjhXbHpqlCNnLM=',NULL,0,'ou1111','','','',0,1,'2022-10-17 14:27:04.138669','upload/2022/10/authors.png');
/*!40000 ALTER TABLE `books_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_user_groups`
--

DROP TABLE IF EXISTS `books_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `books_user_groups_user_id_group_id_2326f030_uniq` (`user_id`,`group_id`),
  KEY `books_user_groups_group_id_9a20f01a_fk_auth_group_id` (`group_id`),
  CONSTRAINT `books_user_groups_group_id_9a20f01a_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `books_user_groups_user_id_859b442f_fk_books_user_id` FOREIGN KEY (`user_id`) REFERENCES `books_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_user_groups`
--

LOCK TABLES `books_user_groups` WRITE;
/*!40000 ALTER TABLE `books_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `books_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_user_user_permissions`
--

DROP TABLE IF EXISTS `books_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `books_user_user_permissions_user_id_permission_id_9af4fc60_uniq` (`user_id`,`permission_id`),
  KEY `books_user_user_perm_permission_id_95b62cb2_fk_auth_perm` (`permission_id`),
  CONSTRAINT `books_user_user_perm_permission_id_95b62cb2_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `books_user_user_permissions_user_id_2d867b4d_fk_books_user_id` FOREIGN KEY (`user_id`) REFERENCES `books_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_user_user_permissions`
--

LOCK TABLES `books_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `books_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `books_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_books_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_books_user_id` FOREIGN KEY (`user_id`) REFERENCES `books_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-08-17 14:39:49.679777','1','Có một con đường mòn trên biển',1,'[{\"added\": {}}]',9,1),(2,'2022-08-17 14:43:03.236150','4','Sách văn học',1,'[{\"added\": {}}]',6,1),(3,'2022-08-17 14:43:17.049829','4','Sách thiếu nhi',2,'[{\"changed\": {\"fields\": [\"Category name\", \"Order\"]}}]',6,1),(4,'2022-08-17 14:43:37.456899','4','Sách Kỹ năng - Sống đẹp',2,'[{\"changed\": {\"fields\": [\"Category name\", \"Order\"]}}]',6,1),(5,'2022-08-17 14:43:56.400137','4','Sách Kinh tế',2,'[{\"changed\": {\"fields\": [\"Category name\", \"Order\"]}}]',6,1),(6,'2022-08-17 14:44:12.250729','4','Sách Nuôi Dạy Con',2,'[{\"changed\": {\"fields\": [\"Category name\", \"Order\"]}}]',6,1),(7,'2022-08-17 14:45:06.899413','5','Sách Văn Học',1,'[{\"added\": {}}]',6,1),(8,'2022-08-17 14:46:52.358310','6','Sách Kinh Tế',1,'[{\"added\": {}}]',6,1),(9,'2022-08-17 14:47:26.919820','7','Sách Kỹ Năng - Sống Đẹp',1,'[{\"added\": {}}]',6,1),(10,'2022-08-17 14:48:23.088091','8','Sách Tham Khảo',1,'[{\"added\": {}}]',6,1),(11,'2022-08-17 14:49:06.849855','9','Sách Ngoại Ngữ',1,'[{\"added\": {}}]',6,1),(12,'2022-08-17 14:49:30.176861','10','Truyện Tranh',1,'[{\"added\": {}}]',6,1),(13,'2022-08-17 14:50:29.538107','11','Tiểu Thuyết',1,'[{\"added\": {}}]',6,1),(14,'2022-08-17 14:52:16.949073','2','7 Kì Quan Thế Giới',1,'[{\"added\": {}}]',9,1),(15,'2022-08-17 14:53:46.473969','3','6 Thời Kỳ Quan Trọng Để Dạy Trẻ',1,'[{\"added\": {}}]',9,1),(16,'2022-08-17 14:55:41.316516','4','Những Mảnh Ghép Rực Rỡ',1,'[{\"added\": {}}]',9,1),(17,'2022-08-17 14:57:00.596509','5','Bố Mẹ Đã Cưa Đổ Tớ',1,'[{\"added\": {}}]',9,1),(18,'2022-08-17 14:58:11.721507','6','10 Phút Dạy Trẻ Mỗi Ngày',1,'[{\"added\": {}}]',9,1),(19,'2022-10-16 13:34:13.670137','42','10 Phút Dạy Trẻ Mỗi Ngày 11',1,'[{\"added\": {}}]',9,1),(20,'2022-10-16 14:32:07.255177','59','12321',1,'[{\"added\": {}}]',9,1),(21,'2022-10-16 14:34:51.697244','60','1232131',1,'[{\"added\": {}}]',9,1),(22,'2022-10-16 14:37:43.227192','61','10 Phút Dạy Trẻ Mỗi Ngày12',1,'[{\"added\": {}}]',9,1),(23,'2022-10-17 13:11:31.489265','70','21321',1,'[{\"added\": {}}]',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(13,'books','action'),(8,'books','author'),(9,'books','book'),(20,'books','bookview'),(6,'books','category'),(11,'books','comment'),(10,'books','company'),(22,'books','order'),(21,'books','order_detail'),(14,'books','rating'),(12,'books','tag'),(7,'books','user'),(4,'contenttypes','contenttype'),(16,'oauth2_provider','accesstoken'),(15,'oauth2_provider','application'),(17,'oauth2_provider','grant'),(19,'oauth2_provider','idtoken'),(18,'oauth2_provider','refreshtoken'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-08-15 14:02:58.760447'),(2,'contenttypes','0002_remove_content_type_name','2022-08-15 14:02:58.810759'),(3,'auth','0001_initial','2022-08-15 14:02:59.002975'),(4,'auth','0002_alter_permission_name_max_length','2022-08-15 14:02:59.047957'),(5,'auth','0003_alter_user_email_max_length','2022-08-15 14:02:59.053330'),(6,'auth','0004_alter_user_username_opts','2022-08-15 14:02:59.058894'),(7,'auth','0005_alter_user_last_login_null','2022-08-15 14:02:59.064790'),(8,'auth','0006_require_contenttypes_0002','2022-08-15 14:02:59.069093'),(9,'auth','0007_alter_validators_add_error_messages','2022-08-15 14:02:59.074952'),(10,'auth','0008_alter_user_username_max_length','2022-08-15 14:02:59.081610'),(11,'auth','0009_alter_user_last_name_max_length','2022-08-15 14:02:59.089117'),(12,'auth','0010_alter_group_name_max_length','2022-08-15 14:02:59.104648'),(13,'auth','0011_update_proxy_permissions','2022-08-15 14:02:59.111004'),(14,'auth','0012_alter_user_first_name_max_length','2022-08-15 14:02:59.118472'),(15,'books','0001_initial','2022-08-15 14:02:59.383908'),(16,'admin','0001_initial','2022-08-15 14:02:59.484512'),(17,'admin','0002_logentry_remove_auto_add','2022-08-15 14:02:59.491650'),(18,'admin','0003_logentry_add_action_flag_choices','2022-08-15 14:02:59.500628'),(19,'sessions','0001_initial','2022-08-15 14:02:59.529500'),(20,'books','0002_auto_20220815_2307','2022-08-15 16:07:43.661363'),(21,'books','0003_auto_20220820_1036','2022-08-20 03:37:06.051281'),(22,'books','0004_auto_20220820_2014','2022-08-20 13:14:45.755988'),(23,'books','0005_auto_20220820_2050','2022-08-20 13:50:06.655193'),(24,'books','0006_action_rating','2022-08-20 16:08:46.864529'),(25,'oauth2_provider','0001_initial','2022-08-20 17:06:38.692798'),(26,'oauth2_provider','0002_auto_20190406_1805','2022-08-20 17:06:38.757657'),(27,'oauth2_provider','0003_auto_20201211_1314','2022-08-20 17:06:38.815179'),(28,'oauth2_provider','0004_auto_20200902_2022','2022-08-20 17:06:39.151688'),(29,'books','0007_bookview','2022-08-22 15:06:42.558812'),(30,'books','0008_alter_bookview_book','2022-08-22 15:10:12.317497'),(31,'books','0009_order_order_detail','2022-09-19 13:59:00.440928'),(32,'books','0010_alter_order_phone_receiver','2022-09-19 14:36:16.487767'),(33,'books','0011_alter_order_detail_book','2022-09-19 14:56:30.474501'),(34,'books','0012_order_note','2022-09-21 13:49:58.529128'),(35,'books','0013_auto_20220925_1132','2022-09-25 04:32:23.866872'),(36,'books','0014_alter_order_detail_name','2022-09-25 04:36:59.956628'),(37,'books','0015_auto_20220926_2312','2022-09-26 16:12:44.002406'),(38,'books','0016_auto_20220926_2314','2022-09-26 16:14:47.993798'),(39,'books','0017_alter_book_book_image','2022-10-17 13:01:16.733532'),(40,'books','0018_auto_20221018_2040','2022-10-18 13:40:55.719263');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('20f8u55zz0qk64gpa9hfnv3i88egpnij','.eJxVjDEOwjAMRe-SGUWAXSdmZO8ZIqdxSAE1UtNOiLtDpQ6w_vfef5kg61LC2nQOYzIXczKH3y3K8NBpA-ku063aoU7LPEa7KXanzfY16fO6u38HRVr51nSUhEOHipAzZ1JwUTR7ytmdk1fPQB0QCLKLjoQjOPQIjBSZgc37A_HyN4E:1ojjMK:YmB5Kp0I6gOux5-NM4-5vTCvogvaHJWv4WF5qmctqrw','2022-10-29 15:45:56.829145'),('2598hjyzasfo0rivejx4ddlqd5fzlmuu','.eJxVjDEOwjAMRe-SGUWAXSdmZO8ZIqdxSAE1UtNOiLtDpQ6w_vfef5kg61LC2nQOYzIXczKH3y3K8NBpA-ku063aoU7LPEa7KXanzfY16fO6u38HRVr51nSUhEOHipAzZ1JwUTR7ytmdk1fPQB0QCLKLjoQjOPQIjBSZgc37A_HyN4E:1oOJxy:vLH_1vNSDS5gY_oaK5bstEg17YhZ3jtgJL4hZGz6YHs','2022-08-31 14:24:18.698953'),('8glwn3a1pf0owcqgel57xfuxi5l5uk7y','.eJxVjDEOwjAMRe-SGUWAXSdmZO8ZIqdxSAE1UtNOiLtDpQ6w_vfef5kg61LC2nQOYzIXczKH3y3K8NBpA-ku063aoU7LPEa7KXanzfY16fO6u38HRVr51nSUhEOHipAzZ1JwUTR7ytmdk1fPQB0QCLKLjoQjOPQIjBSZgc37A_HyN4E:1obZod:fOMX39GjzCEs9aIk6FLQX2zT13jpkqZx2orfGo4w6tg','2022-10-07 03:57:27.969372'),('jpgdj4mhzxh7e4wat7tq2yaa0zpb1c2c','.eJxVjDEOwjAMRe-SGUWAXSdmZO8ZIqdxSAE1UtNOiLtDpQ6w_vfef5kg61LC2nQOYzIXczKH3y3K8NBpA-ku063aoU7LPEa7KXanzfY16fO6u38HRVr51nSUhEOHipAzZ1JwUTR7ytmdk1fPQB0QCLKLjoQjOPQIjBSZgc37A_HyN4E:1obzKM:jRUjVt-pCuOuIeR71hv98K84yZrWPYJcnwctztl_7as','2022-10-08 07:11:54.428377');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_accesstoken`
--

DROP TABLE IF EXISTS `oauth2_provider_accesstoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_accesstoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `application_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `source_refresh_token_id` bigint DEFAULT NULL,
  `id_token_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  UNIQUE KEY `source_refresh_token_id` (`source_refresh_token_id`),
  UNIQUE KEY `id_token_id` (`id_token_id`),
  KEY `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_books_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_acce_id_token_id_85db651b_fk_oauth2_pr` FOREIGN KEY (`id_token_id`) REFERENCES `oauth2_provider_idtoken` (`id`),
  CONSTRAINT `oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr` FOREIGN KEY (`source_refresh_token_id`) REFERENCES `oauth2_provider_refreshtoken` (`id`),
  CONSTRAINT `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_books_user_id` FOREIGN KEY (`user_id`) REFERENCES `books_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_accesstoken`
--

LOCK TABLES `oauth2_provider_accesstoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_accesstoken` VALUES (1,'NlVTlALaVH6Q8EHgMgiXUDucO2kyzO','2022-08-21 03:21:25.957768','read write',1,2,'2022-08-20 17:21:25.958792','2022-08-20 17:21:25.958792',NULL,NULL),(2,'QRTHUe43jAmleEM0gStMHamY3PV4mN','2022-08-21 03:29:41.331062','read write',1,2,'2022-08-20 17:29:41.334075','2022-08-20 17:29:41.334075',NULL,NULL),(3,'BG7ISitcX06qio6EYXQDtaWTtwlzet','2022-08-22 23:33:25.519567','read write',1,2,'2022-08-22 13:33:25.519567','2022-08-22 13:33:25.519567',NULL,NULL),(4,'jfKoXOxXbiaDE0DUi197TGhezMZARh','2022-09-12 13:50:24.054460','read write',1,1,'2022-09-12 03:50:24.062061','2022-09-12 03:50:24.062061',NULL,NULL),(5,'U8v9NdR9CPKSLADuBIcdD93Rmuy0bk','2022-09-12 13:51:49.879795','read write',1,2,'2022-09-12 03:51:49.879795','2022-09-12 03:51:49.879795',NULL,NULL),(6,'5MWgchN1GdfrxSed8ME86ZpJVC5NEq','2022-09-12 13:53:09.877681','read write',1,2,'2022-09-12 03:53:09.878612','2022-09-12 03:53:09.878612',NULL,NULL),(7,'pibULFLBf8Krlsa29IRUw756HgUj66','2022-09-12 13:55:23.078242','read write',1,2,'2022-09-12 03:55:23.078242','2022-09-12 03:55:23.078242',NULL,NULL),(8,'9FZHd7xkF4Inx9PMY5nm9RCh1ffWUm','2022-09-12 13:58:59.927667','read write',1,2,'2022-09-12 03:58:59.927667','2022-09-12 03:58:59.927667',NULL,NULL),(9,'VyEyWj2buGvFoLGRJy3ulxCQ5XDyfX','2022-09-12 13:59:11.500728','read write',1,2,'2022-09-12 03:59:11.500728','2022-09-12 03:59:11.500728',NULL,NULL),(10,'anezsLt2FyUQ7XeR38GuzdAzTwfdBw','2022-09-12 14:02:29.452755','read write',1,2,'2022-09-12 04:02:29.453768','2022-09-12 04:02:29.453768',NULL,NULL),(11,'vQPW8wQbgfztC9lpeNft0lza1I3n0j','2022-09-12 14:03:47.607830','read write',1,2,'2022-09-12 04:03:47.608755','2022-09-12 04:03:47.608755',NULL,NULL),(12,'OwgilrO0fVigtM1iVp0OC3RqpRerJL','2022-09-12 14:06:11.755463','read write',1,2,'2022-09-12 04:06:11.756463','2022-09-12 04:06:11.756463',NULL,NULL),(13,'jjQRl8STDdqeM4JvAjaeGgviACUD3y','2022-09-12 14:09:17.516286','read write',1,2,'2022-09-12 04:09:17.516286','2022-09-12 04:09:17.516286',NULL,NULL),(14,'jfvPBgr4CrfvYWy7k4cvQlcm99wx3X','2022-09-12 14:33:21.797038','read write',1,2,'2022-09-12 04:33:21.797038','2022-09-12 04:33:21.797038',NULL,NULL),(15,'fgi6CLLmTATQcuIbPA01MWmQVHCS4x','2022-09-12 14:36:38.428803','read write',1,2,'2022-09-12 04:36:38.428803','2022-09-12 04:36:38.428803',NULL,NULL),(16,'tmr8Zl1t7AxvckhoprEE3PYyrBClCn','2022-09-12 14:38:33.504577','read write',1,2,'2022-09-12 04:38:33.504577','2022-09-12 04:38:33.504577',NULL,NULL),(17,'s8TWmP7xmE29aFujnZN1GNoKEZGYnT','2022-09-12 14:39:18.214253','read write',1,2,'2022-09-12 04:39:18.215185','2022-09-12 04:39:18.215185',NULL,NULL),(18,'ePmQzJZbPU2KXMVgYZwrsThud0vsMa','2022-09-12 14:39:28.347805','read write',1,2,'2022-09-12 04:39:28.348304','2022-09-12 04:39:28.348304',NULL,NULL),(19,'wZ1opJIUihXzXvVPtgkVCnmsqbvRUV','2022-09-12 14:41:32.354665','read write',1,2,'2022-09-12 04:41:32.354665','2022-09-12 04:41:32.354665',NULL,NULL),(20,'9LMWMAIg6V8K99RaVQ0Lyy9aTXZsZF','2022-09-12 14:43:11.765928','read write',1,2,'2022-09-12 04:43:11.765928','2022-09-12 04:43:11.765928',NULL,NULL),(21,'QR6guZUXWWY2rNjjRdpn7idx91IOFN','2022-09-12 14:47:41.565097','read write',1,2,'2022-09-12 04:47:41.566099','2022-09-12 04:47:41.566099',NULL,NULL),(22,'9c2SXRr2sQj3v970o3gEfwI4io8PAD','2022-09-12 14:49:01.974577','read write',1,2,'2022-09-12 04:49:01.974577','2022-09-12 04:49:01.974577',NULL,NULL),(23,'pWd37QEXVKuvLTdfzUR6RGa9l3U0mj','2022-09-12 14:50:02.143931','read write',1,2,'2022-09-12 04:50:02.143931','2022-09-12 04:50:02.143931',NULL,NULL),(24,'P7PdeS42r48wSvJRXPKOb2fMkWhTv0','2022-09-12 14:50:18.887399','read write',1,2,'2022-09-12 04:50:18.887399','2022-09-12 04:50:18.887399',NULL,NULL),(25,'DQAwovLS3Y8OXovMfNbPPOrdl8focZ','2022-09-12 14:51:07.369481','read write',1,2,'2022-09-12 04:51:07.369481','2022-09-12 04:51:07.369481',NULL,NULL),(26,'sFaqbN7AHKSE7QJ83oPM94y3Tw4jQa','2022-09-12 14:51:33.677357','read write',1,2,'2022-09-12 04:51:33.677357','2022-09-12 04:51:33.677357',NULL,NULL),(27,'up9MMPu5w3lvISlJZSsmaFpxxxhTEa','2022-09-12 14:54:10.206067','read write',1,2,'2022-09-12 04:54:10.206067','2022-09-12 04:54:10.206067',NULL,NULL),(28,'uaXmUqCD0YtrCfekBccJ2Joeg0WXbH','2022-09-12 14:54:55.511431','read write',1,2,'2022-09-12 04:54:55.512363','2022-09-12 04:54:55.512363',NULL,NULL),(29,'upfHNClrGjupNr4MGS4AAkMGLePZ7E','2022-09-12 14:55:56.249659','read write',1,2,'2022-09-12 04:55:56.250590','2022-09-12 04:55:56.250590',NULL,NULL),(30,'7zUWKBenIx7fo7CTxsHNlGV2KOxfhE','2022-09-12 14:57:04.440269','read write',1,2,'2022-09-12 04:57:04.440269','2022-09-12 04:57:04.440269',NULL,NULL),(31,'i0aBRQ1zc6jJKvbQByWoN3fEDbG3F7','2022-09-12 15:01:15.934270','read write',1,2,'2022-09-12 05:01:15.934270','2022-09-12 05:01:15.934270',NULL,NULL),(32,'zqYzbylSpuUqu6VEaBZnVS3uvuyhBz','2022-09-12 15:01:50.946871','read write',1,2,'2022-09-12 05:01:50.946871','2022-09-12 05:01:50.946871',NULL,NULL),(33,'CRx3GBaR35SccKMNTMHbZLXXmrreMa','2022-09-12 15:02:35.622208','read write',1,2,'2022-09-12 05:02:35.622208','2022-09-12 05:02:35.622208',NULL,NULL),(34,'5OGP9miBUzrUvXjGmaNPRQdltcO7Kk','2022-09-12 15:16:40.157206','read write',1,2,'2022-09-12 05:16:40.157206','2022-09-12 05:16:40.157206',NULL,NULL),(35,'PZEhu4fPlpGckyQlnp8HCnRf8Tg4pp','2022-09-12 15:17:15.104088','read write',1,2,'2022-09-12 05:17:15.104088','2022-09-12 05:17:15.104088',NULL,NULL),(36,'JagpF34xIypJas4WfRMIwBWV7p3L0c','2022-09-12 15:17:58.433483','read write',1,2,'2022-09-12 05:17:58.434474','2022-09-12 05:17:58.434474',NULL,NULL),(37,'kGx7et4YrGTHxHhsrUMd31XfKcXHr9','2022-09-12 15:18:46.591676','read write',1,2,'2022-09-12 05:18:46.592674','2022-09-12 05:18:46.592674',NULL,NULL),(38,'VKlR50UMqil8F5Ml0FJksGLurEZ9gj','2022-09-12 15:19:09.334306','read write',1,2,'2022-09-12 05:19:09.334306','2022-09-12 05:19:09.334306',NULL,NULL),(39,'aW6MzJpWMJAgUvJST5n4NInyRZoszV','2022-09-12 15:19:41.835208','read write',1,2,'2022-09-12 05:19:41.835208','2022-09-12 05:19:41.835208',NULL,NULL),(40,'0XBb676NpB2GO6m9dUhtUBizYMjlBJ','2022-09-12 15:27:26.616721','read write',1,2,'2022-09-12 05:27:26.616721','2022-09-12 05:27:26.616721',NULL,NULL),(41,'FVNKy2Bma8zlLydG5Z71razGuh8liD','2022-09-12 15:28:08.624595','read write',1,2,'2022-09-12 05:28:08.624595','2022-09-12 05:28:08.624595',NULL,NULL),(42,'mRLdkZJ6FM3nBNYyWKgytSQDiyTQ5y','2022-09-12 15:28:59.396640','read write',1,2,'2022-09-12 05:28:59.396640','2022-09-12 05:28:59.396640',NULL,NULL),(43,'Vi8oX2gj1ykYliuIKvpe6S1TDRNjos','2022-09-12 15:29:53.011716','read write',1,2,'2022-09-12 05:29:53.011716','2022-09-12 05:29:53.011716',NULL,NULL),(44,'ZVkbPA8zOVPc7LryToe8w6ZAAWTSL3','2022-09-12 15:35:04.693049','read write',1,2,'2022-09-12 05:35:04.693049','2022-09-12 05:35:04.693049',NULL,NULL),(45,'7TKy6j3a5h6c2EwpD1MQIdmKHFOZq7','2022-09-12 15:36:23.010313','read write',1,2,'2022-09-12 05:36:23.011314','2022-09-12 05:36:23.011314',NULL,NULL),(46,'d2iASVh8CqtM3AaMkn0AhTma2qU0A5','2022-09-12 15:40:07.210682','read write',1,2,'2022-09-12 05:40:07.211682','2022-09-12 05:40:07.211682',NULL,NULL),(47,'wwJ9HNuNlLAyO8iOfZlXIyGnEqves9','2022-09-12 16:20:00.637915','read write',1,2,'2022-09-12 06:20:00.640312','2022-09-12 06:20:00.640312',NULL,NULL),(48,'943ljlI0pxM6LslnzIQo1oowyeo1LU','2022-09-12 16:32:16.949102','read write',1,2,'2022-09-12 06:32:16.950112','2022-09-12 06:32:16.950112',NULL,NULL),(49,'Qj64hahCPVEd7i8QVz8uJeYThEcmTO','2022-09-12 16:37:35.126128','read write',1,2,'2022-09-12 06:37:35.126128','2022-09-12 06:37:35.126128',NULL,NULL),(50,'xCchcsrgCKIIksDkneaN5vAYikI6ZQ','2022-09-12 16:39:49.254447','read write',1,2,'2022-09-12 06:39:49.254447','2022-09-12 06:39:49.254447',NULL,NULL),(51,'WDrVoNFzJxOwagEw3o4yrK0hyld2Uk','2022-09-12 16:40:48.423860','read write',1,2,'2022-09-12 06:40:48.424861','2022-09-12 06:40:48.424861',NULL,NULL),(52,'45VQw43VQqkOjDlXIumUtY8w4QCSQL','2022-09-12 16:56:22.652238','read write',1,2,'2022-09-12 06:56:22.652238','2022-09-12 06:56:22.652238',NULL,NULL),(53,'4dK8tU4J1jpN88F7rzjSvmOhVHQhdi','2022-09-12 16:57:34.896342','read write',1,2,'2022-09-12 06:57:34.897376','2022-09-12 06:57:34.897376',NULL,NULL),(54,'jSEi0zoROVL2qmTCpLqcrjAyr4tMKy','2022-09-12 16:59:04.131243','read write',1,2,'2022-09-12 06:59:04.131243','2022-09-12 06:59:04.131243',NULL,NULL),(55,'PAhZUQn9RQ7Jxu8j6beamAPFxGyFCG','2022-09-12 16:59:39.948960','read write',1,2,'2022-09-12 06:59:39.948960','2022-09-12 06:59:39.948960',NULL,NULL),(56,'4YExxO8k8LwtoKuxxRJ3Jm2GRDUtGX','2022-09-12 17:00:59.104930','read write',1,2,'2022-09-12 07:00:59.105861','2022-09-12 07:00:59.105861',NULL,NULL),(57,'SO71czSuYN7jm03F8kxaspatVPkmy5','2022-09-12 17:02:55.946704','read write',1,2,'2022-09-12 07:02:55.947664','2022-09-12 07:02:55.947664',NULL,NULL),(58,'tvqOYVKpHJcnWpqZXKh9HUFFfPphEm','2022-09-12 17:35:56.837996','read write',1,2,'2022-09-12 07:35:56.837996','2022-09-12 07:35:56.837996',NULL,NULL),(59,'N2Z9JU0cOrKnF3DONhWbGFtoE0gvo8','2022-09-12 18:03:41.043985','read write',1,1,'2022-09-12 08:03:41.043985','2022-09-12 08:03:41.043985',NULL,NULL),(60,'5k5pss48bqflyEsD0T5zUvGUL044Lj','2022-09-12 18:22:48.364135','read write',1,5,'2022-09-12 08:22:48.364135','2022-09-12 08:22:48.364135',NULL,NULL),(61,'d82Sl3KKqKONvCgf4r9F0yBbl0UAZo','2022-09-12 18:28:30.418491','read write',1,6,'2022-09-12 08:28:30.418491','2022-09-12 08:28:30.418491',NULL,NULL),(62,'rHwTL4C2JYy4Ziv9DqQy7jjdaogb18','2022-09-12 18:29:22.705043','read write',1,7,'2022-09-12 08:29:22.705043','2022-09-12 08:29:22.705043',NULL,NULL),(63,'dPSfVS1DRbKbgULkU1ybYihQZvEqL8','2022-09-12 18:32:03.430779','read write',1,8,'2022-09-12 08:32:03.430779','2022-09-12 08:32:03.430779',NULL,NULL),(64,'huUjI0mjdrr7Nz7Uhdj0EqKgoRUoFX','2022-09-12 18:34:39.794281','read write',1,9,'2022-09-12 08:34:39.794281','2022-09-12 08:34:39.794281',NULL,NULL),(65,'NaZXVhdjBUvdasUTTdh0k3cAiHPO9P','2022-09-12 18:36:24.629214','read write',1,11,'2022-09-12 08:36:24.629214','2022-09-12 08:36:24.629214',NULL,NULL),(66,'6MdzV9QNRkBX29hI3yTIrMIUfCp3oK','2022-09-12 19:13:43.182110','read write',1,17,'2022-09-12 09:13:43.182110','2022-09-12 09:13:43.182110',NULL,NULL),(67,'W6COzKC2wKe7T3i5eevC0CoAbdoO5V','2022-09-18 19:17:12.407496','read write',1,1,'2022-09-18 09:17:12.413092','2022-09-18 09:17:12.413092',NULL,NULL),(68,'zUXYDwm6ANZDnN7CfUmoYIKGo07i5E','2022-09-20 00:34:03.906407','read write',1,4,'2022-09-19 14:34:03.911407','2022-09-19 14:34:03.911407',NULL,NULL),(69,'2gz9cdiwbetfO67EJvBYcs6Thxkfjf','2022-09-21 23:33:24.882275','read write',1,1,'2022-09-21 13:33:24.883355','2022-09-21 13:33:24.883355',NULL,NULL),(70,'QemUd1A3tgqmt1rMVSS9sml7qpPbGe','2022-09-21 23:59:29.898813','read write',1,1,'2022-09-21 13:59:29.898813','2022-09-21 13:59:29.898813',NULL,NULL),(71,'XGBtZEhmpdkocxpHMHEPQiww6dahfA','2022-09-22 01:23:52.002810','read write',1,1,'2022-09-21 15:23:52.007812','2022-09-21 15:23:52.007812',NULL,NULL),(72,'BZ4GxZWosjOMvOuczwfpji9UTVScVX','2022-09-22 01:23:54.967638','read write',1,1,'2022-09-21 15:23:54.968613','2022-09-21 15:23:54.968613',NULL,NULL),(73,'0esXJM1CKs92AuAycfb0eZFqksvaXq','2022-09-22 01:24:12.808240','read write',1,1,'2022-09-21 15:24:12.808240','2022-09-21 15:24:12.808240',NULL,NULL),(74,'2BZ0UDQIyGEKc6yp16V65pjsa1qkqw','2022-09-22 01:24:13.538068','read write',1,1,'2022-09-21 15:24:13.538068','2022-09-21 15:24:13.538068',NULL,NULL),(75,'aoa0yb07FHysOw8hjNKJ7v9DpnybEr','2022-09-22 01:24:13.747905','read write',1,1,'2022-09-21 15:24:13.747905','2022-09-21 15:24:13.747905',NULL,NULL),(76,'1OLix01ymgOBBkLDu64HpVFpXVcsC3','2022-09-22 01:24:13.938244','read write',1,1,'2022-09-21 15:24:13.938244','2022-09-21 15:24:13.938244',NULL,NULL),(77,'8jSHIfuYSwra27yhD9wdjCX4J6E0lo','2022-09-22 01:24:14.166047','read write',1,1,'2022-09-21 15:24:14.166047','2022-09-21 15:24:14.166047',NULL,NULL),(78,'sMKrnGDGIOaokcrUYAE2DDYam6KUF9','2022-09-22 01:24:21.645685','read write',1,4,'2022-09-21 15:24:21.645685','2022-09-21 15:24:21.645685',NULL,NULL),(79,'teGEZRyYLRUVwFa9WS6gsh0tZdo2v5','2022-09-22 01:24:29.051623','read write',1,4,'2022-09-21 15:24:29.051623','2022-09-21 15:24:29.051623',NULL,NULL),(80,'vL6x5GA2LGHGQZfnJP7O5TxK1MjP3H','2022-09-22 01:24:29.144732','read write',1,4,'2022-09-21 15:24:29.144732','2022-09-21 15:24:29.144732',NULL,NULL),(81,'WsUPwu1jkhDUdrxEi9rghG41tn2ru4','2022-09-22 01:24:29.266939','read write',1,4,'2022-09-21 15:24:29.267434','2022-09-21 15:24:29.267434',NULL,NULL),(82,'zJc85LUoI3hPTQLuCVtwPFk78HSgZW','2022-09-22 01:24:29.323935','read write',1,4,'2022-09-21 15:24:29.324438','2022-09-21 15:24:29.324438',NULL,NULL),(83,'KD4T8PeC6dBlwVWIqWNKu6JVuonthm','2022-09-22 01:25:32.299916','read write',1,4,'2022-09-21 15:25:32.299916','2022-09-21 15:25:32.299916',NULL,NULL),(84,'gTH6dKhyYoGus0Lo5czgK6URSfq9nf','2022-09-22 01:27:17.008697','read write',1,4,'2022-09-21 15:27:17.008697','2022-09-21 15:27:17.008697',NULL,NULL),(85,'4MlP5V4sjzH4OfROumh6aDtUDA2tTL','2022-09-24 22:17:29.481994','read write',1,1,'2022-09-24 12:17:29.482495','2022-09-24 12:17:29.482495',NULL,NULL),(86,'kL0fNAXNQLFuSTHVlrOX4YlGBNpsLy','2022-09-24 22:34:04.696235','read write',1,1,'2022-09-24 12:34:04.696235','2022-09-24 12:34:04.696235',NULL,NULL),(87,'bEPWRMiM6hGrBpj0cB5CSXeTdgACVs','2022-09-24 22:54:41.377449','read write',1,1,'2022-09-24 12:54:41.379138','2022-09-24 12:54:41.379138',NULL,NULL),(88,'DViO3s9zK7dyzWIh90m4k78H0l4KhO','2022-09-24 22:55:04.543244','read write',1,4,'2022-09-24 12:55:04.543244','2022-09-24 12:55:04.543244',NULL,NULL),(89,'qM9AspoTT7Gop8oc85pvneSk0HH9OQ','2022-09-27 00:38:04.623673','read write',1,1,'2022-09-26 14:38:04.624172','2022-09-26 14:38:04.624172',NULL,NULL),(90,'8MOxGEA5wztrscoS3ajGYftPEVNl94','2022-09-28 00:54:21.637528','read write',1,1,'2022-09-27 14:54:21.638125','2022-09-27 14:54:21.638125',NULL,NULL),(91,'GT6rVakgRK58O8JKtOSfAlSr7vHYop','2022-09-28 01:44:36.311895','read write',1,1,'2022-09-27 15:44:36.311895','2022-09-27 15:44:36.311895',NULL,NULL),(92,'YgfrTCVglauEp9ZLFAqjVDChAtpBOU','2022-09-28 23:27:15.711042','read write',1,1,'2022-09-28 13:27:15.711042','2022-09-28 13:27:15.711042',NULL,NULL),(93,'Fv78VWkRAE11JzbvDjmpNyMSXo11Am','2022-10-14 00:30:43.769859','read write',1,4,'2022-10-13 14:30:43.769859','2022-10-13 14:30:43.769859',NULL,NULL),(94,'GmRrVIdrhqcXscx6a96mk3b6sHSSQ6','2022-10-14 01:27:22.808413','read write',1,1,'2022-10-13 15:27:22.811728','2022-10-13 15:27:22.811728',NULL,NULL),(95,'LiZfKfgtxQj1UT1bPiLw88461pIaeo','2022-10-14 02:45:44.390317','read write',1,4,'2022-10-13 16:45:44.391313','2022-10-13 16:45:44.391313',NULL,NULL),(96,'16mu97heaKCESSBpfW7MsUPqp5Fysv','2022-10-15 22:41:00.302585','read write',1,4,'2022-10-15 12:41:00.302585','2022-10-15 12:41:00.302585',NULL,NULL),(97,'ohkhMIKPCgVzi1OomU4TGdEiofaxJj','2022-10-15 22:45:44.005267','read write',1,2,'2022-10-15 12:45:44.005267','2022-10-15 12:45:44.005267',NULL,NULL),(98,'moGc3BWCIkzPFo1767AFsk1JufwejK','2022-10-15 23:02:21.175202','read write',1,6,'2022-10-15 13:02:21.175202','2022-10-15 13:02:21.175202',NULL,NULL),(99,'UaDSmrPyuQmLAHIbICtIMiGkb0cgDt','2022-10-15 23:26:39.242273','read write',1,1,'2022-10-15 13:26:39.243279','2022-10-15 13:26:39.243279',NULL,NULL),(100,'2ToBIYusINMm6FFderoAPLHqoAF5q8','2022-10-18 02:52:09.335068','read write',1,1,'2022-10-17 16:52:09.335068','2022-10-17 16:52:09.335068',NULL,NULL),(101,'uOqwuLW5P24jhm3iMNRmZfpADqPlYC','2022-10-18 23:55:11.047031','read write',1,1,'2022-10-18 13:55:11.049917','2022-10-18 13:55:11.049917',NULL,NULL),(102,'l7Hv5C9KBnICF3THI8ebeT1ww6YbXM','2022-10-23 22:19:47.490970','read write',1,4,'2022-10-23 12:19:47.495809','2022-10-23 12:19:47.495809',NULL,NULL),(103,'PKJcGu3ZhcUbZORdDZUPcS9oHSN7r7','2022-10-24 02:39:45.754742','read write',1,4,'2022-10-23 16:39:45.756652','2022-10-23 16:39:45.756652',NULL,NULL),(104,'1WOvfxMbDQzpHxOs2GVLgeAq6tXkbt','2022-10-24 20:38:36.322578','read write',1,1,'2022-10-24 10:38:36.322578','2022-10-24 10:38:36.322578',NULL,NULL),(105,'w2BJnvctzQW8DLi0orpnGKsNcpAkuI','2022-10-24 21:00:00.869037','read write',1,4,'2022-10-24 11:00:00.869037','2022-10-24 11:00:00.869037',NULL,NULL),(106,'8lvaOKZJ9PsKmieTrOyIs2L2vHtl8j','2022-10-25 01:39:27.083501','read write',1,1,'2022-10-24 15:39:27.084513','2022-10-24 15:39:27.084513',NULL,NULL);
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_application`
--

DROP TABLE IF EXISTS `oauth2_provider_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_application` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `client_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect_uris` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authorization_grant_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_secret` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `skip_authorization` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `algorithm` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`),
  KEY `oauth2_provider_application_user_id_79829054_fk_books_user_id` (`user_id`),
  KEY `oauth2_provider_application_client_secret_53133678` (`client_secret`),
  CONSTRAINT `oauth2_provider_application_user_id_79829054_fk_books_user_id` FOREIGN KEY (`user_id`) REFERENCES `books_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_application`
--

LOCK TABLES `oauth2_provider_application` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_application` DISABLE KEYS */;
INSERT INTO `oauth2_provider_application` VALUES (1,'klbGBuPR6Zg3n8UeEDjirdKMKisqStSUzP8DpBOP','','confidential','password','oP4TOjWHUxh2IOFGiSl2bQRFmhT9dEs7YpZCm6zCz4pJtlkfD1tjhMZk1z4yp0EIuUMYUngJdSuQcvSMOB7gA6EpfSN9LlAa75UjYbHxo9hJA6tzfpm8sKk5iuSkhn2M','BookApp',1,0,'2022-08-20 17:11:36.941887','2022-08-20 17:11:36.941887','');
/*!40000 ALTER TABLE `oauth2_provider_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_grant`
--

DROP TABLE IF EXISTS `oauth2_provider_grant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_grant` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `redirect_uri` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `scope` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `application_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `code_challenge` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_challenge_method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nonce` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `claims` longtext COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (_utf8mb3''),
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_grant_user_id_e8f62af8_fk_books_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_grant_user_id_e8f62af8_fk_books_user_id` FOREIGN KEY (`user_id`) REFERENCES `books_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_grant`
--

LOCK TABLES `oauth2_provider_grant` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_grant` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_grant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_idtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_idtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_idtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `jti` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `application_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jti` (`jti`),
  KEY `oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_idtoken_user_id_dd512b59_fk_books_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_idtoken_user_id_dd512b59_fk_books_user_id` FOREIGN KEY (`user_id`) REFERENCES `books_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_idtoken`
--

LOCK TABLES `oauth2_provider_idtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_idtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_idtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_refreshtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_refreshtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_refreshtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` bigint DEFAULT NULL,
  `application_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `revoked` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_token_id` (`access_token_id`),
  UNIQUE KEY `oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq` (`token`,`revoked`),
  KEY `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_refreshtoken_user_id_da837fce_fk_books_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr` FOREIGN KEY (`access_token_id`) REFERENCES `oauth2_provider_accesstoken` (`id`),
  CONSTRAINT `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_refreshtoken_user_id_da837fce_fk_books_user_id` FOREIGN KEY (`user_id`) REFERENCES `books_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_refreshtoken`
--

LOCK TABLES `oauth2_provider_refreshtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_refreshtoken` VALUES (1,'EojgvUUekUiY47a4YMLe91D8X60mRf',1,1,2,'2022-08-20 17:21:25.994954','2022-08-20 17:21:25.994954',NULL),(2,'prLfwW82znR7r5iFDT35zRe3RGIX2K',2,1,2,'2022-08-20 17:29:41.337071','2022-08-20 17:29:41.337071',NULL),(3,'f5thFwFlPo7FRQl1BARsjZjfZZ2ZyS',3,1,2,'2022-08-22 13:33:25.539239','2022-08-22 13:33:25.539239',NULL),(4,'kVzMoyLalAJVklIfk2XgGcqQgybP8K',4,1,1,'2022-09-12 03:50:24.096677','2022-09-12 03:50:24.096677',NULL),(5,'YqMA4vcP7YmhliO0lOTpZJLoNqAgra',5,1,2,'2022-09-12 03:51:49.879795','2022-09-12 03:51:49.879795',NULL),(6,'qaScjwWNGw6KIMWIWBeXkKKxMhOSXE',6,1,2,'2022-09-12 03:53:09.888531','2022-09-12 03:53:09.888531',NULL),(7,'bVhw9yXXp05sFtPxpA8jlONxloPZZ7',7,1,2,'2022-09-12 03:55:23.080179','2022-09-12 03:55:23.080179',NULL),(8,'Zn2m1LwuXKgtfM1DMSjLfIZ8QGLMdS',8,1,2,'2022-09-12 03:58:59.930673','2022-09-12 03:58:59.930673',NULL),(9,'mr1ZMoY8NmN2rWoDCWZFIUiBFeub40',9,1,2,'2022-09-12 03:59:11.502891','2022-09-12 03:59:11.502891',NULL),(10,'ylYrL1tLTtWXmVgDfaSQNkh3oVb0aU',10,1,2,'2022-09-12 04:02:29.455756','2022-09-12 04:02:29.455756',NULL),(11,'hluD4uWMBP4e2EuBQbeVJVFGOSGbp7',11,1,2,'2022-09-12 04:03:47.613457','2022-09-12 04:03:47.613457',NULL),(12,'ovUhC1j2sHjgLJpMypujQAqnwATTc9',12,1,2,'2022-09-12 04:06:11.758608','2022-09-12 04:06:11.758608',NULL),(13,'eWs7pSWWHLQTBq9Jst4nriTSL1OfEH',13,1,2,'2022-09-12 04:09:17.521227','2022-09-12 04:09:17.521227',NULL),(14,'MJSCwxdIk0IqcrZvUdNwDjWco7U3Vl',14,1,2,'2022-09-12 04:33:21.804544','2022-09-12 04:33:21.804544',NULL),(15,'RismhNMp7j7wPwzqD6fPisTR5d5836',15,1,2,'2022-09-12 04:36:38.431808','2022-09-12 04:36:38.431808',NULL),(16,'hTi5H12eDDUhhnh9rpYoQUPluIj66d',16,1,2,'2022-09-12 04:38:33.514728','2022-09-12 04:38:33.514728',NULL),(17,'apZGYqBbAWUZVkLmPREkDODiwCv6ZP',17,1,2,'2022-09-12 04:39:18.219192','2022-09-12 04:39:18.219192',NULL),(18,'ZfmrMfOB53MUr1yhqp23KWElbgR6sn',18,1,2,'2022-09-12 04:39:28.352487','2022-09-12 04:39:28.352487',NULL),(19,'Vcrl1e3TGGsjiw8LvHV10nMHT75BZe',19,1,2,'2022-09-12 04:41:32.354665','2022-09-12 04:41:32.354665',NULL),(20,'ftpRvhQBpF5FfcyMv0eAj4VytYiPAC',20,1,2,'2022-09-12 04:43:11.770868','2022-09-12 04:43:11.770868',NULL),(21,'uDHabiPPK2vh19EtB1hJXv5Y3FTh3Q',21,1,2,'2022-09-12 04:47:41.568283','2022-09-12 04:47:41.568283',NULL),(22,'hviJ9C3uUzYObiL1yQjEEvufEUjZnH',22,1,2,'2022-09-12 04:49:01.974577','2022-09-12 04:49:01.974577',NULL),(23,'DNmiOWSEFadLNAJ1fOGEfA591sSdOH',23,1,2,'2022-09-12 04:50:02.145922','2022-09-12 04:50:02.145922',NULL),(24,'SEMjEDzJaWY0Y2Cpg6H2SWKf8yMUaZ',24,1,2,'2022-09-12 04:50:18.894580','2022-09-12 04:50:18.894580',NULL),(25,'E8tBQWE6eLxLydWXIhRQFJySnX5MpK',25,1,2,'2022-09-12 04:51:07.371480','2022-09-12 04:51:07.371480',NULL),(26,'GTkKhNNag9u3s9dmNxfp0FuLfGrdVR',26,1,2,'2022-09-12 04:51:33.677357','2022-09-12 04:51:33.677357',NULL),(27,'As9dlc1a71zbhq7U9LQeHu6N7cuS9T',27,1,2,'2022-09-12 04:54:10.209531','2022-09-12 04:54:10.209531',NULL),(28,'r2m7JI2OU0BZZcJKtLLXufxCOu8w3T',28,1,2,'2022-09-12 04:54:55.513718','2022-09-12 04:54:55.513718',NULL),(29,'fUSNSU6A0AOYTWnWZj2T08dSWVZHj7',29,1,2,'2022-09-12 04:55:56.254333','2022-09-12 04:55:56.254333',NULL),(30,'uEZ9F3d4rtrgovKO0wJDKOoZaWXaNQ',30,1,2,'2022-09-12 04:57:04.445644','2022-09-12 04:57:04.445644',NULL),(31,'ddDPsY9lS11IUwnEfojXsR6B8RasG4',31,1,2,'2022-09-12 05:01:15.944667','2022-09-12 05:01:15.944667',NULL),(32,'lzwJrR8mpCkzVDLjs78jB16JdD1HWK',32,1,2,'2022-09-12 05:01:50.951914','2022-09-12 05:01:50.951914',NULL),(33,'3owssrJyh7ce5Krw999IRq9Am6M3NW',33,1,2,'2022-09-12 05:02:35.634185','2022-09-12 05:02:35.634185',NULL),(34,'djrwqVoSbcuNXCXATiDkasPNsmGrPB',34,1,2,'2022-09-12 05:16:40.158218','2022-09-12 05:16:40.158218',NULL),(35,'JbB8YiXMplx2aq8Od1lLGToWMYcYL3',35,1,2,'2022-09-12 05:17:15.108087','2022-09-12 05:17:15.108087',NULL),(36,'sX94SKSil2MC5JXyFvCUiTmDhHNFDp',36,1,2,'2022-09-12 05:17:58.437474','2022-09-12 05:17:58.437474',NULL),(37,'El24a0uH3vDRHkM9bG5jrulw9DLkoD',37,1,2,'2022-09-12 05:18:46.594674','2022-09-12 05:18:46.594674',NULL),(38,'3Gniab2pkD010DYxcxVVIgGPLDXVzD',38,1,2,'2022-09-12 05:19:09.334306','2022-09-12 05:19:09.334306',NULL),(39,'Vu66ZzxWVoTro5JgXLJG5nyGSpo1Z0',39,1,2,'2022-09-12 05:19:41.837209','2022-09-12 05:19:41.837209',NULL),(40,'XLI6kGaoLgm2OOA9D18iCquJmgkc0q',40,1,2,'2022-09-12 05:27:26.618742','2022-09-12 05:27:26.618742',NULL),(41,'RErMo6xYwVGB1vRLFRYpCVKg8gu6SQ',41,1,2,'2022-09-12 05:28:08.628552','2022-09-12 05:28:08.628552',NULL),(42,'hNUHfqKfTOYceuHjdpzl81mXagGuTi',42,1,2,'2022-09-12 05:28:59.401849','2022-09-12 05:28:59.401849',NULL),(43,'rCrHiJvUkGFyfqaiO3s5UWpsR5syAE',43,1,2,'2022-09-12 05:29:53.016018','2022-09-12 05:29:53.016018',NULL),(44,'7yF9CjJefkaQK0AF148AJp33oBAwRd',44,1,2,'2022-09-12 05:35:04.696046','2022-09-12 05:35:04.696046',NULL),(45,'j7J1433vnroO1cZJgjObbGlZAGFihm',45,1,2,'2022-09-12 05:36:23.013927','2022-09-12 05:36:23.013927',NULL),(46,'40aOMgqXdXX6soGb5po7NfrbqbMoX9',46,1,2,'2022-09-12 05:40:07.216888','2022-09-12 05:40:07.216888',NULL),(47,'IDIJMKQF1Lkk052wUS9rEKlX5MJTg1',47,1,2,'2022-09-12 06:20:00.645200','2022-09-12 06:20:00.645200',NULL),(48,'WIB40g7NJsJNrR0SojL8A0hC8nyqKE',48,1,2,'2022-09-12 06:32:16.954107','2022-09-12 06:32:16.954107',NULL),(49,'clMNwAnHQ9ehxdNTV2vDv4HqSI479u',49,1,2,'2022-09-12 06:37:35.130129','2022-09-12 06:37:35.130129',NULL),(50,'qh2Pp8StgzAjCl8gsrMA6hZ0eyN580',50,1,2,'2022-09-12 06:39:49.259160','2022-09-12 06:39:49.259160',NULL),(51,'EGJcuJjXn3tphngX0K3utLF5eXh5aD',51,1,2,'2022-09-12 06:40:48.427862','2022-09-12 06:40:48.427862',NULL),(52,'ajRH4j5otKb0tVg99ptQVmQrcDtEDW',52,1,2,'2022-09-12 06:56:22.655347','2022-09-12 06:56:22.655347',NULL),(53,'ILJ6apnze0J3b1X8gCRQewrp3k0wr6',53,1,2,'2022-09-12 06:57:34.901406','2022-09-12 06:57:34.901406',NULL),(54,'20kE5tI6u9XtJH2SP0BNbc0I8hbvFJ',54,1,2,'2022-09-12 06:59:04.137336','2022-09-12 06:59:04.137336',NULL),(55,'QfanDyvkIr45mnKDCTagOIyEoCsdjj',55,1,2,'2022-09-12 06:59:39.954301','2022-09-12 06:59:39.954301',NULL),(56,'iI0E8g7sV901ICEcEtkZOGfHbIYHwk',56,1,2,'2022-09-12 07:00:59.110026','2022-09-12 07:00:59.110026',NULL),(57,'WpD8t76BjZ0FNEvqrjwnyf0qSlmsDZ',57,1,2,'2022-09-12 07:02:55.950608','2022-09-12 07:02:55.950608',NULL),(58,'mOEinYJw3pLJKFmA9QEdj5O602GwjG',58,1,2,'2022-09-12 07:35:56.853660','2022-09-12 07:35:56.853660',NULL),(59,'plIVc70LBflQFcCt5RdqYcXWFaeZwb',59,1,1,'2022-09-12 08:03:41.051134','2022-09-12 08:03:41.051134',NULL),(60,'rQD2ZSResxyJTX2ddMXmSRqDmQ2jEN',60,1,5,'2022-09-12 08:22:48.365314','2022-09-12 08:22:48.365314',NULL),(61,'b5pzoguHf8lyQerjiaE0z2kuLwHT3D',61,1,6,'2022-09-12 08:28:30.418491','2022-09-12 08:28:30.418491',NULL),(62,'yR34OjBMLLVjgKDE3pkgId9Vh9q4BD',62,1,7,'2022-09-12 08:29:22.705043','2022-09-12 08:29:22.705043',NULL),(63,'Fy5FN3FAJDKrgcKunoKNjeZomchVmy',63,1,8,'2022-09-12 08:32:03.430779','2022-09-12 08:32:03.430779',NULL),(64,'4TBA3zVVPFbEmO7s3WaUkrSCdRPNGw',64,1,9,'2022-09-12 08:34:39.795282','2022-09-12 08:34:39.795282',NULL),(65,'tcqgqY5koPFsEbM7fktLeZN96uKY16',65,1,11,'2022-09-12 08:36:24.629214','2022-09-12 08:36:24.629214',NULL),(66,'pudczsyPgK19Zyq3gpRZyV8TAzRNrT',66,1,17,'2022-09-12 09:13:43.187793','2022-09-12 09:13:43.187793',NULL),(67,'PIyI1fWhsrfrYt7BpyAuQVuI3nzxTP',67,1,1,'2022-09-18 09:17:12.444720','2022-09-18 09:17:12.444720',NULL),(68,'HGf1PorAFS7f42w7JClxOH7ERnF0o6',68,1,4,'2022-09-19 14:34:03.944408','2022-09-19 14:34:03.944408',NULL),(69,'3AlPjIIHdqamhd6ruAxzpQbOYggL0m',69,1,1,'2022-09-21 13:33:24.905273','2022-09-21 13:33:24.905273',NULL),(70,'fb0VwusTmMP6TWsbARlR4bPNfRkRbu',70,1,1,'2022-09-21 13:59:29.904762','2022-09-21 13:59:29.904762',NULL),(71,'ihpXg6YullPNidyhbLWVvYW21HiNEW',71,1,1,'2022-09-21 15:23:52.038523','2022-09-21 15:23:52.038523',NULL),(72,'Ndwsj0hoGtZEJuyqEctgBScfGGt9lD',72,1,1,'2022-09-21 15:23:54.969568','2022-09-21 15:23:54.969568',NULL),(73,'od0H6xzCYhuNy9jN714eFqSykwNYku',73,1,1,'2022-09-21 15:24:12.808240','2022-09-21 15:24:12.808240',NULL),(74,'iIxjsUYkn7LRF1lHebKNQVm18RUdch',74,1,1,'2022-09-21 15:24:13.548126','2022-09-21 15:24:13.548126',NULL),(75,'UciziliT6rNYs85ANrDGSbghRwy9pG',75,1,1,'2022-09-21 15:24:13.757889','2022-09-21 15:24:13.757889',NULL),(76,'lDqALBqsHyva2HqPkhQthDIZQDtcl9',76,1,1,'2022-09-21 15:24:13.948453','2022-09-21 15:24:13.948453',NULL),(77,'dscJkjbqCbXzAtkEKGhGpF5Xg5MNtG',77,1,1,'2022-09-21 15:24:14.169955','2022-09-21 15:24:14.169955',NULL),(78,'IEyA5mRuLlRR6FKneDg4u1HOxFu6QM',78,1,4,'2022-09-21 15:24:21.646697','2022-09-21 15:24:21.646697',NULL),(79,'AplmZoVV5uq2ydMyBLpublvp9Xr2uA',79,1,4,'2022-09-21 15:24:29.052622','2022-09-21 15:24:29.052622',NULL),(80,'CMH9xHr72t2vs7M38RkHfMofXljlmY',80,1,4,'2022-09-21 15:24:29.147734','2022-09-21 15:24:29.147734',NULL),(81,'rOw07HC7Zky4Hdj5jy2YV5cHww0xba',81,1,4,'2022-09-21 15:24:29.267934','2022-09-21 15:24:29.267934',NULL),(82,'IhhM2m9g4CYnra8zSKtVL3FIgbkOCF',82,1,4,'2022-09-21 15:24:29.327445','2022-09-21 15:24:29.327445',NULL),(83,'DXxVhc6oIyfMHiLyPSsMILyqWZ9elJ',83,1,4,'2022-09-21 15:25:32.299916','2022-09-21 15:25:32.299916',NULL),(84,'ab6EoxSQUq0jwiu2sbua7QJbh8ekkc',84,1,4,'2022-09-21 15:27:17.009718','2022-09-21 15:27:17.009718',NULL),(85,'iVxgqvNjuwsRqgJ4fPosHHAZEOLmGG',85,1,1,'2022-09-24 12:17:29.498482','2022-09-24 12:17:29.498482',NULL),(86,'FsxSahQiKnbr3HCUZuNYAIeoCQJEDs',86,1,1,'2022-09-24 12:34:04.699245','2022-09-24 12:34:04.699245',NULL),(87,'JnGSarEXzZgaJpdiKYMUiZKt7dYMGO',87,1,1,'2022-09-24 12:54:41.387448','2022-09-24 12:54:41.387448',NULL),(88,'K1NmyiueQvNlslVbENCxxLorkYJ40M',88,1,4,'2022-09-24 12:55:04.546176','2022-09-24 12:55:04.546176',NULL),(89,'AsHiOcVkhsOsBa55geWSvhm2wLHWO9',89,1,1,'2022-09-26 14:38:04.637907','2022-09-26 14:38:04.637907',NULL),(90,'nLfqrEI006flU4Wqiuen9b9u7A5YlF',90,1,1,'2022-09-27 14:54:21.658025','2022-09-27 14:54:21.658025',NULL),(91,'LVfjHyMyQfgoEZuIPLFuTQkBWdCVm2',91,1,1,'2022-09-27 15:44:36.332692','2022-09-27 15:44:36.332692',NULL),(92,'ifaHVkiQNVlgFmoXm0fHcYadd0qk6C',92,1,1,'2022-09-28 13:27:15.721732','2022-09-28 13:27:15.721732',NULL),(93,'uu8qRU6V3OBile7R41SuRi4Lhm3fqn',93,1,4,'2022-10-13 14:30:43.801935','2022-10-13 14:30:43.801935',NULL),(94,'23HZGSn6PW0OHy5Qd1qQ977muNlg4W',94,1,1,'2022-10-13 15:27:22.819851','2022-10-13 15:27:22.819851',NULL),(95,'Krd1NEPxPrDXI83om0fgGVGGOYIHal',95,1,4,'2022-10-13 16:45:44.402408','2022-10-13 16:45:44.402408',NULL),(96,'9j0SV4SfbR3pzY7OtPFpHYds9lpXJz',96,1,4,'2022-10-15 12:41:00.323058','2022-10-15 12:41:00.323058',NULL),(97,'z5Iszun3qoBw33CkcaDIweTspMkr9u',97,1,2,'2022-10-15 12:45:44.005267','2022-10-15 12:45:44.005267',NULL),(98,'hSehQtY8ngruXD6vrEraB7dKDgvnHj',98,1,6,'2022-10-15 13:02:21.184281','2022-10-15 13:02:21.184281',NULL),(99,'v75esj3lL97BQrUqRhcYBvibpQPcQb',99,1,1,'2022-10-15 13:26:39.248246','2022-10-15 13:26:39.248246',NULL),(100,'JLjp3hdaWxM7MhORDqy0hDGM1ZoNVa',100,1,1,'2022-10-17 16:52:09.342991','2022-10-17 16:52:09.342991',NULL),(101,'ndTygsrTaBpLmlSe97JbJTj2HOs8or',101,1,1,'2022-10-18 13:55:11.058790','2022-10-18 13:55:11.058790',NULL),(102,'tWXu9KaccxX0EdZAsZ8bAHQJsEIk05',102,1,4,'2022-10-23 12:19:47.532175','2022-10-23 12:19:47.532175',NULL),(103,'Beu9zYlhDriLyVqLWhMekL5ABuiASL',103,1,4,'2022-10-23 16:39:45.775683','2022-10-23 16:39:45.775683',NULL),(104,'sxLBU6LlxXUy3zgd67mp0aUqlQrJnX',104,1,1,'2022-10-24 10:38:36.353177','2022-10-24 10:38:36.353177',NULL),(105,'kYi2mbUbVEPDP5D6Rv80of6r6S5Zk9',105,1,4,'2022-10-24 11:00:00.884660','2022-10-24 11:00:00.884660',NULL),(106,'8dhpCSlta3zCry9rY2z1Knu7BDtpge',106,1,1,'2022-10-24 15:39:27.094972','2022-10-24 15:39:27.094972',NULL);
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-24 23:00:28
