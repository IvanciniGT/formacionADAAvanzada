with Q_PLAYER.Q_PLAYER_MANAGER.Q_PLAYER_CREATION_TEST_CASE;
with Q_STATISTICS.TEST_CASE;
-- El día de mañana, tenga más casos de pruebas, los puedo agregar aquí

with AUnit.Test_Suites; -- A un conjunto de pruebas que quiero ejecutar... pero agrupadas

package body Q_PLAYERS_TEST_SUITE is

    V_STATISTICS_TEST:       aliased Q_STATISTICS.TEST_CASE.Q_STATISTICS_TEST;
    V_PLAYER_CREATION_TEST:  aliased Q_PLAYER.Q_PLAYER_MANAGER.Q_PLAYER_CREATION_TEST_CASE.Q_PLAYER_CREATION_TEST;
    V_PLAYERS_TEST_SUITE:    aliased AUnit.Test_Suites.Test_Suite;
    -- aliased: para que no se pierda la referencia a la instancia

    function F_PLAYERS_TEST_SUITE return AUnit.Test_Suites.Access_Test_Suite is
    begin

        AUnit.Test_Suites.Add_Test(V_PLAYERS_TEST_SUITE'Access, V_PLAYER_CREATION_TEST'Access);
        AUnit.Test_Suites.Add_Test(V_PLAYERS_TEST_SUITE'Access, V_STATISTICS_TEST'Access);
        return V_PLAYERS_TEST_SUITE'Access;

    end F_PLAYERS_TEST_SUITE;

end Q_PLAYERS_TEST_SUITE;
