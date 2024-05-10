with Ada.Text_IO;
with Ada.Direct_IO;

procedure Main is

    package Estadisticas_IO is new Ada.Direct_IO(Natural);
    V_FICHERO_ESTADISTICAS: Estadisticas_IO.File_Type;

    V_FICHERO: Ada.Text_IO.File_Type;
    V_NOMBRE_FICHERO_TEXTO: String := "fichero.txt";
    V_NOMBRE_FICHERO_ESTADISTICAS: String := "estadisticas.binario";
    V_DATO: Natural;
begin
    -- Crear el fichero de estadisticas
    Ada.Text_IO.Put_Line("CREANDO fichero de estadisticas");
    Estadisticas_IO.Create(
        File => V_FICHERO_ESTADISTICAS,
        Mode => Estadisticas_IO.Out_File,
        Name => V_NOMBRE_FICHERO_ESTADISTICAS
    );
    Ada.Text_IO.Put_Line("Fichero de estadisticas abierto correctamente");
    Estadisticas_IO.Write(V_FICHERO_ESTADISTICAS, 10);
    Estadisticas_IO.Write(V_FICHERO_ESTADISTICAS, 20);
    Estadisticas_IO.Write(V_FICHERO_ESTADISTICAS, 30);
    Ada.Text_IO.Put_Line("Cerrando fichero de estadisticas");
    Estadisticas_IO.Close(V_FICHERO_ESTADISTICAS);

    -- Leer el fichero de estadisticas.. Leer el fichero entero
    Ada.Text_IO.Put_Line("LEYENDO fichero de estadisticas");
    Estadisticas_IO.Open(
        File => V_FICHERO_ESTADISTICAS,
        Mode => Estadisticas_IO.In_File,
        Name => V_NOMBRE_FICHERO_ESTADISTICAS
    );
    Ada.Text_IO.Put_Line("Fichero de estadisticas abierto correctamente");
    while not Estadisticas_IO.End_Of_File(V_FICHERO_ESTADISTICAS) loop
        Ada.Text_IO.Put_Line("Leyendo dato");
        Estadisticas_IO.Read(V_FICHERO_ESTADISTICAS, V_DATO);
        Ada.Text_IO.Put_Line("Dato leido: " & V_DATO'Image);
    end loop;
    Estadisticas_IO.Close(V_FICHERO_ESTADISTICAS);
    -- Solo quiero el dato 3
    Ada.Text_IO.Put_Line("LEYENDO fichero de estadisticas");
    Estadisticas_IO.Open(
        File => V_FICHERO_ESTADISTICAS,
        Mode => Estadisticas_IO.Inout_File,
        Name => V_NOMBRE_FICHERO_ESTADISTICAS
    );
    Ada.Text_IO.Put_Line("Fichero de estadisticas abierto correctamente");
    Estadisticas_IO.Set_Index(V_FICHERO_ESTADISTICAS, 3);
    Estadisticas_IO.Read(V_FICHERO_ESTADISTICAS, V_DATO);
    Estadisticas_IO.Set_Index(V_FICHERO_ESTADISTICAS, 2);
    Estadisticas_IO.Write(V_FICHERO_ESTADISTICAS, 40);
    Ada.Text_IO.Put_Line("Dato discreto leido: " & V_DATO'Image);
    Estadisticas_IO.Close(V_FICHERO_ESTADISTICAS);



    -- Leer el fichero de estadisticas.. Leer el fichero entero
    Ada.Text_IO.Put_Line("LEYENDO fichero de estadisticas");
    Estadisticas_IO.Open(
        File => V_FICHERO_ESTADISTICAS,
        Mode => Estadisticas_IO.In_File,
        Name => V_NOMBRE_FICHERO_ESTADISTICAS
    );
    Ada.Text_IO.Put_Line("Fichero de estadisticas abierto correctamente");
    while not Estadisticas_IO.End_Of_File(V_FICHERO_ESTADISTICAS) loop
        Ada.Text_IO.Put_Line("Leyendo dato");
        Estadisticas_IO.Read(V_FICHERO_ESTADISTICAS, V_DATO);
        Ada.Text_IO.Put_Line("Dato leido: " & V_DATO'Image);
    end loop;
    Estadisticas_IO.Close(V_FICHERO_ESTADISTICAS);
    -- Crear el fichero
    Ada.Text_IO.Put_Line("CREANDO fichero");
    Ada.Text_IO.Create(
        File => V_FICHERO,
        Mode => Ada.Text_IO.Out_File,
        Name => V_NOMBRE_FICHERO_TEXTO
    );
    Ada.Text_IO.Put_Line("Fichero abierto correctamente");
    Ada.Text_IO.Put_Line(V_FICHERO, "Contenido del fichero");
    Ada.Text_IO.Put_Line("Cerrando fichero");
    Ada.Text_IO.Close(V_FICHERO);

    -- Leer el fichero
    Ada.Text_IO.Open(
        File => V_FICHERO,
        Mode => Ada.Text_IO.In_File,
        Name => V_NOMBRE_FICHERO_TEXTO
    );
    Ada.Text_IO.Put_Line("Fichero abierto correctamente");
    Ada.Text_IO.Put_Line("Contenido del fichero");
    Ada.Text_IO.Put_Line(Ada.Text_IO.Get_Line(V_FICHERO));
    Ada.Text_IO.Put_Line("Cerrando fichero");
    Ada.Text_IO.Close(V_FICHERO);




end Main;