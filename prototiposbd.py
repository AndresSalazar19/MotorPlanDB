import mysql.connector
from tabulate import tabulate

config = {
    'user': 'adminGrupo4',
    'password': '8396Quinde',
    'host': 'grupo4demo.mysql.database.azure.com',
    'database': 'motorplan'}


conn = mysql.connector.connect(**config)
cursor = conn.cursor()


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

menu_principal = ["Ingresar como Gerente", "Ingresar como Vendedor", "Salir"]
menu_gerente = ['Añadir Vendedor', 'Añadir Concesionaria', 'Crear Grupo', 'Revisar Ventas', 'Revisar Vendedores', 'Añadir Proformas', 'Revisar Contratos','Salir']
menu_vendedor = ['Añadir Cliente', 'Revisar Cliente', 'Cobrar Cuota', 'Salir']


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
            while opcionG not in [1, 2, 3, 4, 5, 6, 7, 8]:
                opcionG = obtener_entero_positivo_y_cero_input('Ingrese una opción válida (1, 2, 3, 4, 5, 6, 7 ,8): ')

            if opcionG == 1:
                print('Escriba los datos del vendedor')
                cedula = verificador_cedula('Cédula: ')
                nombre = input('Nombre: ')
                apellido = input('Apellido: ')
                email = input('Email: ')
                telefono = verificador_telefono('Teléfono: ')
                id_gerente = cedulaGerente
                add_empleado = ("INSERT INTO empleado "
                                "(cedula, nombre, apellido, email, telefono, id_gerente) "
                                "VALUES (%s, %s, %s, %s, %s, %s)")
                data_empleado = (cedula, nombre, apellido, email, telefono, id_gerente)
                cursor.execute(add_empleado, data_empleado)
                conn.commit()

            elif opcionG == 2:
                print('Escriba los datos de la concesionaria')
                id_concesionaria = obtener_entero_positivo_y_cero_input('ID_Concesionaria: ')
                nombre = input('Nombre: ')
                telefono = verificador_telefono('Teléfono: ')
                email = input('Email: ')
                calle_principal = input('Calle Principal: ')
                calle_secundaria = input('Calle Secundaria: ')

                add_concesionaria = ("INSERT INTO concesionaria "
                                     "(id_concesionaria, nombre, telefono, email, calle_principal, calle_secundaria) "
                                     "VALUES (%s, %s, %s, %s, %s, %s)")
                data_concesionaria = (id_concesionaria, nombre, telefono, email, calle_principal, calle_secundaria)
                cursor.execute(add_concesionaria, data_concesionaria)
                conn.commit()

            elif opcionG == 3:
                print('Creacion de Grupos')
                pass

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
                print('Añadir Proformas')
                print('----Proformas-----')
                cuantas = obtener_entero_positivo_y_cero_input('Cuantas proformas añadira: ')
                for i in range(cuantas):
                    query = "SELECT id_concesionaria FROM concesionaria"
                    cursor.execute(query)
                    ids_concesionarias = cursor.fetchall()
                    for id_concesionaria in ids_concesionarias:
                        print(id_concesionaria[0])
                    id_concesionaria = obtener_entero_positivo_y_cero_input('ID de la Concesionaria: ')
                    id_proforma = obtener_entero_positivo_y_cero_input('ID_Proforma: ')
                    print('Escriba la fecha en el siguiente formato: año-mes-dia')
                    fecha_str = input('Fecha: ')
                    modelo = input('Modelo: ')
                    marca = input('Marca: ')
                    color = input('Color: ')
                    costo = obtener_float_positivo_input('Costo en dolares: ')
                    año = obtener_entero_positivo_y_cero_input('Año: ')
                    add_proforma = ("INSERT INTO proforma "
                                    "(id_proforma, id_concesionaria, fecha, modelo, marca, color, costo, anio) "
                                    "VALUES (%s, %s, %s, %s, %s, %s, %s, %s)")
                    data_proforma = (id_proforma, id_concesionaria, fecha_str, modelo, marca, color, costo, año)
                    cursor.execute(add_proforma, data_proforma)
                    conn.commit()

            elif opcionG == 7:
                print('Revisar Contratos')
                query_contratos = """
                SELECT c.id_contrato, c.id_cliente, c.id_proforma, c.descripcion, c.cuotas_totales, 
                       c.valor_cuota, c.fecha_firma, c.estado, c.id_vendedor
                FROM contrato c
                WHERE c.id_gerente = %s AND c.estado = 'Pendiente'
                """
                cursor.execute(query_contratos, (cedulaGerente,))
                contratos = cursor.fetchall()
                tabla_contratos = []
                for i, (id_contrato, id_cliente, id_proforma, descripcion, cuotas_totales, valor_cuota,
                        fecha_firma, estado, id_vendedor) in enumerate(contratos, start=1):
                    tabla_contratos.append([i, id_contrato, id_cliente, id_proforma, descripcion, cuotas_totales,
                                            valor_cuota, fecha_firma, estado, id_vendedor])
                headers = ['Nº', 'ID Contrato', 'ID Cliente', 'ID Proforma', 'Descripción', 'Cuotas Totales',
                           'Valor Cuota', 'Fecha Firma', 'Estado', 'ID Vendedor']
                if tabla_contratos:
                    print('Contratos Pendientes')
                    print(tabulate(tabla_contratos, headers=headers, tablefmt='fancy_grid'))
                    seleccion = obtener_entero_positivo_y_cero_input('Selecciona el número del contrato para aprobar: ')
                    if 1 <= seleccion <= len(contratos):
                        id_contrato_seleccionado = contratos[seleccion - 1][1]
                        update_estado = """
                        UPDATE contrato
                        SET estado = 'Vigente'
                        WHERE id_contrato = %s
                        """
                        cursor.execute(update_estado, (id_contrato_seleccionado,))
                        conn.commit()
                        print(f"Contrato ID {id_contrato_seleccionado} aprobado y estado actualizado a 'Vigente'.")
                    else:
                        print("Número de selección inválido.")
                else:
                    print("No se encontraron contratos pendientes asociados a tu cédula.")

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
                    add_cliente = ("INSERT INTO cliente "
                                         "(cedula, calle_principal, calle_secundaria, "
                                   "email, telefono, nombre, apellido, id_vendedor) "
                                         "VALUES (%s, %s, %s, %s, %s, %s, %s, %s)")
                    data_cliente = (cedula, calle_principal, calle_secundaria, email,
                                    telefono, nombre, apellido, id_vendedor)
                    cursor.execute(add_cliente, data_cliente)
                    conn.commit()
                    print('Cliente añadido existosamente.')
                    print('----Informacion del Garante----')
                    cedulaGarante = verificador_cedula('Cedula del Garante: ')
                    nombreGarante = input('Nombre: ')
                    apellidoGarante = input('Apellido: ')
                    telefonoGarante = input('Telefono: ')
                    emailGarante = input('Email: ')
                    check_garante_query = """
                    SELECT cedula FROM garante WHERE cedula = %s
                    """
                    cursor.execute(check_garante_query, (cedulaGarante,))
                    resultado = cursor.fetchone()
                    if resultado:
                        print('El garante con esta cédula ya existe en la base de datos.')
                    else:
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
                print('Revisar Cliente')
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
                            query_proformas = """
                                SELECT p.id_proforma, p.marca, p.costo, c.nombre AS concesionaria_nombre
                                FROM proforma p
                                JOIN concesionaria c ON p.id_concesionaria = c.id_concesionaria
                                WHERE p.cedula_cliente = %s
                            """
                            cursor.execute(query_proformas, (cedulaSeleccionada,))
                            proformas = cursor.fetchall()
                            print(f"\nDetalles del Cliente Seleccionado:")
                            print(f"Nombre: {clientes[seleccion - 1][1]} {clientes[seleccion - 1][2]}")
                            print(f"Cédula: {cedulaSeleccionada}")
                            tabla_proformas = []
                            for id_proforma, marca, costo, concesionaria_nombre in proformas:
                                tabla_proformas.append([id_proforma, concesionaria_nombre, marca, costo])
                            headers_proformas = ['ID Proforma', 'Nombre Concesionaria', 'Marca', 'Costo']
                            if tabla_proformas:
                                print("\nProformas Asociadas:")
                                print(tabulate(tabla_proformas, headers=headers_proformas, tablefmt='fancy_grid'))
                            else:
                                print("No hay proformas asociadas a este cliente.")

                        else:
                            print("Número de selección inválido.")
                    except ValueError:
                        print("Entrada inválida. Por favor, introduce un número entero.")
                else:
                    print("No se encontraron clientes para el vendedor con cédula proporcionada.")

                pass

            elif opcionV == 3:
                print('Cobro de cuotas')
            elif opcionV == 4:
                print('Saliendo...')
                break
            salir_menu_vendedor = input('¿Desea salir del menú Vendedor? (s/n): ').strip().lower()
            if salir_menu_vendedor == 's':
                print('Saliendo...')
                break

    elif opcion == 3:
        print('Salir')
        break

