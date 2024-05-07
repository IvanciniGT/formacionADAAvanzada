with Q_STATISTICS;
package body Q_PLAYER is

    function F_CREATE_EXISTING_PLAYER(V_NAME: T_NAME_VALUE; V_EMAIL: T_EMAIL_VALUE; V_STATISTICS: Q_STATISTICS.T_STATISTICS) return T_PLAYER is
        V_PLAYER: T_PLAYER;
    begin
        --return ( 
        --            NAME => P_NAME,
        --            EMAIL => P_EMAIL,
        --            STATISTICS => P_STATISTICS
        --       );
        P_SET_NAME(V_PLAYER, V_NAME);
        P_SET_EMAIL(V_PLAYER, V_EMAIL);         -- aprovecho validaciones adicionales
        V_PLAYER.STATISTICS := V_STATISTICS;
        return V_PLAYER;
    end F_CREATE_PLAYER;

    function F_CREATE_NEW_PLAYER(V_NAME: T_NAME_VALUE; V_EMAIL: T_EMAIL_VALUE) return T_PLAYER is
    begin
        return F_CREATE_EXISTING_PLAYER(V_NAME, V_EMAIL, Q_STATISTICS.F_CREATE_NEW_STATISTICS);
    end F_CREATE_PLAYER;

    function F_GET_NAME(V_PLAYER: T_PLAYER) return T_NAME_VALUE is 
    begin
        return V_PLAYER.NAME;
    end F_GET_NAME;
    
    function F_GET_EMAIL(V_PLAYER: T_PLAYER) return T_EMAIL_VALUE is
    begin
        return V_PLAYER.EMAIL;
    end F_GET_EMAIL;
    
    function F_GET_STATISTICS(V_PLAYER: T_PLAYER) return Q_STATISTICS.T_STATISTICS is
    begin
        return V_PLAYER.STATISTICS;
    end F_GET_STATISTICS;

    procedure P_SET_NAME(V_PLAYER: in out T_PLAYER; V_NAME: T_NAME_VALUE) is 
    begin
        -- hacer las comproibaciones necesarias para el nombre... 
        -- y si al final cuela el nombre?
        -- cambiar el fichero
            -- Lo cambio aqui?
        V_PLAYER.NAME := V_NAME;
    end F_SET_NAME;
    
    procedure P_SET_EMAIL(V_PLAYER: in out T_PLAYER; V_EMAIL: T_EMAIL_VALUE) is
    begin
        -- Validar que lo que meta sea realmente un email... con su arroba... y sus puntitos.
        V_PLAYER.EMAIL := V_EMAIL;
    end F_SET_EMAIL;
            
end Q_PLAYER;
--- Queremos que alguien se pueda subscribir a un player... de forma que cuando se edite un dato, el player le avise.
--- Y ya ese hará lo que le venga bien hacer!... No es mi problema! Mi problema es avisar de que me han tocao el nombre,
--- a quien lo pida! a quien se subscriba a mi!
--- Cuantos observadores puede tener un player? 1 o muchos <<<<