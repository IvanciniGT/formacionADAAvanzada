-- Definir los juegos que hay disponibles
with UIGameEngine; use UIGameEngine;
with Partida; use Partida;

package body GameEngine is

    procedure PLAY is
        NUMERO_DE_MANOS_MAXIMO: constant integer := 3;
        NUMERO_DE_MANOS_PARA_GANAR: constant integer := 2;
        juegoElegido: JUGABLE;
        ganador: RESULTADO;
    begin
        MOSTRAR_BIENVENIDA;

        Continuar_Jugando: loop

            juegoElegido:= ELEGIR_JUEGO;
        
            Continuar_Jugando_Al_Mismo_juego: loop
                ganador:= JUGAR_PARTIDA(juegoElegido, NUMERO_DE_MANOS_MAXIMO, NUMERO_DE_MANOS_PARA_GANAR);
                exit Continuar_Jugando_Al_Mismo_juego when not JUGAR_DE_NUEVO_AL_MISMO_JUEGO;
            end loop Continuar_Jugando_Al_Mismo_juego;

            exit Continuar_Jugando when not JUGAR_A_OTRO_JUEGO;
        end loop Continuar_Jugando;

        MOSTRAR_DESPEDIDA;

    end PLAY;

end GameEngine;

-- Este procedimiento depende de otros componentes:
-- - Juego
-- - Interfaz de comunicación gráfica con el usuario.

-- Si ejecuto la prueba... y falla? Qué ha fallao? NPI
-- Para hacer una prueba unitaria, necesito aislar al componente: Montarlo en un bastidor,
-- y desligarlo del resto de componentes
-- Si mi diseño no permite el aislar a un componente, será imposible hacer una prueba unitaria (por definición)
--  Y no va a ser fácil aislar al componente en muchos escenarios...