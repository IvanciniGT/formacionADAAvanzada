with Q_STATISTICS;
package Q_PLAYER is

    subtype T_EMAIL_VALUE is String(1..50);              -- 50 bytes
    subtype T_NAME_VALUE  is Wide_String(1..50);         -- 100 bytes
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
    -- Nuevos jugadores
    function F_CREATE_NEW_PLAYER(P_NAME: T_NAME_VALUE; P_EMAIL: T_EMAIL_VALUE) return T_PLAYER;
    -- Jugadores leidos de un fichero
    function F_CREATE_EXISTING_PLAYER(P_NAME: T_NAME_VALUE; P_EMAIL: T_EMAIL_VALUE; P_STATISTICS: Q_STATISTICS.T_STATISTICS) return T_PLAYER;

    private type T_PLAYER is tagged record
        R_NAME:         T_NAME_VALUE;
        R_EMAIL:        T_EMAIL_VALUE;
        R_STATISTICS:   Q_STATISTICS.T_STATISTICS;
    end record;
    -- El private hace que externos no puedan acceder a los datos (ni paa verlos, ni para modificarlos)
    -- Pero si permite que externos guarden refencias al record.

    -- Getters
    function F_GET_NAME(P_PLAYER: T_PLAYER) return T_NAME_VALUE;
    
    function F_GET_EMAIL(P_PLAYER: T_PLAYER) return T_EMAIL_VALUE;
    
    function F_GET_STATISTICS(P_PLAYER: T_PLAYER) return Q_STATISTICS.T_STATISTICS;

    -- Setters
    procedure P_SET_NAME(P_PLAYER: in out T_PLAYER; P_NAME: T_NAME_VALUE);
    
    procedure P_SET_EMAIL(P_PLAYER: in out T_PLAYER; P_EMAIL: T_EMAIL_VALUE);
           
    -- Que es un observador? Una función a la que llamaré cuando ocurre un evento.
    -- La llamaremos cuando se cambie alguno de los datos del jugador
    type T_OBSERVER is access procedure(P_PLAYER: T_PLAYER);

end Q_PLAYER;