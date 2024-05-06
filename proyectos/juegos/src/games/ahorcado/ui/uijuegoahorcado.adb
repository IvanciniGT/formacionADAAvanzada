
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
--with Ada.Characters.ASCII;

package body UIJuegoAhorcado is

    function PEDIR_LETRA_AL_JUGADOR return String is
        caracter_pulsado: String;
    begin
            Put("Dame una letra: ");
            Get(caracter_pulsado); -- Leo 1 caracter
            Skip_Line; -- Paso del resto de la línea
        return ""&caracter_pulsado;    
    end PEDIR_LETRA_AL_JUGADOR;

    procedure MOSTRAR_ESTADO(vidas: Integer; palabra_enmascarada:String; letras_usadas: Unbounded_String) is
    begin
        Put_Line("Número de vidas restantes: " & Integer'Image(vidas) & ASCII.LF &
                 "Palabra: " & palabra_enmascarada & ASCII.LF &
                 "Letras usadas: " & To_String(letras_usadas));
    end MOSTRAR_ESTADO;

end UIJuegoAhorcado;