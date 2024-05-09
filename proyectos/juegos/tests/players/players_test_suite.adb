with Player_Creation_Test_Cases;
-- El día de mañana, tenga más casos de pruebas, los puedo agregar aquí

with AUnit.Test_Suites; -- A un conjunto de pruebas que quiero ejecutar... pero agrupadas

package body Players_Test_Suite is

    V_CASO_DE_PRUEBA:           Player_Creation_Test_Cases.Player_Test_Case;
    V_SUITE_CON_MIS_PRUEBAS:    AUnit.Test_Suites.Test_Suite;

    function Suite_Todas_Las_Pruebas return AUnit.Test_Suites.Access_Test_Suite is
    begin

        AUnit.Test_Suites.Add_Test(V_SUITE_CON_MIS_PRUEBAS'Access, V_CASO_DE_PRUEBA'Access);

        return V_SUITE_CON_MIS_PRUEBAS'Access;

    end Suite_Todas_Las_Pruebas;

end Players_Test_Suite;
