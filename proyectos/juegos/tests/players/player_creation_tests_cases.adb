with AUnit.Test_Cases; use AUnit.Test_Cases;
with Ada.Text_IO; use Ada.Text_IO;

package body Player_Creation_Test_Cases is

    --procedure Register_Tests(Test: in out Test_Case) is
    --begin
    --    Add_Test("Test_1", Test_1'Access);
    --end Register_Tests;


    procedure Set_Up(Test: in out Test_Case) is
    begin
        Put_Line("Set_Up");
    end Set_Up;

    procedure Tear_Down(Test: in out Test_Case)  is
    begin
        Put_Line("Tear_Down");
    end Set_Up;

    procedure Test_1(Test: in out Test_Case) is
        V_CONDICION: Boolean;
    begin
        Put_Line("Test_1");
        V_CONDICION := False;
        Assert(V_CONDICION, "La prueba 1 ha fallado por que no se cumple la CONDICION");
    end Test_1;

    procedure Test_2(Test: in out Test_Case) is
        V_CONDICION: Boolean;
    begin
        Put_Line("Test_2");
        V_CONDICION := True;
        Assert(V_CONDICION, "La prueba 2 ha fallado por que no se cumple la CONDICION");
    end Test_1;
    
end Player_Creation_Test_Cases;