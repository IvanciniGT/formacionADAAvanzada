with AUnit;
with AUnit.Test_Cases;          
with AUnit.Assertions;          
with Ada.Text_IO;            
with RandomHelpers; 
with Q_STATISTICS;
with Q_PLAYER;

package body Q_PLAYER.Q_PLAYER_MANAGER.Q_PLAYER_CREATION_TEST_CASE is


    procedure Register_Tests(V_Test: in out Q_PLAYER_CREATION_TEST) is
    begin
        AUnit.Test_Cases.Registration.Register_Routine(V_Test, TEST_PLAYER_CREATION_HAPPY_PATH'Access, "Happy path");
        AUnit.Test_Cases.Registration.Register_Routine(V_Test, TEST_PLAYER_CREATION_ALREADY_EXISTS'Access, "Fallar si ya existe el jugador");
    end Register_Tests;

    function Name(V_Test_Case: Q_PLAYER_CREATION_TEST) return AUnit.Test_String is
    begin
        return AUnit.Format("Creación de un jugador");
    end Name;

    procedure Set_Up_Case(Test: in out Q_PLAYER_CREATION_TEST) is
    begin
        Ada.Text_IO.Put_Line("Set_Up_Case");
    end Set_Up_Case;

    procedure Tear_Down_Case(Test: in out Q_PLAYER_CREATION_TEST) is
    begin
        Ada.Text_IO.Put_Line("Tear_Down_Case");
    end Tear_Down_Case;

    procedure Set_Up(Test: in out Q_PLAYER_CREATION_TEST) is
    begin
        Ada.Text_IO.Put_Line("Set_Up");
    end Set_Up;

    procedure Tear_Down(Test: in out Q_PLAYER_CREATION_TEST)  is
    begin
        Ada.Text_IO.Put_Line("Tear_Down");
    end Tear_Down;


    procedure TEST_PLAYER_CREATION_HAPPY_PATH(Test: in out AUnit.Test_Cases.Test_Case'Class) is
        V_PLAYER: T_PLAYER;
    begin
        -- GIVEN : Tengo unos datos de un player guays:
        declare
            V_RANDOM: Natural := randomHelpers.PEDIR_NUMERO_A_LA_COMPUTADORA(1,1000000);
            V_TEMP_PLAYER_NAME: String := ("Guay" & Natural'Image(V_RANDOM) & (1..50 => ' '));
            V_PLAYER_NAME: T_NAME_VALUE := V_TEMP_PLAYER_NAME(1..50);
            V_PLAYER_EMAIL: T_EMAIL_VALUE := "mi@correso.es" & (14..50 => ' ');
        begin
            -- WHEN (acción): Llamo al F_CREATE_NEW_PLAYER con esos datos
            V_PLAYER := F_CREATE_NEW_PLAYER(V_PLAYER_NAME, V_PLAYER_EMAIL);
            -- THEN (comprobaciones)   -    SELF VALIDATING
            -- Se me devuelve un TPLAYER que tiene los datos originales
          AUnit.Assertions.Assert(Q_PLAYER.F_GET_NAME(V_PLAYER) = V_PLAYER_NAME, "El nombre del jugador no es el esperado");
          AUnit.Assertions.Assert(Q_PLAYER.F_GET_EMAIL(V_PLAYER) = V_PLAYER_EMAIL, "El email del jugador no es el esperado");
        end;
        -- Y el TPLAYER tiene unas estadísticas inicializadas a 0
            -- Internamente llamamos a F_CREATE_NEW_STATISTICS
            -- Yo no querría comprobar silo que tengo en STATISTICS es igual a lo que devuelve F_CREATE_NEW_STATISTICS
            -- ESO LO QUERRIA COMPROBAR EN UNA PRUEBA UNITARIA
            -- En una prueba de sistema, mi responsabilidad la tengo que bajar al ULTIMO NIVEL
        AUnit.Assertions.Assert(Q_STATISTICS.F_GET_WINS(Q_PLAYER.F_GET_STATISTICS(V_PLAYER)) = 0, "Las estadísticas iniciales no son las esperadas: " & Natural'Image(Q_STATISTICS.F_GET_WINS(Q_PLAYER.F_GET_STATISTICS(V_PLAYER))) & " ganadas");
        AUnit.Assertions.Assert(Q_STATISTICS.F_GET_LOSSES(Q_PLAYER.F_GET_STATISTICS(V_PLAYER)) = 0, "Las estadísticas iniciales no son las esperadas: " & Natural'Image(Q_STATISTICS.F_GET_LOSSES(Q_PLAYER.F_GET_STATISTICS(V_PLAYER))) & " perdidas");
        AUnit.Assertions.Assert(Q_STATISTICS.F_GET_TIES(Q_PLAYER.F_GET_STATISTICS(V_PLAYER)) = 0, "Las estadísticas iniciales no son las esperadas: " & Natural'Image(Q_STATISTICS.F_GET_TIES(Q_PLAYER.F_GET_STATistics(V_PLAYER))) & " empatadas");
        -- Y el TPLAYER se ha dado de alta en la cache
        AUnit.Assertions.Assert(V_PLAYERS_CACHE.Contains(Q_PLAYER.F_GET_NAME(V_PLAYER)), "El jugador no se ha dado de alta en la cache");
        -- Y tengo un fichero con el nombre del TPLAYER que contiene los datos del TPLAYER
        -- Necesito asegurar que el contenido es bueno.
        declare
            V_FILE_NAME: String := Q_PLAYER.F_GET_NAME(V_PLAYER) & ".txt";
            V_FILE: Ada.Text_IO.File_Type;
        begin
            Ada.Text_IO.Open(V_FILE, Ada.Text_IO.In_File, V_FILE_NAME);
            AUnit.Assertions.Assert(Ada.Text_IO.Get_Line(V_FILE) = "# Este es el fichero de: "  & Q_PLAYER.F_GET_NAME(V_PLAYER), "El email del jugador no es el esperado");
            AUnit.Assertions.Assert(Ada.Text_IO.Get_Line(V_FILE) = "EMAIL: " & Q_PLAYER.F_GET_EMAIL(V_PLAYER), "El email del jugador no es el esperado");
            AUnit.Assertions.Assert(Ada.Text_IO.Get_Line(V_FILE) = "WINS:  0", "Las estadísticas iniciales no son las esperadas");
            AUnit.Assertions.Assert(Ada.Text_IO.Get_Line(V_FILE) = "LOSSES:  0", "Las estadísticas iniciales no son las esperadas");
            AUnit.Assertions.Assert(Ada.Text_IO.Get_Line(V_FILE) = "TIES:  0", "Las estadísticas iniciales no son las esperadas");
            -- Comprobar que he llegado al final del fichero
            AUnit.Assertions.Assert(Ada.Text_IO.End_Of_File(V_FILE), "El fichero no tiene el formato esperado");
            Ada.Text_IO.Close(V_FILE);
        end;
        -- Y el manager ha quedado subscrito al TPLAYER
        AUnit.Assertions.Assert(V_PLAYER.R_OBSERVERS.LAST_INDEX = 1, "El manager no se ha subscrito al jugador");

    end TEST_PLAYER_CREATION_HAPPY_PATH;


    procedure TEST_PLAYER_CREATION_ALREADY_EXISTS(Test: in out AUnit.Test_Cases.Test_Case'Class) is
        V_CONDICION: Boolean;
    begin
        Ada.Text_IO.Put_Line("Test_2");
        V_CONDICION := True;
        AUnit.Assertions.Assert(V_CONDICION, "No se detecta que el jugador ya existe antes de su creación");
    end TEST_PLAYER_CREATION_ALREADY_EXISTS;
    
end Q_PLAYER.Q_PLAYER_MANAGER.Q_PLAYER_CREATION_TEST_CASE;