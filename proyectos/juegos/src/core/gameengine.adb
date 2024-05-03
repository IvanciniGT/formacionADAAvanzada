-- Definir los juegos que hay disponibles
with UIGameEngine; use UIGameEngine;
with Partida; use Partida;
with Juego; use Juego;
with AdivinarNumeroJuego; use AdivinarNumeroJuego;
package body GameEngine is

    -- Esto lo vamos a llevar a un paquete nuevo: LibreríaDeJuegos

    function JUGAR_JUEGO_DUMMY return RESULTADO is
        type ConfiguracionDummy is new Configuracion with null record;
        miConfiguracion: ConfiguracionDummy := ConfiguracionDummy'(null record);
    begin
        return JUGAR_MANO(miConfiguracion); -- Juego.JUGAR_MANO
                                            -- Nosotros tenemos varias definiciones de la función JUGAR_MANO
                                            -- Esas definiciones usan tipos distintos para los argumentos
                                            -- En AdivinarNumeroJuego hemos SOBREESCRITO la función JUGAR_MANO
                                            -- Sobreescritura (override) es un concepto de la programación orientada a objetos
                                            -- por el cual damos una nueva definición de una función que ya existía previamente
                                            -- Y al hacerlo, personalizamos el comportamiento de esa función para un TIPO CONCRETO
                                            -- El compilador va a decidir a qué función llamar en función del TIPO de los argumentos
                                            -- En automático
                                            -- En este caso, no hay declaración de la función JUGAR_MANO que defina directamente
                                            -- El tipo de argumento ConfiguraciónDummy.
                                            -- Pero ConfiguracionDummy es una Configuracion...
                                            -- Y si hay una definición de JUGAR_MANO que admite Configuracion
                                            -- Y es la que se va a llamar
    end JUGAR_JUEGO_DUMMY;

    function JUGAR_JUEGO_ADIVINAR_NUMERO return RESULTADO is
        miConfiguracion: ConfiguracionAdivinarNumero := ConfiguracionAdivinarNumero'( minimo => 0, maximo => 20, intentos => 3);
    begin
        return JUGAR_MANO(miConfiguracion); -- AdivinarNumeroJuego.JUGAR_MANO
                                            -- En este caso, hay 2 definiciones de la función JUGAR_MANO compatibles con el tipo de argumento
                                            -- Pero el compilador va a elegir la que está en AdivinarNumeroJuego
                                            -- Ya que es más específica
    end JUGAR_JUEGO_ADIVINAR_NUMERO;

    procedure PLAY is
        NUMERO_DE_MANOS_MAXIMO: constant integer := 3;
        NUMERO_DE_MANOS_PARA_GANAR: constant integer := 2;
        juegoElegido: JUGABLE;
        ganador: RESULTADO;
    begin
        MOSTRAR_BIENVENIDA;

        Continuar_Jugando: loop

            juegoElegido:= JUGAR_JUEGO_ADIVINAR_NUMERO'Access;
            --JUGAR_JUEGO_DUMMY'Access;
            --ELEGIR_JUEGO;
        
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