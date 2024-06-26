with Q_STATISTICS;
package body Q_PLAYER is

    procedure P_SUBSCRIBE_TO_PLAYER(V_PLAYER: in out T_PLAYER; V_OBSERVER: T_OBSERVER) is
    begin
        V_PLAYER.R_OBSERVERS.APPEND(V_OBSERVER);
    end P_SUBSCRIBE_TO_PLAYER;
            
    procedure NOTIFY_OBSERVERS(V_PLAYER_CHANGES: T_PLAYER_CHANGES) is
    begin
        for OBSERVER of V_PLAYER_CHANGES.R_PLAYER.R_OBSERVERS loop
            OBSERVER.all(V_PLAYER_CHANGES);
        end loop;
    end NOTIFY_OBSERVERS;

    function F_CREATE_EXISTING_PLAYER_ENTITY(V_NAME: T_NAME_VALUE; V_EMAIL: T_EMAIL_VALUE; V_STATISTICS: Q_STATISTICS.T_STATISTICS) return T_PLAYER is
        V_PLAYER: T_PLAYER;
    begin
        --return ( 
        --            NAME => P_NAME,
        --            EMAIL => P_EMAIL,
        --            STATISTICS => P_STATISTICS
        --       );
        P_SET_NAME(V_PLAYER, V_NAME);
        P_SET_EMAIL(V_PLAYER, V_EMAIL);         -- aprovecho validaciones adicionales
        V_PLAYER.R_STATISTICS := V_STATISTICS;
        return V_PLAYER;
    end F_CREATE_EXISTING_PLAYER_ENTITY;

    function F_CREATE_NEW_PLAYER_ENTITY(V_NAME: T_NAME_VALUE; V_EMAIL: T_EMAIL_VALUE) return T_PLAYER is
    begin
        return F_CREATE_EXISTING_PLAYER_ENTITY(V_NAME, V_EMAIL, Q_STATISTICS.F_CREATE_NEW_STATISTICS);
    end F_CREATE_NEW_PLAYER_ENTITY;

    function F_GET_NAME(V_PLAYER: T_PLAYER) return T_NAME_VALUE is 
    begin
        return V_PLAYER.R_NAME;
    end F_GET_NAME;
    
    function F_GET_EMAIL(V_PLAYER: T_PLAYER) return T_EMAIL_VALUE is
    begin
        return V_PLAYER.R_EMAIL;
    end F_GET_EMAIL;
    
    function F_GET_STATISTICS(V_PLAYER: T_PLAYER) return Q_STATISTICS.T_STATISTICS is
    begin
        return V_PLAYER.R_STATISTICS;
    end F_GET_STATISTICS;

    procedure P_SET_NAME(V_PLAYER: in out T_PLAYER; V_NAME: T_NAME_VALUE) is 
        V_OLD_NAME: T_NAME_VALUE;
    begin
        V_OLD_NAME := V_PLAYER.R_NAME;
        V_PLAYER.R_NAME := V_NAME;
        NOTIFY_OBSERVERS(( R_PLAYER => V_PLAYER, R_OLD_NAME => V_OLD_NAME, R_OLD_EMAIL => V_PLAYER.R_EMAIL));
        -- Y ya el observador, decidirá si quiere cambiar el fichero o no.
        -- O el observador decidirá si apuntar este cambio en un log o no
    end P_SET_NAME;
    
    procedure P_SET_EMAIL(V_PLAYER: in out T_PLAYER; V_EMAIL: T_EMAIL_VALUE) is
        V_OLD_EMAIL: T_EMAIL_VALUE;
    begin
        V_OLD_EMAIL := V_PLAYER.R_EMAIL;
        V_PLAYER.R_EMAIL := V_EMAIL;
        -- o el observador decidirá si quiere mandar un email al usuario para confirmar el cambio o no
        NOTIFY_OBSERVERS(( R_PLAYER => V_PLAYER, R_OLD_EMAIL => V_OLD_EMAIL, R_OLD_NAME => V_PLAYER.R_NAME));
    end P_SET_EMAIL;

end Q_PLAYER;
--- Queremos que alguien se pueda subscribir a un player... de forma que cuando se edite un dato, el player le avise.
--- Y ya ese hará lo que le venga bien hacer!... No es mi problema! Mi problema es avisar de que me han tocao el nombre,
--- a quien lo pida! a quien se subscriba a mi!
--- Cuantos observadores puede tener un player? 1 o muchos <<<<
