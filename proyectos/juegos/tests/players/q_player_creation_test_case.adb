with AUnit;
with AUnit.Test_Cases;          
with AUnit.Assertions;          
with Ada.Text_IO;            

package body Q_PLAYER_CREATION_TEST_CASE is


    procedure Register_Tests(V_Test: in out Q_PLAYER_CREATION_TEST) is
    begin
        AUnit.Test_Cases.Registration.Register_Routine(V_Test, TEST_PLAYER_CREATION_HAPPY_PATH'Access, "Happy path");
        AUnit.Test_Cases.Registration.Register_Routine(V_Test, TEST_PLAYER_CREATION_ALREADY_EXISTS'Access, "Fallar si ya existe el jugador");
    end Register_Tests;

    function Name(V_Test_Case: Q_PLAYER_CREATION_TEST) return AUnit.Test_String is
    begin
        return AUnit.Format("Creación de un jugador");
    end Name;

    procedure Set_Up_Case(Test: in out Q_PLAYER_CREATION_TEST) is
    begin
        Ada.Text_IO.Put_Line("Set_Up_Case");
    end Set_Up_Case;

    procedure Tear_Down_Case(Test: in out Q_PLAYER_CREATION_TEST) is
    begin
        Ada.Text_IO.Put_Line("Tear_Down_Case");
    end Tear_Down_Case;

    procedure Set_Up(Test: in out Q_PLAYER_CREATION_TEST) is
    begin
        Ada.Text_IO.Put_Line("Set_Up");
    end Set_Up;

    procedure Tear_Down(Test: in out Q_PLAYER_CREATION_TEST)  is
    begin
        Ada.Text_IO.Put_Line("Tear_Down");
    end Tear_Down;


    procedure TEST_PLAYER_CREATION_HAPPY_PATH(Test: in out AUnit.Test_Cases.Test_Case'Class) is
        V_CONDICION: Boolean;
    begin
        -- TODO: Implementar el test
        AUnit.Assertions.Assert(True, "No se puede crear un jugador nuevo, cuando debería");
    end TEST_PLAYER_CREATION_HAPPY_PATH;


    procedure TEST_PLAYER_CREATION_ALREADY_EXISTS(Test: in out AUnit.Test_Cases.Test_Case'Class) is
        V_CONDICION: Boolean;
    begin
        Ada.Text_IO.Put_Line("Test_2");
        V_CONDICION := True;
        AUnit.Assertions.Assert(V_CONDICION, "No se detecta que el jugador ya existe antes de su creación");
    end TEST_PLAYER_CREATION_ALREADY_EXISTS;
    
end Q_PLAYER_CREATION_TEST_CASE;