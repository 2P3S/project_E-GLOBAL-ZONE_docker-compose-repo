-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: e_global_zone
-- ------------------------------------------------------
-- Server version	5.7.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reset_expire_time` datetime DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_account_unique` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'oic_yju','$2y$10$fBHFFdme/CfbugRVv1mQS.rMWDbRDJ1ERvW0dPYcLNEYGoxQ5Yq6S','국제교류원','2020-09-26 14:44:44','mOGJkODJlYWVjNjg1MDRmNzUiLCJpYXQiOjE2MDA0MzQ0MzQsIm5iZiI6MTYwMDQzNDQzNCwiZXhwIjoxNjAwNTIwODM0LCJzdWI',NULL,'2020-09-26 05:43:44');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `dept_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`dept_id`),
  UNIQUE KEY `departments_dept_name_unique` (`dept_name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'컴정_컴퓨터정보계열',NULL,NULL),(2,'기계_컴퓨터응용기계계열',NULL,NULL),(3,'전자_ICT반도체전자계열',NULL,NULL),(4,'전기_신재생에너지전기계열',NULL,NULL),(5,'건축_건축인테리어디자인계열',NULL,NULL),(6,'부사관_부사관계열',NULL,NULL),(7,'콘디_콘텐츠디자인과',NULL,NULL),(8,'드론전자_드론항공전자과',NULL,NULL),(9,'경영_경영회계서비스계열',NULL,NULL),(10,'관광_호텔항공관광계열',NULL,NULL),(11,'사회복지_사회복지과',NULL,NULL),(12,'유아_유아교육과',NULL,NULL),(13,'보건의료_보건의료행정과',NULL,NULL),(14,'간호_간호학과',NULL,NULL);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2016_06_01_000001_create_oauth_auth_codes_table',1),(2,'2016_06_01_000002_create_oauth_access_tokens_table',1),(3,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(4,'2016_06_01_000004_create_oauth_clients_table',1),(5,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(6,'2017_10_08_000001_create_oauth_access_token_providers_table',1),(7,'2020_08_02_081526_create_departments_table',1),(8,'2020_08_02_081544_create_sections_table',1),(9,'2020_08_02_081545_create_student_koreans_table',1),(10,'2020_08_02_081547_create_restricted_student_koreans_table',1),(11,'2020_08_02_081548_create_student_foreigners_table',1),(12,'2020_08_02_081549_create_student_foreigners_contacts_table',1),(13,'2020_08_02_081550_create_schedules_table',1),(14,'2020_08_02_081551_create_reservations_table',1),(15,'2020_08_02_081552_create_work_student_foreigners_table',1),(16,'2020_08_02_081638_create_settings_table',1),(17,'2020_08_08_031034_create_admins_table',1),(18,'2020_08_09_153855_create_schedules_result_imgs_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_token_providers`
--

DROP TABLE IF EXISTS `oauth_access_token_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_token_providers` (
  `oauth_access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`oauth_access_token_id`),
  CONSTRAINT `oauth_access_token_providers_oauth_access_token_id_foreign` FOREIGN KEY (`oauth_access_token_id`) REFERENCES `oauth_access_tokens` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_token_providers`
--

LOCK TABLES `oauth_access_token_providers` WRITE;
/*!40000 ALTER TABLE `oauth_access_token_providers` DISABLE KEYS */;
INSERT INTO `oauth_access_token_providers` VALUES ('008c2fcbc57a5949705cd524fffab4ef1695d8b6cfabd7f087e4ae785f7607db0f6d9278684b44cd','foreigners','2020-09-26 09:24:48','2020-09-26 09:24:48'),('0a394dca9e9a89ad39a5455914c52267823037998fb62798a6dce23d4bc8327e107ce44cd9cc6010','admins','2020-09-26 10:53:56','2020-09-26 10:53:56'),('13aa3b73e7b4a53c38cc34581634df0931650f704d3f621ab5c2f8bf7c69dd8f8a22f0165ea0a41b','foreigners','2020-09-27 08:16:29','2020-09-27 08:16:29'),('1e21f32d9b1a29e804678b3767b0ea8b39d21858a0d111efee186963852dca2bb257e6aa8e236bed','admins','2020-09-26 10:14:54','2020-09-26 10:14:54'),('20fea838981bb9ae1dc2921823386b9a58c6204593c4e2051fa37d37a1158303a8686363877d1d20','admins','2020-09-28 08:33:48','2020-09-28 08:33:48'),('2ded9366cef89a7b6bcce00da7201a2fad25bb79148db5db75b905e4e9201b14550965e2d81f1c37','admins','2020-09-28 04:19:57','2020-09-28 04:19:57'),('2df9b607f3b177c6c805cc59a137a4be794dbabf4d049c29214bc91c3d59f4f0e47237a9af46fd69','admins','2020-09-26 07:07:58','2020-09-26 07:07:58'),('3443add1e4863aadf9e06d342f79082ff1dd9bf47c5236e5b0839608e78569e66029b4380349dffb','admins','2020-09-26 11:06:31','2020-09-26 11:06:31'),('3fe4d7ee60692850132a2d0e429a0405c48ea5c0d75daca3d341ddd5051cdc50c61755ad656517df','foreigners','2020-09-28 01:06:42','2020-09-28 01:06:42'),('42e671f7a8daa99a862c0371aa6eb513f3d3db93344bfd81c9ee273fed2f072534aa4f9c3ea9e993','foreigners','2020-09-28 01:07:19','2020-09-28 01:07:19'),('44250e3b0d6dfde6a2b72c6b9cf3031a1f3794d7e538ad956bd49b74ee68cdfd26c1866a1d1b28de','admins','2020-09-26 11:08:23','2020-09-26 11:08:23'),('4800b4c53e3dcfd2fdbddf48738f52835fbc8de1048e6748aa0c81d895552faa92ad513e9425c650','admins','2020-09-26 09:16:49','2020-09-26 09:16:49'),('54d9609a6265ab8c9d94fe51457d1feff9d02e3fe1f1953d00ba9bf6d5ec841cc992319ca63c73cd','admins','2020-09-26 11:09:54','2020-09-26 11:09:54'),('5b8d54b7dc057c1973ecbf95b233b52226e25969fdb2af79d244ce2257db1c6dad1675b1360e2819','admins','2020-09-27 08:16:15','2020-09-27 08:16:15'),('7e73cd14092075c82da5f7af5626bbee5ce2b753690ff305e3eff7de66319221e7be4fa0b2332c3b','admins','2020-09-28 01:03:42','2020-09-28 01:03:42'),('881ea5326a1785e12090f62852036e8987ba0a9e8b9b98afebd45083627caa5fdb6220b13cd10c87','admins','2020-09-26 09:54:10','2020-09-26 09:54:10'),('918bc316b3da70c2ff723141454e738bc6f8c224177cb88217d7ffcff8be03470382aa662d736e73','admins','2020-09-26 10:52:53','2020-09-26 10:52:53'),('9c48f3f08972f678dfd1ae7604457b9a2ef8135d576d2b03b3361518d6edf83090ab13e905af2a76','admins','2020-09-28 03:46:10','2020-09-28 03:46:10'),('9fe2e726f107cf1823d40ca9c587973199e4fb328ea6033982164f6651135a21d05b4f002ba3944c','admins','2020-09-26 11:10:52','2020-09-26 11:10:52'),('ac0fde24340bafcc9d0fd8dac221196726477763144583a21e1320d7f9a721ffb0658bbf2e0d890a','admins','2020-09-26 11:02:16','2020-09-26 11:02:16'),('b309a0c5e89bbef6c5f4ed4ceb7f491ee31517ba3fe63da34ab6fcdceecf8d1f0e9c9f5fb258401d','admins','2020-09-28 04:22:01','2020-09-28 04:22:01'),('b517bdee2ac24aa648cd64c770f859a47447c4a4f388274c3ea5d8ec6effc6530c449d62cdd97f6d','foreigners','2020-09-26 09:25:19','2020-09-26 09:25:19'),('be28b83b700ad59126d4f09b519279b4fa2d3a62dd6b744a6918d49c1c6f14e2a0517f2bd2a3600c','foreigners','2020-09-28 03:41:34','2020-09-28 03:41:34'),('c83c02d435684599860660854116f79d67b7838f1b7df2a48098c3a34dedf5c6d67fcc53b3f9a497','admins','2020-09-26 11:03:22','2020-09-26 11:03:22'),('c8c11c89bd76880d2461a5880f3b3dd90623c85052f66af7de7f587809b6629f881bdd2325fb3295','foreigners','2020-09-26 09:35:19','2020-09-26 09:35:19'),('c8e391a0c39b074bb275ed4aea794ed1321c6a6976c9bbfc1539210c08e91592e2785b76ea2a1132','admins','2020-09-28 04:15:47','2020-09-28 04:15:47'),('cb8968161a4167d4a55633e24a24230ea023b2dfb1b0d866c51f0168575c0a1d8df317c4d6c4a263','admins','2020-09-28 13:57:09','2020-09-28 13:57:09'),('d9646713ead255a2db83105fc3bfbeed0da6b833e8bc2db810008b4717318347130c28e9573e3439','admins','2020-09-27 07:12:20','2020-09-27 07:12:20'),('e2db22bde1deb0171ed21ff55363e3bdeab653a82d70558879ca9dfe54d5a6c1ea6445f23c2f8f2c','admins','2020-09-26 11:04:44','2020-09-26 11:04:44'),('ea72b280721316e7b84cac0940b0c4810b79358672b74b6f0e0b770bb53354c2ad4ab2d513732918','admins','2020-09-26 09:19:51','2020-09-26 09:19:51'),('eb207f785e62e7b0ac7a6efeac75126f7c803b09b90774433117fd8f48e787987c8984830b5d85f0','admins','2020-09-26 11:09:11','2020-09-26 11:09:11'),('f831d09cddddd3ccbd0ea78fa5583a3510703af9ba63960d03d5082149cd0914ef7434606512cee8','admins','2020-09-26 09:59:02','2020-09-26 09:59:02'),('f930ad9a3dfe58b6928240612e828cae56931c84ab712020832718c94674c111bf2e3e78a9658d02','admins','2020-09-26 11:02:56','2020-09-26 11:02:56'),('f946b0e1f5376a0ec0f394e76cec2453f7ebe48a7cfed7671a4fc55b34a02199e1a6ee7b2bc428a0','admins','2020-09-27 05:38:37','2020-09-27 05:38:37');
/*!40000 ALTER TABLE `oauth_access_token_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES ('008c2fcbc57a5949705cd524fffab4ef1695d8b6cfabd7f087e4ae785f7607db0f6d9278684b44cd',2008947,1,'Foreigners Token','[]',0,'2020-09-26 09:24:48','2020-09-26 09:24:48','2020-09-27 18:24:47'),('0a394dca9e9a89ad39a5455914c52267823037998fb62798a6dce23d4bc8327e107ce44cd9cc6010',1,1,'Admins Token','[]',1,'2020-09-26 10:53:56','2020-09-26 10:53:56','2020-09-27 19:53:56'),('13aa3b73e7b4a53c38cc34581634df0931650f704d3f621ab5c2f8bf7c69dd8f8a22f0165ea0a41b',2008947,1,'Foreigners Token','[]',0,'2020-09-27 08:16:29','2020-09-27 08:16:29','2020-09-28 17:16:29'),('1e21f32d9b1a29e804678b3767b0ea8b39d21858a0d111efee186963852dca2bb257e6aa8e236bed',1,1,'Admins Token','[]',0,'2020-09-26 10:14:54','2020-09-26 10:14:54','2020-09-27 19:14:54'),('20fea838981bb9ae1dc2921823386b9a58c6204593c4e2051fa37d37a1158303a8686363877d1d20',1,1,'Admins Token','[]',0,'2020-09-28 08:33:48','2020-09-28 08:33:48','2020-09-29 17:33:48'),('2ded9366cef89a7b6bcce00da7201a2fad25bb79148db5db75b905e4e9201b14550965e2d81f1c37',1,1,'Admins Token','[]',0,'2020-09-28 04:19:57','2020-09-28 04:19:57','2020-09-29 13:19:57'),('2df9b607f3b177c6c805cc59a137a4be794dbabf4d049c29214bc91c3d59f4f0e47237a9af46fd69',1,1,'Admins Token','[]',0,'2020-09-26 07:07:58','2020-09-26 07:07:58','2020-09-27 16:07:58'),('3443add1e4863aadf9e06d342f79082ff1dd9bf47c5236e5b0839608e78569e66029b4380349dffb',1,1,'Admins Token','[]',0,'2020-09-26 11:06:31','2020-09-26 11:06:31','2020-09-27 20:06:31'),('3fe4d7ee60692850132a2d0e429a0405c48ea5c0d75daca3d341ddd5051cdc50c61755ad656517df',2008502,1,'Foreigners Token','[]',0,'2020-09-28 01:06:42','2020-09-28 01:06:42','2020-09-29 10:06:42'),('42e671f7a8daa99a862c0371aa6eb513f3d3db93344bfd81c9ee273fed2f072534aa4f9c3ea9e993',2008947,1,'Foreigners Token','[]',0,'2020-09-28 01:07:19','2020-09-28 01:07:19','2020-09-29 10:07:19'),('44250e3b0d6dfde6a2b72c6b9cf3031a1f3794d7e538ad956bd49b74ee68cdfd26c1866a1d1b28de',1,1,'Admins Token','[]',1,'2020-09-26 11:08:23','2020-09-26 11:08:23','2020-09-27 20:08:23'),('4800b4c53e3dcfd2fdbddf48738f52835fbc8de1048e6748aa0c81d895552faa92ad513e9425c650',1,1,'Admins Token','[]',1,'2020-09-26 09:16:49','2020-09-26 09:16:49','2020-09-27 18:16:49'),('54d9609a6265ab8c9d94fe51457d1feff9d02e3fe1f1953d00ba9bf6d5ec841cc992319ca63c73cd',1,1,'Admins Token','[]',1,'2020-09-26 11:09:54','2020-09-26 11:09:54','2020-09-27 20:09:54'),('5b8d54b7dc057c1973ecbf95b233b52226e25969fdb2af79d244ce2257db1c6dad1675b1360e2819',1,1,'Admins Token','[]',1,'2020-09-27 08:16:15','2020-09-27 08:16:15','2020-09-28 17:16:15'),('7e73cd14092075c82da5f7af5626bbee5ce2b753690ff305e3eff7de66319221e7be4fa0b2332c3b',1,1,'Admins Token','[]',1,'2020-09-28 01:03:42','2020-09-28 01:03:42','2020-09-29 10:03:42'),('881ea5326a1785e12090f62852036e8987ba0a9e8b9b98afebd45083627caa5fdb6220b13cd10c87',1,1,'Admins Token','[]',0,'2020-09-26 09:54:10','2020-09-26 09:54:10','2020-09-27 18:54:10'),('918bc316b3da70c2ff723141454e738bc6f8c224177cb88217d7ffcff8be03470382aa662d736e73',1,1,'Admins Token','[]',0,'2020-09-26 10:52:53','2020-09-26 10:52:53','2020-09-27 19:52:53'),('9c48f3f08972f678dfd1ae7604457b9a2ef8135d576d2b03b3361518d6edf83090ab13e905af2a76',1,1,'Admins Token','[]',1,'2020-09-28 03:46:10','2020-09-28 03:46:10','2020-09-29 12:46:10'),('9fe2e726f107cf1823d40ca9c587973199e4fb328ea6033982164f6651135a21d05b4f002ba3944c',1,1,'Admins Token','[]',0,'2020-09-26 11:10:52','2020-09-26 11:10:52','2020-09-27 20:10:52'),('ac0fde24340bafcc9d0fd8dac221196726477763144583a21e1320d7f9a721ffb0658bbf2e0d890a',1,1,'Admins Token','[]',1,'2020-09-26 11:02:16','2020-09-26 11:02:16','2020-09-27 20:02:15'),('b309a0c5e89bbef6c5f4ed4ceb7f491ee31517ba3fe63da34ab6fcdceecf8d1f0e9c9f5fb258401d',1,1,'Admins Token','[]',0,'2020-09-28 04:22:01','2020-09-28 04:22:01','2020-09-29 13:22:01'),('b517bdee2ac24aa648cd64c770f859a47447c4a4f388274c3ea5d8ec6effc6530c449d62cdd97f6d',2008947,1,'Foreigners Token','[]',0,'2020-09-26 09:25:19','2020-09-26 09:25:19','2020-09-27 18:25:19'),('be28b83b700ad59126d4f09b519279b4fa2d3a62dd6b744a6918d49c1c6f14e2a0517f2bd2a3600c',2008947,1,'Foreigners Token','[]',0,'2020-09-28 03:41:34','2020-09-28 03:41:34','2020-09-29 12:41:34'),('c83c02d435684599860660854116f79d67b7838f1b7df2a48098c3a34dedf5c6d67fcc53b3f9a497',1,1,'Admins Token','[]',1,'2020-09-26 11:03:22','2020-09-26 11:03:22','2020-09-27 20:03:22'),('c8c11c89bd76880d2461a5880f3b3dd90623c85052f66af7de7f587809b6629f881bdd2325fb3295',2008947,1,'Foreigners Token','[]',0,'2020-09-26 09:35:19','2020-09-26 09:35:19','2020-09-27 18:35:19'),('c8e391a0c39b074bb275ed4aea794ed1321c6a6976c9bbfc1539210c08e91592e2785b76ea2a1132',1,1,'Admins Token','[]',0,'2020-09-28 04:15:47','2020-09-28 04:15:47','2020-09-29 13:15:47'),('cb8968161a4167d4a55633e24a24230ea023b2dfb1b0d866c51f0168575c0a1d8df317c4d6c4a263',1,1,'Admins Token','[]',0,'2020-09-28 13:57:09','2020-09-28 13:57:09','2020-09-29 22:57:09'),('d9646713ead255a2db83105fc3bfbeed0da6b833e8bc2db810008b4717318347130c28e9573e3439',1,1,'Admins Token','[]',1,'2020-09-27 07:12:20','2020-09-27 07:12:20','2020-09-28 16:12:20'),('e2db22bde1deb0171ed21ff55363e3bdeab653a82d70558879ca9dfe54d5a6c1ea6445f23c2f8f2c',1,1,'Admins Token','[]',1,'2020-09-26 11:04:44','2020-09-26 11:04:44','2020-09-27 20:04:43'),('ea72b280721316e7b84cac0940b0c4810b79358672b74b6f0e0b770bb53354c2ad4ab2d513732918',1,1,'Admins Token','[]',0,'2020-09-26 09:19:51','2020-09-26 09:19:51','2020-09-27 18:19:51'),('eb207f785e62e7b0ac7a6efeac75126f7c803b09b90774433117fd8f48e787987c8984830b5d85f0',1,1,'Admins Token','[]',0,'2020-09-26 11:09:11','2020-09-26 11:09:11','2020-09-27 20:09:11'),('f831d09cddddd3ccbd0ea78fa5583a3510703af9ba63960d03d5082149cd0914ef7434606512cee8',1,1,'Admins Token','[]',0,'2020-09-26 09:59:02','2020-09-26 09:59:02','2020-09-27 18:59:02'),('f930ad9a3dfe58b6928240612e828cae56931c84ab712020832718c94674c111bf2e3e78a9658d02',1,1,'Admins Token','[]',1,'2020-09-26 11:02:56','2020-09-26 11:02:56','2020-09-27 20:02:56'),('f946b0e1f5376a0ec0f394e76cec2453f7ebe48a7cfed7671a4fc55b34a02199e1a6ee7b2bc428a0',1,1,'Admins Token','[]',0,'2020-09-27 05:38:37','2020-09-27 05:38:37','2020-09-28 14:38:37');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Laravel Personal Access Client','VWvJSRaYpAyrwe13XpENBX4bcHG4IK14oXrAOc0n','http://localhost',1,0,0,'2020-09-23 14:18:07','2020-09-23 14:18:07'),(2,NULL,'Laravel Password Grant Client','KxOgoM4BsR2eqga7Ilu14DSD4J6l05SBnN7miI33','http://localhost',0,1,0,'2020-09-23 14:18:07','2020-09-23 14:18:07');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2020-09-23 14:18:07','2020-09-23 14:18:07');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservations` (
  `res_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `res_sch` bigint(20) unsigned NOT NULL,
  `res_std_kor` bigint(20) unsigned DEFAULT NULL,
  `res_state_of_permission` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `res_state_of_attendance` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`res_id`),
  KEY `reservations_res_std_kor_foreign` (`res_std_kor`),
  KEY `reservations_res_sch_foreign` (`res_sch`),
  CONSTRAINT `reservations_res_sch_foreign` FOREIGN KEY (`res_sch`) REFERENCES `schedules` (`sch_id`) ON DELETE CASCADE,
  CONSTRAINT `reservations_res_std_kor_foreign` FOREIGN KEY (`res_std_kor`) REFERENCES `student_koreans` (`std_kor_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restricted_student_koreans`
--

DROP TABLE IF EXISTS `restricted_student_koreans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restricted_student_koreans` (
  `restrict_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `restrict_std_kor` bigint(20) unsigned NOT NULL,
  `restrict_reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `restrict_start_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `restrict_end_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`restrict_id`),
  KEY `restricted_student_koreans_restrict_std_kor_foreign` (`restrict_std_kor`),
  CONSTRAINT `restricted_student_koreans_restrict_std_kor_foreign` FOREIGN KEY (`restrict_std_kor`) REFERENCES `student_koreans` (`std_kor_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restricted_student_koreans`
--

LOCK TABLES `restricted_student_koreans` WRITE;
/*!40000 ALTER TABLE `restricted_student_koreans` DISABLE KEYS */;
/*!40000 ALTER TABLE `restricted_student_koreans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedules`
--

DROP TABLE IF EXISTS `schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedules` (
  `sch_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sch_sect` bigint(20) unsigned NOT NULL,
  `sch_std_for` bigint(20) unsigned DEFAULT NULL,
  `sch_start_date` datetime NOT NULL,
  `sch_end_date` datetime NOT NULL,
  `sch_state_of_result_input` tinyint(4) NOT NULL DEFAULT '0',
  `sch_state_of_permission` tinyint(4) NOT NULL DEFAULT '0',
  `sch_for_zoom_pw` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`sch_id`),
  KEY `schedules_sch_sect_foreign` (`sch_sect`),
  KEY `schedules_sch_std_for_foreign` (`sch_std_for`),
  CONSTRAINT `schedules_sch_sect_foreign` FOREIGN KEY (`sch_sect`) REFERENCES `sections` (`sect_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `schedules_sch_std_for_foreign` FOREIGN KEY (`sch_std_for`) REFERENCES `student_foreigners` (`std_for_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules`
--

LOCK TABLES `schedules` WRITE;
/*!40000 ALTER TABLE `schedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedules_result_imgs`
--

DROP TABLE IF EXISTS `schedules_result_imgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedules_result_imgs` (
  `sch_id` bigint(20) unsigned NOT NULL,
  `start_img_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_img_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`sch_id`),
  UNIQUE KEY `schedules_result_imgs_start_img_url_unique` (`start_img_url`),
  UNIQUE KEY `schedules_result_imgs_end_img_url_unique` (`end_img_url`),
  CONSTRAINT `schedules_result_imgs_sch_id_foreign` FOREIGN KEY (`sch_id`) REFERENCES `schedules` (`sch_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules_result_imgs`
--

LOCK TABLES `schedules_result_imgs` WRITE;
/*!40000 ALTER TABLE `schedules_result_imgs` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedules_result_imgs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `sect_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sect_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sect_start_date` datetime NOT NULL,
  `sect_end_date` datetime NOT NULL,
  PRIMARY KEY (`sect_id`),
  UNIQUE KEY `sections_sect_name_unique` (`sect_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,'2020학년도 특별학기','2020-09-21 00:00:00','2020-09-25 00:00:00');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `setting_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `max_res_per_day` int(10) unsigned NOT NULL DEFAULT '1',
  `max_std_once` int(10) unsigned NOT NULL DEFAULT '4',
  `res_start_period` int(10) unsigned NOT NULL DEFAULT '1',
  `res_end_period` int(10) unsigned NOT NULL DEFAULT '1',
  `once_meet_time` int(10) unsigned NOT NULL DEFAULT '20',
  `once_rest_time` int(10) unsigned NOT NULL DEFAULT '10',
  `min_absent` int(10) unsigned NOT NULL DEFAULT '3',
  `max_absent` int(10) unsigned NOT NULL DEFAULT '5',
  `once_limit_period` int(10) unsigned NOT NULL DEFAULT '3',
  `result_input_deadline` int(10) unsigned NOT NULL DEFAULT '1',
  `default_admin_pw` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '$2y$10$EwrWGyfsrjyLXfC5yD/q5eg.mBuICjaJ3XofRtnSW0wcld32n3AK.',
  `default_std_for_pw` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '$2y$10$UGkHe7JlJAGcto9F9pHKveMdiXQT4C/ktm8t3OmXDD7njV0wq2ACS',
  PRIMARY KEY (`setting_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES ('2020-09-18 02:46:39',1,4,1,1,20,10,3,5,3,1,'$2y$10$EwrWGyfsrjyLXfC5yD/q5eg.mBuICjaJ3XofRtnSW0wcld32n3AK.','$2y$10$UGkHe7JlJAGcto9F9pHKveMdiXQT4C/ktm8t3OmXDD7njV0wq2ACS'),('2020-09-20 13:54:48',1,4,2,1,20,10,3,5,3,1,'$2y$10$EwrWGyfsrjyLXfC5yD/q5eg.mBuICjaJ3XofRtnSW0wcld32n3AK.','$2y$10$UGkHe7JlJAGcto9F9pHKveMdiXQT4C/ktm8t3OmXDD7njV0wq2ACS'),('2020-09-20 14:12:03',1,4,1,1,20,10,3,5,3,1,'$2y$10$EwrWGyfsrjyLXfC5yD/q5eg.mBuICjaJ3XofRtnSW0wcld32n3AK.','$2y$10$UGkHe7JlJAGcto9F9pHKveMdiXQT4C/ktm8t3OmXDD7njV0wq2ACS'),('2020-09-20 14:12:17',1,4,1,1,20,10,3,5,3,1,'$2y$10$EwrWGyfsrjyLXfC5yD/q5eg.mBuICjaJ3XofRtnSW0wcld32n3AK.','$2y$10$UGkHe7JlJAGcto9F9pHKveMdiXQT4C/ktm8t3OmXDD7njV0wq2ACS'),('2020-09-22 10:10:42',1,4,1,1,20,10,3,5,3,3,'$2y$10$EwrWGyfsrjyLXfC5yD/q5eg.mBuICjaJ3XofRtnSW0wcld32n3AK.','$2y$10$UGkHe7JlJAGcto9F9pHKveMdiXQT4C/ktm8t3OmXDD7njV0wq2ACS'),('2020-09-23 21:18:39',3,4,1,1,20,10,3,5,3,3,'$2y$10$EwrWGyfsrjyLXfC5yD/q5eg.mBuICjaJ3XofRtnSW0wcld32n3AK.','$2y$10$UGkHe7JlJAGcto9F9pHKveMdiXQT4C/ktm8t3OmXDD7njV0wq2ACS'),('2020-09-29 00:27:27',1,4,1,1,20,10,3,5,3,3,'$2y$10$EwrWGyfsrjyLXfC5yD/q5eg.mBuICjaJ3XofRtnSW0wcld32n3AK.','$2y$10$UGkHe7JlJAGcto9F9pHKveMdiXQT4C/ktm8t3OmXDD7njV0wq2ACS');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_foreigners`
--

DROP TABLE IF EXISTS `student_foreigners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_foreigners` (
  `std_for_id` bigint(20) unsigned NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `std_for_dept` bigint(20) unsigned NOT NULL,
  `std_for_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `std_for_lang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `std_for_country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `std_for_num_of_delay_permission` bigint(20) unsigned NOT NULL DEFAULT '0',
  `std_for_num_of_delay_input` bigint(20) unsigned NOT NULL DEFAULT '0',
  `std_for_state_of_favorite` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`std_for_id`),
  KEY `student_foreigners_std_for_dept_foreign` (`std_for_dept`),
  CONSTRAINT `student_foreigners_std_for_dept_foreign` FOREIGN KEY (`std_for_dept`) REFERENCES `departments` (`dept_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_foreigners`
--

LOCK TABLES `student_foreigners` WRITE;
/*!40000 ALTER TABLE `student_foreigners` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_foreigners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_foreigners_contacts`
--

DROP TABLE IF EXISTS `student_foreigners_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_foreigners_contacts` (
  `std_for_id` bigint(20) unsigned NOT NULL,
  `std_for_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `std_for_mail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `std_for_zoom_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`std_for_id`),
  UNIQUE KEY `student_foreigners_contacts_std_for_phone_unique` (`std_for_phone`),
  UNIQUE KEY `student_foreigners_contacts_std_for_mail_unique` (`std_for_mail`),
  UNIQUE KEY `student_foreigners_contacts_std_for_zoom_id_unique` (`std_for_zoom_id`),
  CONSTRAINT `student_foreigners_contacts_std_for_id_foreign` FOREIGN KEY (`std_for_id`) REFERENCES `student_foreigners` (`std_for_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_foreigners_contacts`
--

LOCK TABLES `student_foreigners_contacts` WRITE;
/*!40000 ALTER TABLE `student_foreigners_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_foreigners_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_koreans`
--

DROP TABLE IF EXISTS `student_koreans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_koreans` (
  `std_kor_id` bigint(20) unsigned NOT NULL,
  `std_kor_dept` bigint(20) unsigned NOT NULL,
  `std_kor_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `std_kor_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `std_kor_mail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `std_kor_num_of_attendance` bigint(20) unsigned NOT NULL DEFAULT '0',
  `std_kor_num_of_absent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `std_kor_state_of_permission` tinyint(4) NOT NULL DEFAULT '0',
  `std_kor_state_of_restriction` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`std_kor_id`),
  UNIQUE KEY `student_koreans_std_kor_phone_unique` (`std_kor_phone`),
  UNIQUE KEY `student_koreans_std_kor_mail_unique` (`std_kor_mail`),
  KEY `student_koreans_std_kor_dept_foreign` (`std_kor_dept`),
  CONSTRAINT `student_koreans_std_kor_dept_foreign` FOREIGN KEY (`std_kor_dept`) REFERENCES `departments` (`dept_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_koreans`
--

LOCK TABLES `student_koreans` WRITE;
/*!40000 ALTER TABLE `student_koreans` DISABLE KEYS */;
INSERT INTO `student_koreans` VALUES (1234567,1,'김채원','010-2612-2515','cwkim92@g.yju.ac.kr',0,0,1,0,'2020-09-18 06:09:41','2020-09-18 06:10:18'),(1301257,1,'정재순','010-7188-9494','wjdwotns1006@g.yju.ac.kr',1,0,1,0,'2020-09-18 01:07:40','2020-09-22 07:47:55'),(1601061,1,'김정원','010-6345-0438','jung970306@g.yju.ac.kr',1,0,1,0,'2020-09-21 08:44:06','2020-09-22 07:47:59'),(1601111,1,'박시연','010-9554-1193','watchin13@g.yju.ac.kr',1,0,1,0,'2020-09-18 01:01:21','2020-09-22 07:47:59'),(1601136,1,'손형탁','010-7287-3589','kanbaer@g.yju.ac.kr',0,0,1,0,'2020-09-18 00:59:23','2020-09-18 01:01:09'),(1601201,1,'이승형','010-3366-4333','shlee97@g.yju.ac.kr',1,0,1,0,'2020-09-18 00:56:48','2020-09-23 00:16:29'),(1601214,1,'이재원','010-7246-3347','wodnjsqnzo@g.yju.ac.kr',1,0,1,0,'2020-09-17 17:53:38','2020-09-23 06:28:03'),(1701039,1,'김민혁','010-8632-7497','mhkim128@g.yju.ac.kr',0,0,1,0,'2020-09-20 12:51:47','2020-09-20 12:53:51'),(1701050,1,'김성훈','010-4122-7123','tjdgns0627@g.yju.ac.kr',0,0,1,0,'2020-09-22 05:02:34','2020-09-23 00:08:31'),(1701058,1,'김원형','010-9227-9243','cyberzzang7@g.yju.ac.kr',1,0,1,0,'2020-09-21 10:36:35','2020-09-23 00:16:29'),(1701091,1,'김희수','010-5293-8620','rlagmltn456@g.yju.ac.kr',0,0,1,0,'2020-09-23 05:25:10','2020-09-23 08:25:58'),(1701138,1,'백범환','010-9173-8482','hwan6919@g.yju.ac.kr',0,0,1,0,'2020-09-22 05:03:33','2020-09-23 00:08:31'),(1701149,1,'신동협','010-4688-7033','go05117@g.yju.ac.kr',0,0,1,0,'2020-09-20 12:52:21','2020-09-20 12:53:51'),(1701153,1,'신천은','010-5530-3356','qkskskzlr112@g.yju.ac.kr',1,0,1,0,'2020-09-21 09:19:59','2020-09-28 03:44:41'),(1701235,1,'정예준','010-7108-7427','jyj98071@g.yju.ac.kr',0,0,1,0,'2020-09-22 03:19:12','2020-09-23 00:08:31'),(1701304,1,'김범수','010-4922-7711','qjatnghldlxl@g.yju.ac.kr',0,0,1,0,'2020-09-18 01:23:26','2020-09-18 02:09:09'),(1701314,1,'조승현','010-4074-2360','c0305sh@g.yju.ac.kr',1,0,1,0,'2020-09-17 17:55:34','2020-09-23 06:28:03'),(1801178,1,'유시온','010-2984-5654','tnwl5654@g.yju.ac.kr',0,0,1,0,'2020-09-18 00:57:28','2020-09-18 00:58:24'),(1808073,10,'차강욱','010-2066-9625','crd8414@g.yju.ac.kr',0,0,1,0,'2020-09-24 00:59:18','2020-09-24 05:12:54'),(1808212,10,'최현석','010-4641-4000','hs774@g.yju.ac.kr',0,0,0,0,'2020-09-24 20:34:38','2020-09-24 20:34:38'),(1901019,1,'권소현','010-3649-1541','sohyeon@g.yju.ac.kr',0,0,1,0,'2020-09-18 00:59:34','2020-09-18 01:01:09'),(1901053,1,'김재경','010-1234-5678','kimjk@g.yju.ac.kr',0,0,1,0,'2020-09-18 01:44:51','2020-09-18 02:09:09'),(1901060,1,'김지민','010-5013-1914','hadodi@g.yju.ac.kr',0,0,1,0,'2020-09-22 03:05:56','2020-09-23 00:08:31'),(1901075,1,'김한얼','010-5593-2175','kimhaneol5593@g.yju.ac.kr',0,0,1,0,'2020-09-21 11:20:42','2020-09-23 00:08:31'),(1901123,1,'박중규','010-9687-7227','joongq96@g.yju.ac.kr',1,0,1,0,'2020-09-21 08:23:10','2020-09-22 07:47:59'),(1901141,1,'변희주','010-9683-9993','gmlwn0309@g.yju.ac.kr',0,0,1,0,'2020-09-22 05:08:14','2020-09-23 00:08:31'),(1901192,1,'이구슬','010-6880-8284','rntmf1247@g.yju.ac.kr',0,0,1,0,'2020-09-17 17:47:16','2020-09-17 17:52:46'),(1901249,1,'장주영','010-6665-9400','reloop15@g.yju.ac.kr',0,0,1,0,'2020-09-23 04:23:27','2020-09-23 08:25:58'),(1901256,1,'정경숙','010-4411-7200','tah05004@g.yju.ac.kr',0,0,1,0,'2020-09-18 00:57:08','2020-09-18 00:58:24'),(1901272,1,'조미향','010-5785-8252','algid8252@g.yju.ac.kr',0,0,1,0,'2020-09-22 03:05:31','2020-09-23 00:08:31'),(1901308,1,'허효선','010-9899-6055','iabc0005@g.yju.ac.kr',0,0,1,0,'2020-09-22 05:06:39','2020-09-23 00:08:31'),(1901314,1,'황용주','010-6800-7484','hyj7484@g.yju.ac.kr',0,0,1,0,'2020-09-21 08:42:07','2020-09-21 11:12:03'),(1901321,1,'정연성','010-2128-7865','bomiiys@g.yju.ac.kr',0,0,1,0,'2020-09-21 11:34:44','2020-09-23 00:08:31'),(1903035,1,'김창한','010-4756-5612','rocket5612@g.yju.ac.kr',0,0,1,0,'2020-09-18 13:41:20','2020-09-19 00:32:01'),(2008356,10,'구지윤','010-5197-3488','jiyun1015@g.yju.ac.kr',0,0,0,0,'2020-09-25 05:33:18','2020-09-25 05:33:18'),(2008443,10,'고예은','010-2408-8480','goyeeun@g.yju.ac.kr',0,0,1,0,'2020-09-24 04:59:08','2020-09-24 05:12:54');
/*!40000 ALTER TABLE `student_koreans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_student_foreigners`
--

DROP TABLE IF EXISTS `work_student_foreigners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_student_foreigners` (
  `work_list_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `work_std_for` bigint(20) unsigned NOT NULL,
  `work_sect` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`work_list_id`),
  KEY `work_student_foreigners_work_std_for_foreign` (`work_std_for`),
  KEY `work_student_foreigners_work_sect_foreign` (`work_sect`),
  CONSTRAINT `work_student_foreigners_work_sect_foreign` FOREIGN KEY (`work_sect`) REFERENCES `sections` (`sect_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `work_student_foreigners_work_std_for_foreign` FOREIGN KEY (`work_std_for`) REFERENCES `student_foreigners` (`std_for_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_student_foreigners`
--

LOCK TABLES `work_student_foreigners` WRITE;
/*!40000 ALTER TABLE `work_student_foreigners` DISABLE KEYS */;
/*!40000 ALTER TABLE `work_student_foreigners` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-29  9:00:01
