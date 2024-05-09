with AUnit.Test_Cases; use AUnit.Test_Cases;

package Player_Creation_Test_Cases is

    type Player_Test_Case is new Test_Cases.Test_Case with null record;

    procedure Register_Tests(Test: in out Player_Test_Case);
    procedure Set_Up(Test: in out Player_Test_Case);
    procedure Tear_Down(Test: in out Player_Test_Case);

    procedure Test_1(Test: in out Player_Test_Case);
    procedure Test_2(Test: in out Player_Test_Case);
    
end Player_Creation_Test_Cases;