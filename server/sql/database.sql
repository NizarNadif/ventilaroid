-- MariaDB dump 10.19  Distrib 10.4.18-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: elaborato
-- ------------------------------------------------------
-- Server version	10.4.18-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dati`
--

DROP TABLE IF EXISTS `dati`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dati` (
  `id` int(11) AUTO_INCREMENT NOT NULL,
  `id_paziente` int(11) NOT NULL,
  `id_ventilatore` int(11) DEFAULT NULL,
  `orario` datetime NOT NULL,
  `saturazione_emoglobinica` float NOT NULL,
  `ossigeno_utilizzato` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dati_paziente_fk` (`id_paziente`),
  KEY `dati_ventilatore_fk` (`id_ventilatore`),
  CONSTRAINT `dati_paziente_fk` FOREIGN KEY (`id_paziente`) REFERENCES `paziente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dati_ventilatore_fk` FOREIGN KEY (`id_ventilatore`) REFERENCES `ventilatore` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dati`
--

LOCK TABLES `dati` WRITE;
/*!40000 ALTER TABLE `dati` DISABLE KEYS */;
/*!40000 ALTER TABLE `dati` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paziente`
--

DROP TABLE IF EXISTS `paziente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paziente` (
  `id` int(11) AUTO_INCREMENT NOT NULL,
  `codice_fiscale` varchar(16) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `nascita` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paziente`
--

LOCK TABLES `paziente` WRITE;
/*!40000 ALTER TABLE `paziente` DISABLE KEYS */;
INSERT INTO `paziente` VALUES (1,'RSSMRA02T05D284J','Rossi','Mario','2021-12-05');
/*!40000 ALTER TABLE `paziente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stato`
--

DROP TABLE IF EXISTS `stato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stato` (
  `id` int(11) AUTO_INCREMENT NOT NULL,
  `id_ventilatore` int(11) NOT NULL,
  `orario` datetime NOT NULL,
  `stato` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ventilatore_stato_fk` (`id_ventilatore`),
  CONSTRAINT `ventilatore_stato_fk` FOREIGN KEY (`id_ventilatore`) REFERENCES `ventilatore` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stato`
--

LOCK TABLES `stato` WRITE;
/*!40000 ALTER TABLE `stato` DISABLE KEYS */;
INSERT INTO `stato` VALUES (1,1,'2021-05-31 00:00:00','STAND BY'),(2,1,'2021-05-31 00:00:00','ACTIVATED');
/*!40000 ALTER TABLE `stato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trattamento`
--

DROP TABLE IF EXISTS `trattamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trattamento` (
  `id` int(11) AUTO_INCREMENT NOT NULL,
  `id_paziente` int(11) NOT NULL,
  `id_ventilatore` int(11) DEFAULT NULL,
  `entrata` datetime NOT NULL,
  `uscita` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trattamento_paziente_fk` (`id_paziente`),
  KEY `trattamento_ventilatore_fk` (`id_ventilatore`),
  CONSTRAINT `trattamento_paziente_fk` FOREIGN KEY (`id_paziente`) REFERENCES `paziente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trattamento_ventilatore_fk` FOREIGN KEY (`id_ventilatore`) REFERENCES `ventilatore` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trattamento`
--

LOCK TABLES `trattamento` WRITE;
/*!40000 ALTER TABLE `trattamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `trattamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventilatore`
--

DROP TABLE IF EXISTS `ventilatore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventilatore` (
  `id` int(11) AUTO_INCREMENT NOT NULL,
  `codice` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventilatore`
--

LOCK TABLES `ventilatore` WRITE;
/*!40000 ALTER TABLE `ventilatore` DISABLE KEYS */;
INSERT INTO `ventilatore` VALUES (1,'ciao'),(2,'ciaone');
/*!40000 ALTER TABLE `ventilatore` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-04 20:42:11
