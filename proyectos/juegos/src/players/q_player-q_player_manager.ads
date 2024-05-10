with Ada.Containers.Indefinite_Hashed_Maps;
with Ada.Strings.Hash;

package Q_PLAYER.Q_PLAYER_MANAGER is

    function F_EXISTS_PLAYER(V_PLAYER_NAME: T_NAME_VALUE) return BOOLEAN;
    function F_GET_PLAYER(V_PLAYER_NAME: T_NAME_VALUE) return T_PLAYER;
    procedure P_SAVE_PLAYER(V_PLAYER: T_PLAYER);
    function F_CREATE_NEW_PLAYER(V_PLAYER_NAME: T_NAME_VALUE; V_PLAYER_EMAIL: T_EMAIL_VALUE) return T_PLAYER;

    private
        package Q_PLAYERS_CACHE is new Ada.Containers.Indefinite_Hashed_Maps(
            Key_Type => T_NAME_VALUE,
            Element_Type => T_PLAYER,
            Hash => Ada.Strings.Hash,
            Equivalent_Keys => "="
        ); 
    -- Este es un procedimiento muy básico de cache.
    -- Podemos tener un desbordamiento de memoria.
    -- Limitar el tamaño de la cache es CLAVE
    -- Por ejemplo:
    --   - Eliminación random de elementos cuando llegue al límite ***
    --   - Eliminar los más antiguos . ORDERED MAP
    --   - Eliminar los que lleven más tiempo sin usarse.       Necesito añadir un campo de tiempo
    --   - Eliminar los menos usados.                           Necesito añadir un campo de uso
    V_PLAYERS_CACHE: Q_PLAYERS_CACHE.Map;


end Q_PLAYER.Q_PLAYER_MANAGER;