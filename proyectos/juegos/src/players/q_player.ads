with Q_STATISTICS;
with Ada.Containers.Vectors;
package Q_PLAYER is

    EX_PLAYER_NOT_FOUND: EXCEPTION;
    EX_ERROR_LOADING_PLAYER: EXCEPTION;
    EX_PLAYER_ALREADY_EXISTS: EXCEPTION;

    type T_PLAYER is private; -- Solo digo que habrá un tipo T_PLAYER
    --type T_PLAYER_ACCESS is access constant T_PLAYER; --T_PLAYER; -- Tipo de acceso a T_PLAYER
                                   -- all:      Puedo modificar el player
                                   -- constant: No puedo modificar el player
    subtype T_EMAIL_VALUE is String(1..50);              -- 50 bytes
    subtype T_NAME_VALUE  is String(1..50); -- TODO --Wide_String(1..50);         -- 100 bytes (ver nota 1)

    type T_PLAYER_CHANGES is tagged record
        R_PLAYER: T_PLAYER;
        R_OLD_NAME: T_NAME_VALUE;
        R_OLD_EMAIL: T_EMAIL_VALUE;
    end record;

    type T_OBSERVER is access procedure(V_PLAYER_CHANGES: T_PLAYER_CHANGES); --_ACCESS: T_PLAYER_ACCESS);

    -- Que es un observador? Una función a la que llamaré cuando ocurre un evento.
    -- La llamaremos cuando se cambie alguno de los datos del jugador


    -- Getters
    function F_GET_NAME(V_PLAYER: T_PLAYER) return T_NAME_VALUE;
    function F_GET_EMAIL(V_PLAYER: T_PLAYER) return T_EMAIL_VALUE;
    function F_GET_STATISTICS(V_PLAYER: T_PLAYER) return Q_STATISTICS.T_STATISTICS;

    -- Setters
    procedure P_SET_NAME(V_PLAYER: in out T_PLAYER; V_NAME: T_NAME_VALUE);
    procedure P_SET_EMAIL(V_PLAYER: in out T_PLAYER; V_EMAIL: T_EMAIL_VALUE);
    procedure P_SUBSCRIBE_TO_PLAYER(V_PLAYER: in out T_PLAYER; V_OBSERVER: T_OBSERVER); -- muy habitual sería devolver una función (access function) de des-suscribirse
    
    private 
        -- El private hace que externos no puedan acceder a los datos (ni paa verlos, ni para modificarlos)
        -- Pero si permite que externos guarden refencias al record.
        
        package Q_PLAYER_VECTOR is new Ada.Containers.Vectors(
            Index_Type => Positive ,
            Element_Type => T_OBSERVER
        ); -- 10 jugadores

        subtype T_OBSERVER_VECTOR is Q_PLAYER_VECTOR.Vector;

        type T_PLAYER is tagged record      --- limited
            R_NAME:         T_NAME_VALUE;
            R_EMAIL:        T_EMAIL_VALUE;
            R_STATISTICS:   Q_STATISTICS.T_STATISTICS;
            R_OBSERVERS:    T_OBSERVER_VECTOR;
        end record;

    -- Nuevos jugadores
    function F_CREATE_NEW_PLAYER_ENTITY(V_NAME: T_NAME_VALUE; V_EMAIL: T_EMAIL_VALUE) return T_PLAYER;
    -- Jugadores leidos de un fichero
    function F_CREATE_EXISTING_PLAYER_ENTITY(V_NAME: T_NAME_VALUE; V_EMAIL: T_EMAIL_VALUE; V_STATISTICS: Q_STATISTICS.T_STATISTICS) return T_PLAYER;

end Q_PLAYER;


-- nota 1:
    -- Tengo que tener en cuenta control de desbordamiento.. Con el unbouded string no tengo que preocuparme por el tamaño... al menos tan grande.
    -- 50 caracteres. Cuánto ocupa 1 caracter en RAM?
    -- Depende del caracter:
        -- En ASCII, 1 byte
        -- UNICODE?  Estandar internacional que recopila todos los caracteres usados por la humanidad.150000 caracteres
        -- 1 byte... cuantos caracteres puedo representar diferentes? 256
        -- 2 bytes... cuantos caracteres puedo representar diferentes? 65536
        -- 4 bytes... cuantos caracteres puedo representar diferentes? 4294967296
        -- UTF: Representaciones de los caracteres de UNICODE
            -- UTF-8        Cada caracter ocupa entre 1 y 4 bytes
            -- UTF-16       Cada caracter ocupa 2 o 4 bytes
            -- UTF-32       Cada caracter ocupa 4 bytes
        -- Con que tipo de caracteres trabaja ADA? Depende del tipo de String que use
            -- Si uso String: un String es un array de caracteres ASCII                 1 byte por caracter
                -- Solo puedo representar caracteres ASCII
            -- Si uso Wide_String: Se compone de un array de Wide_Character             2 bytes por caracter
                -- Puedo poner la Ñ... pero no puedo poner: Un caracter chino o un emoji
            -- Si uso Wide_Wide_String: Se compone de un array de Wide_Wide_Character   4 bytes por caracter
