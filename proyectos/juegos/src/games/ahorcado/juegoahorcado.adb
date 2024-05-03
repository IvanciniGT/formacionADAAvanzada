with Partida;
package body JuegoAhorcado is

    overriding function JUGAR_MANO(config: ConfiguracionJuegoAhorcado) return Partida.RESULTADO is
    begin
        -- Por defecto, establecer ganadora a la COMPUTADORA
        -- cargar las potenciales palabras (fichero)                       \
        -- elegir la palabra aleatoriamente (de entre las potenciales)     / Helpers
        -- Guardar convertida a MAYUSCULAS | MINUSCULAS                   /
        -- ENMASCARAR                                                    /
        -- BUCLE: Mientras le queden vidas:
            -- mostrar el estado del juego en este punto:PINTAR POR PANTALLA (1) - UI
            -- Pedir una letra                                                   - UI
            -- la añado a las usadas
            -- Si la palabra tiene la letra: -> CONDICIONAL
                -- REENMASCARAR
                -- Si ya acertó todas las letras: GANADOR... Y SALGO
            -- Si no la tiene:
                -- Le quito vida
        
        -- Cuando salgo del bucle:
            -- Muestro el estado final del juego.
    end JUGAR_MANO;

end JuegoAhorcado;