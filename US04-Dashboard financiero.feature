Feature: Dashboard financiero
    Como estudiante, quiero ver un dashboard con mis gastos e ingresos mensuales
    para entender mejor los movimientos que realicé durante el mes.

Scenario Outline: Visualizar resumen de gráficos interactivos
    Given el estudiante ingresa a la pantalla "<pantalla_dashboard>"
    When consulta el resumen del mes "<mes>"
    Then el dashboard muestra gráficos claros de ingresos y gastos por categorías
    And se visualizan las categorías y leyendas correspondientes

    Examples: Datos de entrada
        | pantalla_dashboard | mes        |
        | Dashboard          | Septiembre |

    Examples: Datos de salida
        | graficos_visibles                 | categorias_renderizadas                          |
        | barras, pastel, línea             | Comida, Vivienda, Transporte, Universidad, Ocio  |

Scenario Outline: Detalle de movimientos por categoría
    Given el estudiante está en la pantalla "<pantalla_dashboard>" del mes "<mes>"
    When selecciona la categoría "<categoria>"
    Then la app muestra el detalle de movimientos individuales de "<categoria>" con sus fechas

    Examples: Datos de entrada
        | pantalla_dashboard | mes        | categoria    |
        | Dashboard          | Septiembre | Comida       |
        | Dashboard          | Septiembre | Transporte   |

    Examples: Datos de salida
        | columnas_detalle          | min_items |
        | monto, fecha, nota_opcional| 1         |

Scenario Outline: Comparar con meses anteriores
    Given el usuario ya generó un reporte mensual
    And se encuentra en la opción "<pantalla_comparar>"
    When selecciona "<opcion_comparar>" y elige comparar "<mes_actual>" con "<mes_comparar>"
    Then la app muestra una comparación gráfica entre los meses seleccionados
    And se destaca la tendencia de "<tendencia>"

    Examples: Datos de entrada
        | pantalla_comparar  | opcion_comparar     | mes_actual | mes_comparar |
        | Comparar historial | Comparar historial  | Octubre    | Septiembre   |

    Examples: Datos de salida
        | comparacion_tipo | indicador_tendencia |
        | gráfico pastel   | Ahorro / Mayor gasto|
