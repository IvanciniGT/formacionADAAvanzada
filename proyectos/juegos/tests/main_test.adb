with AUnit.Run;
with AUnit.Reporter.Text;
with Players_Test_Suite;

procedure Main_Test is

   procedure Run is new AUnit.Run.Test_Runner(Players_Test_Suite.Suite_Todas_Las_Pruebas);

   V_Reporter : AUnit.Reporter.Text.Reporter;

begin

   Run(V_Reporter);

end Main_Test;