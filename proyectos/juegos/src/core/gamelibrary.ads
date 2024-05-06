with UIGameEngine; use UIGameEngine;
with Partida;
with Ada.Containers.Vectors;
with Ada.Containers.Indefinite_Ordered_Maps;

package GameLibrary is

    -- Mapa Ordenado con los nombres de los juegos y jugables
    package Q_MAPA_JUGABLES is new Ada.Containers.Indefinite_Ordered_Maps(
        Key_Type     => Unbounded_String,
        Element_Type => Partida.Jugable
    );
    subtype T_MAPA_JUGABLES is T_MAPA_JUGABLES.Map;

    -- Vector con los nombres de los juegos
    package Q_LISTADO_NOMBRES_JUEGOS is new Ada.Containers.Vectors(
        Index_Type => Positive,
        Element_Type => Unbounded_String
    );
    subtype T_LISTADO_NOMBRES_JUEGOS is Q_LISTADO_NOMBRES_JUEGOS.Vector;

    function F_GET_GAME_NAMES return T_LISTADO_NOMBRES_JUEGOS;

    function F_GET_JUGABLE (V_GAME_NAME : Unbounded_String) return Partida.Jugable;

    procedure P_INIT_LIBRARY; -- LOAD_GAMES

end GameLibrary;
