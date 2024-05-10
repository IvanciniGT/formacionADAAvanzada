with AUnit.Test_Cases;
with AUnit;
package Q_STATISTICS.TEST_CASE is

    type Q_STATISTICS_TEST is new AUnit.Test_Cases.Test_Case with null record;

    -- Esta función nos la invoca AUnit automaticamente para que registremos
    -- Las rutinas de prueba, asociadas a un caso de prueba
    procedure Register_Tests(V_Test: in out Q_STATISTICS_TEST);

    -- Esta función nos la invoca AUnit automaticamente
    -- para que demos el nombre del caso de prueba (y que salga en los informes)
    function Name(V_Test_Case: Q_STATISTICS_TEST) return AUnit.Test_String;

    -- Estas funciones nos las invoca AUnit automaticamente
    
    -- Antes de empezar todas las rutinas de un caso de prueba
    procedure Set_Up_Case(Test: in out Q_STATISTICS_TEST);
    -- Antes de empezar cada rutina de prueba del caso de prueba
    procedure Set_Up(Test: in out Q_STATISTICS_TEST);
    -- Después de terminar cada rutina de prueba del caso de prueba
    procedure Tear_Down(Test: in out Q_STATISTICS_TEST);
    -- Después de terminar todas las rutinas de un caso de prueba
    procedure Tear_Down_Case(Test: in out Q_STATISTICS_TEST);

    -- Y estas también nos las invoca AUnit automaticamente
    -- Por nosotros registrarlas dentro de la rutina Register_Tests
    procedure TEST_NUEVAS_ESTADISTICAS_CON_DATOS(Test: in out AUnit.Test_Cases.Test_Case'Class);
    procedure TEST_NUEVAS_ESTADISTICAS_PERO_NUEVAS(Test: in out AUnit.Test_Cases.Test_Case'Class);
    procedure TEST_GET_WINS(Test: in out AUnit.Test_Cases.Test_Case'Class);
    procedure TEST_GET_LOOSES(Test: in out AUnit.Test_Cases.Test_Case'Class);
    procedure TEST_GET_TIES(Test: in out AUnit.Test_Cases.Test_Case'Class);
    procedure TEST_GET_PLAYED_GAMES(Test: in out AUnit.Test_Cases.Test_Case'Class);
    procedure TEST_INCREMENT_WINS(Test: in out AUnit.Test_Cases.Test_Case'Class);
    procedure TEST_INCREMENT_WINS_MAXIMO(Test: in out AUnit.Test_Cases.Test_Case'Class);
    procedure TEST_INCREMENT_LOSSES(Test: in out AUnit.Test_Cases.Test_Case'Class);
    procedure TEST_INCREMENT_LOSSES_MAXIMO(Test: in out AUnit.Test_Cases.Test_Case'Class);
    procedure TEST_INCREMENT_TIES(Test: in out AUnit.Test_Cases.Test_Case'Class);
    procedure TEST_INCREMENT_TIES_MAXIMO(Test: in out AUnit.Test_Cases.Test_Case'Class);
    

end Q_STATISTICS.TEST_CASE;
