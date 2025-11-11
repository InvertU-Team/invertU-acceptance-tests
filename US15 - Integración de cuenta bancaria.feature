Feature: Integración de cuenta bancaria

    Como estudiante
    quiero vincular mi cuenta bancaria personal
    para que mis ingresos y gastos se registren automáticamente


Scenario Outline: Conexión exitosa del banco
    Dado que el <estudiante> ingresa a la opción “Vincular mi cuenta bancaria” en la app
    Cuando selecciona su <banco> y autoriza el acceso con sus <credenciales>
    Entonces la app confirma su vinculación y muestra un <mensaje_exito> indicando que la cuenta quedó conectada correctamente

Examples: Datos de entrada
    | estudiante                                      | banco       | credenciales            |
    | código: u20241e017, nombre: Juan Linares Garcia | BCP         | usuario: juan123, clave: **** |
    | código: u20241e017, nombre: Juan Linares Garcia | Interbank   | usuario: juanL, clave: ****  |

Examples: Datos de salida
    | mensaje_exito                                           |
    | "Vinculación exitosa: tu cuenta BCP se ha conectado correctamente." |
    | "Vinculación exitosa: tu cuenta Interbank se ha conectado correctamente." |


Scenario Outline: Error de vinculación
    Dado que el <estudiante> intenta vincular su cuenta bancaria
    Cuando ingresa sus <credenciales> de manera incorrecta
    Entonces el sistema muestra un <mensaje_error> y solicita intentarlo otra vez con datos válidos

Examples: Datos de entrada
    | estudiante                                      | banco     | credenciales incorrectas |
    | código: u20241e017, nombre: Juan Linares Garcia | BCP       | usuario: juan123, clave: 0000 |
    | código: u20241e017, nombre: Juan Linares Garcia | Interbank | usuario: juanL, clave: 9999   |

Examples: Datos de salida
    | mensaje_error                                                 |
    | "Error: Credenciales incorrectas. Intente nuevamente."        |
    | "Error: No se pudo vincular la cuenta. Revise sus datos."     |


Scenario Outline: Sincronización automática de movimientos
    Dado que existe una cuenta bancaria vinculada en la app
    Cuando el <estudiante> registra un nuevo <movimiento> en su sistema de banco
    Entonces la app importa automáticamente el registro y lo clasifica en la categoría correspondiente dentro de los movimientos mostrando el <mensaje_sincronizacion>

Examples: Datos de entrada
    | estudiante                                      | movimiento        |
    | código: u20241e017, nombre: Juan Linares Garcia | gasto: 45.50 en "Cineplanet" |
    | código: u20241e017, nombre: Juan Linares Garcia | ingreso: 1200.00 de "Sueldo" |

Examples: Datos de salida
    | mensaje_sincronizacion                                          |
    | "Gasto de S/45.50 clasificado en categoría: Entretenimiento."   |
    | "Ingreso de S/1200.00 clasificado en categoría: Sueldo."        |
