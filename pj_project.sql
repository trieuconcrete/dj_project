-- MySQL dump 10.13  Distrib 8.0.41, for macos15 (arm64)
--
-- Host: 127.0.0.1    Database: dj_project_db
-- ------------------------------------------------------
-- Server version	8.0.41

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
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add category',7,'add_category'),(26,'Can change category',7,'change_category'),(27,'Can delete category',7,'delete_category'),(28,'Can view category',7,'view_category'),(29,'Can add tag',8,'add_tag'),(30,'Can change tag',8,'change_tag'),(31,'Can delete tag',8,'delete_tag'),(32,'Can view tag',8,'view_tag'),(33,'Can add post',9,'add_post'),(34,'Can change post',9,'change_post'),(35,'Can delete post',9,'delete_post'),(36,'Can view post',9,'view_post'),(37,'Can add comment',10,'add_comment'),(38,'Can change comment',10,'change_comment'),(39,'Can delete comment',10,'delete_comment'),(40,'Can view comment',10,'view_comment'),(41,'Can add reply',11,'add_reply'),(42,'Can change reply',11,'change_reply'),(43,'Can delete reply',11,'delete_reply'),(44,'Can view reply',11,'view_reply'),(45,'Can add brand',12,'add_brand'),(46,'Can change brand',12,'change_brand'),(47,'Can delete brand',12,'delete_brand'),(48,'Can view brand',12,'view_brand'),(49,'Can add Category',13,'add_category'),(50,'Can change Category',13,'change_category'),(51,'Can delete Category',13,'delete_category'),(52,'Can view Category',13,'view_category'),(53,'Can add Order',14,'add_order'),(54,'Can change Order',14,'change_order'),(55,'Can delete Order',14,'delete_order'),(56,'Can view Order',14,'view_order'),(57,'Can add Product',15,'add_product'),(58,'Can change Product',15,'change_product'),(59,'Can delete Product',15,'delete_product'),(60,'Can view Product',15,'view_product'),(61,'Can add Order Item',16,'add_orderitem'),(62,'Can change Order Item',16,'change_orderitem'),(63,'Can delete Order Item',16,'delete_orderitem'),(64,'Can view Order Item',16,'view_orderitem'),(65,'Can add Shipping Address',17,'add_shippingaddress'),(66,'Can change Shipping Address',17,'change_shippingaddress'),(67,'Can delete Shipping Address',17,'delete_shippingaddress'),(68,'Can view Shipping Address',17,'view_shippingaddress');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$TVXdK8lYPsrQFbMcjpRNzU$2Q4n3525F6rkn6gcvgLqyF4jLe6XXaxSnRJE5hUsCAU=','2025-03-17 12:50:22.388552',1,'admin','','','admin@gmail.com',1,1,'2025-03-13 13:42:30.810274'),(17,'pbkdf2_sha256$870000$YW5e6xDq1Q0N1FMk3udiX6$2ABMIv3yL3KtG7XjGKApqxnua0/r7I6LHDa1sY7GTic=','2025-03-20 06:04:10.268389',0,'trieunb','','','trieunb@concrete-corp.com',0,1,'2025-03-15 14:58:57.243334');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_reply`
--

DROP TABLE IF EXISTS `blog_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_reply` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `comment_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_reply_comment_id_be7970f5_fk_comments_id` (`comment_id`),
  CONSTRAINT `blog_reply_comment_id_be7970f5_fk_comments_id` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_reply`
--

LOCK TABLES `blog_reply` WRITE;
/*!40000 ALTER TABLE `blog_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(50) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Culture','python','2025-03-14 11:52:18.243576',''),(2,'Lifestyle','chatgpt','2025-03-14 11:52:18.243576',''),(3,'Inspiration','inspiration','2025-03-14 11:53:16.954828','');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `website` varchar(255) DEFAULT NULL,
  `comment` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `parent_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `post_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_parent_id_d317363b_fk_comments_id` (`parent_id`),
  KEY `comments_user_id_b8fd0b64_fk_auth_user_id` (`user_id`),
  KEY `comments_post_id_67cfce36_fk_posts_id` (`post_id`),
  CONSTRAINT `comments_parent_id_d317363b_fk_comments_id` FOREIGN KEY (`parent_id`) REFERENCES `comments` (`id`),
  CONSTRAINT `comments_post_id_67cfce36_fk_posts_id` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `comments_user_id_b8fd0b64_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
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
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-03-13 13:42:48.449246','1','Python',1,'[{\"added\": {}}]',7,1),(2,'2025-03-13 13:42:59.265630','2','ChatGPT',1,'[{\"added\": {}}]',7,1),(3,'2025-03-13 13:44:34.213126','1','Post Title 1 (Python)',1,'[{\"added\": {}}]',9,1),(4,'2025-03-14 09:23:03.775302','1','Lifestyle',1,'[{\"added\": {}}]',13,1),(5,'2025-03-14 09:23:11.557182','2','Inspiration',1,'[{\"added\": {}}]',13,1),(6,'2025-03-14 09:23:19.191004','3','Fashion',1,'[{\"added\": {}}]',13,1),(7,'2025-03-14 09:23:25.446359','4','Politic',1,'[{\"added\": {}}]',13,1),(8,'2025-03-14 09:23:32.052853','5','Trending',1,'[{\"added\": {}}]',13,1),(9,'2025-03-14 09:23:38.298992','6','Culture',1,'[{\"added\": {}}]',13,1),(10,'2025-03-14 11:52:58.545001','2','Lifestyle',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',7,1),(11,'2025-03-14 11:53:09.006257','1','Culture',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',7,1),(12,'2025-03-14 11:53:16.955259','3','Inspiration',1,'[{\"added\": {}}]',7,1),(13,'2025-03-14 11:54:31.489362','1','Brand object (1)',1,'[{\"added\": {}}]',12,1),(14,'2025-03-14 11:54:35.617746','2','Brand object (2)',1,'[{\"added\": {}}]',12,1),(15,'2025-03-14 11:54:41.517810','3','Brand object (3)',1,'[{\"added\": {}}]',12,1),(16,'2025-03-14 12:01:34.445032','1','Audio',1,'[{\"added\": {}}]',8,1),(17,'2025-03-14 12:01:48.086446','2','Content',1,'[{\"added\": {}}]',8,1),(18,'2025-03-14 12:02:02.371999','3','Featured',1,'[{\"added\": {}}]',8,1),(19,'2025-03-14 12:02:06.445287','4','Image',1,'[{\"added\": {}}]',8,1),(20,'2025-03-14 12:02:19.214908','5','Photo',1,'[{\"added\": {}}]',8,1),(21,'2025-03-14 12:02:26.799085','6','Pick',1,'[{\"added\": {}}]',8,1),(22,'2025-03-14 12:02:37.453464','7','Trending',1,'[{\"added\": {}}]',8,1),(23,'2025-03-14 12:02:51.528033','8','Lifestyle',1,'[{\"added\": {}}]',8,1),(24,'2025-03-14 12:11:02.797934','1','5 Easy Ways You Can Turn Future Into Success (Inspiration)',2,'[{\"changed\": {\"fields\": [\"Title\", \"Content\", \"Category\", \"Tags\", \"Section\", \"Position\"]}}]',9,1),(25,'2025-03-14 12:11:28.978260','1','5 Easy Ways You Can Turn Future Into Success (Inspiration)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(26,'2025-03-14 12:12:34.346090','1','5 Easy Ways You Can Turn Future Into Success (Inspiration)',2,'[{\"changed\": {\"fields\": [\"Section\"]}}]',9,1),(27,'2025-03-14 12:15:04.737187','2','3 Easy Ways To Make Your iPhone Faster (Lifestyle)',1,'[{\"added\": {}}]',9,1),(28,'2025-03-14 12:16:10.652478','3','Facts About Business That Will Help You Success (Lifestyle)',1,'[{\"added\": {}}]',9,1),(29,'2025-03-14 12:16:18.269078','2','3 Easy Ways To Make Your iPhone Faster (Lifestyle)',2,'[{\"changed\": {\"fields\": [\"Position\"]}}]',9,1),(30,'2025-03-14 12:18:55.760771','4','What Can You Do About Fashion Right Now (Culture)',1,'[{\"added\": {}}]',9,1),(31,'2025-03-14 12:19:02.532906','3','Facts About Business That Will Help You Success (Lifestyle)',2,'[{\"changed\": {\"fields\": [\"Position\", \"Main post\"]}}]',9,1),(32,'2025-03-14 12:19:07.290471','2','3 Easy Ways To Make Your iPhone Faster (Lifestyle)',2,'[{\"changed\": {\"fields\": [\"Position\"]}}]',9,1),(33,'2025-03-14 12:19:11.953093','1','5 Easy Ways You Can Turn Future Into Success (Inspiration)',2,'[]',9,1),(34,'2025-03-14 12:20:07.921567','5','Your Light Is About To Stop Being Relevant (Inspiration)',1,'[{\"added\": {}}]',9,1),(35,'2025-03-14 12:32:16.817754','4','What Can You Do About Fashion Right Now (Culture)',2,'[{\"changed\": {\"fields\": [\"Main post\"]}}]',9,1),(36,'2025-03-14 12:32:21.615365','2','3 Easy Ways To Make Your iPhone Faster (Lifestyle)',2,'[{\"changed\": {\"fields\": [\"Main post\"]}}]',9,1),(37,'2025-03-14 12:36:47.423225','6','60 Things To Immediately Do About Building (Lifestyle)',1,'[{\"added\": {}}]',9,1),(38,'2025-03-14 12:38:15.886603','7','Master The Art Of Nature With These 7 Tips (Lifestyle)',1,'[{\"added\": {}}]',9,1),(39,'2025-03-14 12:39:12.393043','8','Facts About Business That Will Help You Success (Inspiration)',1,'[{\"added\": {}}]',9,1),(40,'2025-03-14 12:39:49.780119','9','Your Light Is About To Stop Being Relevant (Culture)',1,'[{\"added\": {}}]',9,1),(41,'2025-03-14 14:24:22.102591','10','3 Easy Ways To Make Your iPhone Faster (Inspiration)',1,'[{\"added\": {}}]',9,1),(42,'2025-03-14 14:25:27.651129','11','Easy Ways To Learn Everything About Construction (Lifestyle)',1,'[{\"added\": {}}]',9,1),(43,'2025-03-14 14:26:03.202318','12','Facts About Business That Will Help You Success (Culture)',1,'[{\"added\": {}}]',9,1),(44,'2025-03-14 14:26:39.695017','13','How To Buy Bulb On a Tight Budget (Culture)',1,'[{\"added\": {}}]',9,1),(45,'2025-03-14 14:27:27.574524','14','Your Light Is About To Stop Being Relevant (Inspiration)',1,'[{\"added\": {}}]',9,1),(46,'2025-03-14 14:33:41.734554','1','5 Easy Ways You Can Turn Future Into Success (Inspiration)',2,'[{\"changed\": {\"fields\": [\"Position\"]}}]',9,1),(47,'2025-03-15 02:15:59.133231','2','trieunb',3,'',4,1),(48,'2025-03-15 02:31:17.727256','3','trieunb',3,'',4,1),(49,'2025-03-15 02:31:54.476236','4','trieunb',3,'',4,1),(50,'2025-03-15 02:33:07.969640','5','trieunb',3,'',4,1),(51,'2025-03-15 02:36:58.148070','6','trieunb',3,'',4,1),(52,'2025-03-15 02:40:38.114449','7','trieunb',3,'',4,1),(53,'2025-03-15 02:47:13.321251','8','trieunb',3,'',4,1),(54,'2025-03-15 02:53:40.380309','9','trieunb',3,'',4,1),(55,'2025-03-15 03:01:38.657584','10','trieunb',3,'',4,1),(56,'2025-03-15 03:06:03.944148','11','trieunb',3,'',4,1),(57,'2025-03-15 03:09:42.167611','12','trieunb',3,'',4,1),(58,'2025-03-15 03:10:38.259828','13','trieunb',3,'',4,1),(59,'2025-03-15 03:14:41.734023','14','trieunb',3,'',4,1),(60,'2025-03-15 03:15:24.830688','15','trieunb',3,'',4,1),(61,'2025-03-16 01:46:51.451201','1','Product ABC 001',1,'[{\"added\": {}}]',15,1),(62,'2025-03-16 01:47:49.747743','2','Product XYZ 001',1,'[{\"added\": {}}]',15,1),(63,'2025-03-16 01:48:21.748482','3','Product ABC 002',1,'[{\"added\": {}}]',15,1),(64,'2025-03-16 01:48:57.383896','4','Product XYZ 002',1,'[{\"added\": {}}]',15,1),(65,'2025-03-16 01:49:28.134548','5','Product XYZ 004',1,'[{\"added\": {}}]',15,1),(66,'2025-03-16 01:57:16.274475','6','Product XYZ 003',1,'[{\"added\": {}}]',15,1),(67,'2025-03-16 02:01:21.454426','7','Product ABC 003',2,'[{\"changed\": {\"fields\": [\"Category\", \"Title\"]}}]',15,1),(68,'2025-03-16 02:06:00.207662','8','Product ABC 004',2,'[{\"changed\": {\"fields\": [\"Category\", \"Title\", \"Slug\", \"Brand\", \"Description\"]}}]',15,1),(69,'2025-03-17 12:50:46.967981','10','Product ABC 004',2,'[{\"changed\": {\"fields\": [\"Name\", \"Slug\"]}}]',15,1),(70,'2025-03-17 12:50:58.883222','9','Product ABC 004',2,'[{\"changed\": {\"fields\": [\"Name\", \"Slug\"]}}]',15,1),(71,'2025-03-17 12:51:08.323179','10','Product ABC 006',2,'[{\"changed\": {\"fields\": [\"Name\", \"Slug\"]}}]',15,1),(72,'2025-03-17 12:56:06.823585','3','Product ABC 007',2,'[{\"changed\": {\"fields\": [\"Name\", \"Slug\"]}}]',15,1);
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
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'blog','category'),(10,'blog','comment'),(9,'blog','post'),(11,'blog','reply'),(8,'blog','tag'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(12,'shop','brand'),(13,'shop','category'),(14,'shop','order'),(16,'shop','orderitem'),(15,'shop','product'),(17,'shop','shippingaddress');
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
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-03-13 12:41:52.748996'),(2,'auth','0001_initial','2025-03-13 12:41:52.820015'),(3,'admin','0001_initial','2025-03-13 12:41:52.839546'),(4,'admin','0002_logentry_remove_auto_add','2025-03-13 12:41:52.842185'),(5,'admin','0003_logentry_add_action_flag_choices','2025-03-13 12:41:52.844470'),(6,'contenttypes','0002_remove_content_type_name','2025-03-13 12:41:52.858130'),(7,'auth','0002_alter_permission_name_max_length','2025-03-13 12:41:52.866914'),(8,'auth','0003_alter_user_email_max_length','2025-03-13 12:41:52.873229'),(9,'auth','0004_alter_user_username_opts','2025-03-13 12:41:52.875299'),(10,'auth','0005_alter_user_last_login_null','2025-03-13 12:41:52.882317'),(11,'auth','0006_require_contenttypes_0002','2025-03-13 12:41:52.882557'),(12,'auth','0007_alter_validators_add_error_messages','2025-03-13 12:41:52.884691'),(13,'auth','0008_alter_user_username_max_length','2025-03-13 12:41:52.893975'),(14,'auth','0009_alter_user_last_name_max_length','2025-03-13 12:41:52.902875'),(15,'auth','0010_alter_group_name_max_length','2025-03-13 12:41:52.907296'),(16,'auth','0011_update_proxy_permissions','2025-03-13 12:41:52.909593'),(17,'auth','0012_alter_user_first_name_max_length','2025-03-13 12:41:52.918272'),(18,'blog','0001_initial','2025-03-13 12:41:52.993691'),(19,'sessions','0001_initial','2025-03-13 12:41:52.997926'),(20,'blog','0002_alter_post_status','2025-03-14 07:41:04.278979'),(21,'shop','0001_initial','2025-03-14 07:41:04.403581'),(22,'blog','0003_category_created_at_category_description_and_more','2025-03-14 11:52:18.304119'),(23,'blog','0004_post_position_alter_post_section_alter_post_status','2025-03-14 12:00:24.713287'),(24,'blog','0005_alter_post_position_alter_post_section_and_more','2025-03-14 12:12:13.196313');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1rzmzua0n8gfi1n6rjio9bvkae21esoz','.eJxVjEEOgyAQRe_CuiFQEEaX3fcMZGCm1dpAIrpojHevJm7cvvf-X0XlWoeSw8g_0a3bTQRc5j4slacwkOiE9uICI6aR82Hog_ldZCp5noYoj0SetspnIf4-zvZy0GPt97X3YO_QMBplUbcJgck3ro02OYJE_IrG6ATRE7SN0TugqIwxQM4qcGL7A4QePm0:1tv90k:V7Fmjvh2OC8gtF_sRdu-Q655_1lGHhDnS4uzc0gHUII','2025-04-03 06:04:10.269750'),('nnixyfnpm4urvyhy0dv2lag9trx9lhgb','.eJxVjEEOgyAQRe_CuiGdAiIuu-8ZCMwM1dpAIrpojHevJi7a7X_vv1X4sMy9XypPfiDRCRCX3y0GHDkfgF4hP4vEkudpiPJQ5EmrfBTi9_10_wJ9qP3-1slhVJyCxRvEpK6pNRB1SNEoy41hoAaQIChHChtgGxG0MaklJOvcHq1c61CyH_kjunXbvgV4PxU:1tuTL7:DKNQu_GVDigueEb9AWmqdmxMGCgccHPoYRNlmPZzeJo','2025-04-01 09:34:25.496557');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `slug` varchar(50) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `status` varchar(1) NOT NULL,
  `section` varchar(100) DEFAULT NULL,
  `main_post` tinyint(1) NOT NULL,
  `views` bigint unsigned NOT NULL,
  `author_id` int NOT NULL,
  `category_id` bigint NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `position` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `posts_author_id_099b8aca_fk_auth_user_id` (`author_id`),
  KEY `posts_category_id_dbccff63_fk_categories_id` (`category_id`),
  CONSTRAINT `posts_author_id_099b8aca_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `posts_category_id_dbccff63_fk_categories_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `posts_chk_1` CHECK ((`views` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'5 Easy Ways You Can Turn Future Into Success','post-title-1','images/trending-lg-2.jpg','<p>The European languages are members of the same family. Their separate existence is a myth. For science, music, sport, etc, Europe uses the same&nbsp;<a href=\"https://themeger.shop/html/katen/html/blog-single.html#\">vocabulary</a>. The languages only differ in their grammar, their pronunciation and their most common words.</p>\r\n\r\n<p>Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it&nbsp;would be&nbsp;necessary to have uniform grammar, pronunciation and more common words.</p>\r\n\r\n<p><img alt=\"\" src=\"/media/uploads/2025/03/14/post-md-9.jpg\" style=\"height:367px; width:550px\" /></p>\r\n\r\n<p>A caption for the above image.</p>\r\n\r\n<p>The languages only differ in their grammar, their pronunciation and their most common words. Everyone realizes why a new common language would be desirable.</p>\r\n\r\n<p><img alt=\"\" src=\"/media/uploads/2025/03/14/single-sm-1.jpg\" style=\"height:294px; width:296px\" /></p>\r\n\r\n<p>One could refuse to pay expensive translators. To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words.</p>\r\n\r\n<p>If several languages coalesce, the grammar of the resulting language is more simple and regular than that of the individual languages. The new common language will be more simple and regular than the existing&nbsp;<a href=\"https://themeger.shop/html/katen/html/blog-single.html#\">European languages</a>. It will be as simple as Occidental; in fact, it will be Occidental.</p>\r\n\r\n<p>A collection of textile samples lay spread out on the table &ndash; Samsa was a travelling salesman &ndash; and above it there hung a picture that he had recently cut out of an illustrated magazine and housed in a nice, gilded frame.</p>\r\n\r\n<h2><strong>Pityful a rethoric question ran over her cheek</strong></h2>\r\n\r\n<p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>\r\n\r\n<p>The Big Oxmox advised her not to do so, because there were thousands of bad Commas, wild Question Marks and devious Semikoli, but the Little Blind Text didn&rsquo;t listen. She packed her seven versalia, put her initial into the belt and made herself on the way.</p>\r\n\r\n<p>I am so happy, my dear friend, so absorbed in the&nbsp;<em>exquisite sense</em>&nbsp;of mere tranquil existence, that I neglect my talents. I should be incapable of drawing a single stroke at the present moment; and yet I feel that I never was a greater artist than now.</p>\r\n\r\n<p><img alt=\"\" src=\"/media/uploads/2025/03/14/post-md-10.jpg\" style=\"height:367px; width:550px\" /><img alt=\"\" src=\"/media/uploads/2025/03/14/post-md-1.jpg\" style=\"height:367px; width:550px\" /></p>\r\n\r\n<h2><strong>Conclusion</strong></h2>\r\n\r\n<ul>\r\n	<li>How about if I sleep a little bit</li>\r\n	<li>A collection of textile samples lay spread out</li>\r\n	<li>His many legs, pitifully thin compared with</li>\r\n	<li>He lay on his armour-like back</li>\r\n	<li>Gregor Samsa woke from troubled dreams</li>\r\n</ul>\r\n\r\n<p>To an English person, it will seem like simplified&nbsp;<a href=\"https://themeger.shop/html/katen/html/blog-single.html#\">English</a>, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth. For science, music, sport, etc, Europe uses the same vocabulary.</p>\r\n\r\n<p>&nbsp;</p>','2025-03-13 13:44:34.210485','1',NULL,1,7,1,3,'2025-03-14 14:33:41.733014',NULL),(2,'3 Easy Ways To Make Your iPhone Faster','3-easy-ways-to-make-your-iphone-faster','images/trending-sm-1.jpg','<p>The European languages are members of the same family. Their separate existence is a myth. For science, music, sport, etc, Europe uses the same&nbsp;<a href=\"https://themeger.shop/html/katen/html/blog-single.html#\">vocabulary</a>. The languages only differ in their grammar, their pronunciation and their most common words.</p>\r\n\r\n<p>Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it&nbsp;would be&nbsp;necessary to have uniform grammar, pronunciation and more common words.</p>','2025-03-14 12:15:04.736065','1','Popular',0,0,1,2,'2025-03-14 12:32:21.613550',NULL),(3,'Facts About Business That Will Help You Success','facts-about-business-that-will-help-you-success','images/latest-sm-3.jpg','<p>The European languages are members of the same family. Their separate existence is a myth. For science, music, sport, etc, Europe uses the same&nbsp;<a href=\"https://themeger.shop/html/katen/html/blog-single.html#\">vocabulary</a>. The languages only differ in their grammar, their pronunciation and their most common words.</p>\r\n\r\n<p>Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it&nbsp;would be&nbsp;necessary to have uniform grammar, pronunciation and more common words.</p>','2025-03-14 12:16:10.650633','1','Popular',0,0,1,2,'2025-03-14 12:19:02.531846',NULL),(4,'What Can You Do About Fashion Right Now','what-can-you-do-about-fashion-right-now','images/widget-carousel-1.jpg','<p>The European languages are members of the same family. Their separate existence is a myth. For science, music, sport, etc, Europe uses the same&nbsp;<a href=\"https://themeger.shop/html/katen/html/blog-single.html#\">vocabulary</a>. The languages only differ in their grammar, their pronunciation and their most common words.</p>\r\n\r\n<p>Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it&nbsp;would be&nbsp;necessary to have uniform grammar, pronunciation and more common words.</p>','2025-03-14 12:18:55.758584','1','Popular',0,0,1,1,'2025-03-14 12:32:16.816323',NULL),(5,'Your Light Is About To Stop Being Relevant','your-light-is-about-to-stop-being-relevant','images/editor-sm-2.jpg','<p>The European languages are members of the same family. Their separate existence is a myth. For science, music, sport, etc, Europe uses the same&nbsp;<a href=\"https://themeger.shop/html/katen/html/blog-single.html#\">vocabulary</a>. The languages only differ in their grammar, their pronunciation and their most common words.</p>\r\n\r\n<p>Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it&nbsp;would be&nbsp;necessary to have uniform grammar, pronunciation and more common words.</p>','2025-03-14 12:20:07.919756','1','Popular',0,0,1,3,'2025-03-14 12:20:07.919781',NULL),(6,'60 Things To Immediately Do About Building','60-things-to-immediately-do-about-building','images/featured-xl-1.jpg','<p>The European languages are members of the same family. Their separate existence is a myth. For science, music, sport, etc, Europe uses the same&nbsp;<a href=\"https://themeger.shop/html/katen/html/blog-single.html#\">vocabulary</a>. The languages only differ in their grammar, their pronunciation and their most common words.</p>\r\n\r\n<p>Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it&nbsp;would be&nbsp;necessary to have uniform grammar, pronunciation and more common words.</p>','2025-03-14 12:36:47.421461','1','Recent',0,0,1,2,'2025-03-14 12:36:47.421476',NULL),(7,'Master The Art Of Nature With These 7 Tips','master-the-art-of-nature-with-these-7-tips','images/latest-sm-2.jpg','<p>The European languages are members of the same family. Their separate existence is a myth. For science, music, sport, etc, Europe uses the same&nbsp;<a href=\"https://themeger.shop/html/katen/html/blog-single.html#\">vocabulary</a>. The languages only differ in their grammar, their pronunciation and their most common words.</p>\r\n\r\n<p>Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it&nbsp;would be&nbsp;necessary to have uniform grammar, pronunciation and more common words.</p>','2025-03-14 12:38:15.884154','1','Recent',0,0,1,2,'2025-03-14 12:38:15.884181',NULL),(8,'Facts About Business That Will Help You Success','facts-about-business-that-will-help-you-success-2','images/tabs-2.jpg','<p>The European languages are members of the same family. Their separate existence is a myth. For science, music, sport, etc, Europe uses the same&nbsp;<a href=\"https://themeger.shop/html/katen/html/blog-single.html#\">vocabulary</a>. The languages only differ in their grammar, their pronunciation and their most common words.</p>\r\n\r\n<p>Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it&nbsp;would be&nbsp;necessary to have uniform grammar, pronunciation and more common words.</p>\r\n\r\n<p>&nbsp;</p>','2025-03-14 12:39:12.391277','1','Recent',0,0,1,3,'2025-03-14 12:39:12.391312',NULL),(9,'Your Light Is About To Stop Being Relevant','your-light-is-about-to-stop-being-relevant-2','images/editor-sm-2_bCN8zk1.jpg','<p>The European languages are members of the same family. Their separate existence is a myth. For science, music, sport, etc, Europe uses the same&nbsp;<a href=\"https://themeger.shop/html/katen/html/blog-single.html#\">vocabulary</a>. The languages only differ in their grammar, their pronunciation and their most common words.</p>\r\n\r\n<p>Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it&nbsp;would be&nbsp;necessary to have uniform grammar, pronunciation and more common words.</p>','2025-03-14 12:39:49.778291','1','Recent',0,0,1,1,'2025-03-14 12:39:49.778324',NULL),(10,'3 Easy Ways To Make Your iPhone Faster','3-easy-ways-to-make-your-iphone-faster-2','images/trending-sm-1_oiT4Y53.jpg','<p>The European languages are members of the same family. Their separate existence is a myth. For science, music, sport, etc, Europe uses the same&nbsp;<a href=\"https://themeger.shop/html/katen/html/blog-single.html#\">vocabulary</a>. The languages only differ in their grammar, their pronunciation and their most common words.</p>\r\n\r\n<p>Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it&nbsp;would be&nbsp;necessary to have uniform grammar, pronunciation and more common words.</p>','2025-03-14 14:24:22.100758','1',NULL,0,0,1,3,'2025-03-14 14:24:22.100785','1'),(11,'Easy Ways To Learn Everything About Construction','easy-ways-to-learn-everything-about-construction','images/editor-lg.jpg','<p>The European languages are members of the same family. Their separate existence is a myth. For science, music, sport, etc, Europe uses the same&nbsp;<a href=\"https://themeger.shop/html/katen/html/blog-single.html#\">vocabulary</a>. The languages only differ in their grammar, their pronunciation and their most common words.</p>\r\n\r\n<p>Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it&nbsp;would be&nbsp;necessary to have uniform grammar, pronunciation and more common words.</p>','2025-03-14 14:25:27.649340','1',NULL,0,0,1,2,'2025-03-14 14:25:27.649367','1'),(12,'Facts About Business That Will Help You Success','facts-about-business-that-will-help-you-success-3','images/latest-sm-3_UBfUFpz.jpg','<p>The European languages are members of the same family. Their separate existence is a myth. For science, music, sport, etc, Europe uses the same&nbsp;<a href=\"https://themeger.shop/html/katen/html/blog-single.html#\">vocabulary</a>. The languages only differ in their grammar, their pronunciation and their most common words.</p>\r\n\r\n<p>Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it&nbsp;would be&nbsp;necessary to have uniform grammar, pronunciation and more common words.</p>','2025-03-14 14:26:03.200523','1',NULL,0,0,1,1,'2025-03-14 14:26:03.200553','1'),(13,'How To Buy Bulb On a Tight Budget','how-to-buy-bulb-on-a-tight-budget','images/editor-sm-4.jpg','<p>The European languages are members of the same family. Their separate existence is a myth. For science, music, sport, etc, Europe uses the same&nbsp;<a href=\"https://themeger.shop/html/katen/html/blog-single.html#\">vocabulary</a>. The languages only differ in their grammar, their pronunciation and their most common words.</p>\r\n\r\n<p>Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it&nbsp;would be&nbsp;necessary to have uniform grammar, pronunciation and more common words.</p>','2025-03-14 14:26:39.692959','1',NULL,0,0,1,1,'2025-03-14 14:26:39.692987','1'),(14,'Your Light Is About To Stop Being Relevant','your-light-is-about-to-stop-being-relevant-3','images/editor-sm-2_0BUsVw4.jpg','<p>The European languages are members of the same family. Their separate existence is a myth. For science, music, sport, etc, Europe uses the same&nbsp;<a href=\"https://themeger.shop/html/katen/html/blog-single.html#\">vocabulary</a>. The languages only differ in their grammar, their pronunciation and their most common words.</p>\r\n\r\n<p>Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it&nbsp;would be&nbsp;necessary to have uniform grammar, pronunciation and more common words.</p>','2025-03-14 14:27:27.572880','1',NULL,0,0,1,3,'2025-03-14 14:27:27.572907','1');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_tags`
--

DROP TABLE IF EXISTS `posts_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_tags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `post_id` bigint NOT NULL,
  `tag_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_tags_post_id_tag_id_46ebeb76_uniq` (`post_id`,`tag_id`),
  KEY `posts_tags_tag_id_5b70f6dd_fk_tags_id` (`tag_id`),
  CONSTRAINT `posts_tags_post_id_f1d664f2_fk_posts_id` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `posts_tags_tag_id_5b70f6dd_fk_tags_id` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_tags`
--

LOCK TABLES `posts_tags` WRITE;
/*!40000 ALTER TABLE `posts_tags` DISABLE KEYS */;
INSERT INTO `posts_tags` VALUES (1,1,1),(2,1,3),(3,1,4),(4,3,1),(5,3,3),(6,3,4),(7,3,5),(8,4,5),(9,5,2),(10,5,3),(11,5,4),(12,6,8),(13,7,8),(14,8,5),(15,9,2),(16,9,3),(17,10,3),(18,11,4),(19,12,5),(20,13,3),(21,14,7);
/*!40000 ALTER TABLE `posts_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_brand`
--

DROP TABLE IF EXISTS `shop_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_brand` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_brand_name_048a0bbd` (`name`),
  KEY `shop_brand_slug_5d7ff4c0` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_brand`
--

LOCK TABLES `shop_brand` WRITE;
/*!40000 ALTER TABLE `shop_brand` DISABLE KEYS */;
INSERT INTO `shop_brand` VALUES (1,'ABC','abc','','2025-03-14 11:54:31.488873','2025-03-14 11:54:31.488884'),(2,'XYZ','xyz','','2025-03-14 11:54:35.617183','2025-03-14 11:54:35.617207'),(3,'123','123','','2025-03-14 11:54:41.517278','2025-03-14 11:54:41.517301');
/*!40000 ALTER TABLE `shop_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_categories`
--

DROP TABLE IF EXISTS `shop_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_categories_name_9b8702d5` (`name`),
  KEY `shop_categories_slug_ab36fb96` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_categories`
--

LOCK TABLES `shop_categories` WRITE;
/*!40000 ALTER TABLE `shop_categories` DISABLE KEYS */;
INSERT INTO `shop_categories` VALUES (1,'Lifestyle','lifestyle','2025-03-14 09:23:03.774186','2025-03-14 09:23:03.774247'),(2,'Inspiration','inspiration','2025-03-14 09:23:11.556515','2025-03-14 09:23:11.556541'),(3,'Fashion','fashion','2025-03-14 09:23:19.190190','2025-03-14 09:23:19.190222'),(4,'Politic','politic','2025-03-14 09:23:25.445841','2025-03-14 09:23:25.445866'),(5,'Trending','trending','2025-03-14 09:23:32.052301','2025-03-14 09:23:32.052324'),(6,'Culture','culture','2025-03-14 09:23:38.298522','2025-03-14 09:23:38.298547');
/*!40000 ALTER TABLE `shop_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_order_items`
--

DROP TABLE IF EXISTS `shop_order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_order_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` bigint unsigned NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `order_id` bigint DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_order_items_order_id_e4e555d9_fk_shop_orders_id` (`order_id`),
  KEY `shop_order_items_user_id_9480d8d9_fk_auth_user_id` (`user_id`),
  KEY `shop_order_items_product_id_1e1413c4_fk_shop_products_id` (`product_id`),
  CONSTRAINT `shop_order_items_order_id_e4e555d9_fk_shop_orders_id` FOREIGN KEY (`order_id`) REFERENCES `shop_orders` (`id`),
  CONSTRAINT `shop_order_items_product_id_1e1413c4_fk_shop_products_id` FOREIGN KEY (`product_id`) REFERENCES `shop_products` (`id`),
  CONSTRAINT `shop_order_items_user_id_9480d8d9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `shop_order_items_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_order_items`
--

LOCK TABLES `shop_order_items` WRITE;
/*!40000 ALTER TABLE `shop_order_items` DISABLE KEYS */;
INSERT INTO `shop_order_items` VALUES (1,2,33.33,'2025-03-18 09:18:16.836338','2025-03-18 09:18:16.836358',1,17,10),(2,1,55.55,'2025-03-18 09:18:16.836377','2025-03-18 09:18:16.836386',1,17,4),(3,1,33.33,'2025-03-18 09:18:16.836404','2025-03-18 09:18:16.836412',1,17,9),(4,2,33.33,'2025-03-18 09:18:37.684619','2025-03-18 09:18:37.684636',2,17,10),(5,1,55.55,'2025-03-18 09:18:37.684652','2025-03-18 09:18:37.684658',2,17,4),(6,1,33.33,'2025-03-18 09:18:37.684672','2025-03-18 09:18:37.684679',2,17,9),(7,2,33.33,'2025-03-18 09:19:09.836240','2025-03-18 09:19:09.836271',3,17,10),(8,1,55.55,'2025-03-18 09:19:09.836292','2025-03-18 09:19:09.836301',3,17,4),(9,1,33.33,'2025-03-18 09:19:09.836318','2025-03-18 09:19:09.836328',3,17,9),(10,2,33.33,'2025-03-18 09:22:05.364382','2025-03-18 09:22:05.364406',4,17,10),(11,1,55.55,'2025-03-18 09:22:05.364435','2025-03-18 09:22:05.364448',4,17,4),(12,1,33.33,'2025-03-18 09:22:05.364472','2025-03-18 09:22:05.364483',4,17,9),(13,2,33.33,'2025-03-18 09:22:35.426423','2025-03-18 09:22:35.426444',5,17,10),(14,1,55.55,'2025-03-18 09:22:35.426464','2025-03-18 09:22:35.426473',5,17,4),(15,1,33.33,'2025-03-18 09:22:35.426491','2025-03-18 09:22:35.426500',5,17,9),(16,2,33.33,'2025-03-18 09:24:12.525409','2025-03-18 09:24:12.525432',6,17,10),(17,1,55.55,'2025-03-18 09:24:12.525456','2025-03-18 09:24:12.525469',6,17,4),(18,1,33.33,'2025-03-18 09:24:12.525492','2025-03-18 09:24:12.525503',6,17,9),(19,2,33.33,'2025-03-18 09:27:08.141393','2025-03-18 09:27:08.141436',7,17,10),(20,1,55.55,'2025-03-18 09:27:08.141494','2025-03-18 09:27:08.141508',7,17,4),(21,1,33.33,'2025-03-18 09:27:08.141533','2025-03-18 09:27:08.141548',7,17,9),(22,2,33.33,'2025-03-18 09:28:13.893810','2025-03-18 09:28:13.893820',8,17,10),(23,1,55.55,'2025-03-18 09:28:13.893831','2025-03-18 09:28:13.893836',8,17,4),(24,1,33.33,'2025-03-18 09:28:13.893845','2025-03-18 09:28:13.893850',8,17,9),(25,2,33.33,'2025-03-18 09:28:50.861085','2025-03-18 09:28:50.861106',9,17,10),(26,1,55.55,'2025-03-18 09:28:50.861121','2025-03-18 09:28:50.861128',9,17,4),(27,1,33.33,'2025-03-18 09:28:50.861140','2025-03-18 09:28:50.861147',9,17,9),(28,2,33.33,'2025-03-18 09:30:06.231827','2025-03-18 09:30:06.231847',10,17,10),(29,1,55.55,'2025-03-18 09:30:06.231867','2025-03-18 09:30:06.231877',10,17,4),(30,1,33.33,'2025-03-18 09:30:06.231894','2025-03-18 09:30:06.231903',10,17,9);
/*!40000 ALTER TABLE `shop_order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_orders`
--

DROP TABLE IF EXISTS `shop_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `full_name` varchar(300) NOT NULL,
  `email` varchar(255) NOT NULL,
  `shipping_address` longtext NOT NULL,
  `amount_paid` decimal(10,2) NOT NULL,
  `date_ordered` datetime(6) NOT NULL,
  `status` smallint NOT NULL,
  `payment_method` smallint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_orders_user_id_9abd760d_fk_auth_user_id` (`user_id`),
  CONSTRAINT `shop_orders_user_id_9abd760d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_orders`
--

LOCK TABLES `shop_orders` WRITE;
/*!40000 ALTER TABLE `shop_orders` DISABLE KEYS */;
INSERT INTO `shop_orders` VALUES (1,'trieu nguyen','trieunb.dev@gmail.com','Da Nang\nQuang Nam\nDa Nang\nĐà Nẵng\n550000',155.54,'2025-03-18 09:18:16.829649',1,1,'2025-03-18 09:18:16.829686','2025-03-18 09:18:16.829697',17),(2,'trieu nguyen','trieunb.dev@gmail.com','Da Nang\nQuang Nam\nDa Nang\nĐà Nẵng\n550000',155.54,'2025-03-18 09:18:37.681402',2,2,'2025-03-18 09:18:37.681433','2025-03-18 09:18:37.681441',17),(3,'trieu nguyen','trieunb.dev@gmail.com','Da Nang\nQuang Nam\nDa Nang\nĐà Nẵng\n550000',155.54,'2025-03-18 09:19:09.832618',2,2,'2025-03-18 09:19:09.832686','2025-03-18 09:19:09.832701',17),(4,'trieu nguyen','trieunb.dev@gmail.com','Da Nang\nQuang Nam\nDa Nang\nĐà Nẵng\n550000',155.54,'2025-03-18 09:22:05.361578',2,2,'2025-03-18 09:22:05.361625','2025-03-18 09:22:05.361639',17),(5,'trieu nguyen','trieunb.dev@gmail.com','Da Nang\nQuang Nam\nDa Nang\nĐà Nẵng\n550000',155.54,'2025-03-18 09:22:35.422527',2,2,'2025-03-18 09:22:35.422581','2025-03-18 09:22:35.422596',17),(6,'trieu nguyen','trieunb.dev@gmail.com','Da Nang\nQuang Nam\nDa Nang\nĐà Nẵng\n550000',155.54,'2025-03-18 09:24:12.522275',2,2,'2025-03-18 09:24:12.522323','2025-03-18 09:24:12.522340',17),(7,'trieu nguyen','trieunb.dev@gmail.com','Da Nang\nQuang Nam\nDa Nang\nĐà Nẵng\n550000',155.54,'2025-03-18 09:27:08.138203',2,2,'2025-03-18 09:27:08.138254','2025-03-18 09:27:08.138269',17),(8,'trieu nguyen','trieunb.dev@gmail.com','Da Nang\nQuang Nam\nDa Nang\nĐà Nẵng\n550000',155.54,'2025-03-18 09:28:13.891330',2,2,'2025-03-18 09:28:13.891358','2025-03-18 09:28:13.891366',17),(9,'trieu nguyen','trieunb.dev@gmail.com','Da Nang\nQuang Nam\nDa Nang\nĐà Nẵng\n550000',155.54,'2025-03-18 09:28:50.857917',2,2,'2025-03-18 09:28:50.857961','2025-03-18 09:28:50.857972',17),(10,'trieu nguyen','trieunb.dev@gmail.com','Da Nang\nQuang Nam\nDa Nang\nĐà Nẵng\n550000',155.54,'2025-03-18 09:30:06.227981',2,2,'2025-03-18 09:30:06.228051','2025-03-18 09:30:06.228063',17),(11,'trieu nguyen','trieunb.dev@gmail.com','Da Nang\nQuang Nam\nDa Nang\nĐà Nẵng\n550000',0.00,'2025-03-18 09:34:25.464370',1,1,'2025-03-18 09:34:25.464427','2025-03-18 09:34:25.464441',17);
/*!40000 ALTER TABLE `shop_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_products`
--

DROP TABLE IF EXISTS `shop_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `in_stock` tinyint(1) NOT NULL,
  `quantity` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `brand_id` bigint DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_products_brand_id_e462ee5e_fk_shop_brand_id` (`brand_id`),
  KEY `shop_products_category_id_ba6920ae_fk_shop_categories_id` (`category_id`),
  KEY `shop_products_slug_364ff7dd` (`slug`),
  CONSTRAINT `shop_products_brand_id_e462ee5e_fk_shop_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `shop_brand` (`id`),
  CONSTRAINT `shop_products_category_id_ba6920ae_fk_shop_categories_id` FOREIGN KEY (`category_id`) REFERENCES `shop_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_products`
--

LOCK TABLES `shop_products` WRITE;
/*!40000 ALTER TABLE `shop_products` DISABLE KEYS */;
INSERT INTO `shop_products` VALUES (1,'Product ABC 001','product-abc-001','Description Product ABC 001',11.11,'images/shopping.webp',1,0,'2025-03-16 01:46:51.450010','2025-03-16 01:46:51.450023',1,3),(2,'Product XYZ 001','product-xyz-001','Description Product ABC 001',22.22,'images/MensShirtWhite19.webp',1,0,'2025-03-16 01:47:49.746839','2025-03-16 01:47:49.746865',2,3),(3,'Product ABC 007','product-abc-007','Description  Product ABC 002',33.33,'images/9-vs-9500-9-world-wear-footwear-white-original-imagn6a5fqbncryj.webp',1,0,'2025-03-16 01:48:21.747821','2025-03-17 12:56:06.822421',2,3),(4,'Product XYZ 002','product-xyz-002','Description Product XYZ 002',55.55,'images/runningshoesforyou-2048px-2251.webp',1,0,'2025-03-16 01:48:57.383269','2025-03-16 01:48:57.383286',2,1),(5,'Product XYZ 004','product-xyz-004','Description  Product XYZ 004',66.66,'images/images_1.jpeg',1,0,'2025-03-16 01:49:28.133647','2025-03-16 01:49:28.133671',1,2),(6,'Product XYZ 003','product-xyz-003','Description  Product XYZ 003',99.99,'images/white-sneakers-colored-accents-on-260nw-2473467591.webp',1,0,'2025-03-16 01:57:16.273729','2025-03-16 01:57:16.273753',3,6),(7,'Product ABC 003','product-abc-002','Description  Product ABC 002',33.33,'images/9-vs-9500-9-world-wear-footwear-white-original-imagn6a5fqbncryj.webp',1,0,'2025-03-16 02:01:00.945826','2025-03-16 02:01:21.453537',2,5),(8,'Product ABC 004','product-abc-004','Description  Product ABC 004',33.33,'images/9-vs-9500-9-world-wear-footwear-white-original-imagn6a5fqbncryj.webp',1,0,'2025-03-16 02:05:32.314916','2025-03-16 02:06:00.206548',1,4),(9,'Product ABC 004','product-abc-005','Description  Product ABC 004',33.33,'images/9-vs-9500-9-world-wear-footwear-white-original-imagn6a5fqbncryj.webp',1,0,'2025-03-16 02:06:37.394285','2025-03-17 12:50:58.882274',1,4),(10,'Product ABC 006','product-abc-006','Description  Product ABC 002',33.33,'images/9-vs-9500-9-world-wear-footwear-white-original-imagn6a5fqbncryj.webp',1,0,'2025-03-16 02:06:37.396194','2025-03-17 12:51:08.322217',2,5);
/*!40000 ALTER TABLE `shop_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_shipping_addresses`
--

DROP TABLE IF EXISTS `shop_shipping_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_shipping_addresses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `full_name` varchar(300) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(300) NOT NULL,
  `city` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_shipping_addresses_user_id_78fd30a2_fk_auth_user_id` (`user_id`),
  CONSTRAINT `shop_shipping_addresses_user_id_78fd30a2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_shipping_addresses`
--

LOCK TABLES `shop_shipping_addresses` WRITE;
/*!40000 ALTER TABLE `shop_shipping_addresses` DISABLE KEYS */;
INSERT INTO `shop_shipping_addresses` VALUES (1,'trieu nguyen','trieunb.dev@gmail.com','Da Nang','Quang Nam','Da Nang','2025-03-18 04:47:51.802083','2025-03-18 04:48:27.297626','Đà Nẵng','550000',1);
/*!40000 ALTER TABLE `shop_shipping_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'Audio','2025-03-14 12:01:34.444421'),(2,'Content','2025-03-14 12:01:48.085580'),(3,'Featured','2025-03-14 12:02:02.371437'),(4,'Image','2025-03-14 12:02:06.444838'),(5,'Photo','2025-03-14 12:02:19.214197'),(6,'Pick','2025-03-14 12:02:26.798564'),(7,'Trending','2025-03-14 12:02:37.453042'),(8,'Lifestyle','2025-03-14 12:02:51.527505');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dj_project_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-21 14:43:34
