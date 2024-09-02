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
-- Table structure for table `sorteo`
--

DROP TABLE IF EXISTS `sorteo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sorteo` (
  `id_sorteo` int NOT NULL AUTO_INCREMENT,
  `id_grupo` int DEFAULT NULL,
  `fecha_sorteo` date DEFAULT NULL,
  `cedula_ganador` char(10) DEFAULT NULL,
  PRIMARY KEY (`id_sorteo`),
  KEY `id_grupo` (`id_grupo`),
  KEY `cedula_ganador` (`cedula_ganador`),
  KEY `idx_fecha_sorteo` (`fecha_sorteo`),
  CONSTRAINT `sorteo_ibfk_1` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id_grupo`),
  CONSTRAINT `sorteo_ibfk_2` FOREIGN KEY (`cedula_ganador`) REFERENCES `cliente` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sorteo`
--

LOCK TABLES `sorteo` WRITE;
/*!40000 ALTER TABLE `sorteo` DISABLE KEYS */;
INSERT INTO `sorteo` VALUES (4,6,'2024-09-02','0978546832'),(5,6,'2024-09-02','0409876543'),(6,7,'2024-09-02','0978546832');
/*!40000 ALTER TABLE `sorteo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`adminGrupo4`@`%`*/ /*!50003 TRIGGER `insertGanador` AFTER INSERT ON `sorteo` FOR EACH ROW BEGIN
	update grupo
    set chanchito = chanchito - (Select p.costo
								from detalle_grupo dg join contrato c on dg.contrato=c.id_contrato join Proforma p using(id_proforma)
                                where dg.id_cliente = new.cedula_ganador and dg.id_grupo = new.id_grupo)
    where id_grupo = new.id_grupo;                            
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-01 23:41:02
