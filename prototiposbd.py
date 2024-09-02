import mysql.connector
from tabulate import tabulate
import random

config = {
    'user': 'adminGrupo4',
    'password': '8396Quinde',
    'host': 'grupo4demo.mysql.database.azure.com',
    'database': 'motorplan'}


conn = mysql.connector.connect(**config)
cursor = conn.cursor()

def insertar_cliente(cursor, conn, cedula, calle_principal, calle_secundaria, email, telefono, nombre, apellido, id_vendedor):
    try:
        cursor.callproc('InsertarCliente', (cedula, calle_principal, calle_secundaria, email, telefono, nombre, apellido, id_vendedor))
        conn.commit()
        print('Cliente añadido exitosamente.')
    except mysql.connector.Error as err:
        if err.errno == 1644:
            print(f"Error: {err.msg}")
        else:
            print(f"Error inesperado: {err}")
        conn.rollback()
    try:
        cursor.callproc('InsertarCliente', (cedula, calle_principal, calle_secundaria, email, telefono, nombre, apellido, id_vendedor))
        conn.commit()
        print('Cliente añadido exitosamente.')
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        conn.rollback()



def eliminar_cliente(cursor, conn, cedula):
    try:
        cursor.callproc('EliminarCliente', (cedula,))
        conn.commit()
        print('Cliente eliminado exitosamente.')
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        conn.rollback()


def insertar_cuota(cursor, conn, id_cuota, id_cliente, id_contrato, valor_cuota, fecha_pago):
    try:
        cursor.callproc('InsertarCuota', (id_cuota, id_cliente, id_contrato, valor_cuota, fecha_pago))
        conn.commit()
        print('Cuota añadida exitosamente.')
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        conn.rollback()

def actualizar_cuota(cursor, conn, id_cuota, id_cliente, id_contrato, valor_cuota, fecha_pago):
    try:
        cursor.callproc('ActualizarCuota', (id_cuota, id_cliente, id_contrato, valor_cuota, fecha_pago))
        conn.commit()
        print('Cuota actualizada exitosamente.')
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        conn.rollback()


def eliminar_cuota(cursor, conn, id_cuota):
    try:
        cursor.callproc('EliminarCuota', (id_cuota,))
        conn.commit()
        print('Cuota eliminada exitosamente.')
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        conn.rollback()


def insertar_concesionaria(cursor, conn, id_concesionaria, nombre, telefono, email, calle_principal, calle_secundaria):
    try:
        cursor.callproc('InsertarConcesionaria', (id_concesionaria, nombre, telefono, email, calle_principal, calle_secundaria))
        conn.commit()
        print('Concesionaria añadida exitosamente.')
    except mysql.connector.Error as err:
        if err.errno == 1644:
            print(f"Error: {err.msg}")
        else:
            print(f"Error inesperado: {err}")
        conn.rollback()
    try:
        cursor.callproc('InsertarConcesionaria', (id_concesionaria, nombre, telefono, email, calle_principal, calle_secundaria))
        conn.commit()
        print('Concesionaria añadida exitosamente.')
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        conn.rollback()


def actualizar_concesionaria(cursor, conn, id_concesionaria, nombre, telefono, email, calle_principal, calle_secundaria):
    try:
        cursor.callproc('ActualizarConcesionaria', (id_concesionaria, nombre, telefono, email, calle_principal, calle_secundaria))
        conn.commit()
        print('Concesionaria actualizada exitosamente.')
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        conn.rollback()


def eliminar_concesionaria(cursor, conn, id_concesionaria):
    try:
        cursor.callproc('EliminarConcesionaria', (id_concesionaria,))
        conn.commit()
        print('Concesionaria eliminada exitosamente.')
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        conn.rollback()

def insertar_proforma(cursor, conn, id_proforma, id_concesionaria, fecha, modelo, marca, color, costo, anio):
    try:
        cursor.callproc('InsertarProforma', (id_proforma, id_concesionaria, fecha, modelo, marca, color, costo, anio))
        conn.commit()
        print('Proforma añadida exitosamente.')
    except mysql.connector.Error as err:
        if err.errno == 1644:
            print(f"Error: {err.msg}")
        else:
            print(f"Error inesperado: {err}")
        conn.rollback()
    try:
        cursor.callproc('InsertarProforma', (id_proforma, id_concesionaria, fecha, modelo, marca, color, costo, anio))
        conn.commit()
        print('Proforma añadida exitosamente.')
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        conn.rollback()


def actualizar_proforma(cursor, conn, id_proforma, id_concesionaria, fecha, modelo, marca, color, costo, anio):
    try:
        cursor.callproc('ActualizarProforma', (id_proforma, id_concesionaria, fecha, modelo, marca, color, costo, anio))
        conn.commit()
        print('Proforma actualizada exitosamente.')
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        conn.rollback()


def eliminar_proforma(cursor, conn, id_proforma):
    try:
        cursor.callproc('EliminarProforma', (id_proforma,))
        conn.commit()
        print('Proforma eliminada exitosamente.')
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        conn.rollback()

def insertar_contrato(cursor, conn, id_contrato, id_gerente, id_garante, id_cliente, id_proforma, descripcion, cuotas_totales, valor_cuota, fecha_firma, estado, id_vendedor):
    try:
        cursor.callproc('InsertarContrato', (id_contrato, id_gerente, id_garante, id_cliente, id_proforma, descripcion, cuotas_totales, valor_cuota, fecha_firma, estado, id_vendedor))
        conn.commit()
        print('Contrato generado exitosamente.')
    except mysql.connector.Error as err:
        if err.errno == 1644:
            print(f"Error: {err.msg}")
        else:
            print(f"Error inesperado: {err}")
        conn.rollback()
    try:
        cursor.callproc('InsertarContrato', (id_contrato, id_gerente, id_garante, id_cliente, id_proforma, descripcion, cuotas_totales, valor_cuota, fecha_firma, estado, id_vendedor))
        conn.commit()
        print('Contrato generado exitosamente.')
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        conn.rollback()

def actualizar_contrato(cursor, conn, id_contrato, id_gerente, id_grupo, id_proforma, descripcion, valor_cuota, cuotas_totales, fecha_firma, estado, id_vendedor):
    try:
        cursor.callproc('ActualizarContrato', (id_contrato, id_gerente, id_grupo, id_proforma, descripcion, valor_cuota, cuotas_totales, fecha_firma, estado, id_vendedor))
        conn.commit()
        print('Contrato actualizado exitosamente.')
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        conn.rollback()

def eliminar_contrato(cursor, conn, id_contrato):
    try:
        cursor.callproc('EliminarContrato', (id_contrato,))
        conn.commit()
        print('Contrato eliminado exitosamente.')
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        conn.rollback()

def insertar_empleado(cursor, conn, cedula, nombre, apellido, telefono, email, id_gerente):
    try:
        cursor.callproc('InsertarEmpleado', (cedula, nombre, apellido, telefono, email, id_gerente))
        conn.commit()
        print('Empleado añadido exitosamente.')
    except mysql.connector.Error as err:
        if err.errno == 1644:
            print(f"Error: {err.msg}")
        else:
            print(f"Error inesperado: {err}")
        conn.rollback()
    try:
        cursor.callproc('InsertarEmpleado', (cedula, nombre, apellido, telefono, email, id_gerente))
        conn.commit()
        print('Empleado añadido exitosamente.')
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        conn.rollback()

def actualizar_empleado(cursor, conn, cedula, nombre, apellido, telefono, email):
    try:
        cursor.callproc('ActualizarEmpleado', (cedula, nombre, apellido, telefono, email))
        conn.commit()
        print('Empleado actualizado exitosamente.')
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        conn.rollback()

def eliminar_empleado(cursor, conn, cedula):
    try:
        cursor.callproc('EliminarEmpleado', (cedula,))
        conn.commit()
        print('Empleado eliminado exitosamente.')
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        conn.rollback()

def insertar_garante(cursor, conn, cedula, id_participante, nombres, apellidos, telefono, email):
    try:
        cursor.callproc('InsertarGarante', (cedula, id_participante, nombres, apellidos, telefono, email))
        conn.commit()
        print('Garante añadido exitosamente.')
    except mysql.connector.Error as err:
        if err.errno == 1644:
            print(f"Error: {err.msg}")
        else:
            print(f"Error inesperado: {err}")
        conn.rollback()
    try:
        cursor.callproc('InsertarGarante', (cedula, id_participante, nombres, apellidos, telefono, email))
        conn.commit()
        print('Garante añadido exitosamente.')
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        conn.rollback()

def actualizar_garante(cursor, conn, cedula, id_participante, nombres, apellidos, telefono, email):
    try:
        cursor.callproc('ActualizarGarante', (cedula, id_participante, nombres, apellidos, telefono, email))
        conn.commit()
        print('Garante actualizado exitosamente.')
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        conn.rollback()

def eliminar_garante(cursor, conn, cedula):
    try:
        cursor.callproc('EliminarGarante', (cedula,))
        conn.commit()
        print('Garante eliminado exitosamente.')
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        conn.rollback()

def insertar_detalle_grupo(cursor, conn, id_grupo, id_cliente, contrato):
    try:
        cursor.callproc('InsertarDetalleGrupo', (id_grupo, id_cliente, contrato))
        conn.commit()
        print('Detalle de grupo añadido exitosamente.')
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        conn.rollback()


def actualizar_detalle_grupo(cursor, conn, id_grupo, id_cliente, contrato):
    try:
        cursor.callproc('ActualizarDetalleGrupo', (id_grupo, id_cliente, contrato))
        conn.commit()
        print('Detalle de grupo actualizado exitosamente.')
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        conn.rollback()

def eliminar_detalle_grupo(cursor, conn, id_grupo, id_cliente):
    try:
        cursor.callproc('EliminarDetalleGrupo', (id_grupo, id_cliente))
        conn.commit()
        print('Detalle de grupo eliminado exitosamente.')
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        conn.rollback()

def insertar_grupo(cursor, conn, id_grupo, id_gerente, chanchito, precio_desde, precio_hasta):
    try:
        cursor.callproc('InsertarGrupo', (id_grupo, id_gerente, chanchito, precio_desde, precio_hasta))
        conn.commit()
        print('Grupo añadido exitosamente.')
    except mysql.connector.Error as err:
        if err.errno == 1644:
            print(f"Error: {err.msg}")
        else:
            print(f"Error inesperado: {err}")
        conn.rollback()
    try:
        cursor.callproc('InsertarGrupo', (id_grupo, id_gerente, chanchito, precio_desde, precio_hasta))
        conn.commit()
        print('Grupo añadido exitosamente.')
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        conn.rollback()

def actualizar_grupo(cursor, conn, id_grupo, id_gerente, chanchito, precio_desde, precio_hasta):
    try:
        cursor.callproc('ActualizarGrupo', (id_grupo, id_gerente, chanchito, precio_desde, precio_hasta))
        conn.commit()
        print('Grupo actualizado exitosamente.')
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        conn.rollback()

def eliminar_grupo(cursor, conn, id_grupo):
    try:
        cursor.callproc('EliminarGrupo', (id_grupo,))
        conn.commit()
        print('Grupo eliminado exitosamente.')
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        conn.rollback()

def insertar_sorteo(cursor, conn, id_sorteo, id_grupo, fecha_sorteo, cedula_ganador):
    try:
        cursor.callproc('InsertarSorteo', (id_sorteo, id_grupo, fecha_sorteo, cedula_ganador))
        conn.commit()
        print('Sorteo añadido exitosamente.')
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        conn.rollback()

def actualizar_sorteo(cursor, conn, id_sorteo, id_grupo, fecha_sorteo, cedula_ganador):
    try:
        cursor.callproc('ActualizarSorteo', (id_sorteo, id_grupo, fecha_sorteo, cedula_ganador))
        conn.commit()
        print('Sorteo actualizado exitosamente.')
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        conn.rollback()

def eliminar_sorteo(cursor, conn, id_sorteo):
    try:
        cursor.callproc('EliminarSorteo', (id_sorteo,))
        conn.commit()
        print('Sorteo eliminado exitosamente.')
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        conn.rollback()

def añadir_cliente(cursor, conn, cedulaVendedor):
    cedula = verificador_cedula('Cedula cliente: ')
    
    calle_principal = input('Calle Principal: ')
    calle_secundaria = input('Calle Secundaria: ')
    email = input('Email: ')
    telefono = verificador_telefono('Teléfono: ')
    nombre = input('Nombre: ')
    apellido = input('Apellido: ')
    
    try:
        cursor.callproc('InsertarCliente', (cedula, calle_principal, calle_secundaria, email, telefono, nombre, apellido, cedulaVendedor))
        conn.commit()
        print('Cliente añadido exitosamente.')
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        conn.rollback()

def añadir_garante(cursor, conn, cedula_cliente):
    cedulaGarante = verificador_cedula('Cedula del Garante: ')
    nombreGarante = input('Nombre: ')
    apellidoGarante = input('Apellido: ')
    telefonoGarante = input('Telefono: ')
    emailGarante = input('Email: ')
    
    try:
        cursor.callproc('InsertarGarante', (cedulaGarante, cedula_cliente, nombreGarante, apellidoGarante, telefonoGarante, emailGarante))
        conn.commit()
        print('Garante añadido exitosamente.')
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        conn.rollback()

def añadir_contrato(cursor, conn, id_vendedor, id_cliente, id_proforma):
    id_contrato = obtener_entero_positivo_y_cero_input('ID del Contrato: ')
    id_gerente = input('Cedula de tu gerente: ')
    id_garante = verificador_cedula('Cedula del Garante: ')
    descripcion = 'Bla bla cosas legales que solo los abogados y notarios entienden bla bla'
    cuotas_totales = obtener_entero_positivo_y_cero_input('Cuantas cuotas pagara: ')
    valor_cuota = float(input('Costo total dividido por cuotas: '))
    fecha_firma = input('Fecha (año-mes-dia): ')
    estado = 'Pendiente'
    
    try:
        cursor.callproc('InsertarContrato', (id_contrato, id_gerente, id_garante, id_cliente, id_proforma, descripcion, cuotas_totales, valor_cuota, fecha_firma, estado, id_vendedor))
        conn.commit()
        print('Contrato generado exitosamente.')
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        conn.rollback()


def actualizar_cliente(cursor, conn, cedula):
    calle_principal = input('Calle Principal: ')
    calle_secundaria = input('Calle Secundaria: ')
    email = input('Email: ')
    telefono = verificador_telefono('Teléfono: ')
    nombre = input('Nombre: ')
    apellido = input('Apellido: ')
    
    try:
        cursor.callproc('ActualizarCliente', (cedula, calle_principal, calle_secundaria, email, telefono, nombre, apellido))
        conn.commit()
        print('Cliente actualizado exitosamente.')
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        conn.rollback()


def eliminar_cliente(cursor, conn, cedula):
    try:
        cursor.callproc('EliminarCliente', (cedula,))
        conn.commit()
        print('Cliente eliminado exitosamente.')
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        conn.rollback()


def crear_grupo(cursor, conn, cedulaGerente):
    # Paso 1: Obtener datos para el nuevo grupo
    id_grupo = input('Ingrese el ID del nuevo grupo: ')
    id_gerente = cedulaGerente
    
    query_clientes_vigentes = """
        SELECT c.id_cliente, p.costo
        FROM contrato c
        JOIN proforma p ON c.id_proforma = p.id_proforma
        WHERE c.estado = 'Vigente'
    """
    cursor.execute(query_clientes_vigentes)
    clientes_vigentes = cursor.fetchall()
    
    if not clientes_vigentes:
        print("No hay clientes con contratos vigentes.")
        return
    
    query_clientes_en_grupo = """
        SELECT id_cliente
        FROM detalle_grupo
    """
    cursor.execute(query_clientes_en_grupo)
    clientes_en_grupo = {cliente[0] for cliente in cursor.fetchall()}
    
    clientes_no_en_grupo = [cliente for cliente in clientes_vigentes if cliente[0] not in clientes_en_grupo]

    if not clientes_no_en_grupo:
        print("Todos los clientes con contratos vigentes ya están en un grupo.")
        return
    
    rango_minimo = float(input('Ingrese el costo mínimo del rango: '))
    rango_maximo = float(input('Ingrese el costo máximo del rango: '))
    
    clientes_seleccionados = [cliente for cliente in clientes_no_en_grupo if rango_minimo <= cliente[1] <= rango_maximo]

    if len(clientes_seleccionados) < 5:
        print("No hay suficientes clientes en el rango de costos especificado para formar un grupo.")
        return
    
    clientes_aleatorios = random.sample(clientes_seleccionados, 5)
    
    query_insertar_grupo = """
        INSERT INTO grupo (id_grupo, id_gerente, id_ganador)
        VALUES (%s, %s, NULL)
    """
    cursor.execute(query_insertar_grupo, (id_grupo, id_gerente))
    conn.commit()
    
    query_insertar_detalle_grupo = """
        INSERT INTO detalle_grupo (id_grupo, id_cliente, fecha_sorteo)
        VALUES (%s, %s, NULL)
    """
    for cliente in clientes_aleatorios:
        cursor.execute(query_insertar_detalle_grupo, (id_grupo, cliente[0]))
    
    conn.commit()
    print('Grupo creado y clientes añadidos exitosamente.')
def obtener_entero_positivo_y_cero_input(mensaje):
    while True:
        try:
            valor = int(input(mensaje))
            if valor < 0:
                print("Error: Ingresa un valor entero positivo o 0.")
            else:
                return valor
        except ValueError:
            print("Error: Ingresa un valor entero válido.")
def obtener_entero_positivo_input(mensaje):
    while True:
        try:
            valor = int(input(mensaje))
            if valor <= 0:
                print("Error: Ingresa un valor entero positivo.")
            else:
                return valor
        except ValueError:
            print("Error: Ingresa un valor entero válido.")
def obtener_float_positivo_input(mensaje):
    while True:
        try:
            valor = float(input(mensaje))
            if valor < 0:
                print("Error: Ingresa un valor flotante positivo o 0.")
            else:
                return valor
        except ValueError:
            print("Error: Ingresa un valor flotante válido.")
def verificador_cedula(mensaje):
    while True:
        cedula = input(mensaje)
        if len(cedula) == 10 and cedula[0] == '0' and cedula.isdigit():
            return cedula
        else:
            print("Cédula inválida. Debe ser de longitud 10 y comenzar con '0'. Intenta de nuevo.")
def verificador_telefono(mensaje):
    while True:
        telefono = input(mensaje)
        if len(telefono) == 10 and telefono[0] == '0' and telefono.isdigit():
            return telefono
        else:
            print("Número de teléfono inválido. Debe ser de longitud 10, comenzar con '0' y contener solo dígitos. Intenta de nuevo.")
def imprimir_menu(opciones):    
    for i, opcion in enumerate(opciones, 1):
        print(f"{i}. {opcion}")

    query_lista_grupos = """
        SELECT g.id_grupo, g.id_gerente, g.id_ganador, COUNT(d.id_cliente) AS num_clientes
        FROM grupo g
        LEFT JOIN detalle_grupo d ON g.id_grupo = d.id_grupo
        WHERE g.id_gerente = %s
        GROUP BY g.id_grupo, g.id_gerente, g.id_ganador
    """
    cursor.execute(query_lista_grupos, (cedulaGerente,))
    grupos = cursor.fetchall()
    
    if not grupos:
        print("No hay grupos disponibles para el gerente especificado.")
        return
    
    headers = ['ID Grupo', 'ID Gerente', 'ID Ganador', 'Número de Clientes']
    print(tabulate(grupos, headers=headers, tablefmt='fancy_grid'))
    return grupos

def consulta_externa():
    opciones = ["Verificar Cédula", "Consultar Cliente"]
    imprimir_menu(opciones)
    opcion = obtener_entero_positivo_y_cero_input("Seleccione una opción: ")

    if opcion == 1:
        cedula = verificador_cedula("Ingrese la cédula del cliente: ")
        cursor.callproc('verificar_cedula_cliente', [cedula])
        result = None
        for resultado in cursor.stored_results():
            result = resultado.fetchone()
        if result:
            print(f"Resultado de la verificación: {result[0]}")
        else:
            print("No se encontró información para la cédula proporcionada.")

    elif opcion == 2:
        cedula = verificador_cedula("Ingrese la cédula del cliente: ")
        cursor.callproc('consultar_cliente', [cedula])
        result = None
        for resultado in cursor.stored_results():
            result = resultado.fetchall()
        if result:
            headers = ["Campo", "Valor"]
            print(tabulate(result, headers=headers, tablefmt='fancy_grid'))
        else:
            print("No se encontró información para la cédula proporcionada.")


    # Obtener los grupos asociados al cedulaGerente
    query_grupos = """
        SELECT g.id_grupo
        FROM grupo g
        WHERE g.id_gerente = %s
    """
    cursor.execute(query_grupos, (cedulaGerente,))
    grupos = cursor.fetchall()
    
    if not grupos:
        print('No hay grupos disponibles para el gerente con la cédula proporcionada.')
        return
    
    # Mostrar los grupos disponibles para el gerente
    print('Grupos disponibles para editar o eliminar:')
    headers = ['ID Grupo']
    print(tabulate(grupos, headers=headers, tablefmt='fancy_grid'))
    
    id_grupo = input('Ingrese el ID del grupo que desea editar o del que desea eliminar un registro: ')
    
    # Verificar si el grupo pertenece al gerente
    query_verificar_grupo = """
        SELECT COUNT(*)
        FROM grupo
        WHERE id_grupo = %s AND id_gerente = %s
    """
    cursor.execute(query_verificar_grupo, (id_grupo, cedulaGerente))
    existe_grupo = cursor.fetchone()[0]
    
    if not existe_grupo:
        print('No se encontró un grupo con el ID especificado o el grupo no pertenece al gerente proporcionado.')
        return
    
    print('Seleccione la opción que desea realizar:')
    print('1. Editar ID del grupo')
    print('2. Editar ID del gerente')
    print('3. Eliminar cliente del grupo')
    print('4. Eliminar grupo')
    
    opcion = obtener_entero_positivo_y_cero_input('Ingrese una opción (1-4): ')
    
    if opcion == 1:
        nuevo_id_grupo = input('Ingrese el nuevo ID del grupo: ')
        query_editar_id_grupo = """
            UPDATE grupo
            SET id_grupo = %s
            WHERE id_grupo = %s
        """
        cursor.execute(query_editar_id_grupo, (nuevo_id_grupo, id_grupo))
        conn.commit()
        print('ID del grupo actualizado exitosamente.')

    elif opcion == 2:
        nuevo_id_gerente = input('Ingrese el nuevo ID del gerente: ')
        query_editar_id_gerente = """
            UPDATE grupo
            SET id_gerente = %s
            WHERE id_grupo = %s
        """
        cursor.execute(query_editar_id_gerente, (nuevo_id_gerente, id_grupo))
        conn.commit()
        print('ID del gerente actualizado exitosamente.')

    elif opcion == 3:
        id_cliente = input('Ingrese el ID del cliente que desea eliminar del grupo: ')
        query_eliminar_cliente = """
            DELETE FROM detalle_grupo
            WHERE id_grupo = %s AND id_cliente = %s
        """
        cursor.execute(query_eliminar_cliente, (id_grupo, id_cliente))
        conn.commit()
        print('Cliente eliminado del grupo exitosamente.')

    elif opcion == 4:
        query_eliminar_grupo = """
            DELETE FROM grupo
            WHERE id_grupo = %s
        """
        cursor.execute(query_eliminar_grupo, (id_grupo,))
        conn.commit()
        print('Grupo eliminado exitosamente.')
    else:
        print('Opción no válida.')


    print('Añadir Nueva Concesionaria')
    
    id_concesionaria = input('Ingrese el id de la concesionaria: ')
    nombre = input('Ingrese el nombre de la concesionaria: ')
    telefono = verificador_telefono('Ingrese el teléfono de la concesionaria: ')
    email = input('Ingrese el email de la concesionaria: ')
    calle_principal = input('Ingrese la calle principal de la concesionaria: ')
    calle_secundaria = input('Ingrese la calle secundaria de la concesionaria: ')
    
    query_insertar_concesionaria = """
        INSERT INTO concesionaria (id_concesionaria, nombre, telefono, email, calle_principal, calle_secundaria)
        VALUES (%s, %s, %s, %s, %s, %s)
    """
    cursor.execute(query_insertar_concesionaria, (id_concesionaria, nombre, telefono, email, calle_principal, calle_secundaria))
    conn.commit()
    print('Concesionaria añadida exitosamente.')

    # Función para consultar y/o editar un cliente
    def revisar_o_editar_cliente():
        # Consultar la lista de clientes del vendedor
        query_clientes = """
            SELECT cedula, nombre, apellido 
            FROM cliente 
            WHERE id_vendedor = %s
        """
        cursor.execute(query_clientes, (cedulaVendedor,))
        clientes = cursor.fetchall()
        tabla_clientes = []
        for i, (cedula, nombre, apellido) in enumerate(clientes, start=1):
            tabla_clientes.append([i, nombre, apellido, cedula])
        headers = ['Número', 'Nombre', 'Apellido', 'Cédula']

        if tabla_clientes:
            print("Lista de Clientes:")
            print(tabulate(tabla_clientes, headers=headers, tablefmt='fancy_grid'))
            try:
                seleccion = int(input("Selecciona el número del cliente: "))
                if 1 <= seleccion <= len(clientes):
                    cedulaSeleccionada = clientes[seleccion - 1][0]
                    print(f"\nDetalles del Cliente Seleccionado:")
                    print(f"Nombre: {clientes[seleccion - 1][1]} {clientes[seleccion - 1][2]}")
                    print(f"Cédula: {cedulaSeleccionada}")

                    # Menú para consultar o editar
                    opciones = ["Consultar Cliente", "Editar o Eliminar Cliente", "Salir"]
                    imprimir_menu(opciones)
                    opcion = obtener_entero_positivo_y_cero_input("Seleccione una opción: ")

                    if opcion == 1:
                        # Solo consulta de datos
                        query_proformas = """
                            SELECT p.id_proforma, p.marca, p.costo, c.nombre AS concesionaria_nombre
                            FROM proforma p
                            JOIN concesionaria c ON p.id_concesionaria = c.id_concesionaria
                            WHERE p.cedula_cliente = %s
                        """
                        cursor.execute(query_proformas, (cedulaSeleccionada,))
                        proformas = cursor.fetchall()
                        tabla_proformas = []
                        for id_proforma, marca, costo, concesionaria_nombre in proformas:
                            tabla_proformas.append([id_proforma, concesionaria_nombre, marca, costo])
                        headers_proformas = ['ID Proforma', 'Nombre Concesionaria', 'Marca', 'Costo']
                        if tabla_proformas:
                            print("\nProformas Asociadas:")
                            print(tabulate(tabla_proformas, headers=headers_proformas, tablefmt='fancy_grid'))
                        else:
                            print("No hay proformas asociadas a este cliente.")
                    
                    elif opcion == 2:
                        # Edición de cliente
                        print('Campos disponibles para editar:')
                        print('1. Calle Principal')
                        print('2. Calle Secundaria')
                        print('3. Email')
                        print('4. Teléfono')
                        print('5. Nombre')
                        print('6. Apellido')
                        campo = obtener_entero_positivo_y_cero_input('Seleccione el campo que desea modificar (1-6): ')

                        if campo in [1, 2, 3, 4, 5, 6]:
                            nuevo_valor = input('Ingrese el nuevo valor: ')
                            campos = ['calle_principal', 'calle_secundaria', 'email', 'telefono', 'nombre', 'apellido']
                            campo_actualizar = campos[campo-1]
                            query_actualizar_cliente = f"UPDATE cliente SET {campo_actualizar} = %s WHERE cedula = %s"
                            cursor.execute(query_actualizar_cliente, (nuevo_valor, cedulaSeleccionada))
                            conn.commit()
                            print('Datos del cliente actualizados exitosamente.')
                        
                        # Submenú para eliminar cliente
                        print("¿Desea eliminar este cliente?")
                        eliminar_opcion = input("Escriba 'si' para eliminar o 'no' para salir: ").strip().lower()
                        if eliminar_opcion == 'si':
                            query_eliminar_cliente = "DELETE FROM cliente WHERE cedula = %s"
                            cursor.execute(query_eliminar_cliente, (cedulaSeleccionada,))
                            conn.commit()
                            print('Cliente eliminado exitosamente.')

                    elif opcion == 3:
                        print('Saliendo...')
                        return
                else:
                    print("Número de selección inválido.")
            except ValueError:
                print("Entrada inválida. Por favor, introduce un número entero.")
        else:
            print("No se encontraron clientes para el vendedor con cédula proporcionada.")
def revisar_grupos(cursor, cedulaGerente):
    query = """
    SELECT g.id_grupo, g.id_gerente, g.Chanchito, g.Precio_desde, g.Precio_hasta, g.Tipo
    FROM GRUPO g
    WHERE g.id_gerente = %s
    """
    cursor.execute(query, (cedulaGerente,))
    results = cursor.fetchall()
    column_names = ['ID Grupo', 'ID Gerente', 'Chanchito', 'Precio Desde', 'Precio Hasta', 'Tipo']
    print(tabulate(results, headers=column_names, tablefmt='grid'))

def mostrar_ventas_anuales(cursor):
    query = "SELECT * FROM ventas_anuales_por_vendedor"
    cursor.execute(query)
    results = cursor.fetchall()
    column_names = [desc[0] for desc in cursor.description]
    print(tabulate(results, headers=column_names, tablefmt='grid'))

def mostrar_contratos_en_curso(cursor):
    query = "SELECT * FROM contratos_en_curso"
    cursor.execute(query)
    results = cursor.fetchall()
    column_names = [desc[0] for desc in cursor.description]
    print(tabulate(results, headers=column_names, tablefmt='grid'))

def insertar_cuota(cursor, conn, id_cuota, id_cliente, id_contrato, valor_cuota, fecha_pago):
    try:
        cursor.callproc('InsertarCuota', (id_cuota, id_cliente, id_contrato, valor_cuota, fecha_pago))
        conn.commit()
        print('Cuota añadida exitosamente.')
    except mysql.connector.Error as err:
        if err.errno == 1644:
            print(f"Error: {err.msg}")
        else:
            print(f"Error inesperado: {err}")
        conn.rollback()

menu_principal = ["Ingresar como Gerente", "Ingresar como Vendedor", "Consulta Externa", "Salir"]
menu_gerente = ['Añadir Vendedor', 'Gestionar Concesionaria', 'Gestionar Grupos', 'Revisar Ventas', 'Revisar Vendedores', 'Gestionar Proformas', 'Revisar Contratos','Salir']
menu_vendedor = ['Añadir Cliente', 'Revisar Cliente', 'Gestionar Cuotas', 'Salir']


opcion = 0
while opcion != 3:
    imprimir_menu(menu_principal)
    opcion = obtener_entero_positivo_y_cero_input('Ingrese una opción: ')
    while opcion not in [1, 2, 3]:
        opcion = obtener_entero_positivo_y_cero_input('Ingrese una opción válida (1, 2, 3): ')

    if opcion == 1:
        cedulaGerente = verificador_cedula('Ingresa tu cédula para continuar: ')
        while True:
            print('Menu Gerente')
            imprimir_menu(menu_gerente)
            opcionG = obtener_entero_positivo_y_cero_input('Ingrese una opción: ')
            while opcionG not in [1, 2, 3, 4, 5, 6, 7, 8, 9]:
                opcionG = obtener_entero_positivo_y_cero_input('Ingrese una opción válida (1, 2, 3, 4, 5, 6, 7, 8, 9): ')

            if opcionG == 1:
                print("Añadir empleados")
                print("Completa los siguientes campos para continuar: ")
                cedula = verificador_cedula("Cedula: ")
                telefono = verificador_telefono
                id_gerente = cedulaGerente
                nombre = input("Nombre: ")
                apellido = input("Apellido: ")
                email = input('Email: ')
                insertar_empleado(cursor, conn, cedula, nombre, apellido, telefono, email, id_gerente)
            elif opcionG == 2:
                print('Seleccione la acción deseada:')
                print('1. Añadir Concesionaria')
                print('2. Modificar Concesionaria')
                accion = obtener_entero_positivo_y_cero_input('Ingrese una opción (1-2): ')
                
                if accion == 1:
                    nombre = input("Nombre de la concesionaria: ")
                    telefono = verificador_telefono("Telefono: ")
                    email = input('Email: ')
                    id_concesionaria = input("ID de la concesionaria: ")
                    calle_principal = input("Calle principal: ")
                    calle_secundaria = input("Calle secundaria: ")
                    insertar_concesionaria(cursor, conn, id_concesionaria, nombre, telefono, email, calle_principal, calle_secundaria)
                elif accion == 2:
                    id_concesionaria = input("ID de la concesionaria: ")
                    nombre = input("Nombre de la concesionaria: ")
                    telefono = verificador_telefono("Telefono: ")
                    email = input('Email: ')
                    calle_principal = input("Calle principal: ")
                    calle_secundaria = input("Calle secundaria: ")
                    actualizar_concesionaria(cursor, conn, id_concesionaria, nombre, telefono, email, calle_principal, calle_secundaria)
                else:
                    print('Opción no válida.')
            elif opcionG == 3:
                print('Seleccione la acción deseada:')
                print('1. Mostrar Grupos')
                print('2. Crear Grupos')
                accion = obtener_entero_positivo_y_cero_input('Ingrese una opción (1-2): ')
                
                if accion == 1:
                    cedulaGerente = input("Ingrese la cédula del gerente: ")
                    revisar_grupos(cursor, cedulaGerente)
                elif accion == 2:
                    id_grupo = int(input("Ingrese el ID del grupo: "))
                    chanchito = 0
                    precio_desde = float(input("Ingrese el precio desde: "))
                    precio_hasta = float(input("Ingrese el precio hasta: "))
                    id_gerente = cedulaGerente
                    insertar_grupo(cursor, conn, id_grupo, id_gerente, chanchito, precio_desde, precio_hasta)
                else:
                    print('Opción no válida.')
            elif opcionG == 4:
                mostrar_ventas_anuales(cursor)
            elif opcionG == 5:
                print('Para revisar vendedores presione: 1')
                print('Para editar vendedores presione: 2')
                print('Para eliminar vendedores presione: 3')
                print('Salir presione 4')
                opcionG5 = obtener_entero_positivo_y_cero_input('Escoja una opcion: ')
                if opcionG5 == 1:
                    print('Lista Vendedores')
                elif opcionG5 == 2:
                        print("Completa los siguientes campos para continuar: ")
                        cedula = verificador_cedula("Cedula: ")
                        telefono = verificador_telefono
                        id_gerente = cedulaGerente
                        nombre = input("Nombre: ")
                        apellido = input("Apellido: ")
                        email = input('Email: ')
                        actualizar_empleado(cursor, conn, cedula, nombre, apellido, telefono, email)

                elif opcionG5 == 3:
                    cedula = verificador_cedula("Cedula: ")
                    eliminar_empleado(cursor, conn, cedula)
                elif opcionG5 ==4:
                    pass
            elif opcionG == 6:
                print('Seleccione la acción deseada:')
                print('1. Añadir Proformas')
                print('2. Modificar Proforma')
                print('3 Eliminar proforma')
                accion = obtener_entero_positivo_y_cero_input('Ingrese una opción (1-3): ')
                if accion == 1:
                    id_proforma = int(input("Ingrese el ID de la proforma: "))
                    id_concesionaria = input("Ingrese el ID de la concesionaria: ")
                    fecha = input("Ingrese la fecha (YYYY-MM-DD): ")
                    modelo = input("Ingrese el modelo: ")
                    marca = input("Ingrese la marca: ")
                    color = input("Ingrese el color: ")
                    costo = float(input("Ingrese el costo: "))
                    anio = int(input("Ingrese el año: "))
                    insertar_proforma(cursor, conn, id_proforma, id_concesionaria, fecha, modelo, marca, color, costo, anio)
                elif accion == 2:
                    id_proforma = int(input("Ingrese el ID de la proforma: "))
                    id_concesionaria = input("Ingrese el ID de la concesionaria: ")
                    fecha = input("Ingrese la fecha (YYYY-MM-DD): ")
                    modelo = input("Ingrese el modelo: ")
                    marca = input("Ingrese la marca: ")
                    color = input("Ingrese el color: ")
                    costo = float(input("Ingrese el costo: "))
                    anio = int(input("Ingrese el año: "))
                    actualizar_proforma(cursor, conn, id_proforma, id_concesionaria, fecha, modelo, marca, color, costo, anio)
                elif accion == 3:
                    id_proforma = int(input("Ingrese el ID de la proforma a eliminar: "))
                    eliminar_proforma(cursor, conn, id_proforma)
                else:
                    print('Opción no válida.')
            if opcionG == 7:
                print('Revisar Contratos')
                mostrar_contratos_en_curso(cursor)
            elif opcionG == 8:
                print('Saliendo...')
                break
            salir_menu_gerente = input('¿Desea salir del menú Gerente? (s/n): ').strip().lower()
            if salir_menu_gerente == 's':
                print('Saliendo...')
                break

    elif opcion == 2:
        cedulaVendedor = verificador_cedula('Ingresa tu cédula para continuar: ')
        while True:
            imprimir_menu(menu_vendedor)
            opcionV = obtener_entero_positivo_y_cero_input('Ingrese una opción: ')
            while opcionV not in [1, 2, 3, 4]:
                opcionV = obtener_entero_positivo_y_cero_input('Ingrese una opción válida (1, 2, 3, 4): ')

            if opcionV == 1:
                print('Añadir Cliente')
                print('Escriba los datos del cliente aqui: ')
                cedula = verificador_cedula('Cedula cliente: ')
                query_check = "SELECT COUNT(*) FROM cliente WHERE cedula = %s"
                cursor.execute(query_check, (cedula,))
                resultado = cursor.fetchone()

                if resultado[0] > 0:
                    print('El cliente con esta cédula ya existe en la base de datos.')
                else:
                    calle_principal = input('Calle Principal: ')
                    calle_secundaria = input('Calle Secundaria: ')
                    email = input('Email: ')
                    telefono = verificador_telefono('Teléfono: ')
                    nombre = input('Nombre: ')
                    apellido = input('Apellido: ')
                    id_vendedor = cedulaVendedor
                    insertar_cliente(cursor, conn, cedula, calle_principal, calle_secundaria, email, telefono, nombre, apellido, id_vendedor)
                    print('Cliente añadido existosamente.')
                    # Añadir datos del garante
                    print('----Informacion del Garante----')
                    cedulaGarante = verificador_cedula('Cedula del Garante: ')

                    check_garante_query = """
                    SELECT cedula FROM garante WHERE cedula = %s
                    """
                    cursor.execute(check_garante_query, (cedulaGarante,))
                    resultado = cursor.fetchone()

                    if resultado:
                        print('El garante con esta cédula ya existe en la base de datos.')
                    else:
                        cedula = cedulaGarante
                        nombres = input('Nombre: ')
                        apellidos = input('Apellido: ')
                        id_participante = verificador_cedula("Cedula cliente: ")
                        telefono = verificador_telefono("Telefono: ")
                        email = input('Email: ')
                        insertar_garante(cursor, conn, cedula, id_participante, nombres, apellidos, telefono, email)
                        print('Garante añadido exitosamente.')
                    print('---Generacion de contrato---')
                    print('Elija una proforma')
                    query_proformas = """
                        SELECT p.id_proforma, c.nombre AS concesionaria_nombre, 
                               p.fecha, p.modelo, p.marca, p.color, p.costo, p.anio
                        FROM proforma p
                        JOIN concesionaria c ON p.id_concesionaria = c.id_concesionaria;
                    """
                    cursor.execute(query_proformas)
                    proformas = cursor.fetchall()
                    tabla_proformas = []
                    for i, (id_proforma, concesionaria_nombre, fecha, modelo, marca, color, costo, anio) in enumerate(
                            proformas, start=1):
                        tabla_proformas.append(
                            [i, id_proforma, concesionaria_nombre, fecha, modelo, marca, color, costo, anio])
                    headers = ['Nº', 'ID Proforma', 'Concesionaria', 'Fecha', 'Modelo', 'Marca', 'Color', 'Costo',
                               'Año']
                    if tabla_proformas:
                        print('Proformas')
                        print(tabulate(tabla_proformas, headers=headers, tablefmt='fancy_grid'))
                        seleccion = obtener_entero_positivo_y_cero_input('Selecciona el número de la proforma: ')
                        if 1 <= seleccion <= len(proformas):
                            id_proforma_seleccionada = proformas[seleccion - 1][0]
                            costo_seleccionado = proformas[seleccion - 1][6]
                            print(f"ID de la Proforma Seleccionada: {id_proforma_seleccionada}")
                            print(f"Costo de la Proforma Seleccionada: {costo_seleccionado}")
                        else:
                            print("Número de selección inválido.")
                    else:
                        print("No se encontraron proformas en la base de datos.")

                    descripcion = 'Bla bla cosas legales que solo los abogados y notarios entienden bla bla'
                    id_contrato = obtener_entero_positivo_y_cero_input('ID del Contrato: ')
                    id_gerente = input('Cedula de tu gerente: ')
                    id_garante = cedulaGarante
                    id_cliente = cedula
                    cuotas_totales = obtener_entero_positivo_y_cero_input('Cuantas cuotas pagara: ')
                    valor_cuota = float(costo_seleccionado) / cuotas_totales
                    print('Escriba la fecha en el siguiente formato: año-mes-dia')
                    fecha_firma = input('Fecha: ')
                    estado = 'Pendiente'
                    id_vendedor = cedulaVendedor
                    id_proforma = id_proforma_seleccionada
                    insertar_contrato(cursor, conn, id_contrato, id_gerente, id_garante, id_cliente, id_proforma, descripcion, cuotas_totales, valor_cuota, fecha_firma, estado, id_vendedor)
                    print('Contrato generado exitosamente.')
                    pass
            elif opcionV == 2:
                actualizar_cliente(cursor, conn, cedula)
            elif opcionV == 3:
                print('Añadir cuota: ')
                id_cuota = obtener_entero_positivo_y_cero_input('ID de la Cuota: ')
                id_cliente = verificador_cedula('Cédula del Cliente: ')
                id_contrato = obtener_entero_positivo_y_cero_input('ID del Contrato: ')
                valor_cuota = float(input('Valor de la Cuota: '))
                print('Escriba la fecha en el siguiente formato: año-mes-día')
                fecha_pago_input = input('Fecha de Pago: ')
            
                try:
                    # Convertir la fecha al formato adecuado
                    fecha_pago = tm.strftime('%Y-%m-%d', tm.strptime(fecha_pago_input, '%Y-%m-%d'))
                except ValueError:
                    print('Fecha en formato incorrecto. Debe ser en el formato año-mes-día.')
                    fecha_pago = None

                if fecha_pago:
                    insertar_cuota(cursor, conn, id_cuota, id_cliente, id_contrato, valor_cuota, fecha_pago)
            elif opcionV == 4:
                print('Saliendo...')
                break
            salir_menu_vendedor = input('¿Desea salir del menú Vendedor? (s/n): ').strip().lower()
            if salir_menu_vendedor == 's':
                print('Saliendo...')
                break

    elif opcion == 3:
        consulta_externa()

    elif opcion == 4:
        print('Salir')
        break

