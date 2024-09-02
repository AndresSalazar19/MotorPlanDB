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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `cedula` char(10) NOT NULL,
  `calle_principal` varchar(30) DEFAULT NULL,
  `calle_secundaria` varchar(30) DEFAULT NULL,
  `email` char(30) DEFAULT NULL,
  `telefono` char(10) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `id_vendedor` char(10) DEFAULT NULL,
  PRIMARY KEY (`cedula`),
  KEY `fk_cliente_vendedor` (`id_vendedor`),
  KEY `idx_nombre_apellido_cliente` (`apellido`(10),`nombre`(10)),
  CONSTRAINT `fk_cliente_vendedor` FOREIGN KEY (`id_vendedor`) REFERENCES `empleado` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('0201234567','Av. Amazonas','Av. Colón','maria.fernandez01@gmail.com','0987654321','Maria','Fernández','0989956871'),('0202345678','Av. de los Shyris','Av. República','ana.gomez03@gmail.com','0987654323','Ana','Gómez','0989956872'),('0203456789','Av. 10 de Agosto','Calle Jorge Washington','lucia.martinez05@gmail.com','0987654325','Lucía','Martínez','0989956873'),('0204567890','Av. 12 de Octubre','Calle Luis Cordero','elena.ortiz07@gmail.com','0987654327','Elena','Ortiz','0989956874'),('0205432109','Av. Carlos Julio Arosemena','Av. Delta','pablo.salazar10@gmail.com','0987654330','Pablo','Salazar','0989956875'),('0205678901','Av. Eloy Alfaro','Av. Gaspar de Villarroel','laura.ruiz09@gmail.com','0987654329','Laura','Ruiz','0989956875'),('0206543210','Av. Las Monjas','Av. José Santiago Castillo','andres.moreno08@gmail.com','0987654328','Andrés','Moreno','0989956874'),('0207654321','Av. Machala','Calle El Oro','miguel.castro06@gmail.com','0987654326','Miguel','Castro','0989956873'),('0208765432','Av. Juan Tanca Marengo','Av. Francisco de Orellana','carlos.perez04@gmail.com','0987654324','Carlos','Pérez','0989956872'),('0209876543','Av. 9 de Octubre','Av. Malecón Simón Bolívar','jose.rodriguez02@gmail.com','0987654322','José','Rodríguez','0989956871'),('0401234567','Av. De la República','Av. 6 de Diciembre','gabriela.jimenez11@gmail.com','0987654331','Gabriela','Jiménez','0989956876'),('0402345678','Av. Simón Bolívar','Av. Antonio José de Sucre','sofia.rios13@gmail.com','0987654333','Sofía','Ríos','0989956877'),('0403456789','Av. Patria','Av. 12 de Octubre','natalia.romero15@gmail.com','0987654335','Natalia','Romero','0989956878'),('0404567890','Av. González Suárez','Calle José Bosmediano','isabel.cabrera17@gmail.com','0987654337','Isabel','Cabrera','0989956879'),('0405432109','Av. 25 de Julio','Av. Portete','luis.espinoza20@gmail.com','0987654340','Luis','Espinoza','0989956880'),('0405678901','Av. Naciones Unidas','Av. de los Granados','veronica.torres19@gmail.com','0987654339','Verónica','Torres','0989956880'),('0406543210','Av. Benjamín Carrión Mora','Calle Américas','javier.vaca18@gmail.com','0987654338','Javier','Vaca','0989956879'),('0407654321','Av. Francisco de Orellana','Av. Plaza Dañin','david.paredes16@gmail.com','0987654336','David','Paredes','0989956878'),('0408765432','Av. Quito','Av. Las Aguas','ricardo.chavez14@gmail.com','0987654334','Ricardo','Chávez','0989956877'),('0409876543','Av. Víctor Emilio Estrada','Calle Costanera','fernando.sanchez12@gmail.com','0987654332','Fernando','Sánchez','0989956876'),('0912345678','6 de Marzo','10 de Agosto','maria.lopez@gmail.com','0998765432','Maria','Lopez','0706543212'),('0912457836','19Ava','Pancho Segura','luis14@gmail.com','0975492317','Luis','Alvarez','0912934785'),('0923456789','Los Ceibos','Av. del Ejército','andres.martinez@gmail.com','0976543210','Andres','Martinez','0709937401'),('0956784321','Rumichaca','Luque','laura.perez@hotmail.com','0991234567','Laura','Perez','0912934785'),('0965432178','Urdesa','Kennedy Norte','juan.gomez@yahoo.com','0987654321','Juan','Gomez','0912934785'),('0978546832','Rumichaca','9 Octubre','jose4@gmail.com','0989756933','Jose','Correa','0912934785');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-01 23:41:31
