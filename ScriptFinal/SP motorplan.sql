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
