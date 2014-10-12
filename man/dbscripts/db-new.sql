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
) ENGINE=InnoDB AUTO_INCREMENT=479 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `element_data`
--

LOCK TABLES `element_data` WRITE;
/*!40000 ALTER TABLE `element_data` DISABLE KEYS */;
INSERT INTO `element_data` VALUES (41,3,25,NULL,'container'),(65,2,31,NULL,'/assets/img/bewerbungsbild-01.jpg'),(68,2,34,NULL,'/assets/img/hochzeitsfoto-01.jpg'),(71,2,32,NULL,'/assets/img/familienportrait-01.jpg'),(73,2,38,NULL,'/assets/img/fotoshooting-01.jpg'),(77,2,39,NULL,'/assets/img/babyfoto-01.jpg'),(78,2,40,NULL,'/assets/img/kinderfoto-01.jpg'),(79,2,41,NULL,'/assets/img/portrait-01.jpg'),(83,1,28,NULL,'Photographie ist für uns mehr, als auf den Auslöser zu drücken.'),(84,1,52,NULL,'Photographie ist für uns mehr, als auf den Auslöser zu drücken.'),(85,1,58,NULL,'Photographie ist für uns mehr, als auf den Auslöser zu drücken.'),(86,1,55,NULL,'Photographie ist für uns mehr, als auf den Auslöser zu drücken.'),(87,1,61,NULL,'Photographie ist für uns mehr, als auf den Auslöser zu drücken.'),(92,5,63,NULL,'Kategorien'),(93,5,64,NULL,'Kategorien'),(122,4,70,NULL,'Vorbereitung / Getting ready'),(123,6,70,NULL,'#'),(126,4,71,NULL,'Hochzeitszeremonie'),(127,6,71,NULL,'#'),(128,4,72,NULL,'Brautpaarshooting'),(129,6,72,NULL,'#'),(132,4,73,NULL,'Festlichkeiten'),(133,6,73,NULL,'#'),(134,4,74,NULL,'Standesamtliche Trauung'),(135,6,74,NULL,'#'),(136,4,75,NULL,'Quadrokopter Luftaufnahmen aus der Vogelperspektive'),(137,6,75,NULL,'#'),(138,4,76,NULL,'Zusatzleistungen'),(139,6,76,NULL,'#'),(142,5,69,NULL,'Kategorien'),(143,4,77,NULL,'Location und Themen'),(144,6,77,NULL,'#'),(147,4,78,NULL,'Studie'),(148,6,78,NULL,'#'),(152,2,66,NULL,'/assets/img/Brautpaarshooting.jpg'),(153,4,66,NULL,'Unser eingespieltes Team begleitet Sie gerne an Ihrem Hochzeitstag und hält alle einmaligen Augenblicke, Höhepunkte und Emotionen für immer auf Foto fest! Beginnend mit den morgendlichen Hochzeitsvorbereitungen zu Hause, über die standesamtliche oder kirchliche Trauung, bis hin zum Abendessen und der Party.\r\nAlles ganz nach Ihren Wünschen!'),(154,5,66,NULL,'Hochzeitsfotografie - Ihr schönster Tag in Bildern'),(155,2,67,NULL,'/assets/img/Kirchliche_Trauung.jpg'),(156,4,67,NULL,'Für angenehme Erinnerungen muss man im Voraus sorgen - sagte einst Paul Hörbiger.\r\n\r\nDer Film als ein Ausdruck der Kunst, wird als eine Abfolge von bewegten Bildern geschaffen.\r\n\r\nBieten Sie Ihren Kindern die Möglichkeit an Ihrem größten Momment teil zu nehmen. Denn, neben\r\nder Eigentschaft der Dokumentation bietet sich der Freiraum für allerlei künstlerische Spielerrei.\r\n\r\nOb klassische Lovestory oder ein ausgefallenes Drehbuch, wir stehen Ihnen hierbei mit Rat und Tat zur Seite. Oder \r\nwollen Sie vielleicht den Heiratsantrag festhalten? Es sind Ihnen keine Grenzen gesetzt.\r\n\r\nFilm ab!!'),(157,5,67,NULL,'Hochzeitsvideo - Sei innovativ, sei anders!'),(158,4,82,NULL,'Basisanforderungen an ein biometrisches Passbild'),(159,6,82,NULL,''),(160,4,83,NULL,'Analyse des biometrischen Passbildes'),(161,6,83,NULL,''),(162,4,84,NULL,'Sonderanforderungen für US-Passbilder'),(163,6,84,NULL,''),(164,4,85,NULL,'Informationen rund um den Schwerbehinderten-Ausweis'),(165,6,85,NULL,''),(166,5,81,NULL,'Kategorien'),(176,2,62,NULL,'/assets/img/bewerbungsbild-01.jpg'),(177,4,62,NULL,'Der erste visuelle Eindruck den der potenzielle neue Arbeitgeber von einem erhält ist der, welcher durch das Bewerbungsfoto kommuniziert wird. Und wer kennt nicht die Aussage: \"Für den ersten Eindruck gibt es keine zweite Chance!\" Dies mag zumindest teilweise etwas hochgestochen sein, doch das Unterbewusstsein des Menschen agiert nach gewissen Regeln, was die Entwicklung der Sympathie angeht. Verbessern Sie ihre Chancen durch ein hochwertiges Bewerbungsbild, wir beraten Sie hierbei gerne.'),(178,5,62,NULL,'Bewerbungsbild'),(189,3,26,NULL,'row'),(234,3,88,NULL,'row'),(235,3,27,NULL,'span12'),(236,4,94,NULL,'Willkommen bei der Creative Media Lounge Magstadt. Ein kompetentes Team ausgewählter Fachkräfte steht für Sie bereit um Ihren Anforderungen gerecht zu werden. Bei der Erstellung dieser Webseite haben wir bewusst ein schlichtes, und gut handhabares Design gewählt. Selbstverständlich sind wir gegenüber konstruktiver Kritik aufgeschlossen um eine stetige Verbesserung unserer Leistungen zu erzielen.\r\n'),(237,5,94,NULL,'Willkommen!'),(238,3,95,NULL,'row'),(269,2,97,NULL,'/assets/img/hochzeitsfilm.jpg'),(270,4,97,NULL,'Ob klassische Lovestory oder ein ausgefallenes Drehbuch, wir stehen Ihnen hierbei mit Rat und Tat zur Seite. Oder \r\nwollen Sie vielleicht den Heiratsantrag festhalten? Es sind Ihnen keine Grenzen gesetzt.\r\nFilm ab!!'),(271,5,97,NULL,'Hochzeitsfilm'),(272,6,97,NULL,'#'),(273,7,97,NULL,''),(274,8,97,NULL,'mehr...'),(275,2,98,NULL,'/assets/img/imagefilm.jpg'),(276,4,98,NULL,'Sie sind ein erfolgreicher Unternehmer und möchten Ihre Arbeit präsentieren?\r\nWir stehen Ihnen bei diesem Unterfangen kompetent zur Seite.'),(277,5,98,NULL,'Imagefilm'),(278,6,98,NULL,'#'),(279,7,98,NULL,''),(280,8,98,NULL,'mehr...'),(281,2,99,NULL,'/assets/img/taufe.jpg'),(282,4,99,NULL,'Es gibt wenige besondere Momente in einem Menschenleben die es wert sind, für ewig in Erinnerung zu bleiben. Die Taufe Ihres Kindes gehört zweifellos dazu. Damit Sie diese Momente immer wieder durchleben können sind wir für Sie da.'),(283,5,99,NULL,'Taufe'),(284,6,99,NULL,'#'),(285,7,99,NULL,''),(286,8,99,NULL,'mehr...'),(287,2,100,NULL,'/assets/img/luftaufnahmen.jpg'),(288,4,100,NULL,'Ohne Wackler ist es möglich Luftaufnahmen zu erstellen die sonst nur mit einem Helikopter erstellt werden könnten. Ein weiterer Vorteil dieser Technologie liegt in der Sicherheit der Drohne; Kleinere Kollisionen besteht diese problemlos.'),(289,5,100,NULL,'Luftaufnahmen'),(290,6,100,NULL,'#'),(291,7,100,NULL,''),(292,8,100,NULL,'mehr...'),(299,5,105,NULL,'Kategorien'),(321,2,102,NULL,'/assets/img/kinderfotografie.jpg'),(322,4,102,NULL,'Bezaubernde Babyfotos, Kinderfotos oder ein gelungenes Familienportrait sind immer eine unvergessliche Erinnerung sowie ein persönliches Geschenk für Eltern oder Großeltern. Wir fotografieren Sie und Ihr Kind ohne Hektik und in aller Ruhe. Wir haben das \"richtige\" Licht und die Möglichkeiten für schön gestaltete Aufnahmen.\r\nUnd der Termin?\r\nWir richten uns ganz nach Ihnen und dem Wohlbefinden Ihres Kindes. Sie kennen am besten die richtige Zeit. '),(323,5,102,NULL,'Baby-, Kinder- und Familienfotos'),(324,4,106,NULL,'Neugeborene & Babyfotos'),(325,6,106,NULL,'#'),(326,4,107,NULL,'Kinder'),(327,6,107,NULL,'#'),(328,4,108,NULL,'Familienfotos'),(329,6,108,NULL,'#'),(330,4,109,NULL,'Schwangerschaftsbilder'),(331,6,109,NULL,'#'),(332,2,79,NULL,'/assets/img/passbild.jpg'),(333,4,79,NULL,'Seit November 2010 ist die Nutzung eines biometrischen Passbildes bei der\r\nErstellung von Ausweisdokumenten, in Deutschland Pflicht. In Kombination\r\nmit einem RFID-Chip entsteht so der elektronische Reisepass, kurz e-Pass,\r\nwelcher eine automatisierte Analyse ermöglicht.Theoretisch ist die Anfertigung der Bilder auch privat oder in der Fotokabine möglich-doch aus unserer Erfahrung heraus werden die so entstandenen Aufnahmen meist abgelehnt da die Einhaltung der Kriterien sehr streng überwacht wird..Deshalb sparen Sie sich den Aufwand und kommen Sie gleich zu uns! Die 10 Minuten sind wohl investiert)'),(334,5,79,NULL,'Biometrische Passbild'),(341,2,90,NULL,'/assets/img/hochzeitsfotografie.jpg'),(342,4,90,NULL,'Unser eingespieltes Team begleitet Sie über den ganzen Tag, und hält alle einmalige Momente für Sie fest.'),(343,5,90,NULL,'Hochzeit'),(344,6,90,NULL,'/app/rendercontroller?id=48'),(345,7,90,NULL,'Ihr schönster Tag in Bildern!'),(346,8,90,NULL,'mehr...'),(347,2,91,NULL,'/assets/img/bewerbungsbild.jpg'),(348,4,91,NULL,'Wir beraten Sie ausfühlich von der Kleiderfrage bis hin zum Bildauschnitt.'),(349,5,91,NULL,'Bewerbung'),(350,6,91,NULL,'/app/rendercontroller?id=46'),(351,7,91,NULL,'Für den ersten Eindruck gibt es keine Zweite Chance!'),(352,8,91,NULL,'mehr...'),(353,2,92,NULL,'/assets/img/kinderportrait.jpg'),(354,4,92,NULL,'Bezaubernde Babyfotos und gelungene Familienportraits erlauben es Ihnen den Augenblick für die Ewigkeit festzuhalten!'),(355,5,92,NULL,'Kinder & Familie'),(356,6,92,NULL,'/app/rendercontroller?id=49'),(357,7,92,NULL,'Babies - Kinder - Familie'),(358,8,92,NULL,'mehr...'),(361,4,115,NULL,'Best Friends Shooting'),(362,6,115,NULL,'#'),(372,5,120,NULL,'Kategorien'),(373,5,121,NULL,'Kategorien'),(380,1,125,NULL,'Photographie ist für uns mehr, als auf den Auslöser zu drücken.'),(384,2,93,NULL,'/assets/img/portrait.jpg'),(385,4,93,NULL,'Ein geschmackvolles Portrait ist das ideale Geschenk für Ihren Liebsten.'),(386,5,93,NULL,'Portrait'),(387,6,93,NULL,'/app/rendercontroller?id=116'),(388,7,93,NULL,'Zeigen Sie sich von Ihrer besten Seite!!'),(389,8,93,NULL,'mehr...'),(393,2,119,NULL,'/assets/img/portraitbild.jpg'),(394,4,119,NULL,'Ein Portrait ist das ideale Geschenk für den Partner oder die Partnerin, für die Eltern und Großeltern oder für Sie ganz persönlich. Wir von Creative Media Lounge haben die Erfahrung und den Geschmack, Sie von Ihrer besten Seite zu zeigen! \r\nEs muss nicht immer im Studio sein ... gerne fotografieren wir Sie auch im Freien, bei Ihnen zuhause, wo immer Sie es wünschen! Zur Terminvereinbarung genügt ein kurzer Anruf!'),(395,5,119,NULL,'Portrait'),(396,4,122,NULL,'Tipps für ein gelungenes Fotoshooting'),(397,6,122,NULL,'#'),(403,5,130,NULL,'Kategorien'),(404,5,131,NULL,'Kategorien'),(411,1,135,NULL,'Photographie ist für uns mehr, als auf den Auslöser zu drücken.'),(417,2,129,NULL,''),(418,4,129,NULL,'Das optimale Bewerbungsbild zu erstellen ist keine Hexerei, solange man sich hierbei in erfahrene Hände begibt. Seit der Einführung des Antidiskriminierungsgesetzes (ADG) ist das Bewerbungsfoto zwar kein Pflichtbestandteil der Bewerbung, aber sollte dennoch beigefügt werden. Elementar wichtig für den Erfolg eines Business- oder auch Karrierefotos  ist sowohl die Aktualität  als auch ein gepflegtes und repräsentatives Auftreten, welches passend zu der entsprechenden Stelle ist. Somit ist neben einer positiven Ausstrahlung, die bspw. durch ein Lächeln unterbewusst verstärkt werden kann, ein angemessenes Outfit. Letztlich ist es empfehlenswert etwas herumzuexperimentieren und diverse Posen auszuprobieren.'),(419,5,129,NULL,'Tipps für ein gelungenes Bewerbungsfoto'),(423,5,140,NULL,'Kategorien'),(424,5,141,NULL,'Kategorien'),(431,1,145,NULL,'Photographie ist für uns mehr, als auf den Auslöser zu drücken.'),(435,5,150,NULL,'Kategorien'),(436,5,151,NULL,'Kategorien'),(443,1,155,NULL,'Photographie ist für uns mehr, als auf den Auslöser zu drücken.'),(444,4,132,NULL,'Tipps für ein gelungenes Bewerbungsfoto'),(445,6,132,NULL,'/app/rendercontroller?id=126'),(446,4,133,NULL,'Formelle Regeln für das Bewerbungsbild'),(447,6,133,NULL,'/app/rendercontroller?id=136'),(448,4,134,NULL,'Deckblatt'),(449,6,134,NULL,'/app/rendercontroller?id=146'),(450,4,142,NULL,'Tipps für ein gelungenes Bewerbungsfoto'),(451,6,142,NULL,'/app/rendercontroller?id=126'),(452,4,143,NULL,'Formelle Regeln für das Bewerbungsbild'),(453,6,143,NULL,'/app/rendercontroller?id=136'),(454,4,144,NULL,'Deckblatt'),(455,6,144,NULL,'/app/rendercontroller?id=146'),(456,4,152,NULL,'Tipps für ein gelungenes Bewerbungsfoto'),(457,6,152,NULL,'/app/rendercontroller?id=126'),(458,4,153,NULL,'Formelle Regeln für das Bewerbungsbild'),(459,6,153,NULL,'/app/rendercontroller?id=136'),(460,4,154,NULL,'Deckblatt'),(461,6,154,NULL,'/app/rendercontroller?id=146'),(462,4,86,NULL,'Tipps für ein gelungenes Bewerbungsfoto'),(463,6,86,NULL,'/app/rendercontroller?id=126'),(464,4,87,NULL,'Formelle Regeln für das Bewerbungsbild'),(465,6,87,NULL,'/app/rendercontroller?id=136'),(466,4,65,NULL,'Deckblatt'),(467,6,65,NULL,'/app/rendercontroller?id=146'),(471,2,139,NULL,''),(472,4,139,NULL,'Es existieren 5 Kriterien die bei der Erstellung eines Bewerbungsfotos zu beachten gilt. Im weiteren Verlauf greifen wir diese Punkte stichwortartig auf:<br />\r\n<br />\r\nDie Qualität des Bewerbungsfotos: Gewisse Dinge sollten selbstverständlich sein; Trotzdem kommt es leider immer wieder vor das einige Bewerber ihre Fotos an Automaten oder sonstigen unkonventionellen Orten fertigen. Diese Art von Geiz ist äußerst unvorteilhaft, da der Bewerber sich dadurch ein billiges Image aufbürdet. Niemals sollten Ganzkörperaufnahmen erstellt werden; Ausschließlich Portraitfotos sind für Bewerbungen geeignet.\r\n<br /><br />\r\nDie Größe der Bewerbungsbilder: \r\n<br />\r\nDie heute gängigen Formate bei Bewerbungsbildern sind 6 x 4 cm  und 9 x 6 cm; Sie entsprechen als beide in Ihren Analogien dem „Goldenen Schnitt“ und wirken so besonders ästhetisch. Die Farbe der Bewerbungsfotos: Ob schwarz-weiß oder farbig- bezogen auf diesen Aspekt des „Karrierefotos“ herrscht volle Kulanz; Der Vorteil bei einem monochromen Foto, ist die Quinte von Eleganz, welche dieses zweifellos hinzuaddiert. Negativ ins Gewicht hingegen, fällt die Betonung der Gesichtskonturen, im Falle von markanten Zügen. Diese Farbwahl schmeichelt nur ebenen Gesichtern. Zudem gilt es  die Kleiderwahl bei der farbigen Variante zu beachten. Das Ensemble muss einen gesamtharmonischen Eindruck hinterlassen. Die intelligenteste Lösung liegt wahrscheinlich in einer Anfertigung beider Varianten und der anschließenden Auswahl.\r\n<br /><br />\r\nDie Position des Bewerbungsfotos: \r\n<br />\r\nHier gilt die Faustregel: Immer in die Seite schauen nie heraus! Bei einer Integration \r\nin die Bewerbungsmappe sollte es präferiert werden, das Foto auf der ersten Seite des Lebenslaufes einzufügen.\r\n<br /><br />\r\nBefestigung des Bewerbungsbildes: \r\n<br />\r\nHier gilt kleben, niemals Büroklammern verwenden! Das wirkt einerseits unästhetisch aus, und anderseits signalisiert  eine Wiederverwendung des Bildes das Image des Massenproduktes und der Ersetzbarkeit. Bei einer digitalen Integration sollte auf zwei Kriterien geachtet werden: Eine hohe Auflösung verwenden und hochwertiges Papier!\r\n<br />\r\nDer erste visuelle Eindruck den der potenzielle neue Arbeitgeber von einem erhält ist der, welcher durch das Bewerbungsfoto kommuniziert wird. Und wer kennt nicht die Aussage: \"Für den ersten Eindruck gibt es keine zweite Chance!\" Dies mag zumindest teilweise etwas hochgestochen sein, doch das Unterbewusstsein des Menschen aggiert nach gewissen Regeln, was die Entwicklung der Sympathie angeht. Verbessern Sie ihre Chancen durch ein hochwertiges Bewerbungsbild, wir beraten Sie hierbei gerne.. '),(473,5,139,NULL,'Formelle Regeln für das Bewerbungsbild'),(474,2,149,NULL,''),(475,4,149,NULL,''),(476,5,149,NULL,'Deckblatt'),(477,4,123,NULL,'Outdoor Shooting'),(478,6,123,NULL,'#');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `element_data_types`
--

LOCK TABLES `element_data_types` WRITE;
/*!40000 ALTER TABLE `element_data_types` DISABLE KEYS */;
INSERT INTO `element_data_types` VALUES (8,'button'),(3,'class'),(1,'content'),(6,'href'),(2,'src'),(9,'startpage'),(7,'subtitle'),(4,'text'),(5,'title');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `element_types`
--

LOCK TABLES `element_types` WRITE;
/*!40000 ALTER TABLE `element_types` DISABLE KEYS */;
INSERT INTO `element_types` VALUES (1,'default','default.tpl',''),(2,'menu','menu.tpl','\0'),(3,'footer','footer.tpl','\0'),(4,'container','container.tpl','\0'),(5,'row_black','row_black.tpl','\0'),(6,'row_black_wood','row_black_wood.tpl','\0'),(7,'slider','slider.tpl','\0'),(8,'slider_image','slider_image.tpl','\0'),(9,'article','article.tpl','\0'),(10,'div','div.tpl','\0'),(11,'root','root.tpl',''),(12,'blog_entry','blog_entry.tpl','\0'),(13,'blog_content','blog_content.tpl','\0'),(14,'blog_categories','blog_categories.tpl','\0'),(15,'blog_category_entry','blog_category_entry.tpl','\0'),(16,'blog_category_group','blog_category_group.tpl','\0'),(17,'thumbnails','thumbnails.tpl','\0'),(18,'thumbnail-elem','thumbnail-elem.tpl','\0'),(19,'welcome','welcome.tpl','\0');
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
INSERT INTO `element_types_has_element_data_types` VALUES (3,1),(8,2),(9,2),(12,2),(18,2),(10,3),(9,4),(12,4),(15,4),(18,4),(19,4),(9,5),(12,5),(16,5),(18,5),(19,5),(15,6),(18,6),(18,7),(18,8),(11,9);
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
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
INSERT INTO `elements` VALUES (1,11,NULL,0,0,'root'),(23,1,1,0,0,'About'),(24,2,23,0,0,'menu'),(25,10,23,0,1,'container'),(26,10,25,0,0,'row - slider & welcome'),(27,10,26,0,0,'span12'),(28,3,23,0,2,'footer'),(29,7,27,0,0,'slider'),(31,8,29,1,0,'bewerbungsbild'),(32,8,29,2,0,'familienportrait'),(34,8,29,0,0,'hochzeitsfoto'),(38,8,29,4,0,'fotoshooting'),(39,8,29,5,0,'babyfoto'),(40,8,29,3,0,'kinderfoto'),(41,8,29,6,0,'portrait asdf'),(42,1,1,1,0,'Service'),(43,1,1,2,0,'Aktuelles'),(44,1,1,3,0,'Kontakt'),(46,1,42,0,0,'Bewerbungsbilder'),(47,1,42,1,0,'Passfotos'),(48,1,42,2,0,'Hochzeiten'),(49,1,42,3,0,'Kinder und Familie'),(50,2,46,0,0,'menu'),(51,13,46,0,1,'content'),(52,3,46,0,2,'footer'),(53,2,48,0,0,'menu'),(54,13,48,0,1,'content'),(55,3,48,0,2,'footer'),(56,2,47,0,0,'menu'),(57,13,47,0,1,'content'),(58,3,47,0,2,'footer'),(59,2,49,0,0,'menu'),(61,3,49,0,2,'footer'),(62,12,51,0,0,'Bewerbungsbild'),(63,14,51,0,1,'Kategorien'),(64,16,63,0,0,'Kategorien - Gruppe'),(65,15,64,2,0,'Deckblatt'),(66,12,54,0,0,'Hochzeitsfotografie - Ihr schönster Tag in Bildern'),(67,12,54,1,0,'Hochzeitsvideo - Sei innovativ, sei anders!'),(68,14,54,0,1,'Kategorien'),(69,16,68,0,0,'Kategorien - Gruppe'),(70,15,69,0,0,'Vorbereitung / Getting ready'),(71,15,69,1,0,'Hochzeitszeremonie'),(72,15,69,2,0,'Brautpaarshooting'),(73,15,69,3,0,'Festlichkeiten'),(74,15,69,4,0,'Standesamtliche Trauung'),(75,15,69,5,0,'Quadrokopter Luftaufnahmen aus der Vogelperspektive'),(76,15,69,6,0,'Zusatzleistungen'),(77,15,69,7,0,'Location und Themen'),(78,15,69,7,0,'Studie'),(79,12,57,0,0,'Biometrische Passbild'),(80,14,57,0,1,'Kategorien'),(81,16,80,0,0,'Kategorien - Gruppe'),(82,15,81,0,0,'Basisanforderungen an ein biometrisches Passbild'),(83,15,81,1,0,'Analyse des biometrischen Passbildes'),(84,15,81,2,0,'Sonderanforderungen für US-Passbilder'),(85,15,81,3,0,'Informationen rund um den Schwerbehinderten-Ausweis'),(86,15,64,0,0,'Tipps für ein gelungenes Bewerbungsfoto'),(87,15,64,1,0,'Formelle Regeln für das Bewerbungsbild'),(88,10,25,1,0,'row - thumbnails fotografie'),(89,17,88,0,0,'thumbnails'),(90,18,89,0,0,'hochzeitsfotografie'),(91,18,89,1,0,'Bewerbung'),(92,18,89,2,0,'Baby - Kinder - Familie'),(93,18,89,3,0,'Portrait'),(94,19,27,1,0,'welcome'),(95,10,25,1,0,'row - thumbnails film'),(96,17,95,0,0,'thumbnails'),(97,18,96,0,0,'hochzeitsfilm'),(98,18,96,1,0,'imagefilm'),(99,18,96,2,0,'taufe'),(100,18,96,3,0,'luftaufnahmen'),(101,13,49,0,1,'content'),(102,12,101,0,0,'Hochzeitsfotografie - Ihr schönster Tag in Bildern'),(104,14,101,0,1,'Kategorien'),(105,16,104,0,0,'Kategorien - Gruppe'),(106,15,105,0,0,'Neugeborene & Babyfotos'),(107,15,105,1,0,'Kinder'),(108,15,105,2,0,'Familienfotos'),(109,15,105,3,0,'Schwangerschaftsbilder'),(115,15,105,4,0,'Best Friends Shooting'),(116,1,42,4,1000,'Portrait'),(117,2,116,0,0,'menu'),(118,13,116,0,1,'content'),(119,12,118,0,0,'portrait'),(120,14,118,0,1,'Kategorien'),(121,16,120,0,0,'Kategorien - Gruppe'),(122,15,121,0,0,'Tipps für ein gelungenes Fotoshooting'),(123,15,121,1,0,'Outdoor Shooting'),(125,3,116,0,2,'footer'),(126,1,46,0,1000,'Bewerbungsbilder'),(127,2,126,0,0,'menu'),(128,13,126,0,1,'content'),(129,12,128,0,0,'Bewerbungsbild'),(130,14,128,0,1,'Kategorien'),(131,16,130,0,0,'Kategorien - Gruppe'),(132,15,131,0,0,'Tipps für ein gelungenes Bewerbungsfoto'),(133,15,131,1,0,'Formelle Regeln für das Bewerbungsbild'),(134,15,131,2,0,'Deckblatt'),(135,3,126,0,2,'footer'),(136,1,46,1,1000,'Bewerbungsbilder'),(137,2,136,0,0,'menu'),(138,13,136,0,1,'content'),(139,12,138,0,0,'Bewerbungsbild'),(140,14,138,0,1,'Kategorien'),(141,16,140,0,0,'Kategorien - Gruppe'),(142,15,141,0,0,'Tipps für ein gelungenes Bewerbungsfoto'),(143,15,141,1,0,'Formelle Regeln für das Bewerbungsbild'),(144,15,141,2,0,'Deckblatt'),(145,3,136,0,2,'footer'),(146,1,46,2,1000,'Bewerbungsbilder'),(147,2,146,0,0,'menu'),(148,13,146,0,1,'content'),(149,12,148,0,0,'Bewerbungsbild'),(150,14,148,0,1,'Kategorien'),(151,16,150,0,0,'Kategorien - Gruppe'),(152,15,151,0,0,'Tipps für ein gelungenes Bewerbungsfoto'),(153,15,151,1,0,'Formelle Regeln für das Bewerbungsbild'),(154,15,151,2,0,'Deckblatt'),(155,3,146,0,2,'footer');
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

-- Dump completed on 2014-09-30 11:25:46