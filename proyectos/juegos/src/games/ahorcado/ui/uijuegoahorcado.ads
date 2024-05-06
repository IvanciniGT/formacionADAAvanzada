with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package UIJuegoAhorcado is

    function PEDIR_LETRA_AL_JUGADOR return String;

    procedure MOSTRAR_ESTADO(vidas: Integer; palabra_enmascarada:String; letras_usadas: Unbounded_String);

end UIJuegoAhorcado ;