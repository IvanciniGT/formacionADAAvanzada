package Q_PLAYER.Tests is
    -- Exponemos la función para la prueba
    function Create_New_Player(V_NAME: T_NAME_VALUE; V_EMAIL: T_EMAIL_VALUE) return T_PLAYER;
private
    use Q_PLAYER;
end Q_PLAYER.Tests;

package body Q_PLAYER.Tests is
    function Create_New_Player(V_NAME: T_NAME_VALUE; V_EMAIL: T_EMAIL_VALUE) return T_PLAYER is
    begin
        return Q_PLAYER.F_CREATE_NEW_PLAYER_ENTITY(V_NAME, V_EMAIL);
    end Create_New_Player;
end Q_PLAYER.Tests;
