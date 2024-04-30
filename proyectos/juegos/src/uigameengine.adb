with Ada.Text_IO; use Ada.Text_IO;

with Partida; use Partida;

package body UIGameEngine is

    procedure MOSTRAR_BIENVENIDA is
    begin
        Put_Line("Bienvenido a nuestra app de juegos cutre!");
    end MOSTRAR_BIENVENIDA;

    procedure MOSTRAR_RESULTADO_MANO(ganador: RESULTADO) is
    begin
        if ganador = JUGADOR then
            Put_Line("Has ganado TU.... suerte del principiante!!!");
        elsif ganador = COMPUTADORA then
            Put_Line("He ganado yo.... paquete!!!"); 
        else 
            Put_Line("Hemos Empatado....");
        end if;
    end MOSTRAR_RESULTADO_MANO;

    procedure MOSTRAR_RESULTADO_PARTIDA(ganador: RESULTADO) is
    begin
        case ganador is
            when JUGADOR =>
                Put_Line("Has ganado la partida.... suerte del principiante!!!");
            when COMPUTADORA =>
                Put_Line("He ganado la partida.... paquete!!!");
            when EMPATE => --when others =>
                Put_Line("Hemos empatado la partida....");
        end case;
    end MOSTRAR_RESULTADO_PARTIDA;

    procedure MOSTRAR_DESPEDIDA is
    begin
        Put_Line("Gracias por jugar a nuestra app de juegos cutre!");
    end MOSTRAR_DESPEDIDA;


    function PREGUNTAR_SI_O_NO(pregunta: String; respuesta_si_no_atina: String ) return boolean is
        respuesta: boolean:= false ;
        caracter_pulsado: Character;
    begin
        for Oportunidades in 1..3 loop
            Put(pregunta & " (s/n): ");
            Get(caracter_pulsado); -- Leo 1 caracter
            Skip_Line; -- Paso del resto de la línea

            case caracter_pulsado is
                when 's' | 'S' =>
                    respuesta := true;
                    exit;
                when 'n' | 'N' =>
                    exit;
                when others =>
                    if Oportunidades < 3 then
                        Put_Line("Por favor, introduce 's' o 'n'");
                    else 
                        Put_Line(respuesta_si_no_atina);
                    end if;
            end case;
        end loop;

        return respuesta;
    end PREGUNTAR_SI_O_NO;

    
    function JUGAR_A_OTRO_JUEGO return boolean is
    begin
        return PREGUNTAR_SI_O_NO("¿Quieres jugar a otro juego?", "Vale, no te gusta jugar a juegos...");
    end JUGAR_A_OTRO_JUEGO;

    function JUGAR_DE_NUEVO_AL_MISMO_JUEGO return boolean is
    begin
        return PREGUNTAR_SI_O_NO("¿Quieres jugar de nuevo al mismo juego?", "Vale, no te gusta este juego...");
    end JUGAR_DE_NUEVO_AL_MISMO_JUEGO;


    function ELEGIR_JUEGO return JUGABLE is
        juegoElegido: JUGABLE;
    begin
        -- Preguntar al usuario qué juego quiere jugar
        -- Devolver el juego elegido
        return juegoElegido;
    end ELEGIR_JUEGO;

end UIGameEngine;