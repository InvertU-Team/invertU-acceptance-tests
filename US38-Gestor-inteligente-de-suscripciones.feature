Feature: Gestor inteligente de suscripciones
    Como estudiante, quiero que la aplicación detecte automáticamente mis suscripciones activas, las registre en un calendario 
    y me notifique antes de sus renovaciones automáticas, para decidir si deseo mantenerlas o cancelarlas y evitar gastos innecesarios.

Scenario Outline: Detección automática de suscripciones
    Given el estudiante conecta sus métodos de pago a la aplicación
    When el sistema detecta transacciones recurrentes con el mismo proveedor
    Then la aplicación registra la transacción como una suscripción "<estado>"

    Examples: Datos de entrada
        | método_pago  | proveedor | frecuencia | monto |
        | Tarjeta VISA | Netflix   | Mensual    | 25.90 |

    Examples: Datos de salida
        | suscripción_registrada | categoría       | estado |
        | true                   | Entretenimiento | Activa |

Scenario Outline: Alerta previa a renovación
    Given una suscripción registrada está próxima a renovarse
    When faltan 3 días o menos para el cobro
    Then la aplicación envía una notificación al estudiante preguntando si desea mantener o cancelar el servicio

    Examples: Datos de entrada
        | suscripción | días_restantes |
        | Netflix     | 2              |

    Examples: Datos de salida
        | notificación                 |
        | "Recordatorio de renovacion” |

Scenario Outline: Visualización en calendario
    Given el estudiante tiene suscripciones activas 
    When accede al calendario de la aplicación
    Then puede visualizar las fechas de cobro próximas y recibir recordatorios automáticos

    Examples: Datos de entrada
        | suscripción | próxima_fecha |
        | Spotify     | 15/11/2025    |

    Examples: Datos de salida
        | recordatorio_activado |
        | true                  |

Scenario Outline: Cancelación o recordatorio de seguimiento
    Given el estudiante decide no continuar con una suscripción activa
    When selecciona la opción "<acción>"
    Then la aplicación elimina las alertas futuras y marca la suscripción como "<estado>" en el registro histórico

    Examples: Datos de entrada
        | suscripción | acción   | 
        | Netflix     | Cancelar |

    Examples: Datos de salida
        | estado   | alerta_eliminada | mensaje_confirmación                   |
        | Inactiva | true             | “Suscripción cancelada” |

