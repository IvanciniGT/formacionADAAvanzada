with AUnit;
with AUnit.Test_Cases;          
with AUnit.Assertions;          
with Ada.Text_IO;            

package body Player_Creation_Test_Cases is


    procedure Register_Tests(V_Test: in out Player_Test_Case) is
    begin
        AUnit.Test_Cases.Registration.Register_Routine(V_Test, Test_1'Access, "Test 1");
        AUnit.Test_Cases.Registration.Register_Routine(V_Test, Test_2'Access, "Test 2");
    end Register_Tests;

    function Name(V_Test_Case: Player_Test_Case) return AUnit.Test_String is
    begin
        return AUnit.Format("Mis pruebas de creación de un jugaqdor");
    end Name;

    procedure Set_Up_Case(Test: in out Player_Test_Case) is
    begin
        Ada.Text_IO.Put_Line("Set_Up_Case");
    end Set_Up_Case;

    procedure Tear_Down_Case(Test: in out Player_Test_Case) is
    begin
        Ada.Text_IO.Put_Line("Tear_Down_Case");
    end Tear_Down_Case;

    procedure Set_Up(Test: in out Player_Test_Case) is
    begin
        Ada.Text_IO.Put_Line("Set_Up");
    end Set_Up;

    procedure Tear_Down(Test: in out Player_Test_Case)  is
    begin
        Ada.Text_IO.Put_Line("Tear_Down");
    end Tear_Down;

    procedure Test_1(Test: in out AUnit.Test_Cases.Test_Case'Class) is
        V_CONDICION: Boolean;
    begin
        Ada.Text_IO.Put_Line("Test_1");
        V_CONDICION := False;
        AUnit.Assertions.Assert(V_CONDICION, "La prueba 1 ha fallado por que no se cumple la CONDICION");
    end Test_1;

    procedure Test_2(Test: in out AUnit.Test_Cases.Test_Case'Class) is
        V_CONDICION: Boolean;
    begin
        Ada.Text_IO.Put_Line("Test_2");
        V_CONDICION := True;
        AUnit.Assertions.Assert(V_CONDICION, "La prueba 2 ha fallado por que no se cumple la CONDICION");
    end Test_2;
    
end Player_Creation_Test_Cases;