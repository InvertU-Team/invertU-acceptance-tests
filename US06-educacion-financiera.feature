Feature: Educación financiera

  Como estudiante
  quiero acceder a minicursos, trivias y quizzes de educación financiera
  para aprender de manera sencilla y práctica sobre finanzas personales

  Scenario Outline: Acceso a trivias y quizzes por tema
    Given que el <estudiante> desea reforzar sus conocimientos financieros
    When selecciona la opción de “Educación financiera” y elige el <tema> en la app
    Then el sistema muestra una lista de actividades (trivias y quizzes) interactivas organizadas por <tema>

    Examples: Datos de entrada
      | estudiante                    | tema                    |
      | nombre: <Juan Linares García> | <Presupuesto personal>  |

    Examples: Datos de salida
      | lista de actividades                                                                 |
      | "Trivias y quizzes disponibles para Presupuesto personal: 'Gastos fijos vs variables', 'Arma tu presupuesto 50/30/20', 'Errores comunes al presupuestar'." |


  Scenario Outline: Visualización de progreso acumulado
    Given que el <estudiante> ha completado <actividades completadas> de un <tema>
    When accede a su perfil o al panel de “Educación financiera”
    Then la app muestra su progreso mediante porcentajes y barras y un detalle de avance

    Examples: Datos de entrada
      | estudiante                    | tema                   | actividades completadas |
      | nombre: <Juan Linares García> | <Ahorro e inversiones> | <3 de 5>                |

    Examples: Datos de salida
      | progreso         | detalle de avance                                                                 |
      | <60% completado> | "Has completado 3/5 actividades. Próximas: 'Meta SMART de ahorro' y 'Interés compuesto básico'." |


  Scenario Outline: Recompensa por completar módulos
    Given que el <estudiante> completa satisfactoriamente un <módulo> del <tema>
    When el sistema detecta el <módulo> con estado <completado>
    Then la app genera un certificado de logro y lo vincula a entidades seleccionadas para su historial crediticio

    Examples: Datos de entrada
      | estudiante                    | tema                    | módulo                         | completado |
      | nombre: <Juan Linares García> | <Crédito responsable>    | <Uso responsable de tarjetas> | <Sí>       |

    Examples: Datos de salida
      | certificado de logro                                                                                                       | entidades seleccionadas                       |
      | "Certificado: 'Crédito responsable – Uso responsable de tarjetas' (ID <CF-2025-0017>) emitido para <Juan Linares García>." | <Entidad A>, <Cooperativa B>                  |
