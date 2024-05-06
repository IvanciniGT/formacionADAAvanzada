with Partida; use Partida;
with GameLibrary;
package UIGameEngine is

    procedure MOSTRAR_BIENVENIDA;

    procedure MOSTRAR_RESULTADO_MANO(ganador: RESULTADO);

    procedure MOSTRAR_RESULTADO_PARTIDA(ganador: RESULTADO);

    procedure MOSTRAR_DESPEDIDA;

    function JUGAR_A_OTRO_JUEGO return boolean;

    function JUGAR_DE_NUEVO_AL_MISMO_JUEGO return boolean;

    function ELEGIR_JUEGO(V_LISTADO_NOMBRES_JUEGOS: GameLibrary.T_LISTADO_NOMBRES_JUEGOS) return String;

end UIGameEngine;