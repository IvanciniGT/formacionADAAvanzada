
with Ada.Containers.Indefinite_Hashed_Maps;
with Ada.Strings.Hash;
with Q_PLAYER.Q_REPOSITORY;
with Ada.Text_IO;

package body Q_PLAYER.Q_PLAYER_MANAGER is

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

    function F_EXISTS_PLAYER(V_PLAYER_NAME: T_NAME_VALUE) return BOOLEAN is
    begin
        if V_PLAYERS_CACHE.Contains(V_PLAYER_NAME) then -- Lo primero, mirar si está en la cache
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
        if not V_PLAYERS_CACHE.Contains(V_PLAYER_NAME) then -- Lo primero, mirar si está en la cache
            if Q_REPOSITORY.F_EXISTS_PLAYER(V_PLAYER_NAME) then
                V_PLAYERS_CACHE.Insert(V_PLAYER_NAME, Q_REPOSITORY.F_LOAD_PLAYER(V_PLAYER_NAME));
            else
                raise Q_PLAYER.EX_PLAYER_NOT_FOUND;
            end if;
        end if;
        return V_PLAYERS_CACHE.Element(V_PLAYER_NAME);
    end F_GET_PLAYER;

    
    procedure P_SAVE_PLAYER(V_PLAYER: T_PLAYER) is
    begin
        -- Meter el jugador en una cache
        V_PLAYERS_CACHE.Insert(V_PLAYER.R_NAME, V_PLAYER);
        -- Solicitar al repo el guardado del player
        -- o llamar al procedimiento P_SAVE_PLAYER con el jugador
        Q_PLAYER.Q_REPOSITORY.P_SAVE_PLAYER(V_PLAYER);
        -- Estoy  llamando al procedimiento P_SAVE_PLAYER del paquete Q_REPOSITORY
        -- Que es el paquete que está haciendo el tio ese del bigote... NO YO !!!
        --- El problma está en que estamos llamando al P_SAVE_PLAYER del paquete Q_REPOSITORY
        --- Y si se llamase a OTRO P_SAVE_PLAYER???
        --- De que estoy hablando?
    end P_SAVE_PLAYER;

    procedure P_PLAYER_UPDATED(V_PLAYER_CHANGES: T_PLAYER_CHANGES) is
    begin
        if V_PLAYER_CHANGES.R_PLAYER.R_NAME /= V_PLAYER_CHANGES.R_OLD_NAME then
            -- Cambio el nombre en cache
            V_PLAYERS_CACHE.Delete(V_PLAYER_CHANGES.R_OLD_NAME);
            Q_PLAYER.Q_REPOSITORY.P_DELETE_PLAYER(V_PLAYER_CHANGES.R_OLD_NAME);

            P_SAVE_PLAYER(V_PLAYER_CHANGES.R_PLAYER); -- lo guarda en cache y en archivo
    end if;
    end P_PLAYER_UPDATED;


    function F_CREATE_NEW_PLAYER(V_PLAYER_NAME: T_NAME_VALUE; V_PLAYER_EMAIL: T_EMAIL_VALUE) return T_PLAYER is
        V_PLAYER: T_PLAYER;
    begin
        -- comprobar que el usuario no exista previamente
        if F_EXISTS_PLAYER(V_PLAYER_NAME) then
            raise Q_PLAYER.EX_PLAYER_ALREADY_EXISTS;
        end if;
        -- Crear un jugador nuevo
        V_PLAYER := F_CREATE_NEW_PLAYER_ENTITY(V_PLAYER_NAME, V_PLAYER_EMAIL);
        -- Me subscribo a sus actualizaciones
        V_PLAYER.P_SUBSCRIBE_TO_PLAYER(P_PLAYER_UPDATED'ACCESS);
        -- Llamar al procedimiento P_SAVE_PLAYER, con el jugador.
                    -- XXXXX Lo guardo en fichero > ESTO HAY QUE DELEGARLO A OTRO PAQUETE
        P_SAVE_PLAYER(V_PLAYER);

        return V_PLAYER;
    end F_CREATE_NEW_PLAYER;

-- Y si cambian el nombre de un jugador?
end Q_PLAYER.Q_PLAYER_MANAGER;
