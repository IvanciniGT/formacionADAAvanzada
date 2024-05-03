with Partida;
with HelpersJuegoAhorcado; use HelpersJuegoAhorcado;
with UIJuegoAhorcado; use UIJuegoAhorcado;
package body JuegoAhorcado is

    overriding function JUGAR_MANO(config: ConfiguracionJuegoAhorcado) return Partida.RESULTADO is
        palabras                : ListadoPalabras;
        --palabra_a_adivinar      : Unbounded_String; Opción 1
        ganador                 : Partida.RESULTADO ;
    begin
        ganador := Partida.RESULTADO.COMPUTADORA; -- Por defecto, establecer ganadora a la COMPUTADORA
        palabras := CARGAR_PALABRAS_DE_FICHERO(config.tematica);
        declare
            intentos_restantes      : Integer           := 6;
            letras_usadas           : Unbounded_String  := "";
            caracteres_especiales   : String            := " -";

            palabra_a_adivinar      : constant String := ELEGIR_PALABRA_ALEATORIAMENTE(palabras); -- Opción 2
            palabra_para_validar    : constant String := NORMALIZAR_PALABRA(palabra_a_adivinar);
            palabra_enmascarada     : String          := ENMASCARAR(palabra_para_validar, letras_usadas, config.caracteres_especiales);

            caracter_elegido        : Character;
        begin
            while intentos_restantes > 0 loop
                MOSTRAR_ESTADO(intentos_restantes, palabra_enmascarada, letras_usadas);
                caracter_elegido := PEDIR_LETRA_AL_JUGADOR;
                caracter_elegido := NORMALIZAR_CARACTER(caracter_elegido);
                letras_usadas := letras_usadas & caracter_elegido;
                -- Si la palabra tiene la letra: -> CONDICIONAL
                    -- REENMASCARAR
                    -- Si ya acertó todas las letras: GANADOR... Y SALGO
                -- Si no la tiene:
                    -- Le quito vida
            
                -- Cuando salgo del bucle:
                    -- Muestro el estado final del juego.
            end loop;
        end;
        return ganador;
    end JUGAR_MANO;

end JuegoAhorcado;


--    function ENMASCARAR(palabra: String; caracteres_usados: String; caracteres_especiales: String) return String;
--    function NORMALIZAR_PALABRA(palabra: String) return String;
--    function NORMALIZAR_CARACTER(letra: Character) return String;
--    function CARGAR_PALABRAS_DE_FICHERO(tematica: String) return ListadoPalabras;
--    function ELEGIR_PALABRA_ALEATORIAMENTE(palabras: ListadoPalabras) return String;
