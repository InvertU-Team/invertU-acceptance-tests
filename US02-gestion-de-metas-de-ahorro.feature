Feature: Gestión de metas de ahorro

  Como estudiante
  quiero fijar una meta de ahorro
  para motivarme a cumplirla en un tiempo establecido

Scenario Outline: Establecimiento de metas
  Given que el <usuario> necesita ahorrar
  When ingresa al apartado “Mis metas” y selecciona <crear meta>
  Then el sistema muestra un formulario de meta para definir monto objetivo y fecha objetivo

Examples: Datos de entrada
  | usuario                       | crear meta     |
  | nombre: <Juan Linares García> | <Nueva Laptop> |

Examples: Datos de salida
  | formulario de meta                                | monto objetivo | fecha objetivo |
  | "Formulario: nombre, monto, fecha, recordatorios" | <S/900>        | <25-03-2026>   |

Scenario Outline: Visualización de gráficas de progreso
  Given que el <usuario> ha creado con éxito una <meta>
  When ingresa al apartado “Mis metas”
  Then visualiza una gráfica de progreso con cantidad ahorrada y monto restante

Examples: Datos de entrada
  | usuario                       | meta                      |
  | nombre: <Juan Linares García> | <Laptop estudio>          |

Examples: Datos de salida
  | gráfica de progreso             | cantidad ahorrada | monto restante |
  | "Barras y porcentaje acumulado" | <$360>            | <$540>         |


Scenario Outline: Recordatorios dinámicos para cumplir la meta
  Given que el <usuario> ha iniciado una <meta de ahorro>
  When la IA reconoce que la <fecha objetivo> está próxima con <días restantes>
  Then el sistema muestra un recordatorio para destinar dinero al ahorro

Examples: Datos de entrada
  | usuario                       | meta de ahorro     | fecha objetivo | días restantes |
  | nombre: <Juan Linares García> | <Laptop estudio>   | <2026-03-15>   | <15>            |

Examples: Datos de salida
  | recordatorio                                                                 |
  | "Quedan 5 días para tu meta 'Laptop estudio'. Sug.: aporta $100 esta semana." |


Scenario Outline: Falla por conexión a internet
  Given que el <usuario> intenta ingresar a “Mis metas”
  When el sistema detecta <sin conexión a internet>
  Then muestra un mensaje de error y sugiere reintentar

Examples: Datos de entrada
  | usuario                                             | sin conexión a internet |
  | código: <u20241e017>, nombre: <Juan Linares García> | <Desconectado>          |

Examples: Datos de salida
  | mensaje de error                                           | reintentar           |
  | "Error de conexión. No fue posible cargar 'Mis metas'."    | <Intenta nuevamente> |
