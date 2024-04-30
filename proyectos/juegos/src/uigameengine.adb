with Ada.Text_IO; use Ada.Text_IO;

with Partida; use Partida;

package UIGameEngine is

    procedure MOSTRAR_BIENVENIDA is
    begin
        Put_Line("Bienvenido a nuestra app de juegos cutre!");
    end MOSTRAR_BIENVENIDA;

    procedure MOSTRAR_RESULTADO_MANO(ganador: RESULTADO);

    procedure MOSTRAR_RESULTADO_PARTIDA(ganador: RESULTADO);

    procedure MOSTRAR_DESPEDIDA is
    begin
        Put_Line("Gracias por jugar a nuestra app de juegos cutre!");
    end MOSTRAR_DESPEDIDA;

end UIGameEngine;