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
Saldrá con un código de salida distinto a 0 si alguna prueba falla.

En paralelo, está bien que se me genere un informe de las pruebas... para ver cuales han ido bien y cuales mal.



---

# Pruebas del manager DE SISTEMA

  function F_CREATE_NEW_PLAYER(V_PLAYER_NAME: T_NAME_VALUE; V_PLAYER_EMAIL: T_EMAIL_VALUE) return T_PLAYER;

CASOS DE PRUEBA: Al menos 1 (HAPPY PATH... al menos tantos como la complejidad cicliomática)
  - HAPPY PATH
      GIVEN
        Tengo unos datos de un player guays:
          Email: GUAY
          Nombre: Guay y que NO EXISTA YA
      WHEN (acción)
        Llamo al F_CREATE_NEW_PLAYER con esos datos
      THEN (comprobaciones)   -    SELF VALIDATING
        - No hay errores
        - Se me devuelve un TPLAYER que tiene los datos originales
        - Y el TPLAYER tiene unas estadísticas inicializadas a 0
        - Y el TPLAYER se ha dado de alta en la cache
        - Y tengo un fichero con el nombre del TPLAYER que contiene los datos del TPLAYER
        - Y el manager ha quedado subscrito al TPLAYER

  PODRIA TENER UN FALLO EN PRODUCCION si se me olvida comprobar
    que se haya dado de alta el PLAYER en la cache? NO
  Cada vez que se pida el JUGADOR se leera de fichero...
    FALLO no va a haber... solo que el sistema va más lento.
    El resto si está bien hecho.
  
    TENGO UN DEFECTO que no se manifiesta en PRODUCCION como un fallo!

  - CAJA BLANCA:
    - Usuario que ya existe
    - Subscripcion
    - Save player
      - Se da de alta en la cache
      - Se guarda un fichero
    - Si hay un problema al guardar el jugador
  - CAJA NEGRA:
    - Nombre inválido
    - Email inválido
    - Si hay un problema al guardar el jugador
    - Si hay un problema porque ya exista

# Pruebas del manager UNITARIA
  - HAPPY PATH
      GIVEN
        Tengo unos datos de un player guays:
          Email: GUAY
          Nombre: Guay y que NO EXISTA YA
      WHEN (acción)
        Llamo al F_CREATE_NEW_PLAYER con esos datos
      THEN (comprobaciones)   -    SELF VALIDATING
        - No hay errores
        - Se me devuelve un TPLAYER que tiene los datos originales
        - Y el TPLAYER tiene unas estadísticas inicializadas a 0
        - Se solicita el almacenamiento del jugador (P_SAVE_PLAYER) ***
        - Y el manager ha quedado subscrito al TPLAYER
    *** Para comprobar esto, tengo un problema:
      - Mirar las consecuencias de haber llamado a eso: 
        Pero entonces ya estoy haciendo una prueba de SISTEMA
      - Sobreescribir el procedimiento P_SAVE_PLAYER para que 
        no haga nada más que anotar en un boolean que lo he llamado.
        Y si cuando la prueba, ese boolean está a true, es que mi
        función ha hecho lo que debia hacer.
        TEST-DOUBLE: P_SAVE_PLAYER : SPY
          : stub, spy, mock, fake, dummy

    VENTAJAS ENORMES:
    - Si una prueba unitaria falla, TENGO MUY CLARO qué falla... dónde está el fallo
      - Si una prueba de sistema falla... ponte a buscar... qué falla!
    - Cuándo puedo hacer la prueba de sistema ? Cuando está el sistema.
      - La prueba unitaria no necesita que el sistema esté montado.

## Hemos hecho una prueba antes de crear un player: PLAYER "ivan"

## F_GET_PLAYER : SISTEMA

  TEAR_UP

- HAPPY_PATH
  GIVEN:
    el nombre de jugador RANDOM
    mi email
    guardo el jugador
    le cambio sus estadisticas... 
  WHEN:
    llamo a get player con RANDOM
  THEN:
    entonces, me devuelve un player, con los datos de ivan

  TEAR_DOWN


## AUnit

Framework de **pruebas** en Ada
No es un framework de **pruebas unitarias** en ADA
Aunque puedo hacer pruebas unitarias con él.

Nos ayuda con la configuración / Estructuración de los procedmientos de pruebas

Al usar un framework he de adaptarme a su forma de trabajo.

Un framewokr es un conjunto de 1 o mas librerías, que me imponen una forma de trabajo.

Quien arranca las pruebas con AUnit, es Aunit
Yo declaro pruebas... y las configuro en AUnit...
Para que sea AUnit el que las ejecute.


Suite de pruebas      player_test_suite <--- Suite_Todas_Las_Pruebas
  Caso de prueba      package: player_creation_test_cases
    Rutina de Prueba  player_creation_test_cases: Test_1, Test_2