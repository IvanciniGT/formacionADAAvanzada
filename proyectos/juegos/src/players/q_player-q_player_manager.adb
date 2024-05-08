
with Ada.Containers.Indefinite_Hashed_Maps;
with Ada.Wide_Strings.Hash;
package body Q_PLAYER.Q_PLAYER_MANAGER is

    package Q_PLAYERS_CACHE is new Ada.Containers.Indefinite_Hashed_Maps(
        Key_Type => T_NAME_VALUE,
        Element_Type => T_PLAYER
        Hash => Ada.Wide_Strings.Hash,
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

    function F_EXISTS_PLAYER(V_PLAYER_NAME: T_NAME_VALUE) return BOOLEAN is
    begin
        if V_PLAYERS_CACHE.Exists(V_PLAYER_NAME) then -- Lo primero, mirar si está en la cache
            return TRUE;
        else                                          -- Si no está en cache? Mirar si existe el fichero
            return Q_PLAYER.Q_REPOSITORY.F_EXISTS_PLAYER(V_PLAYER_NAME);
        end if;
    end F_EXISTS_PLAYER;
    
    function F_GET_PLAYER(V_PLAYER_NAME: T_NAME_VALUE) return T_PLAYER is
    begin
        -- Lo primero, mirar si está en la cache. Si está, lo devuelvo de ahí
        -- Si no? Lo leo del fichero si existe
            -- Que también genero un objeto de tipo T_PLAYER
                -- Me subscribo a sus actualizaciones
    end F_GET_PLAYER;
    
    function F_SAVE_PLAYER(V_PLAYER: T_PLAYER) return BOOLEAN is
    begin
        -- Lo guardo en cache
        -- Lo guardo en fichero
    end F_SAVE_PLAYER;

    function F_CREATE_NEW_PLAYER(V_PLAYER_NAME: T_NAME_VALUE; V_PLAYER_EMAIL: T_EMAIL_VALUE) return T_PLAYER is
    begin
        -- Creo un jugador nuevo
            -- Me subscribo a sus actualizaciones
        -- Lo guardo en cache
        -- mandar un email
        -- Lo guardo en fichero > ESTO HAY QUE DELEGARLO A OTRO PAQUETE
    end F_CREATE_NEW_PLAYER;

-- Y si cambian el nombre de un jugador?
    procedure(V_PLAYER_ACCESS: T_PLAYER_ACCESS) is
    begin
        -- Cambio el nombre en cache
        -- Cambio el nombre en fichero
        -- AQUI TENGO UN PROBLEMA!
            -- Puedo cambiar el nombre en cache??
            --- NO... solo puedo meterlo otra vez con el nuevo nombre
            --- CAMBIARLO implicaría tener el anterior... y no lo tengo... Mas vale que me lo pasen
    end F_CHANGE_PLAYER_NAME;

end Q_PLAYER.Q_PLAYER_MANAGER;
