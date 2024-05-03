package body Juego is

    -- Definimos la configuración de un juego... como concepto
    -- Será un Record (similar a un struct de C) que me permite agrupar otros datos... potencialmente de distinto tipo
    -- Normalmente al definir un record, indicamos los datos que contendrá.
    -- En este caso, aún no lo sé. Va a depender del tipo de juego: null: NADA
    -- Eso si... querré definirlo el dia de mañana.... en funcion del juego... por eso lo defino como tagged
    -- Es algo que suministraremos cuando queramos juagr una mano a ese juego

    function JUGAR_MANO(config: Configuracion) return Partida.RESULTADO is
    begin
        return Partida.EMPATE;
    end JUGAR_MANO;

end Juego;