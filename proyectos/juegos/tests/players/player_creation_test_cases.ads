with AUnit.Test_Cases;
with AUnit;

package Player_Creation_Test_Cases is

    type Player_Test_Case is new AUnit.Test_Cases.Test_Case with null record;

    -- Esta función nos la invoca AUnit automaticamente para que registremos
    -- Las rutinas de prueba, asociadas a un caso de prueba
    procedure Register_Tests(V_Test: in out Player_Test_Case);

    -- Esta función nos la invoca AUnit automaticamente
    -- para que demos el nombre del caso de prueba (y que salga en los informes)
    function Name(V_Test_Case: Player_Test_Case) return AUnit.Test_String;

    -- Estas funciones nos las invoca AUnit automaticamente
    
    -- Antes de empezar todas las rutinas de un caso de prueba
    procedure Set_Up_Case(Test: in out Player_Test_Case);
    -- Antes de empezar cada rutina de prueba del caso de prueba
    procedure Set_Up(Test: in out Player_Test_Case);
    -- Después de terminar cada rutina de prueba del caso de prueba
    procedure Tear_Down(Test: in out Player_Test_Case);
    -- Después de terminar todas las rutinas de un caso de prueba
    procedure Tear_Down_Case(Test: in out Player_Test_Case);

    -- Y estas también nos las invoca AUnit automaticamente
    -- Por nosotros registrarlas dentro de la rutina Register_Tests
    procedure Test_1(Test: in out AUnit.Test_Cases.Test_Case'Class);
    procedure Test_2(Test: in out AUnit.Test_Cases.Test_Case'Class);
    
end Player_Creation_Test_Cases;