with AUnit.Assertions; use AUnit.Assertions;
--with Q_PLAYER.Tests; use Q_PLAYER.Tests;
--with Q_PLAYER; use Q_PLAYER;
with AUnit;            use AUnit;
with AUnit.Test_Cases; use AUnit.Test_Cases;
with Ada.Text_IO; use Ada.Text_IO;

package body Tests is

   ----------------------------------------------
   -- Test Case Name and Routine Registrations --
   ----------------------------------------------
   
   procedure Register_Tests (T: in out Test_Case) is
      use Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Create_New_Player'Access, "Test A");
      Register_Routine (T, Test_Create_New_Player_2'Access, "Test B");
   end Register_Tests;

   function Name (T: Test_Case) return Test_String is
   begin
      return Format ("Pruebas 1");
   end Name;
   
   -------------------------------
   --  Test Setup and Tear Down --
   -------------------------------

   procedure Set_Up (T : in out Test_Case) is
   begin
      Put_Line ("| Set_Up");
   end Set_Up;
   
   procedure Set_Up_Case (T : in out Test_Case) is
   begin
      Put_Line ("Set_Up_Case");
   end Set_Up_Case;
   
   procedure Tear_Down (T : in out Test_Case) is
   begin
      Put_Line ("| Tear_Down");
   end Tear_Down;
   
   procedure Tear_Down_Case (T : in out Test_Case) is
   begin
      Put_Line ("Tear_Down_Case");
   end Tear_Down_Case;
   
   -------------------------
   -- Test Routines A/B/C --
   -------------------------

   procedure Test_Create_New_Player (Test : in out Test_Cases.Test_Case'Class) is
      --V_Player : T_PLAYER_TEST;
      --V_Name : T_NAME_VALUE := T_NAME_VALUE'"TestPlayer";
      --V_Email : T_EMAIL_VALUE := "test@player.com";
   begin
      -- Invocar la función de creación del subpaquete de pruebas
      --V_Player := Create_New_Player(V_Name, V_Email);
      Put_Line("OK");
      -- Comprobaciones: los datos del jugador son correctos
      --Assert (V_Player.R_NAME = V_Name, "Test Failed: Player name does not match.");
      --Assert (V_Player.R_EMAIL = V_Email, "Test Failed: Player email does not match.");
      Assert(False, "Test Failed: Player email does not match.");
   end Test_Create_New_Player;

   procedure Test_Create_New_Player_2 (Test : in out Test_Cases.Test_Case'Class) is
   begin
      Put_Line("OK2");
      Assert(True, "Test Failed: Player email does not match.");
   end Test_Create_New_Player_2;
end Tests;
