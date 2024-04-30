
with Ada.Text_IO; use Ada.Text_IO;

package body UIAdivinarNumeroJuego is

    function PEDIR_NUMERO_AL_JUGADOR return Natural is 
        numero_seleccionado: Natural;
    begin

        return numero_seleccionado;
    end PEDIR_NUMERO_AL_JUGADOR;

    procedure MOSTRAR_MENSAJE_AL_USUARIO(mensaje: String) is
    begin
        Put_Line(mensaje);
    end MOSTRAR_MENSAJE_AL_USUARIO;

end UIAdivinarNumeroJuego;