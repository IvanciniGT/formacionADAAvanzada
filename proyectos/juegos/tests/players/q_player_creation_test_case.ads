with AUnit.Test_Cases;
with AUnit;

package Q_PLAYER_CREATION_TEST_CASE is

    type Q_PLAYER_CREATION_TEST is new AUnit.Test_Cases.Test_Case with null record;

    -- Esta función nos la invoca AUnit automaticamente para que registremos
    -- Las rutinas de prueba, asociadas a un caso de prueba
    procedure Register_Tests(V_Test: in out Q_PLAYER_CREATION_TEST);

    -- Esta función nos la invoca AUnit automaticamente
    -- para que demos el nombre del caso de prueba (y que salga en los informes)
    function Name(V_Test_Case: Q_PLAYER_CREATION_TEST) return AUnit.Test_String;

    -- Estas funciones nos las invoca AUnit automaticamente
    
    -- Antes de empezar todas las rutinas de un caso de prueba
    procedure Set_Up_Case(Test: in out Q_PLAYER_CREATION_TEST);
    -- Antes de empezar cada rutina de prueba del caso de prueba
    procedure Set_Up(Test: in out Q_PLAYER_CREATION_TEST);
    -- Después de terminar cada rutina de prueba del caso de prueba
    procedure Tear_Down(Test: in out Q_PLAYER_CREATION_TEST);
    -- Después de terminar todas las rutinas de un caso de prueba
    procedure Tear_Down_Case(Test: in out Q_PLAYER_CREATION_TEST);

    -- Y estas también nos las invoca AUnit automaticamente
    -- Por nosotros registrarlas dentro de la rutina Register_Tests
    procedure TEST_PLAYER_CREATION_HAPPY_PATH(Test: in out AUnit.Test_Cases.Test_Case'Class);
    procedure TEST_PLAYER_CREATION_ALREADY_EXISTS(Test: in out AUnit.Test_Cases.Test_Case'Class);
    
end Q_PLAYER_CREATION_TEST_CASE;