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
-- Table structure for table `proforma`
--

DROP TABLE IF EXISTS `proforma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proforma` (
  `id_proforma` int NOT NULL,
  `id_concesionaria` char(30) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `modelo` char(20) DEFAULT NULL,
  `marca` char(10) DEFAULT NULL,
  `color` char(20) DEFAULT NULL,
  `costo` float DEFAULT NULL,
  `anio` int DEFAULT NULL,
  PRIMARY KEY (`id_proforma`),
  KEY `fk_proforma_concesionaria` (`id_concesionaria`),
  KEY `idx_modelo_proforma` (`modelo`(10)),
  CONSTRAINT `fk_proforma_concesionaria` FOREIGN KEY (`id_concesionaria`) REFERENCES `concesionaria` (`id_concesionaria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proforma`
--

LOCK TABLES `proforma` WRITE;
/*!40000 ALTER TABLE `proforma` DISABLE KEYS */;
INSERT INTO `proforma` VALUES (1,'1','2019-08-09','suzuki f20','suzuki','verde',1998.98,2019),(2,'3','2018-09-04','BT50','Mazda','Blanco',20000,2029),(3,'3','2023-03-10','Corolla','Toyota','Verde',30000,2023),(4,'2','2020-09-08','Camaro','Chevrolet','Amarillo',60000,2020),(5,'2','2023-05-10','Corolla full','Tollota','Blanco',40000,2024),(6,'1','2023-06-10','Civic','Honda','Gris',45000,2023),(7,'1','2023-07-10','Mustang','Ford','Amarillo',50000,2023),(8,'2','2023-08-10','Malibu','Chevrolet','Naranja',55000,2023),(9,'100','2023-09-10','3 Series Full','BMW','Violeta',60000,2023),(10,'2','2023-10-10','A4','Audi','Rosado',65000,2023),(11,'3','2023-01-10','Altima','Nissan','Rojo',20000,2023),(12,'2','2023-02-10','Sonata','Hyundai','Azul',25000,2023),(14,'2','2023-04-10','Optima','Kia','Negro',35000,2023),(100,'100','2020-09-04','Mazda','Citroen','Verde',19284,2020),(101,'100','2015-09-08','Diablo','Lamborgini','amarillo',109000,2012),(102,'100','2000-01-01','Ford','Ford','Negro',39999.2,2000),(103,'100','2020-12-09','Jeep','Daihatsu','Verde',4000,1998),(104,'100','2024-07-28','Explorer','Ford','azul',9000.98,2012),(105,'100','2023-08-04','Aveo','Chevrolet','amarillo',9999.99,2020),(106,'100','2020-04-03','Elantra','Hyundai','plata',12999.9,2016),(107,'100','1999-04-05','Bocho','Wolksvagen','Rojo',4999.99,1990),(108,'100','2013-09-23','Elantra','Kia','blanco',16988,2013),(109,'100','2017-11-28','Terracan','Hyundai','Plata',13678,2000),(110,'100','2024-09-01','Elantra','Lexus','Azul',50000,2024);
/*!40000 ALTER TABLE `proforma` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-01 23:41:21
