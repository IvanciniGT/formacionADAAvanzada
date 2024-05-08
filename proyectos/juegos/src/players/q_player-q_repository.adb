with Ada.Directories;
with Ada.Text_IO;

package body Q_PLAYER.Q_REPOSITORY is

    function F_EXISTS_PLAYER(V_PLAYER_NAME: T_NAME_VALUE) return BOOLEAN is
    begin
        return Ada.Directories.EXISTS(T_NAME_VALUE & "txt");
    end F_EXISTS_PLAYER;

    function F_LOAD_PLAYER(V_PLAYER_NAME: T_NAME_VALUE) return T_PLAYER is
        V_PLAYER_EMAIL: T_EMAIL_VALUE;
        V_PLAYER_WINS: T_STATISTICS_VALUE;
        V_PLAYER_LOSSES: T_STATISTICS_VALUE;
        V_PLAYER_TIES: T_STATISTICS_VALUE;
        referencia_al_archivo: Ada.Text_IO.File_Type;
    begin
        Open(
            File => referencia_al_archivo,
            Name => tematica & ".txt",
            Mode => In_File -- En modo lectura
                            -- En modo escritura: Out_File (Lo reescribe) 
                            -- En modo añadir: Append_File (Añade al final)
        );
        -- Leer linea a linea y añadir a listado_a_devolver
        while not End_Of_File(referencia_al_archivo) loop
            listado_a_devolver.append(To_Unbounded_String(Get_Line(referencia_al_archivo)));
            -- Necesito saber si la linea es un comentario
            -- O si está en blanco
            -- Si no lo está: Parto la linea por "="
            -- A cada lado le quito los espacios en blanco circundantes
            -- En función de la palabra primera, así la propiedad que asigno 
        end loop;
        -- Cerrar fichero
        Close(referencia_al_archivo);
        return CREATE_EXISTING_PLAYER( nombre, email, CREATE_EXISTING_STATICTICS(win.looses, ties));
    end F_LOAD_PLAYER;

    function F_SAVE_PLAYER(V_PLAYER: T_PLAYER) return BOOLEAN is
            referencia_al_archivo: Ada.Text_IO.File_Type;
    begin
        Ada.Text_IO.Create(
            File => referencia_al_archivo,
            Name => T_NAME_VALUE & ".txt",
            Mode => Ada.Text_IO.Out_File
        );

        Ada.Text_IO.Put_Line("# Este es el fichero de: " & V_PLAYER.R_NAME);
        ---....

        Ada.Text_IO.Close(referencia_al_archivo);
    end F_SAVE_PLAYER;

end Q_PLAYER.Q_REPOSITORY;