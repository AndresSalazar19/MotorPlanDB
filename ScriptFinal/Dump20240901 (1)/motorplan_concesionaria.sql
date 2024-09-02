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
-- Table structure for table `concesionaria`
--

DROP TABLE IF EXISTS `concesionaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `concesionaria` (
  `id_concesionaria` char(30) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `telefono` char(10) DEFAULT NULL,
  `email` char(30) DEFAULT NULL,
  `calle_principal` varchar(50) DEFAULT NULL,
  `calle_secundaria` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_concesionaria`),
  KEY `idx_nombre_concesionaria` (`nombre`(15))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concesionaria`
--

LOCK TABLES `concesionaria` WRITE;
/*!40000 ALTER TABLE `concesionaria` DISABLE KEYS */;
INSERT INTO `concesionaria` VALUES ('1','Concesionaria ABC','123456789','contacto@concesionariaabc.com','Calle Falsa 123','Calle Verdadera 456'),('100','AutoCenter','0099887766','autocenter@gmail.com','Perimetral','10 de Agosto'),('2','Emaulme','0985654332','emaulme@google.com','Lorenzo de Garaycoa','Perimetral'),('3','Mazda','0967654422','mazda@mazda.net','Perimetral','9 de Octubre'),('C001','AMBA CAR','123456789','contactoA@concesionaria.com','Calle Principal 1','Calle Secundaria 1'),('C002','Concesionaria B','987654321','contactoB@concesionaria.com','Calle Principal 2','Calle Secundaria 2'),('C003','Concesionaria C','456123789','contactoC@concesionaria.com','Calle Principal 3','Calle Secundaria 3'),('C004','Concesionaria D','789123456','contactoD@concesionaria.com','Calle Principal 4','Calle Secundaria 4'),('C005','Concesionaria E','321654987','contactoE@concesionaria.com','Calle Principal 5','Calle Secundaria 5'),('C006','Concesionaria F','654987321','contactoF@concesionaria.com','Calle Principal 6','Calle Secundaria 6'),('C007','Concesionaria G','147258369','contactoG@concesionaria.com','Calle Principal 7','Calle Secundaria 7'),('C008','Concesionaria H','369258147','contactoH@concesionaria.com','Calle Principal 8','Calle Secundaria 8'),('C009','Concesionaria I','258147369','contactoI@concesionaria.com','Calle Principal 9','Calle Secundaria 9'),('C010','Concesionaria J','963852741','contactoJ@concesionaria.com','Calle Principal 10','Calle Secundaria 10');
/*!40000 ALTER TABLE `concesionaria` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-01 23:41:07
