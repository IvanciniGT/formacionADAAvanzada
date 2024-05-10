with AUnit.Run;
with AUnit.Reporter.Text;
with Q_PLAYERS_TEST_SUITE;

procedure MAIN_TEST is

   procedure Run is new AUnit.Run.Test_Runner(Q_PLAYERS_TEST_SUITE.F_PLAYERS_TEST_SUITE);

   V_Reporter : AUnit.Reporter.Text.Text_Reporter;

begin

   Run(V_Reporter);
   -- El AUnit empieza a hacer mágia.
   -- Aunit va a llamar él solito a la función Register_Tests de Player_Creation_Test_Cases
   -- Ya que en Suite_Todas_Las_Pruebas la función del paquete Players_Test_Suite,
   -- Le he dado un tipo de dato declarado en Player_Creation_Test_Cases
   -- A esa función, nos pasa un dato de tipo: AUnit.Test_Case.Test_Case
   -- Y a ese Test-Case le vamos registrando las rutinas de pruebas que queremos hacer.

end MAIN_TEST;