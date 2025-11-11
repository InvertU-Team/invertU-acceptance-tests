Feature: Chatbot financiero

    Como estudiante
    quiero interactuar con un chatbot financiero personalizado
    para resolver mis dudas y recibir orientación adaptada a mi realidad económica. 

Scenario Outline: Recomendaciones adaptadas al perfil del usuario
    Given el <usuario> necesita recomendaciones sobre finanzas
    When inicia una conversación con el chatbot 
    Then la IA analiza los <patrones de gastos> para dar consejos de reducción de gastos 

Examples: Datos de entrada
    | usuario                     | patrones de gasto                     |
    | nombre: Juan Linares Garcia | Gastos altos en entretenimiento y comidas fuera |

Examples: Datos de salida
    | Consejos                          |
    | "Juan, te recomendamos reducir tus gastos en entretenimiento un 20% y destinar ese monto a tu fondo de emergencia." |


Scenario Outline: Elaboración de planes para mejorar hábitos de ahorro 
    Given el <usuario> necesita un <plan de ahorro>
    When le manda el mensaje “Generar plan de ahorro” al chatbot
    Then la IA prepara un plan en la función de “Mis metas”


Examples: Datos de entrada
    | usuario                     | plan de ahorro                          |
    | nombre: Juan Linares Garcia | Ahorrar para comprar una laptop en 6 meses |

Examples: Datos de salida
    | plan financiero             |
    | "Plan creado: Ahorra S/.150.00 mensuales para alcanzar tu meta de laptop en 6 meses. Progreso visible en 'Mis metas'." |


Scenario Outline: Reconocimiento de un manejo inadecuado de finanzas 
    Given la IA revisa los <movimientos del mes>
    When reconoce que el <usuario> no administra correctamente sus finanzas
    Then le manda notificaciones para empezar a aprender sobre finanzas 

Examples: Datos de entrada
    | usuario                     | movimientos del mes                                      |
    | nombre: Juan Linares Garcia | Gastos mayores a ingresos durante 3 semanas consecutivas |

Examples: Datos de salida
    | notificaciones                          |
    | "Hemos notado un desequilibrio financiero este mes. Revisa los recursos de educación financiera para mejorar tu control de gastos." |

Scenario Outline: Fallo por conexión a internet  
    Given el <usuario> intenta iniciar un chat con la IA  
    When el programa no tiene <conexión a internet>
    Then el programa muestra un mensaje de error indicando la falla de conexión. 

Examples: Datos de entrada
    | usuario                                         | conexión a internet |
    | código: <u20241e017>, nombre: <Juan Linares García> | <Desconectado>      |

Examples: Datos de salida
    | mensaje de error                               |
    | "Error de conexión: No se puede iniciar el chat. Verifica tu conexión a internet e inténtalo nuevamente." |
