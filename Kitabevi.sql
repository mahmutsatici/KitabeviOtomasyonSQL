-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: kitabevi_otomasyon
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `faturalar`
--

DROP TABLE IF EXISTS `faturalar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faturalar` (
  `fatura_id` int NOT NULL AUTO_INCREMENT,
  `fatura_tarihi` date NOT NULL,
  `toplam_tutar` decimal(10,2) NOT NULL,
  `siparis_id` int NOT NULL,
  PRIMARY KEY (`fatura_id`),
  KEY `siparis_id` (`siparis_id`),
  CONSTRAINT `faturalar_ibfk_1` FOREIGN KEY (`siparis_id`) REFERENCES `siparisler` (`siparis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faturalar`
--

LOCK TABLES `faturalar` WRITE;
/*!40000 ALTER TABLE `faturalar` DISABLE KEYS */;
/*!40000 ALTER TABLE `faturalar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `kategori_kitap_sayisi`
--

DROP TABLE IF EXISTS `kategori_kitap_sayisi`;
/*!50001 DROP VIEW IF EXISTS `kategori_kitap_sayisi`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `kategori_kitap_sayisi` AS SELECT 
 1 AS `kategori_id`,
 1 AS `kategori_ad`,
 1 AS `kitap_sayisi`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `kategoriler`
--

DROP TABLE IF EXISTS `kategoriler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kategoriler` (
  `kategori_id` int NOT NULL AUTO_INCREMENT,
  `kategori_ad` varchar(255) NOT NULL,
  PRIMARY KEY (`kategori_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategoriler`
--

LOCK TABLES `kategoriler` WRITE;
/*!40000 ALTER TABLE `kategoriler` DISABLE KEYS */;
/*!40000 ALTER TABLE `kategoriler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kitaplar`
--

DROP TABLE IF EXISTS `kitaplar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kitaplar` (
  `kitap_id` int NOT NULL AUTO_INCREMENT,
  `kitap_ad` varchar(255) NOT NULL,
  `yazar_ad` varchar(255) NOT NULL,
  `yayinevi_ad` varchar(255) NOT NULL,
  `ISBN_no` varchar(255) NOT NULL,
  `yayin_tarihi` date NOT NULL,
  `sayfa_sayisi` int NOT NULL,
  `kategori_id` int NOT NULL,
  PRIMARY KEY (`kitap_id`),
  KEY `kategori_id` (`kategori_id`),
  KEY `idx_kitaplar_isbn` (`ISBN_no`),
  CONSTRAINT `kitaplar_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `kategoriler` (`kategori_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kitaplar`
--

LOCK TABLES `kitaplar` WRITE;
/*!40000 ALTER TABLE `kitaplar` DISABLE KEYS */;
/*!40000 ALTER TABLE `kitaplar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `musteri_siparisleri`
--

DROP TABLE IF EXISTS `musteri_siparisleri`;
/*!50001 DROP VIEW IF EXISTS `musteri_siparisleri`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `musteri_siparisleri` AS SELECT 
 1 AS `siparis_id`,
 1 AS `siparis_tarihi`,
 1 AS `musteri_ad`,
 1 AS `kitap_ad`,
 1 AS `adet`,
 1 AS `birim_fiyat`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `musteriler`
--

DROP TABLE IF EXISTS `musteriler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `musteriler` (
  `musteri_id` int NOT NULL AUTO_INCREMENT,
  `musteri_ad` varchar(255) NOT NULL,
  `adres` varchar(255) NOT NULL,
  `eposta` varchar(255) NOT NULL,
  `telefon_no` varchar(20) NOT NULL,
  PRIMARY KEY (`musteri_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musteriler`
--

LOCK TABLES `musteriler` WRITE;
/*!40000 ALTER TABLE `musteriler` DISABLE KEYS */;
/*!40000 ALTER TABLE `musteriler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odemeler`
--

DROP TABLE IF EXISTS `odemeler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `odemeler` (
  `odeme_id` int NOT NULL AUTO_INCREMENT,
  `odeme_tarihi` date NOT NULL,
  `odeme_tutari` decimal(10,2) NOT NULL,
  `fatura_id` int NOT NULL,
  PRIMARY KEY (`odeme_id`),
  KEY `fatura_id` (`fatura_id`),
  CONSTRAINT `odemeler_ibfk_1` FOREIGN KEY (`fatura_id`) REFERENCES `faturalar` (`fatura_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odemeler`
--

LOCK TABLES `odemeler` WRITE;
/*!40000 ALTER TABLE `odemeler` DISABLE KEYS */;
/*!40000 ALTER TABLE `odemeler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personel`
--

DROP TABLE IF EXISTS `personel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personel` (
  `personel_id` int NOT NULL AUTO_INCREMENT,
  `personel_ad` varchar(255) NOT NULL,
  `adres` varchar(255) NOT NULL,
  `eposta` varchar(255) NOT NULL,
  `telefon_no` varchar(20) NOT NULL,
  `pozisyon` varchar(255) NOT NULL,
  PRIMARY KEY (`personel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personel`
--

LOCK TABLES `personel` WRITE;
/*!40000 ALTER TABLE `personel` DISABLE KEYS */;
/*!40000 ALTER TABLE `personel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `siparis_kitaplar`
--

DROP TABLE IF EXISTS `siparis_kitaplar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `siparis_kitaplar` (
  `siparis_id` int NOT NULL,
  `kitap_id` int NOT NULL,
  `adet` int NOT NULL,
  `birim_fiyat` decimal(10,2) NOT NULL,
  PRIMARY KEY (`siparis_id`,`kitap_id`),
  KEY `kitap_id` (`kitap_id`),
  CONSTRAINT `siparis_kitaplar_ibfk_1` FOREIGN KEY (`siparis_id`) REFERENCES `siparisler` (`siparis_id`),
  CONSTRAINT `siparis_kitaplar_ibfk_2` FOREIGN KEY (`kitap_id`) REFERENCES `kitaplar` (`kitap_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `siparis_kitaplar`
--

LOCK TABLES `siparis_kitaplar` WRITE;
/*!40000 ALTER TABLE `siparis_kitaplar` DISABLE KEYS */;
/*!40000 ALTER TABLE `siparis_kitaplar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `siparisler`
--

DROP TABLE IF EXISTS `siparisler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `siparisler` (
  `siparis_id` int NOT NULL AUTO_INCREMENT,
  `siparis_tarihi` date NOT NULL,
  `musteri_id` int NOT NULL,
  PRIMARY KEY (`siparis_id`),
  KEY `musteri_id` (`musteri_id`),
  CONSTRAINT `siparisler_ibfk_1` FOREIGN KEY (`musteri_id`) REFERENCES `musteriler` (`musteri_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `siparisler`
--

LOCK TABLES `siparisler` WRITE;
/*!40000 ALTER TABLE `siparisler` DISABLE KEYS */;
/*!40000 ALTER TABLE `siparisler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yayinevleri`
--

DROP TABLE IF EXISTS `yayinevleri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yayinevleri` (
  `yayinevi_id` int NOT NULL AUTO_INCREMENT,
  `yayinevi_ad` varchar(255) NOT NULL,
  `adres` varchar(255) NOT NULL,
  `eposta` varchar(255) NOT NULL,
  `telefon_no` varchar(20) NOT NULL,
  PRIMARY KEY (`yayinevi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yayinevleri`
--

LOCK TABLES `yayinevleri` WRITE;
/*!40000 ALTER TABLE `yayinevleri` DISABLE KEYS */;
/*!40000 ALTER TABLE `yayinevleri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `kategori_kitap_sayisi`
--

/*!50001 DROP VIEW IF EXISTS `kategori_kitap_sayisi`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `kategori_kitap_sayisi` AS select `kategoriler`.`kategori_id` AS `kategori_id`,`kategoriler`.`kategori_ad` AS `kategori_ad`,count(0) AS `kitap_sayisi` from (`kitaplar` join `kategoriler` on((`kitaplar`.`kategori_id` = `kategoriler`.`kategori_id`))) group by `kategoriler`.`kategori_id`,`kategoriler`.`kategori_ad` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `musteri_siparisleri`
--

/*!50001 DROP VIEW IF EXISTS `musteri_siparisleri`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `musteri_siparisleri` AS select `siparisler`.`siparis_id` AS `siparis_id`,`siparisler`.`siparis_tarihi` AS `siparis_tarihi`,`musteriler`.`musteri_ad` AS `musteri_ad`,`kitaplar`.`kitap_ad` AS `kitap_ad`,`siparis_kitaplar`.`adet` AS `adet`,`siparis_kitaplar`.`birim_fiyat` AS `birim_fiyat` from (((`siparisler` join `musteriler` on((`siparisler`.`musteri_id` = `musteriler`.`musteri_id`))) join `siparis_kitaplar` on((`siparisler`.`siparis_id` = `siparis_kitaplar`.`siparis_id`))) join `kitaplar` on((`siparis_kitaplar`.`kitap_id` = `kitaplar`.`kitap_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-26 12:20:56
