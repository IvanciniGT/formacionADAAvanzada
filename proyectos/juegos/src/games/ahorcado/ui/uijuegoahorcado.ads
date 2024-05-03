with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package UIJuegoAhorcado is

    function PEDIR_LETRA_AL_JUGADOR return Character;

    procedure MOSTRAR_ESTADO(vidas: Integer; palabraEnmascarada:String; letrasUsadas: Unbounded_String);

end package UIJuegoAhorcado is
;