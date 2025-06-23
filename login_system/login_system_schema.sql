-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: login_db
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `blocks`
--

DROP TABLE IF EXISTS `blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blocks` (
  `id_block` char(36) NOT NULL,
  `id_user` char(36) DEFAULT NULL,
  `block_date` datetime NOT NULL,
  `unblock_date` datetime DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `unblock_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_block`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `blocks_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blocks`
--

LOCK TABLES `blocks` WRITE;
/*!40000 ALTER TABLE `blocks` DISABLE KEYS */;
INSERT INTO `blocks` VALUES ('339030f5-964c-4831-af94-85c07e86978a','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-23 01:05:31','2025-06-23 01:06:41','Re-bloqueo por intentos fallidos','Desbloqueo manual por admin_10F1PLL');
INSERT INTO `blocks` VALUES ('7d8967ef-1208-471e-9c1d-ff0361d79260','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-23 01:58:29','2025-06-23 02:25:17','Re-bloqueo por intentos fallidos','Desbloqueo manual por admin_10F1PLL');
INSERT INTO `blocks` VALUES ('adce74d7-47d0-42c3-93e6-082017498e14','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-22 23:38:29','2025-06-22 23:58:29','Demasiados intentos fallidos (primer bloqueo)',NULL);
INSERT INTO `blocks` VALUES ('bc60bbc8-df9a-43ef-b2dc-8a4d0676c91c','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-23 00:02:21','2025-06-23 00:11:15','Re-bloqueo por intentos fallidos','Desbloqueo manual por admin_10F1PLL');
INSERT INTO `blocks` VALUES ('d7691ca2-09fa-4126-8a41-5d4274baf389','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-23 09:51:42',NULL,'Re-block due to failed attempts',NULL);
/*!40000 ALTER TABLE `blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id_rol` char(36) NOT NULL,
  `id_user` char(36) DEFAULT NULL,
  `rol` enum('customer','admin','suport','ceo','manager') DEFAULT 'customer',
  `id_employee` char(36) DEFAULT NULL,
  PRIMARY KEY (`id_rol`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('0b5790d6-fda5-4263-a0d6-cc83d1d330c7','0ae2868f-c467-47d2-9fe4-29395433e7f9','admin','b69fdf78-d1af-45bf-a52a-30eff40a92fe');
INSERT INTO `roles` VALUES ('2f119e3d-06e1-495a-bb40-7392b2858d6f','a1b2c3d4-e5f6-7890-1234-567890abcdef','ceo',NULL);
INSERT INTO `roles` VALUES ('379bdaac-07ae-4878-abea-e53f793ef907','WBCX6JT','manager',NULL);
INSERT INTO `roles` VALUES ('dedda672-296d-4850-9eca-109ea1b63d28','d9f6bd80-982f-48d2-8715-159035851dcd','manager','a6fd6185-1da6-4c2c-bb33-a9dc960e0f32');
INSERT INTO `roles` VALUES ('e9f22a4b-4542-40ce-bb18-a1a91dc311db','QUTS7CZ','admin',NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sesions`
--

DROP TABLE IF EXISTS `sesions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sesions` (
  `id_session` char(36) NOT NULL,
  `id_user` char(36) DEFAULT NULL,
  `date_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `success` tinyint(1) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_session`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `sesions_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesions`
--

LOCK TABLES `sesions` WRITE;
/*!40000 ALTER TABLE `sesions` DISABLE KEYS */;
INSERT INTO `sesions` VALUES ('02e0d5c3-e198-4743-97a0-7c4fa3a0461e','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-22 23:38:29',0,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('04a0062c-dc4c-48c3-a742-d9d52d078305','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-23 00:05:18',0,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('07927b10-90d3-4f99-b8ce-46f39e89a621','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-23 01:26:01',0,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('0894d9ea-e60b-4003-b6fb-1a11ac1717cc','QUTS7CZ','2025-06-23 00:08:22',1,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('1f64f5fe-119b-4cd2-a0cf-1b5d25301395','QUTS7CZ','2025-06-22 23:40:38',1,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('2270119d-dbfd-4118-8476-7e8ad0f3ae67','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-23 00:11:46',1,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('22f867f3-7d09-43b9-9911-4aafa817a89d','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-23 01:41:25',0,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('30d02aaa-0184-4b0b-af51-fc8f5b31b707','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-23 01:00:06',0,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('370d4902-3145-43e3-8653-2a62d1d57f26','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-22 23:58:50',1,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('3b7b432b-9233-4445-9876-fa7154d563c3','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-23 09:51:33',0,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('3cd2d038-6026-4c0c-a0ce-73ab694f4947','QUTS7CZ','2025-06-23 00:03:37',1,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('3e9c940d-e754-4577-91a2-d60c110e8a9b','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-23 09:51:26',0,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('43c9d331-4d1b-4011-8f31-9375ac21604d','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-22 23:57:07',0,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('44ad0d7a-f580-4b4a-9c91-2238e3dfb503','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-23 00:56:16',0,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('4655b9b8-8354-47d6-a18f-08dc8bbbfd3f','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-22 23:38:08',0,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('5254e72c-0bb9-4be8-870f-79a68b9b890b','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-23 00:26:52',1,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('5299cf80-703e-4617-b705-ad6a3f0f339c','QUTS7CZ','2025-06-22 23:57:55',1,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('53b6f93a-5825-4fa0-a0bd-bae762d1857d','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-23 01:32:33',0,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('55931ea1-7993-4754-a482-49cbeb46478a','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-23 01:34:56',0,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('60f8bc1a-f086-44ab-8cdf-e04c4514efbe','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-23 00:56:05',0,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('646274e8-50ab-4403-ab1e-d776520af4ac','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-23 01:05:11',0,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('69a48fb9-2319-4c7b-b0fe-b8414b83865b','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-23 00:02:21',0,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('6a04ecf7-4f6a-4701-8328-95de7a6121a1','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-23 01:32:24',0,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('6ab4811a-3aea-4f45-965f-9f9e3164b3d9','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-23 00:01:57',0,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('6bf9bdd5-2f16-4128-8070-eb25af3b75b4','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-23 09:51:42',0,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('75b6ed38-f9fc-4bf4-848d-638aab2b7ab0','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-23 00:55:45',0,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('76f1db2d-bdc8-4459-9d47-0878d104202f','QUTS7CZ','2025-06-23 01:59:24',1,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('7ff6da71-7b46-4da8-8290-a620c7c888a7','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-23 01:58:51',0,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('828b465c-9f62-41bd-a3aa-5ea3c67dd6b0','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-22 23:38:20',0,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('86351475-b7c3-4890-a0ea-702bd9b916b3','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-23 01:47:12',0,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('8c59a8ba-02d5-4eab-96c5-45a24f17767b','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-23 09:49:03',1,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('8de42eb3-06dc-4e82-a5a1-b9a36e49f500','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-22 23:56:57',0,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('971d77ee-3073-40c7-b0dd-771387052d57','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-22 23:41:38',0,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('9a11fc87-3289-478e-8fd0-ffa281a862c0','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-23 01:31:20',0,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('9a804a2b-bc8b-4d7b-8575-1131399cfb5c','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-23 01:07:17',1,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('a18e98fa-a7ea-4ea9-9597-8dc1c5af6922','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-23 02:03:27',0,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('a1adc2c7-87f6-4092-b141-ad3b3bf921c8','QUTS7CZ','2025-06-23 02:03:45',1,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('b182a275-7c16-4cfa-810e-f2dc0d73e55c','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-23 01:58:29',0,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('b1fb89ec-dcd7-4804-9e9a-8056e7173636','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-23 01:05:31',0,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('b23a4519-ffde-4aca-bebb-9f1acb5f28e9','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-23 09:35:10',1,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('b2c27648-2a1b-48d7-9248-bd574c5f3480','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-23 01:32:05',1,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('b417dc11-982b-4ec6-9407-b08066f6c79e','QUTS7CZ','2025-06-23 01:06:11',1,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('bd86eda7-ee0d-4331-bb33-08030c28dbdf','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-23 01:00:44',0,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('bdb7b8af-afae-4ef2-a69e-748f19ba8b89','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-23 01:47:49',0,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('c97318e0-c296-451d-8636-2d6fea10ce0c','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-23 00:02:06',0,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('ca9d6682-a280-4004-8b73-4d5be8677bb7','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-23 00:56:30',0,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('cce2ad3a-c622-4e4f-a758-676304ff5470','QUTS7CZ','2025-06-23 02:24:08',1,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('d16f196b-ba79-438f-aa35-55d05742237c','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-23 02:25:57',1,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('d31a75d0-a687-4642-a943-2f0007625566','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-23 01:32:57',0,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('de82cbb6-cca0-429c-8751-3e68feb55d7c','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-23 01:32:42',0,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('df68e0ed-c355-4bdf-9c4d-66d9442274b6','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-23 01:33:21',1,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('e17f3129-c0cd-443c-b17b-6b63ef6f7ee7','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-23 01:00:34',0,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('e20ae49e-7e67-472c-b20f-c96fd6c9cc64','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-22 23:38:45',0,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('ebc9ded7-ced0-45fa-bd31-1d1ede4db0dd','QUTS7CZ','2025-06-23 02:07:36',1,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('eda219a9-f9a9-482a-bbaf-57532bd86ac6','QUTS7CZ','2025-06-22 23:39:32',1,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('ee30b4e4-4f1c-4893-90b7-259466d2f928','QUTS7CZ','2025-06-23 00:10:31',1,'N/A','ConsoleApp');
INSERT INTO `sesions` VALUES ('fad31133-1c86-4e87-8f5d-ba415b74b2f9','a1b2c3d4-e5f6-7890-1234-567890abcdef','2025-06-22 23:56:52',0,'N/A','ConsoleApp');
/*!40000 ALTER TABLE `sesions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id_user` char(36) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `real_name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `age` int NOT NULL,
  `country` varchar(60) NOT NULL,
  `two_factor_auth` tinyint(1) DEFAULT '0',
  `failed_session_attempts` int DEFAULT '0',
  `blocked` tinyint(1) DEFAULT '0',
  `registration_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_session` datetime DEFAULT NULL,
  `online` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `mail` (`mail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('0ae2868f-c467-47d2-9fe4-29395433e7f9','admin_8e677acd-8977-4aaa-827e-c1c3e0593184','jaime godoy','$2a$10$bMbcDIY9uoP1Jlyd4HhnY.GMPkOZN4FTnkDOAn1N7.TMUYzM0EL5K','admjaimegodoy33@securityEnterprise.com','232424234',33,'afganistan',0,0,0,'2025-06-23 00:27:52',NULL,1);
INSERT INTO `users` VALUES ('59179b7f-4fad-11f0-a884-dc4546f65ee5','reonzx','jose luis','$2a$10$J7HM8tf9ITSdOnpBUEflOOR8wxWumdtu59rxtjDM96dozAy3S4T/W','jose@jose.com','23322334',23,'mexico',0,0,0,'2025-06-22 15:10:39','2025-06-22 15:37:27',1);
INSERT INTO `users` VALUES ('9A9SB4A','ManagerPrincipal','jonh smith','$2a$10$EFLKQWc.vDi8YAYSLlEs..keVFgsX4tqOoEJWEPOoXlXLjY6sEq16','manager@securityEnterprise.com','5559876543',35,'Usa',0,0,0,'2025-06-22 21:42:30',NULL,1);
INSERT INTO `users` VALUES ('a1b2c3d4-e5f6-7890-1234-567890abcdef','CEOPR','Jose Sosa','$2a$10$r6wT8vNGZogwZEp3SU8kJuy8rzMibTRfS6JImazOUs0fXTFYf980i','ceo1i@securityEnterprise.com','532322424',25,'Mexico',0,0,0,'2025-06-22 22:19:55','2025-06-23 09:51:42',0);
INSERT INTO `users` VALUES ('d9f6bd80-982f-48d2-8715-159035851dcd','manager_a464ec17-21af-498e-b7fe-b15020183b89','carlos landeros','$2a$10$ltgD0bwBo74N4d4OhpGYduqVYgm2f4gucRwVLFGlJoB3wbnpZprYu','mancarloslanderos23@securityEnterprise.com','332424243',23,'chile',0,0,0,'2025-06-23 09:50:01',NULL,1);
INSERT INTO `users` VALUES ('EXTO62D','artemio777','artemio perez','$2a$10$AaFLe4QSL55iN7CTck0mT.5m/0AWT1foqgzVu7XGRyAaOHaCR7cK6','artemio@constructora','23242442424',50,'mexico',0,0,0,'2025-06-22 15:39:12',NULL,1);
INSERT INTO `users` VALUES ('KJ5UTUI','ManagerPrincipal1','Miguel Vega','$2a$10$3F.B5ley9GYZse2zq.0uOey8FOX7VvOip4qFkEwfXp.yL.DvRlNXy','manager1@securityEnterprise.com','5559343543',35,'Mexico',0,0,0,'2025-06-22 21:55:07',NULL,1);
INSERT INTO `users` VALUES ('P3N2F#Y','Ceo7878','Rafael Sosa','$2a$10$Wlc9Q/l9SEQL3apk/5RZJO6gz5lveNmZ0ud6xlZDWxDgSx79to2Gm','ceo@securityEnterprise.com','5551234567',40,'México',0,0,0,'2025-06-22 21:42:30',NULL,1);
INSERT INTO `users` VALUES ('QUTS7CZ','admin_10F1PLL','oscar','$2a$10$AUQ1Zc/a8qhMwbj7QUxjfucAXQsnKl7LX1/TjfCqG0bd2NzOzCAoW','joseguero1416@gmail.com','33321314',34,'peru',0,0,0,'2025-06-22 22:57:37','2025-06-23 02:24:08',0);
INSERT INTO `users` VALUES ('SB1IESL','Ceo7979','Cuco sosa','$2a$10$uRDjiZibGOFMYJuRjytWUumsnO7Gh.KkhYW49e1FYT2B9C3hNeeNq','ceo1@securityEnterprise.com','53232424',45,'México',0,0,0,'2025-06-22 21:55:07',NULL,1);
INSERT INTO `users` VALUES ('WBCX6JT','managerPrincipal1i','Miguel lares','$2a$10$uI.5hTNZA5yG0MsaZ7Gf1OGP.41xx/FFe7ZhIy9IqDCyDTFbc9vm.','manager1i@securityEnterprise.com','532232323',20,'Mexico',0,0,0,'2025-06-22 22:19:55',NULL,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-23 10:20:40
