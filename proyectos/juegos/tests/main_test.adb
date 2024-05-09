with AUnit.Test_Runner; use AUnit.Test_Runner;
with Test_New_Player; use Test_New_Player;

procedure Main_Test is
   -- Crear una instancia del runner que gestionará la ejecución de las pruebas.
   Runner : Test_Runner_Type;
begin
   -- Registra los casos de prueba en el runner.
   Add (Runner, Test_Create_New_Player_Case'Access);

   -- Ejecutar todas las pruebas registradas.
   Run (Runner);
end Main_Test;
