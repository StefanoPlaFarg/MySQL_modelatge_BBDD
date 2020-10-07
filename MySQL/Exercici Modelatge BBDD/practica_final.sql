CREATE DATABASE  IF NOT EXISTS `practica_final` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `practica_final`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: practica_final
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id_Clients` int NOT NULL,
  `nom_Clients` varchar(45) DEFAULT NULL,
  `adreca_postal_Clients` varchar(45) DEFAULT NULL,
  `telefon_Clients` int DEFAULT NULL,
  `mail_Clients` varchar(70) DEFAULT NULL,
  `data_registre_Clients` datetime DEFAULT CURRENT_TIMESTAMP,
  `recomanat_Clients` int DEFAULT NULL,
  PRIMARY KEY (`id_Clients`),
  KEY `fk_Clients_Clients1_idx` (`recomanat_Clients`),
  CONSTRAINT `fk_Clients_Clients1` FOREIGN KEY (`recomanat_Clients`) REFERENCES `clients` (`id_Clients`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Joan Garcia','Carrer Mallorca 1 1',666111111,'joangarcia@gmail.com','2020-10-07 00:07:19',1),(2,'Pau Ramirez','Carrer Valencia 2 2',622111111,'pauramirez@gmail.com','2020-10-07 00:07:19',1),(3,'Carles Mila','Carrer Tarragona 3 3',633111111,'carlesmila@gmail.com','2020-10-07 00:07:19',1);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compres`
--

DROP TABLE IF EXISTS `compres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compres` (
  `id_Compres` int NOT NULL,
  `client_Compres` int NOT NULL,
  `ullera_compres` int NOT NULL,
  `treballador_Compres` int NOT NULL,
  PRIMARY KEY (`id_Compres`),
  KEY `fk_Compra_Treballadors1_idx` (`treballador_Compres`),
  KEY `fk_Compres_Clients1_idx` (`client_Compres`),
  KEY `fk_Compres_Ulleres1_idx` (`ullera_compres`),
  CONSTRAINT `fk_Compra_Treballadors1` FOREIGN KEY (`treballador_Compres`) REFERENCES `treballadors` (`id_Treballadors`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Compres_Clients1` FOREIGN KEY (`client_Compres`) REFERENCES `clients` (`id_Clients`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Compres_Ulleres1` FOREIGN KEY (`ullera_compres`) REFERENCES `ulleres` (`id_Ulleres`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compres`
--

LOCK TABLES `compres` WRITE;
/*!40000 ALTER TABLE `compres` DISABLE KEYS */;
INSERT INTO `compres` VALUES (1,1,1,2),(2,2,2,2),(3,3,1,1);
/*!40000 ALTER TABLE `compres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marques`
--

DROP TABLE IF EXISTS `marques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marques` (
  `id_Marques` int NOT NULL,
  `nom_Marques` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_Marques`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marques`
--

LOCK TABLES `marques` WRITE;
/*!40000 ALTER TABLE `marques` DISABLE KEYS */;
INSERT INTO `marques` VALUES (1,'Oakley'),(2,'Rayban');
/*!40000 ALTER TABLE `marques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marques_proveidors`
--

DROP TABLE IF EXISTS `marques_proveidors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marques_proveidors` (
  `id_Marques_Proveidors` int NOT NULL AUTO_INCREMENT,
  `marca_Marques_Proveidors` int NOT NULL,
  `proveidor_Marques_Proveidors` int NOT NULL,
  PRIMARY KEY (`id_Marques_Proveidors`),
  UNIQUE KEY `marca_Marques_Proveidors_UNIQUE` (`marca_Marques_Proveidors`),
  KEY `fk_Marques_Proveidors_Proveidors1_idx` (`proveidor_Marques_Proveidors`),
  KEY `fk_Marques_Proveidors_Marques1_idx` (`marca_Marques_Proveidors`),
  CONSTRAINT `fk_Marques_Proveidors_Marques1` FOREIGN KEY (`marca_Marques_Proveidors`) REFERENCES `marques` (`id_Marques`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Marques_Proveidors_Proveidors1` FOREIGN KEY (`proveidor_Marques_Proveidors`) REFERENCES `proveidors` (`id_Proveidors`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marques_proveidors`
--

LOCK TABLES `marques_proveidors` WRITE;
/*!40000 ALTER TABLE `marques_proveidors` DISABLE KEYS */;
INSERT INTO `marques_proveidors` VALUES (1,1,1),(2,2,1);
/*!40000 ALTER TABLE `marques_proveidors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveidors`
--

DROP TABLE IF EXISTS `proveidors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveidors` (
  `id_Proveidors` int NOT NULL,
  `nom_Proveidors` varchar(45) DEFAULT NULL,
  `carrer_Proveidors` varchar(45) DEFAULT NULL,
  `num_Proveidors` int DEFAULT NULL,
  `pis_Proveidors` int DEFAULT NULL,
  `porta_Proveidors` varchar(12) DEFAULT NULL,
  `ciutat_Proveidors` varchar(25) DEFAULT NULL,
  `codipostal_Proveidors` int DEFAULT NULL,
  `pais_Proveidors` varchar(25) DEFAULT NULL,
  `telefon_Proveidors` int DEFAULT NULL,
  `fax_Proveidors` int DEFAULT NULL,
  `NIF_Proveidors` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id_Proveidors`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveidors`
--

LOCK TABLES `proveidors` WRITE;
/*!40000 ALTER TABLE `proveidors` DISABLE KEYS */;
INSERT INTO `proveidors` VALUES (1,'Oakley','Avinguda Roma',7,7,'7B','Barcelona',8008,'Espanya',93111111,93111112,'F1111111'),(2,'Rayban','Avinguda Girona',6,6,'6A','Barcelona',8031,'Espanya',93111122,93111123,'A2222222');
/*!40000 ALTER TABLE `proveidors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treballadors`
--

DROP TABLE IF EXISTS `treballadors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treballadors` (
  `id_Treballadors` int NOT NULL,
  `nom_Treballadors` varchar(45) DEFAULT NULL,
  `cognom_Treballadors` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_Treballadors`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treballadors`
--

LOCK TABLES `treballadors` WRITE;
/*!40000 ALTER TABLE `treballadors` DISABLE KEYS */;
INSERT INTO `treballadors` VALUES (1,'Pau','Mila'),(2,'Jordi','Llull');
/*!40000 ALTER TABLE `treballadors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ulleres`
--

DROP TABLE IF EXISTS `ulleres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ulleres` (
  `id_Ulleres` int NOT NULL AUTO_INCREMENT,
  `graduacio_esquerra_Ulleres` decimal(3,2) unsigned DEFAULT NULL,
  `graduacio_dreta_Ulleres` decimal(3,2) unsigned DEFAULT NULL,
  `muntura_Ulleres` enum('flotant','pasta','metalica') DEFAULT NULL,
  `color_muntura_Ulleres` varchar(12) DEFAULT NULL,
  `color_vidre_esquerra_Ulleres` varchar(12) DEFAULT NULL,
  `color_vidre_dret_Ulleres` varchar(12) DEFAULT NULL,
  `preu_Ulleres` decimal(6,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_Ulleres`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ulleres`
--

LOCK TABLES `ulleres` WRITE;
/*!40000 ALTER TABLE `ulleres` DISABLE KEYS */;
INSERT INTO `ulleres` VALUES (1,1.25,1.25,'flotant','vermell','translucid','translucid',183.50),(2,1.75,1.75,'flotant','blau','translucid','translucid',65.35);
/*!40000 ALTER TABLE `ulleres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ulleres_marques`
--

DROP TABLE IF EXISTS `ulleres_marques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ulleres_marques` (
  `id_Ulleres_Marques` int NOT NULL,
  `ullera_Ulleres_Marques` int NOT NULL,
  `marca_Ulleres_Marques` int NOT NULL,
  PRIMARY KEY (`id_Ulleres_Marques`),
  UNIQUE KEY `ullera_Ulleres_Marques_UNIQUE` (`ullera_Ulleres_Marques`),
  KEY `fk_Ulleres_Marques_Ulleres1_idx` (`ullera_Ulleres_Marques`),
  KEY `fk_Ulleres_Marques_Marques1_idx` (`marca_Ulleres_Marques`),
  CONSTRAINT `fk_Ulleres_Marques_Marques1` FOREIGN KEY (`marca_Ulleres_Marques`) REFERENCES `marques` (`id_Marques`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Ulleres_Marques_Ulleres1` FOREIGN KEY (`ullera_Ulleres_Marques`) REFERENCES `ulleres` (`id_Ulleres`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ulleres_marques`
--

LOCK TABLES `ulleres_marques` WRITE;
/*!40000 ALTER TABLE `ulleres_marques` DISABLE KEYS */;
INSERT INTO `ulleres_marques` VALUES (1,1,1),(2,2,1);
/*!40000 ALTER TABLE `ulleres_marques` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-07  0:18:30
