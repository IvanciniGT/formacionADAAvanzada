with Ada.Numerics.Discrete_Random;

package body AdivinarNumeroHelpers is

    function PEDIR_NUMERO_A_LA_COMPUTADORA(minimo: Natural; maximo: Natural) return Natural is 

        subtype Rango_Numerico is Natural range minimo .. maximo;

        package NumerosAleatorios is new Ada.Numerics.Discrete_Random(
            Result_Subtype => Rango_Numerico
        ); use NumerosAleatorios;

        generador_numeros_aleatorios: Generator;

    begin
        Reset(generador_numeros_aleatorios);
        return Random(generador_numeros_aleatorios);
    end PEDIR_NUMERO_A_LA_COMPUTADORA;
    
    -- Refactorizar el código y a Optimizar

end AdivinarNumeroHelpers;