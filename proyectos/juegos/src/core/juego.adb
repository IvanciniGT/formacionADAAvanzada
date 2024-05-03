with Partida;
package body Juego is

    function JUGAR_MANO(config: Configuracion) return Partida.RESULTADO is 
    begin
        return Partida.EMPATE;
    end JUGAR_MANO;

end Juego;