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
        print(f"Error: {err}")
        conn.rollback()


def actualizar_cliente(cursor, conn, cedula, calle_principal, calle_secundaria, email, telefono, nombre, apellido):
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

def revisar_grupos(cursor, cedulaGerente):
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



def editar_o_eliminar_grupo(cursor, conn, cedulaGerente):
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


def modificar_concesionaria(cursor, conn):
    print("Lista de Concesionarias")
    query_lista_concesionarias = """
        SELECT id_concesionaria, nombre FROM concesionaria
    """
    cursor.execute(query_lista_concesionarias)
    concesionarias = cursor.fetchall()
    
    if not concesionarias:
        print("No hay concesionarias disponibles.")
        return

    headers = ['ID Concesionaria', 'Nombre']
    print(tabulate(concesionarias, headers=headers, tablefmt='fancy_grid'))

    id_concesionaria = input('Ingrese el ID de la concesionaria que desea modificar: ')

    query_verificar_concesionaria = "SELECT COUNT(*) FROM concesionaria WHERE id_concesionaria = %s"
    cursor.execute(query_verificar_concesionaria, (id_concesionaria,))
    existe_concesionaria = cursor.fetchone()[0]

    if not existe_concesionaria:
        print('No se encontró una concesionaria con el ID especificado.')
        return

    print('Campos disponibles para editar:')
    print('1. Nombre')
    print('2. Teléfono')
    print('3. Email')
    print('4. Calle Principal')
    print('5. Calle Secundaria')

    campo = obtener_entero_positivo_y_cero_input('Seleccione el campo que desea modificar (1-5): ')

    if campo in [1, 2, 3, 4, 5]:
        if campo == 1:
            nuevo_valor = input('Ingrese el nuevo nombre de la concesionaria: ')
            campo_actualizar = 'nombre'
        elif campo == 2:
            nuevo_valor = verificador_telefono('Ingrese el nuevo teléfono de la concesionaria: ')
            campo_actualizar = 'telefono'
        elif campo == 3:
            nuevo_valor = input('Ingrese el nuevo email de la concesionaria: ')
            campo_actualizar = 'email'
        elif campo == 4:
            nuevo_valor = input('Ingrese la nueva calle principal de la concesionaria: ')
            campo_actualizar = 'calle_principal'
        elif campo == 5:
            nuevo_valor = input('Ingrese la nueva calle secundaria de la concesionaria: ')
            campo_actualizar = 'calle_secundaria'

        query_actualizar_concesionaria = f"""
            UPDATE concesionaria
            SET {campo_actualizar} = %s
            WHERE id_concesionaria = %s
        """
        cursor.execute(query_actualizar_concesionaria, (nuevo_valor, id_concesionaria))
        conn.commit()
        print('Datos de la concesionaria actualizados exitosamente.')
    else:
        print('Opción no válida.')
def añadir_concesionaria(cursor, conn):
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

def modificar_empleado(cursor, conn, cedulaGerente):
    print("Lista de Empleados")
    query_lista_empleados = """
        SELECT cedula, nombre, apellido FROM empleado
    """
    cursor.execute(query_lista_empleados)
    empleados = cursor.fetchall()
    
    if not empleados:
        print("No hay empleados disponibles.")
        return

    headers = ['Cédula', 'Nombre', 'Apellido']
    print(tabulate(empleados, headers=headers, tablefmt='fancy_grid'))

    cedula_empleado = input('Ingrese la cédula del empleado que desea modificar: ')

    query_verificar_empleado = "SELECT COUNT(*) FROM empleado WHERE cedula = %s"
    cursor.execute(query_verificar_empleado, (cedula_empleado,))
    existe_empleado = cursor.fetchone()[0]

    if not existe_empleado:
        print('No se encontró un empleado con la cédula especificada.')
        return

    print('Campos disponibles para editar:')
    print('1. Nombre')
    print('2. Apellido')
    print('3. Teléfono')
    print('4. Email')

    campo = obtener_entero_positivo_y_cero_input('Seleccione el campo que desea modificar (1-4): ')

    if campo in [1, 2, 3, 4]:
        if campo == 1:
            nuevo_valor = input('Ingrese el nuevo nombre del empleado: ')
            campo_actualizar = 'nombre'
        elif campo == 2:
            nuevo_valor = input('Ingrese el nuevo apellido del empleado: ')
            campo_actualizar = 'apellido'
        elif campo == 3:
            nuevo_valor = verificador_telefono('Ingrese el nuevo teléfono del empleado: ')
            campo_actualizar = 'telefono'
        elif campo == 4:
            nuevo_valor = input('Ingrese el nuevo email del empleado: ')
            campo_actualizar = 'email'

        query_actualizar_empleado = f"""
            UPDATE empleado
            SET {campo_actualizar} = %s
            WHERE cedula = %s
        """
        cursor.execute(query_actualizar_empleado, (nuevo_valor, cedula_empleado))
        conn.commit()
        print('Datos del empleado actualizados exitosamente.')
    else:
        print('Opción no válida.')

def añadir_empleado(cursor, conn, cedulaGerente):
    print('Añadir Nuevo Empleado')

    cedula = verificador_cedula('Ingrese la cédula del empleado (10 caracteres): ')
    nombre = input('Ingrese el nombre del empleado: ')
    apellido = input('Ingrese el apellido del empleado: ')
    email = input('Ingrese el email del empleado: ')
    telefono = verificador_telefono('Ingrese el teléfono del empleado: ')
    id_gerente = cedulaGerente

    query_insertar_empleado = """
        INSERT INTO empleado (cedula, nombre, apellido, email, telefono, id_gerente)
        VALUES (%s, %s, %s, %s, %s, %s)
    """
    cursor.execute(query_insertar_empleado, (cedula, nombre, apellido, email, telefono, id_gerente))
    conn.commit()
    print('Empleado añadido exitosamente.')

def añadir_proforma(cursor, conn):
    print('----Añadir Proformas-----')
    cuantas = obtener_entero_positivo_y_cero_input('Cuántas proformas añadirá: ')
    
    for i in range(cuantas):
        query = "SELECT id_concesionaria FROM concesionaria"
        cursor.execute(query)
        ids_concesionarias = cursor.fetchall()
        
        if not ids_concesionarias:
            print('No hay concesionarias disponibles para añadir una proforma.')
            return
        
        print('ID de las concesionarias disponibles:')
        for id_concesionaria in ids_concesionarias:
            print(id_concesionaria[0])
        
        id_concesionaria = obtener_entero_positivo_y_cero_input('ID de la Concesionaria: ')
        id_proforma = obtener_entero_positivo_y_cero_input('ID Proforma: ')
        
        print('Escriba la fecha en el siguiente formato: año-mes-día')
        fecha_str = input('Fecha: ')
        modelo = input('Modelo: ')
        marca = input('Marca: ')
        color = input('Color: ')
        costo = obtener_float_positivo_input('Costo en dólares: ')
        año = obtener_entero_positivo_y_cero_input('Año: ')
        
        add_proforma = """
            INSERT INTO proforma
            (id_proforma, id_concesionaria, fecha, modelo, marca, color, costo, anio)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
        """
        data_proforma = (id_proforma, id_concesionaria, fecha_str, modelo, marca, color, costo, año)
        cursor.execute(add_proforma, data_proforma)
        conn.commit()
        print(f'Proforma {id_proforma} añadida exitosamente.')

def modificar_o_eliminar_proforma(cursor, conn):
    query_proformas = "SELECT id_proforma, id_concesionaria, fecha, modelo, marca, color, costo, anio FROM proforma"
    cursor.execute(query_proformas)
    proformas = cursor.fetchall()
    
    if not proformas:
        print('No hay proformas disponibles.')
        return
    
    headers = ['ID Proforma', 'ID Concesionaria', 'Fecha', 'Modelo', 'Marca', 'Color', 'Costo', 'Año']
    print(tabulate(proformas, headers=headers, tablefmt='fancy_grid'))
    

    id_proforma = input('Ingrese el ID de la proforma que desea modificar o eliminar: ')
    
    query_verificar_proforma = "SELECT COUNT(*) FROM proforma WHERE id_proforma = %s"
    cursor.execute(query_verificar_proforma, (id_proforma,))
    existe_proforma = cursor.fetchone()[0]
    
    if not existe_proforma:
        print('No se encontró una proforma con el ID especificado.')
        return
    
    print('Seleccione la opción que desea realizar:')
    print('1. Modificar ID de la proforma')
    print('2. Modificar ID de la concesionaria')
    print('3. Modificar Fecha')
    print('4. Modificar Modelo')
    print('5. Modificar Marca')
    print('6. Modificar Color')
    print('7. Modificar Costo')
    print('8. Modificar Año')
    print('9. Eliminar proforma')
    
    opcion = obtener_entero_positivo_y_cero_input('Ingrese una opción (1-9): ')
    
    if opcion == 9:
        query_eliminar_proforma = "DELETE FROM proforma WHERE id_proforma = %s"
        cursor.execute(query_eliminar_proforma, (id_proforma,))
        conn.commit()
        print('Proforma eliminada exitosamente.')
        return

    if opcion == 1:
        campo = 'id_proforma'
        nuevo_valor = input('Ingrese el nuevo ID de la proforma: ')
    elif opcion == 2:
        campo = 'id_concesionaria'
        nuevo_valor = input('Ingrese el nuevo ID de la concesionaria: ')
    elif opcion == 3:
        campo = 'fecha'
        nuevo_valor = input('Ingrese la nueva fecha en el formato año-mes-día: ')
    elif opcion == 4:
        campo = 'modelo'
        nuevo_valor = input('Ingrese el nuevo modelo: ')
    elif opcion == 5:
        campo = 'marca'
        nuevo_valor = input('Ingrese la nueva marca: ')
    elif opcion == 6:
        campo = 'color'
        nuevo_valor = input('Ingrese el nuevo color: ')
    elif opcion == 7:
        campo = 'costo'
        nuevo_valor = obtener_float_positivo_input('Ingrese el nuevo costo en dólares: ')
    elif opcion == 8:
        campo = 'anio'
        nuevo_valor = obtener_entero_positivo_y_cero_input('Ingrese el nuevo año: ')
    else:
        print('Opción no válida.')
        return
    
    query_modificar_proforma = f"UPDATE proforma SET {campo} = %s WHERE id_proforma = %s"
    cursor.execute(query_modificar_proforma, (nuevo_valor, id_proforma))
    conn.commit()
    print(f'{campo} de la proforma actualizado exitosamente.')

def cobrar_cuota(cursor, conn):
    print('----Cobro de Cuotas-----')

    id_cliente = input('Ingrese el ID del cliente: ')

    query_contratos_vigentes = """
        SELECT c.id_contrato, c.valor_cuota, c.descripcion, c.fecha_firma
        FROM contrato c
        WHERE c.id_cliente = %s AND c.estado = 'Vigente'
    """
    cursor.execute(query_contratos_vigentes, (id_cliente,))
    contratos = cursor.fetchall()

    if not contratos:
        print('No se encontraron contratos vigentes para el cliente especificado.')
        return

    headers = ['ID Contrato', 'Valor Cuota', 'Descripción', 'Fecha Firma']
    print(tabulate(contratos, headers=headers, tablefmt='fancy_grid'))

    id_contrato = obtener_entero_positivo_y_cero_input('Ingrese el ID del contrato que desea pagar: ')
    
    query_verificar_contrato = "SELECT COUNT(*) FROM contrato WHERE id_contrato = %s AND id_cliente = %s AND estado = 'Vigente'"
    cursor.execute(query_verificar_contrato, (id_contrato, id_cliente))
    existe_contrato = cursor.fetchone()[0]

    if not existe_contrato:
        print('No se encontró un contrato vigente con el ID especificado.')
        return

    cantidad_cuotas = obtener_entero_positivo_y_cero_input('¿Cuántas cuotas desea pagar?: ')

    query_max_id_cuota = "SELECT COALESCE(MAX(id_cuota), 0) FROM cuota"
    cursor.execute(query_max_id_cuota)
    max_id_cuota = cursor.fetchone()[0]
    nuevo_id_cuota = max_id_cuota + 1

    query_valor_cuota = "SELECT valor_cuota FROM contrato WHERE id_contrato = %s"
    cursor.execute(query_valor_cuota, (id_contrato,))
    valor_cuota = cursor.fetchone()[0]
    valor_total = valor_cuota * cantidad_cuotas

    fecha_pago_str = input('Escriba la fecha del pago en el formato año-mes-día: ')

    add_cuota = """
        INSERT INTO cuota (id_cuota, id_cliente, id_contrato, valor_cuota, fecha_pago)
        VALUES (%s, %s, %s, %s, %s)
    """
    for _ in range(cantidad_cuotas):
        data_cuota = (nuevo_id_cuota, id_cliente, id_contrato, valor_total, fecha_pago_str)
        cursor.execute(add_cuota, data_cuota)
        nuevo_id_cuota += 1
    
    conn.commit()
    print(f'{cantidad_cuotas} cuota(s) registrada(s) exitosamente.')

def ver_cuotas_pagadas(cursor):
    print('----Cuotas Pagadas-----')

    query_cuotas_pagadas = """
        SELECT id_cuota, id_cliente, id_contrato, valor_cuota, fecha_pago
        FROM cuota
    """
    cursor.execute(query_cuotas_pagadas)
    cuotas_pagadas = cursor.fetchall()

    if not cuotas_pagadas:
        print('No hay cuotas pagadas registradas.')
        return

    headers = ['ID Cuota', 'ID Cliente', 'ID Contrato', 'Valor Cuota', 'Fecha Pago']
    print(tabulate(cuotas_pagadas, headers=headers, tablefmt='fancy_grid'))

def mostrar_contratos(cursor, cedulaGerente):
    print('----Mostrar Contratos-----')

    id_gerente = cedulaGerente

    query_clientes = """
        SELECT DISTINCT c.id_cliente
        FROM contrato c
        WHERE c.id_gerente = %s
    """
    cursor.execute(query_clientes, (id_gerente,))
    clientes = cursor.fetchall()
    
    if not clientes:
        print('No se encontraron clientes para el gerente especificado.')
        return

    print('Clientes asociados al gerente:')
    for cliente in clientes:
        print(cliente[0])

    id_cliente = input('Ingrese la cédula del cliente para ver los detalles de su contrato: ')

    query_contratos = """
        SELECT id_contrato, id_proforma, descripcion, cuotas_totales, valor_cuota, fecha_firma, estado
        FROM contrato
        WHERE id_cliente = %s
    """
    cursor.execute(query_contratos, (id_cliente,))
    contratos = cursor.fetchall()
    
    if not contratos:
        print('No se encontraron contratos para el cliente especificado.')
        return
    
    headers = ['ID Contrato', 'ID Proforma', 'Descripción', 'Cuotas Totales', 'Valor Cuota', 'Fecha Firma', 'Estado']
    print(tabulate(contratos, headers=headers, tablefmt='fancy_grid'))

menu_principal = ["Ingresar como Gerente", "Ingresar como Vendedor", "Consulta Externa", "Salir"]
menu_gerente = ['Añadir Vendedor', 'Gestionar Concesionaria', 'Gestionar Grupos', 'Revisar Ventas', 'Revisar Vendedores', 'Gestionar Proformas', 'Revisar Contratos','Modificar Empleados','Salir']
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
                añadir_empleado(cursor, conn, cedulaGerente)                   

            elif opcionG == 2:
                print('Seleccione la acción deseada:')
                print('1. Añadir Concesionaria')
                print('2. Modificar Concesionaria')
                accion = obtener_entero_positivo_y_cero_input('Ingrese una opción (1-2): ')
                
                if accion == 1:
                    añadir_concesionaria(cursor, conn)
                elif accion == 2:
                    modificar_concesionaria(cursor, conn)
                else:
                    print('Opción no válida.')

            elif opcionG == 3:
                print('Seleccione la acción deseada:')
                print('1. Mostrar Grupos')
                print('2. Editar Grupos')
                print('3. Crear Grupos')
                accion = obtener_entero_positivo_y_cero_input('Ingrese una opción (1-2): ')
                
                if accion == 1:
                    revisar_grupos(cursor, cedulaGerente)
                elif accion == 2:
                    editar_o_eliminar_grupo(cursor, conn, cedulaGerente)
                elif accion == 3:
                    crear_grupo(cursor, conn, cedulaGerente)
                else:
                    print('Opción no válida.')

            elif opcionG == 4:
                print('Ventas por Vendedor')
                query_ventas_por_vendedor = """
                    SELECT e.cedula, CONCAT(e.nombre, ' ', e.apellido) AS vendedor_nombre, COUNT(c.cedula) AS num_clientes
                    FROM empleado e
                    LEFT JOIN cliente c ON e.cedula = c.id_vendedor
                    WHERE e.id_gerente = %s
                    GROUP BY e.cedula, e.nombre, e.apellido
                """
                cursor.execute(query_ventas_por_vendedor, (cedulaGerente,))
                vendedores = cursor.fetchall()
                headers = ['Cédula Vendedor', 'Nombre Vendedor', 'Número de Clientes']
                print('Lista de Vendedores y Número de Clientes por vendedor')
                print(tabulate(vendedores, headers=headers, tablefmt='fancy_grid'))
                pass

            elif opcionG == 5:
                print('Para revisar vendedores presione: 1')
                print('Para editar vendedores presione: 2')
                print('Para eliminar vendedores presione: 3')
                print('Salir presione 4')
                opcionG5 = obtener_entero_positivo_y_cero_input('Escoja una opcion: ')
                if opcionG5 == 1:
                    print('Lista Vendedores')
                    query_lista_vendedores = """
                        SELECT e1.cedula, e1.nombre AS vendedor_nombre, e1.apellido AS vendedor_apellido, 
                               e1.email AS vendedor_email, e1.telefono AS vendedor_telefono, 
                               CONCAT(e2.nombre, ' ', e2.apellido) AS gerente_nombre
                        FROM empleado e1
                        JOIN empleado e2 ON e1.id_gerente = e2.cedula
                        WHERE e1.id_gerente = %s
                    """
                    cursor.execute(query_lista_vendedores, (cedulaGerente,))
                    vendedores = cursor.fetchall()
                    headers = ['Cédula', 'Nombre', 'Apellido', 'Email', 'Teléfono', 'Nombre Gerente']
                    print(tabulate(vendedores, headers=headers, tablefmt='fancy_grid'))
                    pass
                elif opcionG5 == 2:
                    print('Lista de Vendedores para editar')
                    query_lista_vendedores = """
                        SELECT e1.cedula, e1.nombre AS vendedor_nombre, e1.apellido AS vendedor_apellido, 
                               e1.email AS vendedor_email, e1.telefono AS vendedor_telefono
                        FROM empleado e1
                        WHERE e1.id_gerente = %s
                    """
                    cursor.execute(query_lista_vendedores, (cedulaGerente,))
                    vendedores = cursor.fetchall()
                    headers = ['Cédula', 'Nombre', 'Apellido', 'Email', 'Teléfono']
                    print(tabulate(vendedores, headers=headers, tablefmt='fancy_grid'))

                    cedula_vendedor = verificador_cedula('Ingrese la cédula del vendedor que desea editar: ')
                    query_verificar_vendedor = "SELECT COUNT(*) FROM empleado WHERE cedula = %s AND id_gerente = %s"
                    cursor.execute(query_verificar_vendedor, (cedula_vendedor, cedulaGerente))
                    existe_vendedor = cursor.fetchone()[0]

                    if existe_vendedor:
                        print('Campos disponibles para editar:')
                        print('1. Cédula')
                        print('2. Nombre')
                        print('3. Apellido')
                        print('4. Email')
                        print('5. Teléfono')
                        campo = obtener_entero_positivo_y_cero_input('Seleccione el campo que desea modificar (1-5): ')

                        if campo in [1, 2, 3, 4, 5]:
                            if campo == 1:
                                nueva_cedula = verificador_cedula('Ingrese la nueva cédula del vendedor: ')
                                query_actualizar_vendedor = """
                                    UPDATE empleado
                                    SET cedula = %s
                                    WHERE cedula = %s
                                """
                                cursor.execute(query_actualizar_vendedor, (nueva_cedula, cedula_vendedor))
                                conn.commit()
                                print('Cédula del vendedor actualizada exitosamente.')
                            else:
                                if campo == 2:
                                    nuevo_valor = input('Ingrese el nuevo nombre del vendedor: ')
                                    campo_actualizar = 'nombre'
                                elif campo == 3:
                                    nuevo_valor = input('Ingrese el nuevo apellido del vendedor: ')
                                    campo_actualizar = 'apellido'
                                elif campo == 4:
                                    nuevo_valor = input('Ingrese el nuevo email del vendedor: ')
                                    campo_actualizar = 'email'
                                elif campo == 5:
                                    nuevo_valor = input('Ingrese el nuevo teléfono del vendedor: ')
                                    campo_actualizar = 'telefono'
                                query_actualizar_vendedor = f"""
                                    UPDATE empleado
                                    SET {campo_actualizar} = %s
                                    WHERE cedula = %s
                                """
                                cursor.execute(query_actualizar_vendedor, (nuevo_valor, cedula_vendedor))
                                conn.commit()
                                print('Datos del vendedor actualizados exitosamente.')
                        else:
                            print('Opción no válida.')
                    else:
                        print('No se encontró un vendedor con la cédula especificada.')
                elif opcionG5 == 3:
                    print('Lista de Vendedores para eliminar')
                    query_lista_vendedores = """
                        SELECT e1.cedula, e1.nombre AS vendedor_nombre, e1.apellido AS vendedor_apellido, 
                               e1.email AS vendedor_email, e1.telefono AS vendedor_telefono
                        FROM empleado e1
                        WHERE e1.id_gerente = %s
                    """
                    cursor.execute(query_lista_vendedores, (cedulaGerente,))
                    vendedores = cursor.fetchall()
                    headers = ['Cédula', 'Nombre', 'Apellido', 'Email', 'Teléfono']
                    print(tabulate(vendedores, headers=headers, tablefmt='fancy_grid'))

                    cedula_vendedor = verificador_cedula('Ingrese la cédula del vendedor que desea eliminar: ')
                    query_verificar_vendedor = "SELECT COUNT(*) FROM empleado WHERE cedula = %s AND id_gerente = %s"
                    cursor.execute(query_verificar_vendedor, (cedula_vendedor, cedulaGerente))
                    existe_vendedor = cursor.fetchone()[0]

                    if existe_vendedor:
                        query_eliminar_vendedor = "DELETE FROM empleado WHERE cedula = %s"
                        cursor.execute(query_eliminar_vendedor, (cedula_vendedor,))
                        conn.commit()
                        print('Vendedor eliminado exitosamente.')
                    else:
                        print('No se encontró un vendedor con la cédula especificada.')

                elif opcionG5 ==4:
                    pass


            elif opcionG == 6:
                print('Seleccione la acción deseada:')
                print('1. Añadir Proformas')
                print('2. Modificar o Eliminar Proforma')
                accion = obtener_entero_positivo_y_cero_input('Ingrese una opción (1-2): ')

                if accion == 1:
                    añadir_proforma(cursor, conn)
                elif accion == 2:
                    modificar_o_eliminar_proforma(cursor, conn)
                else:
                    print('Opción no válida.')

            elif opcionG == 7:
                print('Revisar Contratos')
                mostrar_contratos(cursor, cedulaGerente)
            
            elif opcionG == 8:
                modificar_empleado(cursor, conn, cedulaGerente)

            elif opcionG == 9:
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
                
                # Verificar si el cliente ya existe
                query_check = "SELECT COUNT(*) FROM cliente WHERE cedula = %s"
                cursor.execute(query_check, (cedula,))
                resultado = cursor.fetchone()

                if resultado[0] > 0:
                    print('El cliente con esta cédula ya existe en la base de datos.')
                else:
                    # Solicitar datos del cliente
                    calle_principal = input('Calle Principal: ')
                    calle_secundaria = input('Calle Secundaria: ')
                    email = input('Email: ')
                    telefono = verificador_telefono('Teléfono: ')
                    nombre = input('Nombre: ')
                    apellido = input('Apellido: ')
                    id_vendedor = cedulaVendedor

                    # Insertar cliente en la base de datos
                    add_cliente = ("INSERT INTO cliente "
                                         "(cedula, calle_principal, calle_secundaria, "
                                   "email, telefono, nombre, apellido, id_vendedor) "
                                         "VALUES (%s, %s, %s, %s, %s, %s, %s, %s)")
                    data_cliente = (cedula, calle_principal, calle_secundaria, email,
                                    telefono, nombre, apellido, id_vendedor)
                    cursor.execute(add_cliente, data_cliente)
                    conn.commit()
                    print('Cliente añadido existosamente.')

                    # Añadir datos del garante
                    print('----Informacion del Garante----')
                    cedulaGarante = verificador_cedula('Cedula del Garante: ')
                    nombreGarante = input('Nombre: ')
                    apellidoGarante = input('Apellido: ')
                    telefonoGarante = input('Telefono: ')
                    emailGarante = input('Email: ')

                    # Verificar si el garante ya existe
                    check_garante_query = """
                    SELECT cedula FROM garante WHERE cedula = %s
                    """
                    cursor.execute(check_garante_query, (cedulaGarante,))
                    resultado = cursor.fetchone()

                    if resultado:
                        print('El garante con esta cédula ya existe en la base de datos.')
                    else:
                        # Insertar garante en la base de datos
                        add_garante_query = """
                        INSERT INTO garante (cedula, id_participante, nombres, apellidos, telefono, email)
                        VALUES (%s, %s, %s, %s, %s, %s)
                        """
                        data_garante = (cedulaGarante, cedula, nombreGarante, apellidoGarante, telefonoGarante, emailGarante)
                        cursor.execute(add_garante_query, data_garante)
                        conn.commit()
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

                    add_contrato = """
                    INSERT INTO contrato (
                        id_contrato, id_gerente, id_garante, id_cliente, id_proforma, descripcion, 
                        cuotas_totales, valor_cuota, fecha_firma, estado, id_vendedor
                    ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
                    """
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
                    data_contrato = (
                    id_contrato, id_gerente, id_garante, id_cliente, id_proforma_seleccionada, descripcion,
                    cuotas_totales, valor_cuota, fecha_firma, estado, id_vendedor)
                    cursor.execute(add_contrato, data_contrato)
                    conn.commit()
                    print('Contrato generado exitosamente.')
                    pass
            elif opcionV == 2:
                revisar_o_editar_cliente()
            elif opcionV == 3:
                print('Seleccione la acción deseada:')
                print('1. Cobrar Cuota')
                print('2. Mostrar Cuotas')
                accion = obtener_entero_positivo_y_cero_input('Ingrese una opción (1-2): ')
                if accion == 1:
                    cobrar_cuota(cursor, conn)
                elif accion == 2:
                    ver_cuotas_pagadas(cursor)
                else:
                    print('Opción no válida.')
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

