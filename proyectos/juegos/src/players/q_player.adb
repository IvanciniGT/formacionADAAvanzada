with Q_STATISTICS;
package body Q_PLAYER is

    function F_CREATE_EXISTING_PLAYER(P_NAME: T_NAME_VALUE; P_EMAIL: T_EMAIL_VALUE; P_STATISTICS: Q_STATISTICS.T_STATISTICS) return T_PLAYER is
        V_PLAYER: T_PLAYER;
    begin
        --return ( 
        --            NAME => P_NAME,
        --            EMAIL => P_EMAIL,
        --            STATISTICS => P_STATISTICS
        --       );
        P_SET_NAME(V_PLAYER, P_NAME);
        P_SET_EMAIL(V_PLAYER, P_EMAIL);         -- aprovecho validaciones adicionales
        V_PLAYER.STATISTICS := P_STATISTICS;
        return V_PLAYER;
    end F_CREATE_PLAYER;

    function F_CREATE_NEW_PLAYER(P_NAME: T_NAME_VALUE; P_EMAIL: T_EMAIL_VALUE) return T_PLAYER is
    begin
        return F_CREATE_EXISTING_PLAYER(P_NAME, P_EMAIL, Q_STATISTICS.F_CREATE_NEW_STATISTICS);
    end F_CREATE_PLAYER;

    function F_GET_NAME(P_PLAYER: T_PLAYER) return T_NAME_VALUE is 
    begin
        return P_PLAYER.NAME;
    end F_GET_NAME;
    
    function F_GET_EMAIL(P_PLAYER: T_PLAYER) return T_EMAIL_VALUE is
    begin
        return P_PLAYER.EMAIL;
    end F_GET_EMAIL;
    
    function F_GET_STATISTICS(P_PLAYER: T_PLAYER) return Q_STATISTICS.T_STATISTICS is
    begin
        return P_PLAYER.STATISTICS;
    end F_GET_STATISTICS;

    procedure P_SET_NAME(P_PLAYER: in out T_PLAYER; P_NAME: T_NAME_VALUE) is 
    begin
        -- hacer las comproibaciones necesarias para el nombre... 
        -- y si al final cuela el nombre?
        -- cambiar el fichero
            -- Lo cambio aqui?
        P_PLAYER.NAME := P_NAME;
    end F_SET_NAME;
    
    procedure P_SET_EMAIL(P_PLAYER: in out T_PLAYER; P_EMAIL: T_EMAIL_VALUE) is
    begin
        -- Validar que lo que meta sea realmente un email... con su arroba... y sus puntitos.
        P_PLAYER.EMAIL := P_EMAIL;
    end F_SET_EMAIL;
            
end Q_PLAYER;
--- Queremos que alguien se pueda subscribir a un player... de forma que cuando se edite un dato, el player le avise.
--- Y ya ese hará lo que le venga bien hacer!... No es mi problema! Mi problema es avisar de que me han tocao el nombre,
--- a quien lo pida! a quien se subscriba a mi!
--- Cuantos observadores puede tener un player? 1 o muchos <<<<
