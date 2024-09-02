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
-- Table structure for table `cuota`
--

DROP TABLE IF EXISTS `cuota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuota` (
  `id_cuota` int NOT NULL AUTO_INCREMENT,
  `id_cliente` char(10) DEFAULT NULL,
  `id_contrato` int DEFAULT NULL,
  `valor_cuota` float DEFAULT NULL,
  `fecha_pago` date DEFAULT NULL,
  PRIMARY KEY (`id_cuota`),
  KEY `fk_cuota_cliente` (`id_cliente`),
  KEY `fk_cuota_contrato` (`id_contrato`),
  CONSTRAINT `fk_cuota_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`cedula`),
  CONSTRAINT `fk_cuota_contrato` FOREIGN KEY (`id_contrato`) REFERENCES `contrato` (`id_contrato`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuota`
--

LOCK TABLES `cuota` WRITE;
/*!40000 ALTER TABLE `cuota` DISABLE KEYS */;
INSERT INTO `cuota` VALUES (1,'0912457836',1,55.5,'2024-08-14'),(2,'0912457836',1,55.5,'2024-09-14'),(3,'0912457836',1,55.5,'2024-10-14'),(4,'0912457836',2,833.4,'2024-04-10'),(5,'0912457836',2,833.4,'2024-05-10'),(6,'0912457836',2,833.4,'2024-06-10'),(10,'0978546832',4,1250,'2024-06-05'),(11,'0978546832',4,1250,'2024-07-05'),(12,'0978546832',4,1250,'2024-08-05'),(16,'0923456789',6,937.5,'2024-03-08'),(17,'0923456789',6,937.5,'2024-03-08'),(18,'0923456789',6,937.5,'2024-03-08'),(19,'0923456789',7,781,'2022-10-30'),(20,'0923456789',7,781,'2022-11-30'),(21,'0923456789',7,781,'2022-12-30'),(22,'0956784321',8,1388,'2021-12-11'),(23,'0956784321',8,1388,'2022-01-11'),(24,'0956784321',8,1388,'2022-02-11'),(25,'0956784321',9,1041,'2023-07-14'),(26,'0956784321',9,1041,'2023-08-14'),(27,'0956784321',9,1041,'2023-09-14'),(28,'0965432178',10,1160.71,'2022-09-25'),(29,'0965432178',10,1160.71,'2022-10-25'),(30,'0965432178',10,1160.71,'2022-11-25'),(31,'0965432178',10,1160,'2024-12-12'),(32,'0965432178',10,1160,'2024-11-11'),(39,'0407654321',51,535.71,'2024-09-01'),(40,'0912345678',52,1111.11,'2024-09-01'),(41,'0923456789',53,1666.66,'2024-09-01'),(42,'0978546832',54,1250,'2024-09-01'),(44,'0978546832',54,1250,'2024-09-01'),(45,'0978546832',54,1250,'2024-09-02'),(46,'0978546832',54,1250,'2024-09-02'),(47,'0978546832',54,1250,'2024-09-02'),(48,'0978546832',54,1250,'2024-09-02'),(49,'0407654321',51,535.71,'2024-09-02'),(50,'0407654321',51,535.71,'2024-09-02'),(51,'0407654321',51,535.71,'2024-09-02'),(52,'0407654321',51,535.71,'2024-09-02'),(53,'0407654321',51,535.71,'2024-09-02'),(54,'0407654321',51,535.71,'2024-09-02'),(55,'0912345678',52,1111.11,'2024-09-02'),(56,'0912345678',52,1111.11,'2024-09-02'),(57,'0912345678',52,1111.11,'2024-09-02'),(58,'0912345678',52,1111.11,'2024-09-02'),(59,'0912345678',52,1111.11,'2024-09-02'),(60,'0978546832',54,1250,'2024-09-02'),(61,'0407654321',51,535.71,'2024-09-02'),(62,'0912345678',52,1111.11,'2024-09-02'),(63,'0978546832',54,1250,'2024-09-02'),(64,'0407654321',51,535.71,'2024-09-02'),(65,'0912345678',52,1111.11,'2024-09-02'),(66,'0978546832',54,1250,'2024-09-02'),(67,'0407654321',51,535.71,'2024-09-02'),(68,'0912345678',52,1111.11,'2024-09-02'),(69,'0978546832',54,1250,'2024-09-02'),(70,'0407654321',51,535.71,'2024-09-02'),(71,'0912345678',52,1111.11,'2024-09-02'),(72,'0409876543',13,2500,'2024-09-02'),(73,'0409876543',13,2500,'2024-09-02'),(74,'0409876543',13,2500,'2024-09-02'),(75,'0409876543',13,2500,'2024-09-02'),(76,'0409876543',13,2500,'2024-09-02'),(77,'0409876543',13,2500,'2024-09-02'),(78,'0978546832',12,833.4,'2024-09-02'),(79,'0205678901',5,1111.1,'2024-09-02'),(80,'0204567890',55,833.4,'2024-09-02'),(81,'0409876543',56,833.4,'2024-09-02'),(82,'0205678901',57,833.4,'2024-09-02'),(83,'0204567890',55,833.4,'2024-09-02'),(84,'0204567890',55,833.4,'2024-09-02'),(85,'0204567890',55,833.4,'2024-09-02'),(86,'0204567890',55,833.4,'2024-09-02'),(87,'0407654321',51,535.71,'2024-09-02'),(88,'0912345678',52,1111.11,'2024-09-02'),(89,'0409876543',13,2500,'2024-09-02'),(90,'0407654321',51,535.71,'2024-09-02'),(91,'0912345678',52,1111.11,'2024-09-02'),(92,'0409876543',13,2500,'2024-09-02'),(93,'0407654321',51,535.71,'2024-09-02'),(94,'0912345678',52,1111.11,'2024-09-02'),(95,'0409876543',13,2500,'2024-09-02'),(96,'0204567890',55,833.4,'2024-09-02'),(97,'0204567890',56,833.4,'2024-09-02'),(98,'0204567890',57,833.4,'2024-09-02'),(99,'0204567890',12,833.4,'2024-09-02'),(100,'0204567890',5,1111.1,'2024-09-02'),(101,'0407654321',51,535.71,'2024-09-02'),(102,'0912345678',52,1111.11,'2024-09-02'),(103,'0409876543',13,2500,'2024-09-02'),(104,'0204567890',55,833.4,'2024-09-02'),(105,'0204567890',56,833.4,'2024-09-02'),(106,'0204567890',57,833.4,'2024-09-02'),(107,'0204567890',12,833.4,'2024-09-02'),(108,'0204567890',5,1111.1,'2024-09-02'),(109,'0407654321',51,535.71,'2024-09-02'),(110,'0912345678',52,1111.11,'2024-09-02'),(111,'0409876543',13,2500,'2024-09-02'),(112,'0204567890',55,833.4,'2024-09-02'),(113,'0204567890',56,833.4,'2024-09-02'),(114,'0204567890',57,833.4,'2024-09-02'),(115,'0204567890',12,833.4,'2024-09-02'),(116,'0204567890',5,1111.1,'2024-09-02'),(117,'0978546832',54,1250,'2024-09-02'),(118,'0978546832',54,1250,'2024-09-02'),(119,'0978546832',54,1250,'2024-09-02'),(120,'0204567890',55,833.4,'2024-09-02'),(121,'0204567890',56,833.4,'2024-09-02'),(122,'0204567890',57,833.4,'2024-09-02'),(123,'0204567890',55,833.4,'2024-09-02'),(124,'0204567890',56,833.4,'2024-09-02'),(125,'0204567890',57,833.4,'2024-09-02'),(126,'0204567890',55,833.4,'2024-09-02'),(127,'0204567890',56,833.4,'2024-09-02'),(128,'0204567890',57,833.4,'2024-09-02'),(129,'0204567890',55,833.4,'2024-09-02'),(130,'0204567890',56,833.4,'2024-09-02'),(131,'0204567890',57,833.4,'2024-09-02');
/*!40000 ALTER TABLE `cuota` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`adminGrupo4`@`%`*/ /*!50003 TRIGGER `insertCuota` BEFORE INSERT ON `cuota` FOR EACH ROW begin
    DECLARE cuota float;
    DECLARE mensaje TEXT;
    DECLARE num_cuotas int;
    DECLARE IDgrupo int;
    
    set new.fecha_pago = now();
    set IDgrupo = (
            Select dg.id_grupo
            from detalle_grupo dg 
            where new.id_cliente = dg.id_cliente and dg.contrato = new.id_contrato);
    set cuota = (Select valor_cuota from contrato where id_contrato = new.id_contrato);
    set num_cuotas = (Select c.cuotas_totales from contrato c where c.id_contrato = new.id_contrato);
    
    if (num_cuotas = (Select count(*) from cuota c where c.id_contrato = new.id_contrato)) then
        SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = "Este contrato ya culminó";  
    end if;
    
    if (cuota <> new.valor_cuota) then
         SET mensaje = CONCAT('Su cuota a pagar es de ', cuota);
         SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = mensaje;
    else 
        set new.valor_cuota = cuota;
        update grupo
        set chanchito = chanchito + new.valor_cuota
        where id_grupo = IDgrupo;
    end if;
    
    if (num_cuotas = (Select count(*) from cuota c where c.id_contrato = new.id_contrato) + 1) then
        update Contrato
        set estado = 'Culminado'
        where id_contrato = new.id_contrato;
    end if;
end */;;
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

-- Dump completed on 2024-09-01 23:40:52
