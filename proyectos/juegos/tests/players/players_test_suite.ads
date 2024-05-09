
with AUnit.Test_Suites; -- A un conjunto de pruebas que quiero ejecutar... pero agrupadas

package Players_Test_Suite is
    function Suite_Todas_Las_Pruebas return AUnit.Test_Suites.Access_Test_Suite;
end Players_Test_Suite;