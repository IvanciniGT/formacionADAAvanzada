with UIGameEngine; use UIGameEngine;
package body Partida is

    type RESULTADOS_ACUMULADOS is array(RESULTADO) of Integer;

    function HAY_QUE_SEGUIR_JUGANDO(resultados_acumulados_manos: RESULTADOS_ACUMULADOS;
                                    numero_manos_maximas: Integer; 
                                    numero_manos_para_ganar: Integer
    ) return Boolean is
        manos_jugadas: Integer := resultados_acumulados_manos(COMPUTADORA) + resultados_acumulados_manos(JUGADOR) + resultados_acumulados_manos(EMPATE);
    begin
        if resultados_acumulados_manos(COMPUTADORA) = numero_manos_para_ganar then
            return False;
        elsif resultados_acumulados_manos(JUGADOR) = numero_manos_para_ganar then
            return False;
        end if;
        return (manos_jugadas < numero_manos_maximas); -- si quedan manos disponibles.
    end HAY_QUE_SEGUIR_JUGANDO;


    function DETERMINAR_GANADOR(resultados_acumulados_manos: RESULTADOS_ACUMULADOS; numero_manos_para_ganar: Integer) return RESULTADO is
    begin
         return ( -- Recomputo el ganador de la partida
                if resultados_acumulados_manos(COMPUTADORA) = numero_manos_para_ganar then
                    COMPUTADORA
                elsif resultados_acumulados_manos(JUGADOR) = numero_manos_para_ganar then
                    JUGADOR
                else
                    EMPATE
            );
    end DETERMINAR_GANADOR;

    function JUGAR_PARTIDA(juego: JUGABLE ; numero_manos_maximas: Integer; numero_manos_para_ganar: Integer) return RESULTADO is
        --resultados_acumulados_manos: array(1..2) of Integer := (0, 0); --- El 1 la perona y el 2... RUINA !!!
        resultados_acumulados_manos: RESULTADOS_ACUMULADOS := (0, 0, 0); 
            -- type RESULTADO is (COMPUTADORA, JUGADOR, EMPATE);
            --  [COMPUTADORA] = 0,
            --  [JUGADOR] = 0,
            --  [EMPATE] = 0
        ganador: RESULTADO;
    begin
        while HAY_QUE_SEGUIR_JUGANDO(resultados_acumulados_manos, numero_manos_maximas, numero_manos_para_ganar) loop
            ganador:= juego.all; -- El .all en c equivaldría a un *... para desreferenciar el puntero
            MOSTRAR_RESULTADO_MANO(ganador);
            resultados_acumulados_manos(ganador) := resultados_acumulados_manos(ganador) + 1;
        end loop;

        ganador:= DETERMINAR_GANADOR(resultados_acumulados_manos, numero_manos_para_ganar);

        MOSTRAR_RESULTADO_PARTIDA(ganador);
        return ganador;
    end JUGAR_PARTIDA;



end Partida;