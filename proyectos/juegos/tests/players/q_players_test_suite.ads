
with AUnit.Test_Suites; -- A un conjunto de pruebas que quiero ejecutar... pero agrupadas

package Q_PLAYERS_TEST_SUITE is
    function F_PLAYERS_TEST_SUITE return AUnit.Test_Suites.Access_Test_Suite;
end Q_PLAYERS_TEST_SUITE;