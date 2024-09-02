import mysql.connector
from tabulate import tabulate
import random
import time as tm
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

def eliminar_cliente(cursor, conn, cedula):
    try:
        cursor.callproc('EliminarCliente', (cedula,))
        conn.commit()
        print('Cliente eliminado exitosamente.')
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        conn.rollback()
def imprimir_menu(opciones):
    for i, opcion in enumerate(opciones, 1):
        print(f"{i}. {opcion}")

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
        if err.errno == 1644:  # 1644 es el código de error para SIGNAL SQLSTATE '45000'
            print(f"Error: {err.msg}")
        else:
            print(f"Error inesperado: {err}")
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

def consulta_externa(cursor):
    cedula = verificador_cedula("Ingrese su cédula: ")
    print("Seleccione una opción:")
    print("0. Ver contratos")
    print("1. Ver pagos")
    opcion = obtener_entero_positivo_y_cero_input("Ingrese el número de la opción deseada: ")
    try:
        if opcion == 0:
            cursor.callproc('consultaCliente', [cedula])
            result = cursor.stored_results()
            for r in result:
                rows = r.fetchall()
                print(tabulate(rows, headers=[i[0] for i in r.description], tablefmt='fancy_grid'))
        
        elif opcion == 1:
            id_contrato = input("Ingrese el ID del contrato: ")
            cursor.callproc('consultasPagos', [cedula, id_contrato])
            result = cursor.stored_results()
            for r in result:
                rows = r.fetchall()
                print(tabulate(rows, headers=[i[0] for i in r.description], tablefmt='fancy_grid'))
        else:
            print("Opción no válida.")
    except mysql.connector.Error as err:
        print(f"Error: {err}")
    pass


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


def mostrar_modelos_mascotizados(cursor):
    try:
        cursor.execute("SELECT * FROM modelosmascotizados")
        rows = cursor.fetchall()
        headers = [i[0] for i in cursor.description]
        print(tabulate(rows, headers=headers, tablefmt='grid'))
    except mysql.connector.Error as err:
        print(f"Error: {err}")

menu_principal = ["Ingresar como Gerente", "Ingresar como Vendedor", "Consulta Externa", "Salir"]
menu_gerente = ['Añadir Vendedor', 'Gestionar Concesionaria', 'Gestionar Grupos', 'Revisar Ventas', 'Revisar Vendedores', 'Gestionar Proformas', 'Revisar Contratos','Salir']
menu_vendedor = ['Añadir Cliente', 'Actualizar Cliente', 'Gestionar Cuotas', 'Revisar Top models','Salir']


opcion = 0
while opcion != 3:
    print("1 Gerente")
    print("2 Empleado")
    print("3 Consulta Externa")
    print("4 Salir")
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
                opcionV = obtener_entero_positivo_y_cero_input('Ingrese una opción válida (1, 2, 3, 4, 5): ')

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
                cedula = verificador_cedula("Cedula: ")
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
                    fecha_pago = tm.strftime('%Y-%m-%d', tm.strptime(fecha_pago_input, '%Y-%m-%d'))
                except ValueError:
                    print('Fecha en formato incorrecto. Debe ser en el formato año-mes-día.')
                    fecha_pago = None

                if fecha_pago:
                    insertar_cuota(cursor, conn, id_cuota, id_cliente, id_contrato, valor_cuota, fecha_pago)
            elif opcionV == 4:
                mostrar_modelos_mascotizados(cursor)
            elif opcionV == 5:
                print('Saliendo...')
                break
            salir_menu_vendedor = input('¿Desea salir del menú Vendedor? (s/n): ').strip().lower()
            if salir_menu_vendedor == 's':
                print('Saliendo...')
                break

    elif opcion == 3:
        consulta_externa(cursor)

    elif opcion == 4:
        print('Salir')
        break

