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
-- Table structure for table `garante`
--

DROP TABLE IF EXISTS `garante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `garante` (
  `cedula` char(10) NOT NULL,
  `id_participante` char(10) DEFAULT NULL,
  `nombres` char(30) DEFAULT NULL,
  `apellidos` char(30) DEFAULT NULL,
  `telefono` char(30) DEFAULT NULL,
  `email` char(30) DEFAULT NULL,
  PRIMARY KEY (`cedula`),
  KEY `fk_garante_participante` (`id_participante`),
  KEY `idx_nombre_apellido_garante` (`apellidos`(10),`nombres`(10)),
  CONSTRAINT `fk_garante_participante` FOREIGN KEY (`id_participante`) REFERENCES `cliente` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garante`
--

LOCK TABLES `garante` WRITE;
/*!40000 ALTER TABLE `garante` DISABLE KEYS */;
INSERT INTO `garante` VALUES ('0101234567','0201234567','Pedro','Sánchez García','0998765431','pedro.sanchez01@gmail.com'),('0101234598','0401234567','Daniel','Paredes Zambrano','0998765441','daniel.paredes11@gmail.com'),('0102345676','0402345678','Cristian','Ávila Delgado','0998765443','cristian.avila13@gmail.com'),('0102345678','0202345678','Santiago','Herrera Martínez','0998765433','santiago.herrera03@gmail.com'),('0103456781','0403456789','Esteban','Andrade Palacios','0998765445','esteban.andrade15@gmail.com'),('0103456789','0203456789','Jorge','Montalvo Alvarez','0998765435','jorge.montalvo05@gmail.com'),('0104567890','0204567890','Rodrigo','Espinosa Salinas','0998765437','rodrigo.espinosa07@gmail.com'),('0104567893','0404567890','Julio','Torres Luna','0998765447','julio.torres17@gmail.com'),('0105678901','0205678901','Ricardo','Becerra Flores','0998765439','ricardo.becerra09@gmail.com'),('0105678904','0405678901','Matías','Escobar Benítez','0998765449','matias.escobar19@gmail.com'),('0705432109','0205432109','Patricia','Vallejo Mora','0998765440','patricia.vallejo10@gmail.com'),('0705432110','0405432109','Silvia','Bustamante Montes','0998765450','silvia.bustamante20@gmail.com'),('0706543210','0206543210','Claudia','Vargas González','0998765438','claudia.vargas08@gmail.com'),('0706543219','0406543210','Lorena','Molina Quintero','0998765448','lorena.molina18@gmail.com'),('0707654320','0407654321','Alejandra','Peña Cordero','0998765446','alejandra.pena16@gmail.com'),('0707654321','0207654321','Andrea','Ponce Mejía','0998765436','andrea.ponce06@gmail.com'),('0708765432','0208765432','Luisa','Castro Ramos','0998765434','luisa.castro04@gmail.com'),('0708765433','0408765432','Gloria','Manzano Ruiz','0998765444','gloria.manzano14@gmail.com'),('0709876542','0409876543','Marcela','Suárez Carrillo','0998765442','marcela.suarez12@gmail.com'),('0709876543','0209876543','Carmen','Ruiz López','0998765432','carmen.ruiz02@gmail.com'),('0954321876','0912345678','Ricardo Emilio','Paredes Vargas','0987654321','ricardo.paredes@outlook.com'),('0956784321','0965432178','Andrés Felipe','Zambrano Ortega','0998765124','andres.zambrano@hotmail.com'),('0967895432','0978546832','Lucía Isabel','Ortiz Ramírez','0998765432','lucia.ortiz@hotmail.com'),('0975361485','0912457836','Daniel Matias','Loor Cevallos','0963369751','dani16@hotmail.com'),('0976541238','0923456789','Verónica Alejandra','Espinoza López','0964321789','veronica.espinoza@gmail.com'),('0978456123','0978546832','Miguel Angel','Vera Sánchez','0965432187','miguel.vera@yahoo.com'),('0978521463','0956784321','Santiago Javier','Mejía Torres','0968745123','santiago.mejia@gmail.com'),('0987463521','0912457836','Carla Beatriz','Mora Castillo','0976543219','carla.mora@gmail.com'),('0987612345','0956784321','María Fernanda','Gómez Paredes','0976432189','maria.gomez@yahoo.com'),('0998765123','0923456789','Gabriel Enrique','Ramos Salazar','0971234567','gabriel.ramos@hotmail.com');
/*!40000 ALTER TABLE `garante` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-01 23:41:12
