use motorplan;

DELIMITER //

CREATE PROCEDURE InsertarCliente(
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
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE ActualizarCliente(
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
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE EliminarCliente(
    IN p_cedula CHAR(10)
)
BEGIN
    START TRANSACTION;
    DELETE FROM cliente WHERE cedula = p_cedula;
    COMMIT;
END //

DELIMITER ;



DELIMITER //

CREATE PROCEDURE InsertarCuota(
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
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE ActualizarCuota(
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
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE EliminarCuota(
    IN p_id_cuota INT
)
BEGIN
    START TRANSACTION;
    DELETE FROM cuota WHERE id_cuota = p_id_cuota;
    COMMIT;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE InsertarConcesionaria(
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
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE ActualizarConcesionaria(
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
END //

DELIMITER ;



DELIMITER //

CREATE PROCEDURE EliminarConcesionaria(
    IN p_id_concesionaria CHAR(30)
)
BEGIN
    START TRANSACTION;
    DELETE FROM concesionaria WHERE id_concesionaria = p_id_concesionaria;
    COMMIT;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE InsertarProforma(
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
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE ActualizarProforma(
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
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE EliminarProforma(
    IN p_id_proforma INT
)
BEGIN
    START TRANSACTION;
    DELETE FROM proforma WHERE id_proforma = p_id_proforma;
    COMMIT;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE InsertarContrato(
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
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE ActualizarContrato(
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
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE EliminarContrato(
    IN p_id_contrato INT
)
BEGIN
    START TRANSACTION;
    DELETE FROM contrato WHERE id_contrato = p_id_contrato;
    COMMIT;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE InsertarEmpleado(
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
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE ActualizarEmpleado(
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
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE EliminarEmpleado(
    IN p_cedula CHAR(10)
)
BEGIN
    START TRANSACTION;
    DELETE FROM empleado WHERE cedula = p_cedula;
    COMMIT;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE InsertarGarante(
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
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE ActualizarGarante(
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
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE EliminarGarante(
    IN p_cedula CHAR(10)
)
BEGIN
    START TRANSACTION;
    DELETE FROM garante WHERE cedula = p_cedula;
    COMMIT;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE InsertarDetalleGrupo(
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
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE ActualizarDetalleGrupo(
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
END //

DELIMITER ;



DELIMITER //

CREATE PROCEDURE EliminarDetalleGrupo(
    IN p_id_grupo INT,
    IN p_id_cliente CHAR(10)
)
BEGIN
    START TRANSACTION;
    DELETE FROM detalle_grupo WHERE id_grupo = p_id_grupo AND id_cliente = p_id_cliente;
    COMMIT;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE InsertarGrupo(
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
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE ActualizarGrupo(
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
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE EliminarGrupo(
    IN p_id_grupo INT
)
BEGIN
    START TRANSACTION;
    DELETE FROM grupo WHERE id_grupo = p_id_grupo;
    COMMIT;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE InsertarSorteo(
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
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE ActualizarSorteo(
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
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE EliminarSorteo(
    IN p_id_sorteo INT
)
BEGIN
    START TRANSACTION;
    DELETE FROM sorteo WHERE id_sorteo = p_id_sorteo;
    COMMIT;
END //

DELIMITER ;
CREATE INDEX idx_nombre_apellido_cliente
ON cliente(apellido(10),nombre(10));

CREATE INDEX idx_nombre_apellido_empleado
ON empleado(apellido(10),nombre(10));

CREATE INDEX idx_nombre_apellido_garante
ON garante(apellidos(10),nombres(10));

CREATE INDEX idx_nombre_concesionaria
ON concesionaria(nombre(15));

CREATE INDEX idx_modelo_proformaidx_modelo_proforma
ON proforma(modelo(10));

CREATE INDEX idx_fecha_firma_contrato
on contrato(fecha_firma);

CREATE INDEX idx_fecha_sorteo
on sorteo(fecha_sorteo);

Create user "VENDEDOR" identified by "adminVendedor" ;

GRANT INSERT, SELECT, UPDATE ON motorplan.cliente TO "VENDEDOR";
GRANT INSERT, SELECT, UPDATE ON motorplan.cuota TO "VENDEDOR";

CREATE USER 'cliente'@'localhost' IDENTIFIED BY 'contraseña';

GRANT EXECUTE ON PROCEDURE motorplan.consultaCliente TO 'cliente'@'localhost';
GRANT EXECUTE ON PROCEDURE motorplan.consultaPagos TO 'cliente'@'localhost';

CREATE USER 'recursosHumanos'@'localhost' IDENTIFIED BY 'contraseña789';
GRANT SELECT, INSERT, DELETE, UPDATE ON motorplan.Empleado TO 'recursosHumanos'@'localhost';
FLUSH PRIVILEGES;

CREATE USER 'analista_financiero'@'localhost' IDENTIFIED BY 'contraseña123';
GRANT SELECT ON motorplan.CONTRATO TO 'analista_financiero'@'localhost';
GRANT SELECT ON motorplan.analisis_financiero_anual TO 'analista_financiero'@'localhost';
FLUSH PRIVILEGES;
 CREATE USER 'atencionAlCliente'@'localhost' IDENTIFIED BY 'contraseña456';
GRANT SELECT, INSERT, UPDATE, DELETE ON motorplan.CLIENTE TO 'atencionAlCliente'@'localhost';
FLUSH PRIVILEGES;
 CREATE VIEW ModelosMasCotizados AS
SELECT
    categoria,
    modelo,
    costo
FROM (
    SELECT
        'económico' AS categoria,
        modelo,
        costo,
        ROW_NUMBER() OVER (PARTITION BY 'económico' ORDER BY COUNT(*) DESC) AS row_num
    FROM PROFORMA
    JOIN CONTRATO ON PROFORMA.id_Proforma = CONTRATO.id_proforma
    WHERE YEAR(CONTRATO.fecha_firma) = YEAR(CURDATE())
      AND PROFORMA.costo <= 15000
    GROUP BY modelo, costo
) AS ranked_economico
WHERE row_num <= 3

UNION ALL

SELECT
    categoria,
    modelo,
    costo
FROM (
    SELECT
        'estándar' AS categoria,
        modelo,
        costo,
        ROW_NUMBER() OVER (PARTITION BY 'estándar' ORDER BY COUNT(*) DESC) AS row_num
    FROM PROFORMA
    JOIN CONTRATO ON PROFORMA.id_Proforma = CONTRATO.id_proforma
    WHERE YEAR(CONTRATO.fecha_firma) = YEAR(CURDATE())
      AND PROFORMA.costo BETWEEN 15000 AND 25000
    GROUP BY modelo, costo
) AS ranked_estandar
WHERE row_num <= 3

UNION ALL

SELECT
    categoria,
    modelo,
    costo
FROM (
    SELECT
        'premium' AS categoria,
        modelo,
        costo,
        ROW_NUMBER() OVER (PARTITION BY 'premium' ORDER BY COUNT(*) DESC) AS row_num
    FROM PROFORMA
    JOIN CONTRATO ON PROFORMA.id_Proforma = CONTRATO.id_proforma
    WHERE YEAR(CONTRATO.fecha_firma) = YEAR(CURDATE())
      AND PROFORMA.costo > 25000
    GROUP BY modelo, costo
) AS ranked_premium
WHERE row_num <= 3;

CREATE VIEW analisis_financiero_anual AS
SELECT 
    ROUND(IFNULL(SUM(PROFORMA.costo), 0), 2) AS total_De_Venta,
    ROUND(IFNULL(SUM(PROFORMA.costo) - SUM(pagos.total_pagado), 0), 2) AS CuentasPorCobrar
FROM CONTRATO
JOIN PROFORMA ON CONTRATO.id_proforma = PROFORMA.id_Proforma
LEFT JOIN (
    SELECT
        CUOTA.id_contrato,
        SUM(CUOTA.valor_cuota) AS total_pagado
    FROM CUOTA
    WHERE YEAR(CUOTA.fecha_pago) = YEAR(CURDATE())
    GROUP BY CUOTA.id_contrato
) AS pagos ON CONTRATO.id_contrato = pagos.id_contrato
LEFT JOIN CLIENTE ON CONTRATO.id_cliente = CLIENTE.cedula
WHERE YEAR(CONTRATO.fecha_firma) = YEAR(CURDATE());


[22:27, 1/9/2024] Melissa: delimiter /
Create trigger insertContrato after Insert on Contrato
for each row 
Begin
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
end /
delimiter ;

delimiter /
Create trigger insertCuota before Insert on Cuota
for each row
begin
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
end /
delimiter ;


CREATE VIEW ListaGanadoresMas1vez AS
	SELECT DISTINCT c.nombre, c.apellido
	FROM cliente c
	JOIN sorteo s ON c.cedula = s.cedula_ganador
	WHERE s.cedula_ganador IN (
		SELECT s2.cedula_ganador
		FROM sorteo s2
		GROUP BY s2.cedula_ganador
		HAVING COUNT(DISTINCT s2.id_grupo) > 1
	);
CREATE USER 'admConcesionarias'@'localhost' IDENTIFIED BY 'adminConse123';
GRANT SELECT, INSERT, DELETE, UPDATE ON motorplan.proforma TO 'admConcesionarias'@'localhost';
GRANT SELECT, INSERT, DELETE, UPDATE ON motorplan.concesionaria TO 'admConcesionarias'@'localhost';

