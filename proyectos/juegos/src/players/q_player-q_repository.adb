with Ada.Directories;
with Ada.Text_IO;

package body Q_PLAYER.Q_REPOSITORY is

    function F_EXISTS_PLAYER(V_PLAYER_NAME: T_NAME_VALUE) return BOOLEAN is
    begin
        return Ada.Directories.EXISTS(T_NAME_VALUE & "txt");
    end F_EXISTS_PLAYER;

    function F_LINE_CONTAINS_VALID_VALUE(V_LINE: STRING) return BOOLEAN is
    begin
        return V_LINE(1) /= '#'; -- VACIA
    end F_LINE_CONTAINS_VALID_VALUE;

    procedure(linea; out campo; out valor) ????

    function F_LOAD_PLAYER(V_PLAYER_NAME: T_NAME_VALUE) return T_PLAYER is
        V_PLAYER_EMAIL: T_EMAIL_VALUE;
        V_PLAYER_WINS: T_STATISTICS_COUNT;
        V_PLAYER_LOSSES: T_STATISTICS_COUNT;
        V_PLAYER_TIES: T_STATISTICS_COUNT;
        V_FILE_CHANNEL: Ada.Text_IO.File_Type;
    begin
        Ada.Text_IO.Open(
            File => V_FILE_CHANNEL,
            Name => V_PLAYER_NAME & ".txt",
            Mode => Ada.Text_IO.In_File
        );
        while not Ada.Text_IO..End_Of_File(V_FILE_CHANNEL) loop
            Ada.Text_IO.Get_Line(referencia_al_archivo);
            -- 1º Saber si la linea sirve (si es comentario o varia, no sirve)
            -- 2º Partirla, sacar el valor y ver a que campo la asigno
        end loop;

        Ada.Text_IO.Close(V_FILE_CHANNEL);
        
        return F_CREATE_EXISTING_PLAYER( nombre, email, Q_STATISTICS.F_CREATE_EXISTING_STATICTICS(win.looses, ties));
    end F_LOAD_PLAYER;

    function F_SAVE_PLAYER(V_PLAYER: T_PLAYER) return BOOLEAN is
            V_FILE_CHANNEL: Ada.Text_IO.File_Type;
    begin
        Ada.Text_IO.Create(
            File => V_FILE_CHANNEL,
            Name => T_NAME_VALUE & ".txt",
            Mode => Ada.Text_IO.Out_File
        );

        Ada.Text_IO.Put_Line(V_FILE_CHANNEL, "# Este es el fichero de: " & V_PLAYER.R_NAME);

        Ada.Text_IO.Put(V_FILE_CHANNEL, "EMAIL: ");
        Ada.Text_IO.Put_Line(V_FILE_CHANNEL, V_PLAYER.R_EMAIL);
--        Ada.Text_IO.Put_Line(V_FILE_CHANNEL, "EMAIL: " & V_PLAYER.R_EMAIL);


        Ada.Text_IO.Put(V_FILE_CHANNEL, "WINS: ");
        Ada.Text_IO.Put_Line(V_FILE_CHANNEL, Natural'Image(V_PLAYER.R_STATISTICS.R_WINS));
        
        Ada.Text_IO.Put(V_FILE_CHANNEL, "LOSSES: ");
        Ada.Text_IO.Put_Line(V_FILE_CHANNEL, Natural'Image(V_PLAYER.R_STATISTICS.R_LOSSES));
        
        Ada.Text_IO.Put(V_FILE_CHANNEL, "TIES: ");
        Ada.Text_IO.Put_Line(V_FILE_CHANNEL, Natural'Image(V_PLAYER.R_STATISTICS.R_TIES));
        
        Ada.Text_IO.Close(V_FILE_CHANNEL);
    end F_SAVE_PLAYER;

end Q_PLAYER.Q_REPOSITORY;