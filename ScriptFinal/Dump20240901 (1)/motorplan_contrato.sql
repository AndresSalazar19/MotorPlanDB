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
-- Table structure for table `contrato`
--

DROP TABLE IF EXISTS `contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contrato` (
  `id_contrato` int NOT NULL AUTO_INCREMENT,
  `id_gerente` char(10) DEFAULT NULL,
  `id_garante` char(10) DEFAULT NULL,
  `id_cliente` char(10) DEFAULT NULL,
  `id_proforma` int DEFAULT NULL,
  `descripcion` varchar(15000) DEFAULT NULL,
  `cuotas_totales` int DEFAULT NULL,
  `valor_cuota` float DEFAULT NULL,
  `fecha_firma` date DEFAULT NULL,
  `estado` enum('Pendiente','Vigente','Culminado') DEFAULT 'Pendiente',
  `id_vendedor` char(10) DEFAULT NULL,
  PRIMARY KEY (`id_contrato`),
  KEY `fk_contrato_gerente` (`id_gerente`),
  KEY `fk_contrato_garante` (`id_garante`),
  KEY `fk_contrato_cliente` (`id_cliente`),
  KEY `fk_contrato_proforma` (`id_proforma`),
  KEY `id_vendedor` (`id_vendedor`),
  KEY `idx_fecha_firma_contrato` (`fecha_firma`),
  CONSTRAINT `contrato_ibfk_1` FOREIGN KEY (`id_vendedor`) REFERENCES `empleado` (`cedula`),
  CONSTRAINT `fk_contrato_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`cedula`),
  CONSTRAINT `fk_contrato_garante` FOREIGN KEY (`id_garante`) REFERENCES `garante` (`cedula`),
  CONSTRAINT `fk_contrato_gerente` FOREIGN KEY (`id_gerente`) REFERENCES `empleado` (`cedula`),
  CONSTRAINT `fk_contrato_proforma` FOREIGN KEY (`id_proforma`) REFERENCES `proforma` (`id_proforma`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrato`
--

LOCK TABLES `contrato` WRITE;
/*!40000 ALTER TABLE `contrato` DISABLE KEYS */;
INSERT INTO `contrato` VALUES (1,'0943792739','0975361485','0912457836',1,'Este contrato fue firmado el 14 de Julio del 2024 con 36 cuotas de 55.5 dolares.',36,55.5,'2024-07-14','Vigente','0912934785'),(2,'0943792739','0987463521','0912457836',2,'Este contrato fue firmado el 10 de Marzo del 2024 con 24 cuotas de 833.4 dólares.',24,833.4,'2024-03-10','Vigente','0709937401'),(4,'0704497601','0967895432','0978546832',4,'Este contrato fue firmado el 5 de Mayo del 2024 con 48 cuotas de 1250.0 dólares.',48,1250,'2024-05-05','Vigente','0709937401'),(5,'0704497601','0954321876','0205678901',5,'Este contrato fue firmado el 2 de Abril del 2023 con 36 cuotas de 1111.10 dólares.',36,1111.1,'2023-04-02','Vigente','0706543212'),(6,'0943792739','0976541238','0923456789',6,'Este contrato fue firmado el 8 de Febrero del 2024 con 48 cuotas de 937.5 dólares.',48,937.5,'2024-02-08','Vigente','0912934785'),(7,'0943792739','0998765123','0923456789',7,'Este contrato fue firmado el 30 de Septiembre del 2022 con 64 cuotas de 781.0 dólares.',64,781,'2022-09-30','Vigente','0912934785'),(8,'0704497601','0978521463','0956784321',8,'Este contrato fue firmado el 11 de Noviembre del 2021 con 36 cuotas de 1388.0 dólares.',36,1388,'2021-11-11','Vigente','0709937401'),(9,'0943792739','0987612345','0956784321',9,'Este contrato fue firmado el 14 de Junio del 2023 con 48 cuotas de 1041.0 dólares.',48,1041,'2023-06-14','Vigente','0706543212'),(10,'0704497601','0956784321','0965432178',10,'Este contrato fue firmado el 25 de Agosto del 2022 con 56 cuotas de 1160.71 dólares.',56,1160,'2022-08-25','Vigente','0912934785'),(11,'0704497601','0705432110','0405432109',1,'Este contrato fue firmado el 19 de Julio del 2022 con 24 cuotas de 83.25 dolares.',24,83.25,'2022-07-19','Vigente','0912934785'),(12,'0943792739','0707654320','0978546832',2,'Este contrato fue firmado el 8 de Marzo del 2023 con 24 cuotas de 833.4 dólares.',24,833.4,'2023-03-08','Vigente','0709937401'),(13,'0704497601','0978456123','0409876543',3,'Este contrato fue firmado el 20 de Enero del 2024 con 12 cuotas de 2500.0 dólares.',12,2500,'2024-01-20','Vigente','0706543212'),(14,'0704497601','0954321876','0912345678',4,'Este contrato fue firmado el 3 de Mayo del 2022 con 48 cuotas de 1250.0 dólares.',48,1250,'2022-05-03','Vigente','0709937401'),(15,'0704497601','0954321876','0912345678',11,'Este contrato fue firmado el 22 de Abril del 2023 con 36 cuotas de 555.60 dólares.',36,555.6,'2023-04-22','Vigente','0706543212'),(16,'0943792739','0976541238','0923456789',12,'Este contrato fue firmado el 18 de Febrero del 2023 con 48 cuotas de 520.83 dólares.',48,520.83,'2023-02-18','Vigente','0912934785'),(17,'0943792739','0998765123','0923456789',12,'Este contrato fue firmado el 30 de Octubre del 2022 con 64 cuotas de 390.625 dólares.',64,390.625,'2022-10-30','Vigente','0912934785'),(18,'0704497601','0978521463','0956784321',14,'Este contrato fue firmado el 1 de Diciembre del 2021 con 36 cuotas de 972.22 dólares.',36,972.22,'2021-12-01','Vigente','0709937401'),(19,'0943792739','0987612345','0956784321',100,'Este contrato fue firmado el 5 de Mayo del 2022 con 48 cuotas de 401.75 dólares.',48,401.75,'2022-05-05','Vigente','0706543212'),(20,'0704497601','0956784321','0965432178',100,'Este contrato fue firmado el 25 de Julio del 2021 con 56 cuotas de 344.35 dólares.',56,344.35,'2021-07-25','Vigente','0912934785'),(21,'0704497601','0707654320','0407654321',101,'Este contrato fue firmado el 25 de Agosto del 2022 con 56 cuotas de 1946.42 dólares.',56,1946.2,'2022-08-25','Vigente','0912934785'),(22,'0704497601','0101234567','0201234567',101,'Este contrato fue firmado el 19 de Julio del 2022 con 64 cuotas de 625.0 dolares.',64,625,'2022-07-19','Vigente','0912934785'),(23,'0943792739','0103456789','0203456789',102,'Este contrato fue firmado el 8 de Marzo del 2023 con 24 cuotas de 1666.63 dólares.',24,1666.63,'2023-03-08','Vigente','0709937401'),(24,'0704497601','0104567890','0204567890',102,'Este contrato fue firmado el 20 de Enero del 2021 con 36 cuotas de 1111.1 dólares.',36,1111.1,'2021-01-20','Vigente','0706543212'),(25,'0704497601','0954321876','0912345678',104,'Este contrato fue firmado el 23 de Junio del 2022 con 48 cuotas de 187.5 dólares.',48,187.5,'2022-06-23','Vigente','0709937401'),(26,'0704497601','0102345676','0402345678',108,'Este contrato fue firmado el 22 de Abril del 2023 con 36 cuotas de 472.16 dólares.',36,472.16,'2023-04-22','Vigente','0706543212'),(27,'0943792739','0976541238','0923456789',103,'Este contrato fue firmado el 16 de Marzo del 2023 con 48 cuotas de 83.33 dólares.',48,83.33,'2023-03-16','Vigente','0912934785'),(28,'0943792739','0104567890','0204567890',109,'Este contrato fue firmado el 30 de Octubre del 2022 con 64 cuotas de 213.71 dólares.',64,213.71,'2022-10-30','Vigente','0912934785'),(29,'0704497601','0978521463','0956784321',105,'Este contrato fue firmado el 15 de Noviembre del 2020 con 36 cuotas de 277.78 dólares.',36,277.78,'2020-11-15','Vigente','0709937401'),(30,'0943792739','0105678901','0205678901',106,'Este contrato fue firmado el 5 de Abril del 2022 con 48 cuotas de 270.83 dólares.',48,270.83,'2022-04-05','Vigente','0706543212'),(31,'0704497601','0101234567','0201234567',1,'Este contrato se firmó el 15 de noviembre de 2020.',12,166.58,'2020-11-15','Vigente','0989956871'),(32,'0943792739','0709876543','0209876543',2,'Este contrato se firmó el 3 de diciembre de 2020.',24,833.33,'2020-12-03','Vigente','0989956871'),(33,'0954151908','0102345678','0202345678',3,'Este contrato se firmó el 20 de enero de 2021.',36,833.33,'2021-01-20','Vigente','0989956872'),(34,'0704497601','0708765432','0208765432',4,'Este contrato se firmó el 25 de febrero de 2021.',48,1250,'2021-02-25','Vigente','0989956872'),(35,'0943792739','0103456789','0203456789',5,'Este contrato se firmó el 18 de marzo de 2021.',24,1666.67,'2021-03-18','Vigente','0989956873'),(36,'0954151908','0707654321','0207654321',6,'Este contrato se firmó el 10 de abril de 2021.',36,1250,'2021-04-10','Vigente','0989956873'),(37,'0704497601','0104567890','0204567890',7,'Este contrato se firmó el 5 de mayo de 2022.',48,1041.67,'2022-05-05','Vigente','0989956874'),(38,'0943792739','0706543210','0206543210',8,'Este contrato se firmó el 12 de junio de 2022.',36,1527.78,'2022-06-12','Vigente','0989956874'),(39,'0954151908','0105678901','0205678901',9,'Este contrato se firmó el 25 de julio de 2022.',48,1250,'2022-07-25','Vigente','0989956875'),(40,'0704497601','0705432109','0205432109',10,'Este contrato se firmó el 18 de agosto de 2022.',60,1083.33,'2022-08-18','Vigente','0989956875'),(41,'0943792739','0101234598','0401234567',11,'Este contrato se firmó el 9 de septiembre de 2022.',24,833.33,'2022-09-09','Vigente','0989956876'),(42,'0943792739','0709876542','0409876543',8,'Este contrato se firmó el 14 de octubre de 2022.',36,1527.78,'2022-10-14','Vigente','0989956876'),(43,'0704497601','0102345676','0402345678',5,'Este contrato se firmó el 22 de noviembre de 2022.',24,1666.67,'2022-11-22','Vigente','0989956877'),(44,'0954151908','0708765433','0408765432',9,'Este contrato se firmó el 18 de enero de 2023.',48,1250,'2023-01-18','Vigente','0989956877'),(45,'0943792739','0103456781','0403456789',6,'Este contrato se firmó el 28 de febrero de 2023.',36,1250,'2023-02-28','Vigente','0989956878'),(46,'0704497601','0707654320','0407654321',3,'Este contrato se firmó el 30 de marzo de 2023.',36,833.33,'2023-03-30','Vigente','0989956878'),(47,'0943792739','0104567893','0404567890',1,'Este contrato se firmó el 17 de abril de 2023.',12,166.58,'2023-04-17','Vigente','0989956879'),(48,'0954151908','0706543219','0406543210',10,'Este contrato se firmó el 22 de mayo de 2023.',60,1083.33,'2023-05-22','Vigente','0989956879'),(49,'0704497601','0105678904','0405678901',7,'Este contrato se firmó el 16 de junio de 2023.',48,1041.67,'2023-06-16','Vigente','0989956880'),(50,'0943792739','0705432110','0405432109',2,'Este contrato se firmó el 19 de julio de 2023.',24,833.33,'2023-07-19','Vigente','0989956880'),(51,'0704497601','0707654320','0407654321',3,'Este contrato fue firmado el 25 de Agosto del 2024 con 56 cuotas de 535.71 dólares.',56,535.71,'2024-08-25','Vigente','0912934785'),(52,'0704497601','0954321876','0912345678',5,'Este contrato fue firmado el 2 de Abril del 2024 con 36 cuotas de 1111.11 dólares.',36,1111.11,'2024-04-02','Vigente','0706543212'),(53,'0704497601','0978456123','0923456789',2,'Este contrato fue firmado el 20 de Enero del 2024 con 12 cuotas de 1666.66 dólares.',12,1666.66,'2027-01-20','Vigente','0706543212'),(54,'0704497601','0978456123','0978546832',3,'Este contrato fue firmado el 15 de Enero del 2024 con 24 cuotas de 1250 dólares.',24,1250,'2027-01-15','Vigente','0706543212'),(55,'0943792739','0707654320','0204567890',2,'Este contrato fue firmado el 8 de Marzo del 2023 con 24 cuotas de 833.4 dólares.',24,833.4,'2023-03-08','Vigente','0709937401'),(56,'0943792739','0707654320','0409876543',2,'Este contrato fue firmado el 8 de Marzo del 2023 con 24 cuotas de 833.4 dólares.',24,833.4,'2023-03-08','Vigente','0709937401'),(57,'0943792739','0707654320','0205678901',2,'Este contrato fue firmado el 8 de Marzo del 2023 con 24 cuotas de 833.4 dólares.',24,833.4,'2023-03-08','Vigente','0709937401');
/*!40000 ALTER TABLE `contrato` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`adminGrupo4`@`%`*/ /*!50003 TRIGGER `insertContrato` AFTER INSERT ON `contrato` FOR EACH ROW Begin
    Declare precio float;
    Declare iD_grupo int;
	set precio = (Select p.costo
					from proforma p
					where p.id_proforma = new.id_proforma);
	SET iD_grupo = (
        SELECT g.id_grupo
        FROM grupo g LEFT JOIN detalle_grupo dg ON g.id_grupo = dg.id_grupo
        WHERE g.precio_desde <= precio AND g.precio_hasta >= precio
        GROUP BY g.id_grupo
        HAVING COUNT(dg.id_cliente) < 5
        LIMIT 1
    );
	
	if(iD_grupo is null ) then
		Insert into Grupo(id_gerente, chanchito, precio_desde, precio_hasta) values(new.id_gerente, new.valor_cuota, precio, precio+15000);
		SET @last_id = LAST_INSERT_ID();
		Insert into Detalle_Grupo values(@last_id, new.id_cliente, new.id_contrato);
	 else 
        Insert into Detalle_Grupo values(iD_grupo, new.id_cliente, new.id_contrato	);	
		update grupo
		set chanchito = chanchito + new.valor_cuota
		where id_grupo = iD_grupo;
	 end if;
     insert into cuota(id_cliente, id_contrato, valor_cuota, fecha_pago) values(new.id_cliente, new.id_contrato, new.valor_cuota, now());
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

-- Dump completed on 2024-09-01 23:40:57
