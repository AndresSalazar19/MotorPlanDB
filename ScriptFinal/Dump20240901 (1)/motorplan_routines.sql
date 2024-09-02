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
-- Temporary view structure for view `listaganadoresmas1vez`
--

DROP TABLE IF EXISTS `listaganadoresmas1vez`;
/*!50001 DROP VIEW IF EXISTS `listaganadoresmas1vez`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `listaganadoresmas1vez` AS SELECT 
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `cedula`,
 1 AS `costo`,
 1 AS `id_contrato`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `ventas_anuales_por_vendedor`
--

DROP TABLE IF EXISTS `ventas_anuales_por_vendedor`;
/*!50001 DROP VIEW IF EXISTS `ventas_anuales_por_vendedor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ventas_anuales_por_vendedor` AS SELECT 
 1 AS `Vendedor`,
 1 AS `Apellido`,
 1 AS `Total_Ventas`,
 1 AS `Saldo_Por_Cobrar`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `modelosmascotizados`
--

DROP TABLE IF EXISTS `modelosmascotizados`;
/*!50001 DROP VIEW IF EXISTS `modelosmascotizados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `modelosmascotizados` AS SELECT 
 1 AS `categoria`,
 1 AS `modelo`,
 1 AS `costo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `analisis_financiero_anual`
--

DROP TABLE IF EXISTS `analisis_financiero_anual`;
/*!50001 DROP VIEW IF EXISTS `analisis_financiero_anual`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `analisis_financiero_anual` AS SELECT 
 1 AS `total_De_Venta`,
 1 AS `CuentasPorCobrar`,
 1 AS `TotalCobrado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `contratos_en_curso`
--

DROP TABLE IF EXISTS `contratos_en_curso`;
/*!50001 DROP VIEW IF EXISTS `contratos_en_curso`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `contratos_en_curso` AS SELECT 
 1 AS `cedula`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `id_contrato`,
 1 AS `cuotas_totales`,
 1 AS `cantidad_cuotas_pagadas`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `listaganadoresmas1vez`
--

/*!50001 DROP VIEW IF EXISTS `listaganadoresmas1vez`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`adminGrupo4`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `listaganadoresmas1vez` AS select distinct `c`.`nombre` AS `nombre`,`c`.`apellido` AS `apellido`,`c`.`cedula` AS `cedula`,`p`.`costo` AS `costo`,`c1`.`id_contrato` AS `id_contrato` from ((((`cliente` `c` join `sorteo` `s` on((`c`.`cedula` = `s`.`cedula_ganador`))) join `detalle_grupo` `dg` on((`s`.`id_grupo` = `dg`.`id_grupo`))) join `contrato` `c1` on((`dg`.`contrato` = `c1`.`id_contrato`))) join `proforma` `p` on((`c1`.`id_proforma` = `p`.`id_proforma`))) where (`s`.`cedula_ganador` in (select `s2`.`cedula_ganador` from `sorteo` `s2` group by `s2`.`cedula_ganador` having (count(distinct `s2`.`id_grupo`) > 1)) and (`s`.`id_grupo` = `dg`.`id_grupo`) and (`c`.`cedula` = `dg`.`id_cliente`) and (`c1`.`id_contrato` = `dg`.`contrato`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ventas_anuales_por_vendedor`
--

/*!50001 DROP VIEW IF EXISTS `ventas_anuales_por_vendedor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`adminGrupo4`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `ventas_anuales_por_vendedor` AS select `e`.`nombre` AS `Vendedor`,`e`.`apellido` AS `Apellido`,round(coalesce(sum(`p`.`costo`),0),2) AS `Total_Ventas`,round(coalesce((sum(`p`.`costo`) - coalesce(sum(`cu`.`valor_cuota`),0)),0),2) AS `Saldo_Por_Cobrar` from (((`empleado` `e` join `contrato` `c` on((`e`.`cedula` = `c`.`id_vendedor`))) join `proforma` `p` on((`c`.`id_proforma` = `p`.`id_proforma`))) left join `cuota` `cu` on((`c`.`id_contrato` = `cu`.`id_contrato`))) where (year(`c`.`fecha_firma`) = year(curdate())) group by `e`.`nombre`,`e`.`apellido` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `modelosmascotizados`
--

/*!50001 DROP VIEW IF EXISTS `modelosmascotizados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`adminGrupo4`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `modelosmascotizados` AS select `ranked_economico`.`categoria` AS `categoria`,`ranked_economico`.`modelo` AS `modelo`,`ranked_economico`.`costo` AS `costo` from (select 'económico' AS `categoria`,`proforma`.`modelo` AS `modelo`,`proforma`.`costo` AS `costo`,row_number() OVER (PARTITION BY 'económico' ORDER BY count(0) desc )  AS `row_num` from (`proforma` join `contrato` on((`proforma`.`id_proforma` = `contrato`.`id_proforma`))) where ((year(`contrato`.`fecha_firma`) = year(curdate())) and (`proforma`.`costo` <= 15000)) group by `proforma`.`modelo`,`proforma`.`costo`) `ranked_economico` where (`ranked_economico`.`row_num` <= 3) union all select `ranked_estandar`.`categoria` AS `categoria`,`ranked_estandar`.`modelo` AS `modelo`,`ranked_estandar`.`costo` AS `costo` from (select 'estándar' AS `categoria`,`proforma`.`modelo` AS `modelo`,`proforma`.`costo` AS `costo`,row_number() OVER (PARTITION BY 'estándar' ORDER BY count(0) desc )  AS `row_num` from (`proforma` join `contrato` on((`proforma`.`id_proforma` = `contrato`.`id_proforma`))) where ((year(`contrato`.`fecha_firma`) = year(curdate())) and (`proforma`.`costo` between 15000 and 25000)) group by `proforma`.`modelo`,`proforma`.`costo`) `ranked_estandar` where (`ranked_estandar`.`row_num` <= 3) union all select `ranked_premium`.`categoria` AS `categoria`,`ranked_premium`.`modelo` AS `modelo`,`ranked_premium`.`costo` AS `costo` from (select 'premium' AS `categoria`,`proforma`.`modelo` AS `modelo`,`proforma`.`costo` AS `costo`,row_number() OVER (PARTITION BY 'premium' ORDER BY count(0) desc )  AS `row_num` from (`proforma` join `contrato` on((`proforma`.`id_proforma` = `contrato`.`id_proforma`))) where ((year(`contrato`.`fecha_firma`) = year(curdate())) and (`proforma`.`costo` > 25000)) group by `proforma`.`modelo`,`proforma`.`costo`) `ranked_premium` where (`ranked_premium`.`row_num` <= 3) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `analisis_financiero_anual`
--

/*!50001 DROP VIEW IF EXISTS `analisis_financiero_anual`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`adminGrupo4`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `analisis_financiero_anual` AS select round(ifnull(sum(`proforma`.`costo`),0),2) AS `total_De_Venta`,round(ifnull((sum(`proforma`.`costo`) - sum(`pagos`.`total_pagado`)),0),2) AS `CuentasPorCobrar`,round((round(ifnull(sum(`proforma`.`costo`),0),2) - round(ifnull((sum(`proforma`.`costo`) - sum(`pagos`.`total_pagado`)),0),2)),2) AS `TotalCobrado` from (((`contrato` join `proforma` on((`contrato`.`id_proforma` = `proforma`.`id_proforma`))) left join (select `cuota`.`id_contrato` AS `id_contrato`,sum(`cuota`.`valor_cuota`) AS `total_pagado` from `cuota` where (year(`cuota`.`fecha_pago`) = year(curdate())) group by `cuota`.`id_contrato`) `pagos` on((`contrato`.`id_contrato` = `pagos`.`id_contrato`))) left join `cliente` on((`contrato`.`id_cliente` = `cliente`.`cedula`))) where (year(`contrato`.`fecha_firma`) = year(curdate())) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `contratos_en_curso`
--

/*!50001 DROP VIEW IF EXISTS `contratos_en_curso`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`adminGrupo4`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `contratos_en_curso` AS select `cliente`.`cedula` AS `cedula`,`cliente`.`nombre` AS `nombre`,`cliente`.`apellido` AS `apellido`,`contrato`.`id_contrato` AS `id_contrato`,`contrato`.`cuotas_totales` AS `cuotas_totales`,count(`cuota`.`id_cuota`) AS `cantidad_cuotas_pagadas` from ((`cliente` join `contrato` on((`cliente`.`cedula` = `contrato`.`id_cliente`))) left join `cuota` on(((`contrato`.`id_contrato` = `cuota`.`id_contrato`) and (`cuota`.`fecha_pago` is not null)))) where (`contrato`.`estado` = 'Vigente') group by `cliente`.`cedula`,`cliente`.`nombre`,`cliente`.`apellido`,`contrato`.`id_contrato`,`contrato`.`cuotas_totales` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'motorplan'
--

--
-- Dumping routines for database 'motorplan'
--
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`adminGrupo4`@`%` PROCEDURE `ActualizarCliente`(
    IN p_cedula CHAR(10),
    IN p_calle_principal VARCHAR(30),
    IN p_calle_secundaria VARCHAR(30),
    IN p_email CHAR(30),
    IN p_telefono CHAR(10),
    IN p_nombre VARCHAR(30),
    IN p_apellido VARCHAR(30)
)
BEGIN
    START TRANSACTION;
    UPDATE cliente
    SET calle_principal = p_calle_principal,
        calle_secundaria = p_calle_secundaria,
        email = p_email,
        telefono = p_telefono,
        nombre = p_nombre,
        apellido = p_apellido
    WHERE cedula = p_cedula;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarConcesionaria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`adminGrupo4`@`%` PROCEDURE `ActualizarConcesionaria`(
    IN p_id_concesionaria CHAR(30),
    IN p_nombre VARCHAR(30),
    IN p_telefono CHAR(10),
    IN p_email CHAR(30),
    IN p_calle_principal VARCHAR(30),
    IN p_calle_secundaria VARCHAR(50)
)
BEGIN
    START TRANSACTION;
    UPDATE concesionaria
    SET nombre = p_nombre,
        telefono = p_telefono,
        email = p_email,
        calle_principal = p_calle_principal,
        calle_secundaria = p_calle_secundaria
    WHERE id_concesionaria = p_id_concesionaria;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarContrato` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`adminGrupo4`@`%` PROCEDURE `ActualizarContrato`(
    IN p_id_contrato INT,
    IN p_id_gerente CHAR(10),
    IN p_id_grupo INT,
    IN p_id_proforma INT,
    IN p_descripcion VARCHAR(1500),
    IN p_valor_cuota FLOAT,
    IN p_cuotas_totales INT,
    IN p_fecha_firma DATE,
    IN p_estado ENUM('Activo', 'Inactivo', 'Cancelado'),
    IN p_id_vendedor CHAR(10)
)
BEGIN
    START TRANSACTION;
    UPDATE contrato
    SET id_gerente = p_id_gerente,
        id_grupo = p_id_grupo,
        id_proforma = p_id_proforma,
        descripcion = p_descripcion,
        valor_cuota = p_valor_cuota,
        cuotas_totales = p_cuotas_totales,
        fecha_firma = p_fecha_firma,
        estado = p_estado,
        id_vendedor = p_id_vendedor
    WHERE id_contrato = p_id_contrato;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarCuota` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`adminGrupo4`@`%` PROCEDURE `ActualizarCuota`(
    IN p_id_cuota INT,
    IN p_id_cliente CHAR(10),
    IN p_id_contrato INT,
    IN p_valor_cuota FLOAT,
    IN p_fecha_pago DATE
)
BEGIN
    START TRANSACTION;
    UPDATE cuota
    SET id_cliente = p_id_cliente,
        id_contrato = p_id_contrato,
        valor_cuota = p_valor_cuota,
        fecha_pago = p_fecha_pago
    WHERE id_cuota = p_id_cuota;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarDetalleGrupo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`adminGrupo4`@`%` PROCEDURE `ActualizarDetalleGrupo`(
    IN p_id_grupo INT,
    IN p_id_cliente CHAR(10),
    IN p_contrato INT
)
BEGIN
    START TRANSACTION;
    UPDATE detalle_grupo
    SET id_cliente = p_id_cliente,
        contrato = p_contrato
    WHERE id_grupo = p_id_grupo;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`adminGrupo4`@`%` PROCEDURE `ActualizarEmpleado`(
    IN p_cedula CHAR(10),
    IN p_nombre VARCHAR(30),
    IN p_apellido VARCHAR(80),
    IN p_telefono CHAR(10),
    IN p_email CHAR(30)
)
BEGIN
    START TRANSACTION;
    UPDATE empleado
    SET nombre = p_nombre,
        apellido = p_apellido,
        telefono = p_telefono,
        email = p_email
    WHERE cedula = p_cedula;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarGarante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`adminGrupo4`@`%` PROCEDURE `ActualizarGarante`(
    IN p_cedula CHAR(10),
    IN p_id_participante CHAR(10),
    IN p_nombres CHAR(30),
    IN p_apellidos CHAR(30),
    IN p_telefono CHAR(10),
    IN p_email CHAR(30)
)
BEGIN
    START TRANSACTION;
    UPDATE garante
    SET id_participante = p_id_participante,
        nombres = p_nombres,
        apellidos = p_apellidos,
        telefono = p_telefono,
        email = p_email
    WHERE cedula = p_cedula;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarGrupo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`adminGrupo4`@`%` PROCEDURE `ActualizarGrupo`(
    IN p_id_grupo INT,
    IN p_id_gerente CHAR(10),
    IN p_chanchito FLOAT,
    IN p_precio_desde FLOAT,
    IN p_precio_hasta FLOAT
)
BEGIN
    START TRANSACTION;
    UPDATE grupo
    SET id_gerente = p_id_gerente,
        chanchito = p_chanchito,
        precio_desde = p_precio_desde,
        precio_hasta = p_precio_hasta
    WHERE id_grupo = p_id_grupo;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarProforma` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`adminGrupo4`@`%` PROCEDURE `ActualizarProforma`(
    IN p_id_proforma INT,
    IN p_id_concesionaria CHAR(30),
    IN p_fecha DATE,
    IN p_modelo VARCHAR(20),
    IN p_marca CHAR(10),
    IN p_color CHAR(20),
    IN p_costo FLOAT,
    IN p_anio INT
)
BEGIN
    START TRANSACTION;
    UPDATE proforma
    SET id_concesionaria = p_id_concesionaria,
        fecha = p_fecha,
        modelo = p_modelo,
        marca = p_marca,
        color = p_color,
        costo = p_costo,
        anio = p_anio
    WHERE id_proforma = p_id_proforma;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarSorteo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`adminGrupo4`@`%` PROCEDURE `ActualizarSorteo`(
    IN p_id_sorteo INT,
    IN p_id_grupo INT,
    IN p_fecha_sorteo DATE,
    IN p_cedula_ganador CHAR(10)
)
BEGIN
    START TRANSACTION;
    UPDATE sorteo
    SET id_grupo = p_id_grupo,
        fecha_sorteo = p_fecha_sorteo,
        cedula_ganador = p_cedula_ganador
    WHERE id_sorteo = p_id_sorteo;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `consultaCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`adminGrupo4`@`%` PROCEDURE `consultaCliente`(IN clienteCedula CHAR(10))
BEGIN
    IF (SELECT COUNT(*) FROM CLIENTE WHERE cedula = clienteCedula) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La cédula proporcionada no existe en la base de datos.';
    ELSE
        SELECT 
            C.id_contrato,
            C.descripcion,
            C.fecha_firma,
            C.cuotas_totales,
            COALESCE(COUNT(CU.id_cuota), 0) AS cuotas_pagadas,
            (C.cuotas_totales - COALESCE(COUNT(CU.id_cuota), 0)) AS cuotas_pendientes,
            C.valor_cuota,
            C.estado
        FROM 
            CONTRATO C
        LEFT JOIN 
            CUOTA CU ON C.id_contrato = CU.id_contrato AND CU.fecha_pago IS NOT NULL
        WHERE 
            C.id_cliente = clienteCedula
        GROUP BY 
            C.id_contrato, 
            C.descripcion, 
            C.fecha_firma,
            C.cuotas_totales,
            C.valor_cuota,
            C.estado;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `consultaPagos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`adminGrupo4`@`%` PROCEDURE `consultaPagos`(IN clienteCedula CHAR(10), IN contratoId INT)
BEGIN
    IF (SELECT COUNT(*) FROM CLIENTE WHERE cedula = clienteCedula) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La cédula proporcionada no existe en la base de datos.';
    ELSEIF (SELECT COUNT(*) FROM CONTRATO WHERE id_contrato = contratoId AND id_cliente = clienteCedula) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El contrato no pertenece al cliente proporcionado o no existe.';
    ELSE
        SELECT 
            CU.fecha_pago, 
            CU.valor_cuota
        FROM 
            CUOTA CU
        WHERE 
            CU.id_cliente = clienteCedula 
            AND CU.id_contrato = contratoId;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`adminGrupo4`@`%` PROCEDURE `EliminarCliente`(
    IN p_cedula CHAR(10)
)
BEGIN
    START TRANSACTION;
    DELETE FROM cliente WHERE cedula = p_cedula;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarConcesionaria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`adminGrupo4`@`%` PROCEDURE `EliminarConcesionaria`(
    IN p_id_concesionaria CHAR(30)
)
BEGIN
    START TRANSACTION;
    DELETE FROM concesionaria WHERE id_concesionaria = p_id_concesionaria;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarContrato` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`adminGrupo4`@`%` PROCEDURE `EliminarContrato`(
    IN p_id_contrato INT
)
BEGIN
    START TRANSACTION;
    DELETE FROM contrato WHERE id_contrato = p_id_contrato;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarCuota` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`adminGrupo4`@`%` PROCEDURE `EliminarCuota`(
    IN p_id_cuota INT
)
BEGIN
    START TRANSACTION;
    DELETE FROM cuota WHERE id_cuota = p_id_cuota;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarDetalleGrupo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`adminGrupo4`@`%` PROCEDURE `EliminarDetalleGrupo`(
    IN p_id_grupo INT,
    IN p_id_cliente CHAR(10)
)
BEGIN
    START TRANSACTION;
    DELETE FROM detalle_grupo WHERE id_grupo = p_id_grupo AND id_cliente = p_id_cliente;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`adminGrupo4`@`%` PROCEDURE `EliminarEmpleado`(
    IN p_cedula CHAR(10)
)
BEGIN
    START TRANSACTION;
    DELETE FROM empleado WHERE cedula = p_cedula;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarGarante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`adminGrupo4`@`%` PROCEDURE `EliminarGarante`(
    IN p_cedula CHAR(10)
)
BEGIN
    START TRANSACTION;
    DELETE FROM garante WHERE cedula = p_cedula;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarGrupo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`adminGrupo4`@`%` PROCEDURE `EliminarGrupo`(
    IN p_id_grupo INT
)
BEGIN
    START TRANSACTION;
    DELETE FROM grupo WHERE id_grupo = p_id_grupo;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarProforma` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`adminGrupo4`@`%` PROCEDURE `EliminarProforma`(
    IN p_id_proforma INT
)
BEGIN
    START TRANSACTION;
    DELETE FROM proforma WHERE id_proforma = p_id_proforma;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarSorteo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`adminGrupo4`@`%` PROCEDURE `EliminarSorteo`(
    IN p_id_sorteo INT
)
BEGIN
    START TRANSACTION;
    DELETE FROM sorteo WHERE id_sorteo = p_id_sorteo;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`adminGrupo4`@`%` PROCEDURE `InsertarCliente`(
    IN p_cedula CHAR(10),
    IN p_calle_principal VARCHAR(30),
    IN p_calle_secundaria VARCHAR(30),
    IN p_email CHAR(30),
    IN p_telefono CHAR(10),
    IN p_nombre VARCHAR(30),
    IN p_apellido VARCHAR(30),
    IN p_id_vendedor CHAR(10)
)
BEGIN
    START TRANSACTION;
    IF (SELECT COUNT(*) FROM cliente WHERE cedula = p_cedula) != 0 THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El cliente ya está en la base de datos';
        ROLLBACK;
    ELSE 
        INSERT INTO cliente(cedula, calle_principal, calle_secundaria, email, telefono, nombre, apellido, id_vendedor)
        VALUES (p_cedula, p_calle_principal, p_calle_secundaria, p_email, p_telefono, p_nombre, p_apellido, p_id_vendedor);
        COMMIT;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarConcesionaria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`adminGrupo4`@`%` PROCEDURE `InsertarConcesionaria`(
    IN p_id_concesionaria CHAR(30),
    IN p_nombre VARCHAR(30),
    IN p_telefono CHAR(10),
    IN p_email CHAR(30),
    IN p_calle_principal VARCHAR(30),
    IN p_calle_secundaria VARCHAR(50)
)
BEGIN
    START TRANSACTION;
    IF (SELECT COUNT(*) FROM concesionaria WHERE id_concesionaria = p_id_concesionaria) != 0 THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La concesionaria ya está en la base de datos';
        ROLLBACK;
    ELSE 
        INSERT INTO concesionaria(id_concesionaria, nombre, telefono, email, calle_principal, calle_secundaria)
        VALUES (p_id_concesionaria, p_nombre, p_telefono, p_email, p_calle_principal, p_calle_secundaria);
        COMMIT;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarContrato` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`adminGrupo4`@`%` PROCEDURE `InsertarContrato`(
    IN p_id_contrato INT,
    IN p_id_gerente CHAR(10),
    IN p_id_garante CHAR(10),
    IN p_id_cliente CHAR(10),
    IN p_id_proforma INT,
    IN p_descripcion VARCHAR(1500),
    IN p_cuotas_totales INT,
    IN p_valor_cuota FLOAT,
    IN p_fecha_firma DATE,
    IN p_estado ENUM('Pendiente', 'Vigente', 'Culminado'),
    IN p_id_vendedor CHAR(10)
)
BEGIN
    START TRANSACTION;
    IF (SELECT COUNT(*) FROM contrato WHERE id_contrato = p_id_contrato) != 0 THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El contrato ya está en la base de datos';
        ROLLBACK;
    ELSE 
        INSERT INTO contrato(id_contrato, id_gerente, id_garante, id_cliente, id_proforma, descripcion, cuotas_totales, valor_cuota, fecha_firma, estado, id_vendedor)
        VALUES (p_id_contrato, p_id_gerente, p_id_garante, p_id_cliente, p_id_proforma, p_descripcion, p_cuotas_totales, p_valor_cuota, p_fecha_firma, p_estado, p_id_vendedor);
        COMMIT;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarCuota` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`adminGrupo4`@`%` PROCEDURE `InsertarCuota`(
    IN p_id_cuota INT,
    IN p_id_cliente CHAR(10),
    IN p_id_contrato INT,
    IN p_valor_cuota FLOAT,
    IN p_fecha_pago DATE
)
BEGIN
    START TRANSACTION;
    IF (SELECT COUNT(*) FROM cuota WHERE id_cuota = p_id_cuota) != 0 THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La cuota ya está en la base de datos';
        ROLLBACK;
    ELSE 
        INSERT INTO cuota(id_cuota, id_cliente, id_contrato, valor_cuota, fecha_pago)
        VALUES (p_id_cuota, p_id_cliente, p_id_contrato, p_valor_cuota, p_fecha_pago);
        COMMIT;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarDetalleGrupo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`adminGrupo4`@`%` PROCEDURE `InsertarDetalleGrupo`(
    IN p_id_grupo INT,
    IN p_id_cliente CHAR(10),
    IN p_contrato INT
)
BEGIN
    START TRANSACTION;
    IF (SELECT COUNT(*) FROM detalle_grupo WHERE id_grupo = p_id_grupo AND id_cliente = p_id_cliente AND contrato = p_contrato) != 0 THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El detalle de grupo ya está en la base de datos';
        ROLLBACK;
    ELSE 
        INSERT INTO detalle_grupo(id_grupo, id_cliente, contrato)
        VALUES (p_id_grupo, p_id_cliente, p_contrato);
        COMMIT;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`adminGrupo4`@`%` PROCEDURE `InsertarEmpleado`(
    IN p_cedula CHAR(10),
    IN p_nombre VARCHAR(30),
    IN p_apellido VARCHAR(80),
    IN p_telefono CHAR(10),
    IN p_email CHAR(30),
    IN p_id_gerente CHAR(10)
)
BEGIN
    START TRANSACTION;
    IF (SELECT COUNT(*) FROM empleado WHERE cedula = p_cedula) != 0 THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El empleado ya está en la base de datos';
        ROLLBACK;
    ELSE 
        INSERT INTO empleado(cedula, nombre, apellido, telefono, email, id_gerente)
        VALUES (p_cedula, p_nombre, p_apellido, p_telefono, p_email, p_id_gerente);
        COMMIT;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarGarante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`adminGrupo4`@`%` PROCEDURE `InsertarGarante`(
    IN p_cedula CHAR(10),
    IN p_id_participante CHAR(10),
    IN p_nombres CHAR(30),
    IN p_apellidos CHAR(30),
    IN p_telefono CHAR(10),
    IN p_email CHAR(30)
)
BEGIN
    START TRANSACTION;
    IF (SELECT COUNT(*) FROM garante WHERE cedula = p_cedula) != 0 THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El garante ya está en la base de datos';
        ROLLBACK;
    ELSE 
        INSERT INTO garante(cedula, id_participante, nombres, apellidos, telefono, email)
        VALUES (p_cedula, p_id_participante, p_nombres, p_apellidos, p_telefono, p_email);
        COMMIT;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarGrupo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`adminGrupo4`@`%` PROCEDURE `InsertarGrupo`(
    IN p_id_grupo INT,
    IN p_id_gerente CHAR(10),
    IN p_chanchito FLOAT,
    IN p_precio_desde FLOAT,
    IN p_precio_hasta FLOAT
)
BEGIN
    START TRANSACTION;
    IF (SELECT COUNT(*) FROM grupo WHERE id_grupo = p_id_grupo) != 0 THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El grupo ya está en la base de datos';
        ROLLBACK;
    ELSE 
        INSERT INTO grupo(id_grupo, id_gerente, chanchito, precio_desde, precio_hasta)
        VALUES (p_id_grupo, p_id_gerente, p_chanchito, p_precio_desde, p_precio_hasta);
        COMMIT;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarProforma` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`adminGrupo4`@`%` PROCEDURE `InsertarProforma`(
    IN p_id_proforma INT,
    IN p_id_concesionaria CHAR(30),
    IN p_fecha DATE,
    IN p_modelo VARCHAR(20),
    IN p_marca CHAR(10),
    IN p_color CHAR(20),
    IN p_costo FLOAT,
    IN p_anio INT
)
BEGIN
    START TRANSACTION;
    IF (SELECT COUNT(*) FROM proforma WHERE id_proforma = p_id_proforma) != 0 THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La proforma ya está en la base de datos';
        ROLLBACK;
    ELSE 
        INSERT INTO proforma(id_proforma, id_concesionaria, fecha, modelo, marca, color, costo, anio)
        VALUES (p_id_proforma, p_id_concesionaria, p_fecha, p_modelo, p_marca, p_color, p_costo, p_anio);
        COMMIT;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarSorteo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`adminGrupo4`@`%` PROCEDURE `InsertarSorteo`(
    IN p_id_sorteo INT,
    IN p_id_grupo INT,
    IN p_fecha_sorteo DATE,
    IN p_cedula_ganador CHAR(10)
)
BEGIN
    START TRANSACTION;
    IF (SELECT COUNT(*) FROM sorteo WHERE id_sorteo = p_id_sorteo) != 0 THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El sorteo ya está en la base de datos';
        ROLLBACK;
    ELSE 
        INSERT INTO sorteo(id_sorteo, id_grupo, fecha_sorteo, cedula_ganador)
        VALUES (p_id_sorteo, p_id_grupo, p_fecha_sorteo, p_cedula_ganador);
        COMMIT;
    END IF;
END ;;
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

-- Dump completed on 2024-09-01 23:41:55
