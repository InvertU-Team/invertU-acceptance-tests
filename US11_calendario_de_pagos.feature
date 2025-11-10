Feature: Calendario de pagos
  Como estudiante
  Quiero gestionar pagos e ingresos en un calendario interactivo
  Para recordar fechas importantes y evitar recargos.

  # Escenario 1
  Scenario: Ingresar fechas de pago manuales
    Given que el usuario necesita organizar sus pagos
    When el usuario accede al calendario de pagos en "InvertU"
    Then el sistema permite añadir fechas y recordatorios manualmente

  # Escenario 2
  Scenario: Programar fechas de pago automáticamente con soporte de IA
    Given que el usuario tiene pagos registrados en una aplicación externa de calendario
    And se encuentra dentro del calendario de "InvertU"
    When el usuario selecciona la opción "Programar fechas automáticas"
    Then el sistema sincroniza y transfiere las fechas desde la aplicación externa a "InvertU"

  # Escenario 3
  Scenario: Notificación previa a fecha de pago
    Given que el usuario registró una fecha de pago
    And la fecha está próxima a cumplirse
    When quede un plazo de 4 días para el pago
    Then la aplicación envía una notificación recordatoria al usuario
