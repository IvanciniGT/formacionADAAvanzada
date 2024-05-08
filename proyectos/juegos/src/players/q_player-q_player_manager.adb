
with Ada.Containers.Indefinite_Hashed_Maps;
with Ada.Wide_Strings.Hash;
package body Q_PLAYER.Q_PLAYER_MANAGER is

    package Q_PLAYERS_CACHE is new Ada.Containers.Indefinite_Hashed_Maps(
        Key_Type => T_NAME_VALUE,
        Element_Type => T_PLAYER,
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
    

--    function F_GET_PLAYER(V_PLAYER_NAME: T_NAME_VALUE) return T_PLAYER is
--        V_PLAYER: T_PLAYER;
--    begin
--        if V_PLAYERS_CACHE.Exists(V_PLAYER_NAME) then -- Lo primero, mirar si está en la cache
--            return V_PLAYERS_CACHE.Element(V_PLAYER_NAME);
--        else                                          -- Si no está en cache? Mirar si existe el fichero
--            if Q_REPOSITORY.F_EXISTS_PLAYER(V_PLAYER_NAME) then
--                V_PLAYER :=  Q_REPOSITORY.F_LOAD_PLAYER(V_PLAYER_NAME);
--                V_PLAYERS_CACHE.Insert(V_PLAYER_NAME, V_PLAYER);
--                return V_PLAYER;
--            else
--                raise Q_PLAYER.Q_PLAYER_NOT_FOUND;
--            end if;
--        end if;
--    end F_GET_PLAYER;


    function F_GET_PLAYER(V_PLAYER_NAME: T_NAME_VALUE) return T_PLAYER is
    begin
        if not V_PLAYERS_CACHE.Exists(V_PLAYER_NAME) then -- Lo primero, mirar si está en la cache
            if Q_REPOSITORY.F_EXISTS_PLAYER(V_PLAYER_NAME) then
                V_PLAYERS_CACHE.Insert(V_PLAYER_NAME, Q_REPOSITORY.F_LOAD_PLAYER(V_PLAYER_NAME));
            else
                raise Q_PLAYER.Q_PLAYER_NOT_FOUND;
            end if;
        end if;
        return V_PLAYERS_CACHE.Element(V_PLAYER_NAME);
    end F_GET_PLAYER;

    
    procedure P_SAVE_PLAYER(V_PLAYER: T_PLAYER) is
    begin
        -- Lo guardo en cache
        V_PLAYERS_CACHE.Insert(V_PLAYER.R_NAME, V_PLAYER);
        -- Lo guardo en fichero
        Q_PLAYER.Q_REPOSITORY.F_SAVE_PLAYER(V_PLAYER);
    end P_SAVE_PLAYER;

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
