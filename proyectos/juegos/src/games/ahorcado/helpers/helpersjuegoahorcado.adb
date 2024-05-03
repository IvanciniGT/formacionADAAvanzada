
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body HelpersJuegoAhorcado is

    function ENMASCARAR(palabra: String; caracteres_usados: String; caracteres_especiales: String) return String is
    begin
        -- Poner guiones si las letras de la palabra no estan en caracteres_usados ni en caracteres_especiales
    end ENMASCARAR;
    
    function NORMALIZAR_PALABRA(palabra: String) return String is
    begin
        -- Convertimos a mayusculas
    end NORMALIZAR_PALABRA;
    
    function NORMALIZAR_CARACTER(letra: Character) return String is
    begin
        -- Convertimos a mayusculas
    end NORMALIZAR_CARACTER;
    
    function CARGAR_PALABRAS_DE_FICHERO(tematica: String) return ListadoPalabras is
        listado_a_devolver: ListadoPalabras;
        referencia_al_archivo: File_Type;
    begin
        -- Necesito abrir el fichero
        Open(
            File => referencia_al_archivo,
            Name => tematica & ".txt",
            Mode => In_File -- En modo lectura
                            -- En modo escritura: Out_File (Lo reescribe) 
                            -- En modo añadir: Append_File (Añade al final)
        );
        -- Leer linea a linea y añadir a listado_a_devolver
        while not End_Of_File(referencia_al_archivo) loop
            listado_a_devolver.append(Get_Line(referencia_al_archivo));
        end loop;
        -- Cerrar fichero
        Close(referencia_al_archivo);
        return listado_a_devolver;
    end CARGAR_PALABRAS_DE_FICHERO;

    function ELEGIR_PALABRA_ALEATORIAMENTE(palabras: ListadoPalabras) return String is
    begin
    
    end ELEGIR_PALABRA_ALEATORIAMENTE;

end HelpersJuegoAhorcado;