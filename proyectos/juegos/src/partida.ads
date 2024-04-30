-- Una partida se juega a un juego concreto
-- Defino de antemano el número de manos necesaria para ganar la partida
-- Defina un número máximo de manos jugables
-- Voy a tener un resultado
package Partida is

    type RESULTADO is (COMPUTADORA, JUGADOR, EMPATE);
    type JUGABLE is access function return RESULTADO;
    -- Un jugable es algo que puedo ejecutar (una función) y que me devuelve un resultado
    -- function: función que me devuelve un resultado
    -- access: para que pueda ser un puntero:
        -- Te doy una referencia a una función que me devuelve un resultado.
        -- Esto me permite en tiempo de ejecución, asignarle a esta variable una función concreta que ejecutar... el jugable.

    -- De cara a jugar una partida, necesitaré el juego concreto, información del numero de manos máximo, requerido para ganar
    function JUGAR_PARTIDA(juego: JUGABLE ; numero_manos_maximas: Integer; numero_manos_para_ganar: Integer) return RESULTADO;

end Partida;