
package body Q_STATISTICS is

    function F_CREATE_EXISTING_STATISTICS(
        V_WINS   : T_STATISTICS_COUNT;
        V_LOSSES : T_STATISTICS_COUNT;
        V_TIES   : T_STATISTICS_COUNT
    ) return T_STATISTICS is
    begin
        return (V_WINS, V_LOSSES, V_TIES);
    end F_CREATE_EXISTING_STATISTICS;

    function F_CREATE_NEW_STATISTICS return T_STATISTICS is
    begin
        return F_CREATE_EXISTING_STATISTICS(0, 0, 0);
    end F_CREATE_NEW_STATISTICS;
    
    function F_GET_WINS (V_STATISTICS : T_STATISTICS) return T_STATISTICS_COUNT is
    begin
        return P_STATISTICS.V_WINS;
    end F_GET_WINS;

    function F_GET_LOSSES (V_STATISTICS : T_STATISTICS) return T_STATISTICS_COUNT is
    begin
        return P_STATISTICS.V_LOSSES;
    end F_GET_LOSSES;

    function F_GET_TIES (V_STATISTICS : T_STATISTICS) return T_STATISTICS_COUNT is
    begin
        return P_STATISTICS.V_TIES;
    end F_GET_TIES;
    
    function F_GET_PLAYED_GAMES (V_STATISTICS : T_STATISTICS) return Natural is
    begin
        return F_GET_WINS(V_STATISTICS) + F_GET_LOSSES(V_STATISTICS) + F_GET_TIES(V_STATISTICS);
    end F_GET_PLAYED_GAMES;

    procedure P_INCREMENT_IF_ALLOWED ( V_DATA: in out T_STATISTICS_COUNT; WAS_ABLE_TO_INCREMENT : out Boolean ) is
    begin
        if T_STATISTICS_COUNT'Last < V_DATA then
            V_DATA := V_DATA +1;
            WAS_ABLE_TO_INCREMENT := True;
        else
            WAS_ABLE_TO_INCREMENT := False;
        end if;
    end F_INCREMENT_IF_ALLOWED;

    procedure P_INCREMENT_WINS (V_STATISTICS : in out T_STATISTICS; WAS_ABLE_TO_INCREMENT : out Boolean) is
    begin
        P_INCREMENT_IF_ALLOWED(V_STATISTICS.V_WINS, WAS_ABLE_TO_INCREMENT);
    end P_INCREMENT_WINS;
    
    procedure P_INCREMENT_LOSSES (V_STATISTICS : in out T_STATISTICS; WAS_ABLE_TO_INCREMENT : out Boolean) is
    begin
        P_INCREMENT_IF_ALLOWED(V_STATISTICS.V_LOSSES, WAS_ABLE_TO_INCREMENT);
    end P_INCREMENT_LOSSES;

    procedure P_INCREMENT_TIES (V_STATISTICS : in out T_STATISTICS; WAS_ABLE_TO_INCREMENT : out Boolean) is
    begin
        P_INCREMENT_IF_ALLOWED(V_STATISTICS.V_TIES, WAS_ABLE_TO_INCREMENT);
    end P_INCREMENT_TIES;
        
end Q_STATISTICS;