with AUnit.Assertions; use AUnit.Assertions;
with AUnit.Test_Cases; use AUnit.Test_Cases;
with Q_PLAYER.Tests; use Q_PLAYER.Tests;

package Test_New_Player is

   type Test_Create_New_Player_Case is new AUnit.Test_Cases.Test_Case with null record;

   procedure Test_Create_New_Player (Test : in out Test_Create_New_Player_Case);

end Test_New_Player;
