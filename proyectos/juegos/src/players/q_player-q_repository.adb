with Ada.Directories;
with Ada.Text_IO;
with Ada.Strings.Fixed;

package body Q_PLAYER.Q_REPOSITORY is

    function F_EXISTS_PLAYER(V_PLAYER_NAME: T_NAME_VALUE) return BOOLEAN is
    begin
        return Ada.Directories.EXISTS(T_NAME_VALUE & "txt");
    end F_EXISTS_PLAYER;



    function F_LINE_CONTAINS_VALID_VALUE(V_LINE: STRING) return BOOLEAN is
    begin
        return V_LINE(1) /= '#' and
               Ada.Strings.Fixed.Trim(V_LINE, Ada.Strings.Fixed.Both)="";
    end F_LINE_CONTAINS_VALID_VALUE;


    -- TODO a un helper
    procedure P_SPLIT (V_TEXT: String; 
                       V_SEPARATOR: String; 
                       V_FIELD_NAME: OUT Unbounded_String; 
                       V_FIELD_VALUE: OUT Unbounded_String;
                       V_FOUND: OUT Boolean) is
        V_SEPARATOR_INDEX: Natural;
    begin
        V_SEPARATOR_INDEX := Ada.Strings.Fixed.INDEX(V_TEXT, V_SEPARATOR,1);
        if V_SEPARATOR_INDEX = 0 then-- no se ha encontrado el separador
            V_FIELD_NAME := To_Unbounded_string("");
            V_FIELD_VALUE := To_Unbounded_string("");
            V_FOUND := FALSE;
        else
            V_FIELD_NAME := To_Unbounded_string(Ada.Strings.Fixed.Trim(
                    Ada.Strings.Fixed.Head(V_TEXT, V_SEPARATOR_INDEX - 1)
                    , Ada.Strings.Fixed.Both));
            V_FIELD_VALUE := To_Unbounded_string(Ada.Strings.Fixed.Trim(
                    Ada.Strings.Fixed.Tail(V_TEXT, V_SEPARATOR_INDEX + 1)
                    , Ada.Strings.Fixed.Both));
            V_FOUND := TRUE;
        end if;
    end P_SPLIT;
        

    function F_PROCESS_PLAYER_FILE_CONTENTS(V_PLAYER_NAME: T_NAME_VALUE; V_FILE_CHANNEL: Ada.Text_IO.File_Type) return T_PLAYER is
        V_PLAYER_EMAIL: T_EMAIL_VALUE;
        V_PLAYER_WINS: T_STATISTICS_COUNT;
        V_PLAYER_LOSSES: T_STATISTICS_COUNT;
        V_PLAYER_TIES: T_STATISTICS_COUNT;
        V_FIELD_NAME: Unbounded_String;
        V_FIELD_VALUE: Unbounded_String;
        V_FOUND: Boolean;
    begin
        while not (Ada.Text_IO.End_Of_File(V_FILE_CHANNEL))loop
            if F_LINE_CONTAINS_VALID_VALUE(V_TEXT) then
                P_SPLIT (V_TEXT => Ada.Text_IO.Get_Line(V_FILE_CHANNEL),
                        V_SEPARATOR => ":", 
                        V_FIELD_NAME => V_FIELD_NAME,
                        V_FIELD_VALUE => V_FIELD_VALUE,
                        V_FOUND => V_FOUND);
                if V_FOUND then
                    case V_FIELD_NAME is
                        when "EMAIL" =>
                            V_PLAYER_EMAIL := T_EMAIL_VALUE'Value(V_FIELD_VALUE);
                        when "WINS" =>
                            V_PLAYER_WINS := T_STATISTICS_COUNT'Value(V_FIELD_VALUE);
                        when "LOSSES" =>
                            V_PLAYER_LOSSES := T_STATISTICS_COUNT'Value(V_FIELD_VALUE);
                        when "TIES" =>
                            V_PLAYER_TIES := T_STATISTICS_COUNT'Value(V_FIELD_VALUE);
                        when others => --- Campo no reconocido
                            raise EX_ERROR_LOADING_PLAYER;
                    end case;
                else -- Linea con sintaxis no válida
                    raise EX_ERROR_LOADING_PLAYER;
                end if;
            end if;
        end loop;
        return F_CREATE_EXISTING_PLAYER( 
            V_PLAYER_NAME, 
            V_PLAYER_EMAIL, 
            Q_STATISTICS.F_CREATE_EXISTING_STATICTICS(V_PLAYER_WINS,V_PLAYER_LOSSES, V_PLAYER_TIES)
        );
    end F_LOAD_PLAYER;


    function F_LOAD_PLAYER(V_PLAYER_NAME: T_NAME_VALUE) return T_PLAYER is
        V_PLAYER: T_PLAYER;
        V_FILE_CHANNEL: Ada.Text_IO.File_Type;
    begin
        if not F_EXISTS_PLAYER(V_PLAYER_NAME) then
            raise EX_PLAYER_NOT_FOUND;
        end if;
        Ada.Text_IO.Open(
            File => V_FILE_CHANNEL,
            Name => V_PLAYER_NAME & ".txt",
            Mode => Ada.Text_IO.In_File
        );

        V_PLAYER := F_PROCESS_PLAYER_FILE_CONTENTS(V_PLAYER_NAME, V_FILE_CHANNEL);

        Ada.Text_IO.Close(V_FILE_CHANNEL);
        
        return V_PLAYER;
    end F_LOAD_PLAYER;


-- VALIDAR SI EL CAMPO ES VALIDO
-- enum
-- El enum me permite saber si un texto está declarado en ese enum de una forma sencilla?
-- Podríamos tener un vector con todos los campos validos y comprobar si el campo que hemos sacado está en ese vector
-- PERO... aun así, tenemos un problema adicional
-- El valor, a que campo lo echo?
-- Al final me hace falta controlar con condicionales (case, if) que campo es el que tengo que asignar
-- Otra alternativa?

    procedure P_SAVE_PLAYER(V_PLAYER: T_PLAYER) is
            V_FILE_CHANNEL: Ada.Text_IO.File_Type;
    begin
        Ada.Text_IO.Create(
            File => V_FILE_CHANNEL,
            Name => V_PLAYER.R_NAME_VALUE & ".txt",
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
    end P_SAVE_PLAYER;

end Q_PLAYER.Q_REPOSITORY;