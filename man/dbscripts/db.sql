-- MySQL dump 10.13  Distrib 5.6.19, for osx10.9 (x86_64)
--
-- Host: localhost    Database: compactcms
-- ------------------------------------------------------
-- Server version	5.6.19

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
-- Table structure for table `element_data`
--

DROP TABLE IF EXISTS `element_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `element_data` (
  `id_element_data` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_id_element_data_types` int(10) unsigned NOT NULL,
  `fk_id_elements` int(10) unsigned NOT NULL,
  `fk_id_languages` int(10) unsigned DEFAULT NULL,
  `data` varchar(16384) DEFAULT NULL,
  PRIMARY KEY (`id_element_data`,`fk_id_elements`),
  UNIQUE KEY `id_element_data_UNIQUE` (`id_element_data`),
  KEY `fk_element_data_elements1_idx` (`fk_id_elements`),
  KEY `fk_element_data_element_data_types1_idx` (`fk_id_element_data_types`),
  KEY `fk_element_data_languages1_idx` (`fk_id_languages`),
  CONSTRAINT `fk_element_data_elements1` FOREIGN KEY (`fk_id_elements`) REFERENCES `elements` (`id_elements`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_element_data_element_data_types1` FOREIGN KEY (`fk_id_element_data_types`) REFERENCES `element_data_types` (`id_element_data_types`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_element_data_languages1` FOREIGN KEY (`fk_id_languages`) REFERENCES `languages` (`id_languages`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `element_data`
--

LOCK TABLES `element_data` WRITE;
/*!40000 ALTER TABLE `element_data` DISABLE KEYS */;
INSERT INTO `element_data` VALUES (41,3,25,NULL,'container'),(42,3,26,NULL,'row'),(43,3,27,NULL,'span12'),(65,2,31,NULL,'/assets/img/bewerbungsbild-01.jpg'),(68,2,34,NULL,'/assets/img/hochzeitsfoto-01.jpg'),(71,2,32,NULL,'/assets/img/familienportrait-01.jpg'),(73,2,38,NULL,'/assets/img/fotoshooting-01.jpg'),(77,2,39,NULL,'/assets/img/babyfoto-01.jpg'),(78,2,40,NULL,'/assets/img/kinderfoto-01.jpg'),(79,2,41,NULL,'/assets/img/portrait-01.jpg'),(83,1,28,NULL,'Photographie ist für uns mehr, als auf den Auslöser zu drücken.'),(84,1,52,NULL,'Photographie ist für uns mehr, als auf den Auslöser zu drücken.'),(85,1,58,NULL,'Photographie ist für uns mehr, als auf den Auslöser zu drücken.'),(86,1,55,NULL,'Photographie ist für uns mehr, als auf den Auslöser zu drücken.'),(87,1,61,NULL,'Photographie ist für uns mehr, als auf den Auslöser zu drücken.'),(92,5,63,NULL,'Kategorien'),(93,5,64,NULL,'Kategorien'),(122,4,70,NULL,'Vorbereitung / Getting ready'),(123,6,70,NULL,'#'),(126,4,71,NULL,'Hochzeitszeremonie'),(127,6,71,NULL,'#'),(128,4,72,NULL,'Brautpaarshooting'),(129,6,72,NULL,'#'),(132,4,73,NULL,'Festlichkeiten'),(133,6,73,NULL,'#'),(134,4,74,NULL,'Standesamtliche Trauung'),(135,6,74,NULL,'#'),(136,4,75,NULL,'Quadrokopter Luftaufnahmen aus der Vogelperspektive'),(137,6,75,NULL,'#'),(138,4,76,NULL,'Zusatzleistungen'),(139,6,76,NULL,'#'),(142,5,69,NULL,'Kategorien'),(143,4,77,NULL,'Location und Themen'),(144,6,77,NULL,'#'),(147,4,78,NULL,'Studie'),(148,6,78,NULL,'#'),(152,2,66,NULL,'/assets/img/Brautpaarshooting.jpg'),(153,4,66,NULL,'Unser eingespieltes Team begleitet Sie gerne an Ihrem Hochzeitstag und hält alle einmaligen Augenblicke, Höhepunkte und Emotionen für immer auf Foto fest! Beginnend mit den morgendlichen Hochzeitsvorbereitungen zu Hause, über die standesamtliche oder kirchliche Trauung, bis hin zum Abendessen und der Party.\r\nAlles ganz nach Ihren Wünschen!'),(154,5,66,NULL,'Hochzeitsfotografie - Ihr schönster Tag in Bildern'),(155,2,67,NULL,'/assets/img/Kirchliche_Trauung.jpg'),(156,4,67,NULL,'Für angenehme Erinnerungen muss man im Voraus sorgen - sagte einst Paul Hörbiger.\r\n\r\nDer Film als ein Ausdruck der Kunst, wird als eine Abfolge von bewegten Bildern geschaffen.\r\n\r\nBieten Sie Ihren Kindern die Möglichkeit an Ihrem größten Momment teil zu nehmen. Denn, neben\r\nder Eigentschaft der Dokumentation bietet sich der Freiraum für allerlei künstlerische Spielerrei.\r\n\r\nOb klassische Lovestory oder ein ausgefallenes Drehbuch, wir stehen Ihnen hierbei mit Rat und Tat zur Seite. Oder \r\nwollen Sie vielleicht den Heiratsantrag festhalten? Es sind Ihnen keine Grenzen gesetzt.\r\n\r\nFilm ab!!'),(157,5,67,NULL,'Hochzeitsvideo - Sei innovativ, sei anders!'),(158,4,82,NULL,'Basisanforderungen an ein biometrisches Passbild'),(159,6,82,NULL,''),(160,4,83,NULL,'Analyse des biometrischen Passbildes'),(161,6,83,NULL,''),(162,4,84,NULL,'Sonderanforderungen für US-Passbilder'),(163,6,84,NULL,''),(164,4,85,NULL,'Informationen rund um den Schwerbehinderten-Ausweis'),(165,6,85,NULL,''),(166,5,81,NULL,'Kategorien'),(173,2,79,NULL,''),(174,4,79,NULL,'Seit November 2010 ist die Nutzung eines biometrischen Passbildes bei der\r\nErstellung von Ausweisdokumenten, in Deutschland Pflicht. In Kombination\r\nmit einem RFID-Chip entsteht so der elektronische Reisepass, kurz e-Pass,\r\nwelcher eine automatisierte Analyse ermöglicht.Theoretisch ist die Anfertigung der Bilder auch privat oder in der Fotokabine möglich-doch aus unserer Erfahrung heraus werden die so entstandenen Aufnahmen meist abgelehnt da die Einhaltung der Kriterien sehr streng überwacht wird..Deshalb sparen Sie sich den Aufwand und kommen Sie gleich zu uns! Die 10 Minuten sind wohl investiert)'),(175,5,79,NULL,'Biometrische Passbild'),(176,2,62,NULL,'/assets/img/bewerbungsbild-01.jpg'),(177,4,62,NULL,'Der erste visuelle Eindruck den der potenzielle neue Arbeitgeber von einem erhält ist der, welcher durch das Bewerbungsfoto kommuniziert wird. Und wer kennt nicht die Aussage: \"Für den ersten Eindruck gibt es keine zweite Chance!\" Dies mag zumindest teilweise etwas hochgestochen sein, doch das Unterbewusstsein des Menschen agiert nach gewissen Regeln, was die Entwicklung der Sympathie angeht. Verbessern Sie ihre Chancen durch ein hochwertiges Bewerbungsbild, wir beraten Sie hierbei gerne.'),(178,5,62,NULL,'Bewerbungsbild'),(183,4,65,NULL,'Deckblatt'),(184,6,65,NULL,'#'),(185,4,87,NULL,'Formelle Regeln für das Bewerbungsbild'),(186,6,87,NULL,'#'),(187,4,86,NULL,'Tipps für ein gelungenes Bewerbungsfoto'),(188,6,86,NULL,'#');
/*!40000 ALTER TABLE `element_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `element_data_types`
--

DROP TABLE IF EXISTS `element_data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `element_data_types` (
  `id_element_data_types` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id_element_data_types`),
  UNIQUE KEY `id_element_data_types_UNIQUE` (`id_element_data_types`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `element_data_types`
--

LOCK TABLES `element_data_types` WRITE;
/*!40000 ALTER TABLE `element_data_types` DISABLE KEYS */;
INSERT INTO `element_data_types` VALUES (3,'class'),(1,'content'),(6,'href'),(2,'src'),(4,'text'),(5,'title');
/*!40000 ALTER TABLE `element_data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `element_types`
--

DROP TABLE IF EXISTS `element_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `element_types` (
  `id_element_types` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(64) NOT NULL,
  `template` varchar(64) NOT NULL,
  `is_page` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id_element_types`),
  UNIQUE KEY `idelement_types_UNIQUE` (`id_element_types`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `element_types`
--

LOCK TABLES `element_types` WRITE;
/*!40000 ALTER TABLE `element_types` DISABLE KEYS */;
INSERT INTO `element_types` VALUES (1,'default','default.tpl',''),(2,'menu','menu.tpl','\0'),(3,'footer','footer.tpl','\0'),(4,'container','container.tpl','\0'),(5,'row_black','row_black.tpl','\0'),(6,'row_black_wood','row_black_wood.tpl','\0'),(7,'slider','slider.tpl','\0'),(8,'slider_image','slider_image.tpl','\0'),(9,'article','article.tpl','\0'),(10,'div','div.tpl','\0'),(11,'root','root.tpl','\0'),(12,'blog_entry','blog_entry.tpl','\0'),(13,'blog_content','blog_content.tpl','\0'),(14,'blog_categories','blog_categories.tpl','\0'),(15,'blog_category_entry','blog_category_entry.tpl','\0'),(16,'blog_category_group','blog_category_group.tpl','\0');
/*!40000 ALTER TABLE `element_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `element_types_has_element_data_types`
--

DROP TABLE IF EXISTS `element_types_has_element_data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `element_types_has_element_data_types` (
  `fk_id_element_types` int(10) unsigned NOT NULL,
  `fk_id_element_data_types` int(10) unsigned NOT NULL,
  PRIMARY KEY (`fk_id_element_types`,`fk_id_element_data_types`),
  KEY `fk_element_types_has_element_data_types_element_data_types1_idx` (`fk_id_element_data_types`),
  KEY `fk_element_types_has_element_data_types_element_types1_idx` (`fk_id_element_types`),
  CONSTRAINT `fk_element_types_has_element_data_types_element_data_types1` FOREIGN KEY (`fk_id_element_data_types`) REFERENCES `element_data_types` (`id_element_data_types`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_element_types_has_element_data_types_element_types1` FOREIGN KEY (`fk_id_element_types`) REFERENCES `element_types` (`id_element_types`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `element_types_has_element_data_types`
--

LOCK TABLES `element_types_has_element_data_types` WRITE;
/*!40000 ALTER TABLE `element_types_has_element_data_types` DISABLE KEYS */;
INSERT INTO `element_types_has_element_data_types` VALUES (3,1),(8,2),(9,2),(12,2),(10,3),(9,4),(12,4),(15,4),(9,5),(12,5),(16,5),(15,6);
/*!40000 ALTER TABLE `element_types_has_element_data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id_elements` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_id_element_types` int(10) unsigned NOT NULL,
  `fk_id_parent_element` int(10) unsigned DEFAULT NULL,
  `ordinal` int(10) unsigned DEFAULT NULL,
  `position` int(10) unsigned DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id_elements`),
  UNIQUE KEY `idelements_UNIQUE` (`id_elements`),
  KEY `fk_elements_element_types_idx` (`fk_id_element_types`),
  KEY `fk_elements_elements1_idx` (`fk_id_parent_element`),
  CONSTRAINT `fk_elements_element_types` FOREIGN KEY (`fk_id_element_types`) REFERENCES `element_types` (`id_element_types`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_elements_elements1` FOREIGN KEY (`fk_id_parent_element`) REFERENCES `elements` (`id_elements`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
INSERT INTO `elements` VALUES (1,11,NULL,0,0,'root'),(23,1,1,0,0,'About'),(24,2,23,0,0,'menu'),(25,10,23,0,1,'container'),(26,10,25,0,0,'row'),(27,10,26,0,0,'span12'),(28,3,23,0,2,'footer'),(29,7,27,0,0,'slider'),(31,8,29,1,0,'bewerbungsbild'),(32,8,29,2,0,'familienportrait'),(34,8,29,0,0,'hochzeitsfoto'),(38,8,29,4,0,'fotoshooting'),(39,8,29,5,0,'babyfoto'),(40,8,29,3,0,'kinderfoto'),(41,8,29,6,0,'portrait asdf'),(42,1,1,1,0,'Service'),(43,1,1,2,0,'Aktuelles'),(44,1,1,3,0,'Kontakt'),(46,1,42,0,0,'Bewerbungsbilder'),(47,1,42,1,0,'Passfotos'),(48,1,42,2,0,'Hochzeiten'),(49,1,42,3,0,'Kinder und Familie'),(50,2,46,0,0,'menu'),(51,13,46,0,1,'content'),(52,3,46,0,2,'footer'),(53,2,48,0,0,'menu'),(54,13,48,0,1,'content'),(55,3,48,0,2,'footer'),(56,2,47,0,0,'menu'),(57,13,47,0,1,'content'),(58,3,47,0,2,'footer'),(59,2,49,0,0,'menu'),(60,13,49,0,1,'content'),(61,3,49,0,2,'footer'),(62,12,51,0,0,'Bewerbungsbild'),(63,14,51,0,1,'Kategorien'),(64,16,63,0,0,'Kategorien - Gruppe'),(65,15,64,2,0,'Deckblatt'),(66,12,54,0,0,'Hochzeitsfotografie - Ihr schönster Tag in Bildern'),(67,12,54,1,0,'Hochzeitsvideo - Sei innovativ, sei anders!'),(68,14,54,0,1,'Kategorien'),(69,16,68,0,0,'Kategorien - Gruppe'),(70,15,69,0,0,'Vorbereitung / Getting ready'),(71,15,69,1,0,'Hochzeitszeremonie'),(72,15,69,2,0,'Brautpaarshooting'),(73,15,69,3,0,'Festlichkeiten'),(74,15,69,4,0,'Standesamtliche Trauung'),(75,15,69,5,0,'Quadrokopter Luftaufnahmen aus der Vogelperspektive'),(76,15,69,6,0,'Zusatzleistungen'),(77,15,69,7,0,'Location und Themen'),(78,15,69,7,0,'Studie'),(79,12,57,0,0,'Biometrische Passbild'),(80,14,57,0,1,'Kategorien'),(81,16,80,0,0,'Kategorien - Gruppe'),(82,15,81,0,0,'Basisanforderungen an ein biometrisches Passbild'),(83,15,81,1,0,'Analyse des biometrischen Passbildes'),(84,15,81,2,0,'Sonderanforderungen für US-Passbilder'),(85,15,81,3,0,'Informationen rund um den Schwerbehinderten-Ausweis'),(86,15,64,0,0,'Tipps für ein gelungenes Bewerbungsfoto'),(87,15,64,1,0,'Formelle Regeln für das Bewerbungsbild');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `id_languages` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(2) NOT NULL,
  PRIMARY KEY (`id_languages`),
  UNIQUE KEY `id_languages_UNIQUE` (`id_languages`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layouts`
--

DROP TABLE IF EXISTS `layouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `layouts` (
  `id_layouts` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_layouts`),
  UNIQUE KEY `idlayouts_UNIQUE` (`id_layouts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layouts`
--

LOCK TABLES `layouts` WRITE;
/*!40000 ALTER TABLE `layouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `layouts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-09-22 16:39:55
