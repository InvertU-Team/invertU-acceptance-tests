Feature: Gestión de deudas y préstamos
    Como estudiante, quiero registrar deudas o préstamos que tengo con otras personas o entidades financieras,
    para mantener una gestión organizada de mis compromisos económicos.

Scenario Outline: Ingreso a la sección de deudas y préstamos
    Given el estudiante visualiza la opción "<sección>"
    When accede a dicha opción
    Then la aplicación solicita información detallada sobre el proceso.

    Examples: Datos de entrada
        | sección            |
        | Deudas y préstamos |

Scenario Outline: Añadir una nueva deuda o préstamo
    Given el estudiante especifica que presta o recibe dinero e ingresa los campos requeridos "<monto>", "<fecha_límite>" y "<tipo_operación>"
    When hace clic en "<botón_registrar>"
    Then la aplicación guarda correctamente el registro
    And actualiza la gráfica correspondiente en la sección "<sección>"

    Examples: Datos de entrada
        | monto | fecha_límite | tipo_operación | botón_registrar | sección            |
        | 250   | 25/11/2025   | Préstamo       | Registrar       | Deudas y préstamos |

    Examples: Datos de salida
        | mensaje_sistema                      | gráfica_actualizada |
        | "operación registrada correctamente" | true                |

Scenario Outline: Sincronización automática con el calendario
    Given el estudiante registra una nueva obligación financiera y se encuentra en "<sección>"
    When hace clic en "<botón_registrar>"
    Then la aplicación sincroniza automáticamente las fechas de cada pago/ingreso del monto total registrado 
    And envía notificaciones de recordatorio. 

    Examples: Datos de entrada
        | sección            | botón_registrar |
        | Deudas y préstamos | Registrar       |

    Examples: Datos de salida
    | calendario_actualizado | notificación_programada |
    | true                   | true                    |

Scenario Outline: Progreso visual
    Given el estudiante registra un ingreso o gasto con categoría "<tipo_registro>" y selecciona la persona implicada
    When el sistema identifica la operación
    Then actualiza el monto total en "<sección>"
    And modifica la gráfica de progreso.

    Examples: Datos de entrada
        | tipo_registro | sección            |
        | Deuda         | Deudas y préstamos |
        | Préstamo      | Deudas y préstamos |

    Examples: Datos de salida
        | monto_actualizado | gráfico_refrescado |
        | true              | true               |

Scenario Outline: Deuda o préstamo concluido
    Given el estudiante recibe o cancela el último monto necesario para saldar la deuda o préstamo 
    When el sistema identifique la gráfica completa, 
    Then muestra un mensaje de felicitación
    And redirige el registro a la subsección de "<subección>" en "<sección>". 

    Examples: Datos de salida
        | subsección    | sección            |
        | Historial     | Deudas y préstamos |




