with Partida; use Partida;
with HelpersJuegoAhorcado; use HelpersJuegoAhorcado;
with UIJuegoAhorcado; use UIJuegoAhorcado;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Text_IO; use Ada.Text_IO;

package body JuegoAhorcado is

    function ACIERTA_CON_LA_LETRA(palabra: String; letra: String) return Boolean is
    begin
        return Index(palabra, letra, 1) /= 0;
    end ACIERTA_CON_LA_LETRA;

    overriding function JUGAR_MANO(config: ConfiguracionJuegoAhorcado) return Partida.RESULTADO is
        palabras                : ListadoPalabras;
        --palabra_a_adivinar      : Unbounded_String; Opción 1
        ganador                 : Partida.RESULTADO ;
    begin
        ganador := COMPUTADORA; -- Por defecto, establecer ganadora a la COMPUTADORA
        palabras := CARGAR_PALABRAS_DE_FICHERO(To_String(config.tematica));
        declare
            intentos_restantes      : Integer           := 6;
            letras_usadas           : Unbounded_String  := To_Unbounded_String("");
            caracteres_especiales   : constant String   := " -";
            palabra_a_adivinar      : constant String   := ELEGIR_PALABRA_ALEATORIAMENTE(palabras); -- Opción 2
            palabra_para_validar    : constant String   := NORMALIZAR_PALABRA(palabra_a_adivinar);
            palabra_enmascarada     : String            := ENMASCARAR(palabra_a_adivinar, palabra_para_validar, To_String(letras_usadas), caracteres_especiales);
            caracter_elegido        : String(1..1);
            acierto                 : Boolean;
        begin
            while intentos_restantes > 0 loop
                MOSTRAR_ESTADO(intentos_restantes, palabra_enmascarada, letras_usadas);
                caracter_elegido := PEDIR_LETRA_AL_JUGADOR;
                caracter_elegido := NORMALIZAR_CARACTER(caracter_elegido);
                if Index(letras_usadas, caracter_elegido, 1) /= 0 then
                    acierto := False;
                else
                    acierto := ACIERTA_CON_LA_LETRA(palabra_para_validar, caracter_elegido);
                    letras_usadas := letras_usadas & caracter_elegido;
                end if;
                if acierto then
                    palabra_enmascarada := ENMASCARAR(palabra_a_adivinar, palabra_para_validar, To_String(letras_usadas), caracteres_especiales);
                    if palabra_enmascarada = palabra_a_adivinar then
                        ganador := JUGADOR;
                        exit;
                    end if;
                else
                    intentos_restantes := intentos_restantes - 1;
                end if;
            end loop;
            MOSTRAR_ESTADO(intentos_restantes, palabra_a_adivinar, letras_usadas);
        end;
        return ganador;
    end JUGAR_MANO;

end JuegoAhorcado;
