with AUnit.Assertions; use AUnit.Assertions;
with AUnit.Test_Cases; use AUnit.Test_Cases;
with Q_PLAYER.Tests; use Q_PLAYER.Tests;


package body Test_New_Player is

   procedure Test_Create_New_Player (Test : in out Test_Create_New_Player_Case) is
      V_Player : Q_PLAYER.T_PLAYER;
      V_Name : Q_PLAYER.T_NAME_VALUE := "TestPlayer";
      V_Email : Q_PLAYER.T_EMAIL_VALUE := "test@player.com";
   begin
      -- Invocar la función de creación del subpaquete de pruebas
      V_Player := Create_New_Player(V_Name, V_Email);

      -- Comprobaciones: asegúrate de que los datos del jugador son correctos
      Assert (V_Player.R_NAME = V_Name, "Test Failed: Player name does not match.");
      Assert (V_Player.R_EMAIL = V_Email, "Test Failed: Player email does not match.");

      -- Podrías añadir más comprobaciones relacionadas con los valores predeterminados de las estadísticas, etc.
   end Test_Create_New_Player;

end Test_New_Player;
