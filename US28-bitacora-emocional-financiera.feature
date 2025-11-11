Feature: Bitácora emocional financiera
  Como estudiante registrado en la aplicación
  quiero registrar cómo me siento (con emojis) sobre ciertos gastos, ingresos o metas cumplidas
  para reconocer cómo mis emociones influyen en mis patrones de gasto

  Scenario Outline: Registro de una emoción financiera
    Given que el <estudiante> ha iniciado sesión y ha registrado un(a) <acción financiera>
    When selecciona el <icono de emoji> en la sección correspondiente
    Then la app permite elegir un emoji que refleje el estado emocional y lo guarda en la bitácora

    Examples: Datos de entrada
      | estudiante                    | acción financiera | icono de emoji |
      | nombre: <Juan Linares García> | <Gasto en comida> | <Carita>       |

    Examples: Datos de salida
      | emoji             | guarda en la bitácora                                   |
      | <😕>              | "Registro creado: 2025-11-11, Gasto en comida, emoji 😕." |


  Scenario Outline: Visualización del historial emocional
    Given que el <estudiante> ha registrado <emociones> en la bitácora
    When accede a la sección “Bitácora emocional”
    Then el sistema muestra un calendario con el promedio diario de emociones

    Examples: Datos de entrada
      | estudiante                    | emociones        |
      | nombre: <Juan Linares García> | <30 registros>   |

    Examples: Datos de salida
      | calendario                 | promedio diario                                   |
      | "Vista mensual interactiva" | "Promedio 2025-11-10: 🙂; 2025-11-11: 😕."        |


  Scenario Outline: Edición o eliminación de una emoción registrada
    Given que el <estudiante> visualiza su bitácora emocional
    When selecciona el <icono de tuerca> en la <fecha>
    Then el sistema muestra una barra rápida para cambiar emoji o eliminar registro

    Examples: Datos de entrada
      | estudiante                    | icono de tuerca | fecha        |
      | nombre: <Juan Linares García> | <Configuración> | <2025-11-11> |

    Examples: Datos de salida
      | barra rápida                         | cambiar emoji | eliminar registro |
      | "Opciones: 🙂 😐 😕 😡 😍 + borrar" | <✅>          | <✅>               |


  Scenario Outline: Análisis de cómo las emociones influyen en gastos
    Given que el <estudiante> ha registrado emociones sobre sus <actividades financieras>
    When escribe “<resumen emocional>” en el chatbot
    Then el chatbot muestra un resumen mensual con emociones frecuentes por categoría y ofrece retroalimentación

    Examples: Datos de entrada
      | estudiante                    | actividades financieras              | resumen emocional |
      | nombre: <Juan Linares García> | <Ingresos, Gastos, Metas cumplidas>  | <resumen emocional> |

    Examples: Datos de salida
      | resumen mensual                                                      | emociones frecuentes por categoría                                                  | retroalimentación                                            |
      | "Octubre: 45% 🙂 en ingresos, 35% 😕 en gastos, 20% 😍 en metas."   | "Gastos: 😕 al comer fuera; Ingresos: 🙂 por beca; Metas: 😍 al completar objetivo." | "Sugerencia: reduce comidas fuera y planifica compras."      |
