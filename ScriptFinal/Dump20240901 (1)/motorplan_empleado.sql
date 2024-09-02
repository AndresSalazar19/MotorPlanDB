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
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `cedula` char(10) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `email` varchar(80) NOT NULL,
  `telefono` char(10) NOT NULL,
  `id_gerente` char(10) DEFAULT NULL,
  PRIMARY KEY (`cedula`),
  KEY `fk_empleado_gerente` (`id_gerente`),
  KEY `idx_nombre_apellido_empleado` (`apellido`(10),`nombre`(10)),
  CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`id_gerente`) REFERENCES `empleado` (`cedula`),
  CONSTRAINT `fk_empleado_gerente` FOREIGN KEY (`id_gerente`) REFERENCES `empleado` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES ('0702127117','Juan ','Guarnizo','juanGuarnizoCom@gmail.com','0987654333','0954151908'),('0704497601','Felix','Romero','ferofern@espol.edu.ec','0963184940','0704497601'),('0706543212','Pedro','Granja','pextranja@gmail.com','0983214321','0704497601'),('0709937401','Daniel','Herrera','daniher@gmail.com','0987654321','0704497601'),('0912934785','Luisa','Sanchez','lusisas18@gmail.com','0963369751','0943792739'),('0927305854','Andres','Salazar','aasalazar@espol.edu.ec','0984471745','0927305854'),('0943792739','Lladira','Suarez','ymsuarez@espol.edu.ec','0988955999','0943792739'),('0954151908','Gino','Quinde','glquin@espol.edu.ec','0989956888','0954151908'),('0989956871','Lizandro','Meza','empleado1@example.com','0989956871','0954151908'),('0989956872','Anicieto','Molina','empleado2@example.com','0989956872','0954151908'),('0989956873','Ruben','Blades','empleado3@example.com','0989956873','0954151908'),('0989956874','Pedro','Infante','empleado4@example.com','0989956874','0954151908'),('0989956875','Julian','Conrado','empleado5@example.com','0989956875','0954151908'),('0989956876','Pamela','Balladares','empleado6@example.com','0989956876','0954151908'),('0989956877','Valeria','Yepez','empleado7@example.com','0989956877','0954151908'),('0989956878','Andres','Sanchez','empleado8@example.com','0989956878','0954151908'),('0989956879','Valeria','Montes','empleado9@example.com','0989956879','0954151908'),('0989956880','Enrique','Anton','empleado10@example.com','0989956880','0954151908');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-01 23:41:26
