q_player.ads
q_player.adb

q_statictics.ads
q_statictics.adb

q_player.q_player_manager.ads
q_player.q_player_manager.adb

q_player.q_repository.ads
q_player.q_repository.adb

A cuáles quiero definir pruebas?

Las pruebas que hago a las especificaciones de que tipo son? Sistema/Funcionales

POR DEFINICION TODA PRUEBA QUE HAGO CONTRA UN API ES DE SISTEMA. 
- Conozco lo que hay detrás? NPI ... es un API
  - Nunca podré entonces garantizar que esas funciones
    no dependan de otros componentes.

El API es como se comunica mi sistema (subsistema)
con el exterior.

Pero al llamar al API estoy llamando por tanto al sistema/subsistema. NUNCA A UN COMPONENTE AISLADO

POR DEFINICION NO SON UNITARIAS . SIEMPRE DE SISTEMA

q_player.ads
q_player.q_player_manager.ads
q_player.q_repository.ads

---

q_statictics.ads

1- T_STATISCTICS_COUNT .. y que está definido con unos determinados rangos de valores.
Voy a mirar si el rango está entre 0 y 255

SOLID
S - Single Responsability
O - Open/Closed
L - Sustitución de Liskov
I - Segregación de la Interfaz
D - Inversión de la depenendecia

FIRST
F - Fast
I - Independientes
R - Repeteable
S - Selfvalidating (1)
T - TIMELY

El desarrollo le hago contra unos REQUISITOS
Las pruebas las hago sobre unos requisitos... nunca sobre el código

    function F_CREATE_EXISTING_STATISTICS(
        V_WINS   : T_STATISTICS_COUNT;
        V_LOSSES : T_STATISTICS_COUNT;
        V_TIES   : T_STATISTICS_COUNT
    ) return T_STATISTICS;

# Pruebas que desarrollaremos?

En UNA prueba:
- Puede dar un resultado correcto
- Puede dar un resultado incorrecto
- O puede haber una explosión

Al definir UNA prueba: Sintaxis de tipo GIVEN, WHEN, THEN.
- GIVEN: Preparo el contexto de ejecución de la prueba
- WHEN: Donde ejecuto lo que quiero probar
- THEN: Donde compruebo TODO (1) lo que debe ocurrir como consecuencia de la acción que quiero probar

Para una función de mi código / procedimiento... 
Definé varios casos de prueba... al menos tantos como la complejidad ciclomática de ese código.

Empezamos siempre por definir el caso de prueba que denominamos el HAPPY PATH.

- GIVEN
    Dado que tengo unos datos de estadisticas:
      WINS: 17
      LOSSES: 33
      TIES: 14
- WHEN
    Invoco a la función F_CREATE_EXISTING_STATISTICS con esos datos
- THEN
    La función me devuelve un objeto T_STATISTICS con los datos (que tenía) asignados

```ada

procedure TEST_NUEVAS_ESTADISTICAS_CON_DATOS is
   V_WINS: T_STATISTICS_COUNT;
   V_LOSSES: T_STATISTICS_COUNT;
   V_TIES: T_STATISTICS_COUNT;
   V_RESULTADO: T_STATISTICS;
begin

  -- GIVEN: Dado que tengo unos datos de estadisticas:
   V_WINS:= 17;
   V_LOSSES:= 33;
   V_TIES:= 14;

  -- WHEN: Invoco a la función F_CREATE_EXISTING_STATISTICS con esos datos
  V_RESULTADO:= F_CREATE_EXISTING_STATISTICS(V_WINS, V_LOSSES, V_TIES);

  -- THEN La función me un T_STATISTICS con los datos (que tenía) asignados:
  if V_WINS = F_GET_WINS(V_RESULTADO) then
    Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - OK")
  else
    Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - NOK")
  end if;

  if V_LOSSES = F_GET_LOSSES(V_RESULTADO) then
    Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - OK")
  else
    Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - NOK")
  end if;

  if V_TIES = F_GET_TIES(V_RESULTADO) then
    Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - OK")
  else
    Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - NOK")
  end if;

  if V_TIES+V_LOSSES+V_WINS = F_GET_PLAYED_GAMES(V_RESULTADO) then
    Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - OK")
  else
    Put_line("TEST_NUEVAS_ESTADISTICAS_CON_DATOS - NOK")
  end if;

end TEST_NUEVAS_ESTADISTICAS_CON_DATOS;

```

Una prueba automatizada no es sino un programa que prueba mi programa.