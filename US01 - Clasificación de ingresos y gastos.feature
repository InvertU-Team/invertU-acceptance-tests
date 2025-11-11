Feature: Clasificación de ingresos y gastos

    Como estudiante
    quiero clasificar mis ingresos y gastos por categorías personalizadas
    para identificar fácilmente en qué se va mi dinero


Scenario Outline: Registrar ingreso o gasto
    Dado que el <estudiante> desea registrar un movimiento
    Cuando indica el tipo de movimiento <tipo> e ingresa el monto <monto>
    Entonces el movimiento queda guardado con el tipo indicado y se muestra el <mensaje>

Examples: Datos de entrada
    | estudiante                                        | tipo     | monto  |
    | código: u20241e017, nombre: Juan Linares Garcia   | ingreso  | 250.00 |
    | código: u20241e017, nombre: Juan Linares Garcia   | gasto    | 35.90  |

Examples: Datos de salida
    | mensaje                                    |
    | "Movimiento registrado: ingreso de S/250." |
    | "Movimiento registrado: gasto de S/35.90." |


Scenario Outline: Registro manual de categoría
    Dado que el <estudiante> inicia el registro de un movimiento
    Cuando el sistema solicita seleccionar una categoría y el usuario elige <categoria>
    Entonces el movimiento se guarda con la categoría <categoria> y se muestra el <mensaje>

Examples: Datos de entrada
    | estudiante                                      | categoria  |
    | código: u20241e017, nombre: Juan Linares Garcia | Comida     |
    | código: u20241e017, nombre: Juan Linares Garcia | Transporte |

Examples: Datos de salida
    | mensaje                                 |
    | "Movimiento clasificado en: Comida."    |
    | "Movimiento clasificado en: Transporte." |


Scenario Outline: Clasificación automática por boleta o tarjeta
    Dado que el <estudiante> realiza un pago mediante <fuente> o escanea una boleta válida
    Cuando el sistema reconoce la transacción con descripción <descripcion>
    Entonces la app clasifica automáticamente el gasto en la categoría <categoria_detectada> y se muestra el <mensaje>

Examples: Datos de entrada
    | estudiante                                      | fuente  | descripcion              | categoria_detectada |
    | código: u20241e017, nombre: Juan Linares Garcia | tarjeta | "STARBUCKS MIRAFLORES"   | Comida              |
    | código: u20241e017, nombre: Juan Linares Garcia | boleta  | "METROPOLITANO RECARGA"  | Transporte          |

Examples: Datos de salida
    | mensaje                                          |
    | "Clasificación automática aplicada: Comida."     |
    | "Clasificación automática aplicada: Transporte." |


Scenario Outline: Edición de categorías existentes
    Dado que el <estudiante> tiene un movimiento previamente clasificado en <categoria_inicial>
    Cuando cambia la categoría a <categoria_nueva> y guarda los cambios
    Entonces el movimiento queda en la categoría <categoria_nueva> y el historial refleja el <registro_historial>

Examples: Datos de entrada
    | estudiante                                      | categoria_inicial | categoria_nueva |
    | código: u20241e017, nombre: Juan Linares Garcia | Transporte        | Estudio         |

Examples: Datos de salida
    | registro_historial                              |
    | "Categoría actualizada de Transporte a Estudio." |
