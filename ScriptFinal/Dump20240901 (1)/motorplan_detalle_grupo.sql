-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: grupo4demo.mysql.database.azure.com    Database: motorplan
-- ------------------------------------------------------
-- Server version	8.0.37-azure

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
-- Table structure for table `detalle_grupo`
--

DROP TABLE IF EXISTS `detalle_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_grupo` (
  `id_grupo` int NOT NULL,
  `id_cliente` char(10) NOT NULL,
  `contrato` int DEFAULT NULL,
  PRIMARY KEY (`id_grupo`,`id_cliente`),
  KEY `fk_detalle_grupo_cliente` (`id_cliente`),
  KEY `contrato` (`contrato`),
  CONSTRAINT `detalle_grupo_ibfk_1` FOREIGN KEY (`contrato`) REFERENCES `contrato` (`id_contrato`),
  CONSTRAINT `fk_detalle_grupo_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`cedula`),
  CONSTRAINT `fk_detallGrupo_grupo` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id_grupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_grupo`
--

LOCK TABLES `detalle_grupo` WRITE;
/*!40000 ALTER TABLE `detalle_grupo` DISABLE KEYS */;
INSERT INTO `detalle_grupo` VALUES (6,'0205678901',5),(7,'0978546832',12),(6,'0409876543',13),(6,'0407654321',51),(6,'0912345678',52),(7,'0923456789',53),(6,'0978546832',54),(7,'0204567890',55),(7,'0409876543',56),(7,'0205678901',57);
/*!40000 ALTER TABLE `detalle_grupo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-01 23:41:36
