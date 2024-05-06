
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Characters.Handling; use Ada.Characters.Handling;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Strings.Maps.Constants; use Ada.Strings.Maps.Constants; -- Este es el que trae los mapas de mayusculas, minusculas...
with RandomHelpers; use RandomHelpers;

package body HelpersJuegoAhorcado is

    function ENMASCARAR(palabra_a_adivinar: String; palabra_a_validar: String; caracteres_usados: String; caracteres_especiales: String) return String is
        palabra_enmascarada: String := palabra_a_adivinar;
        caracter_actual: Character;
    begin
        -- Poner guiones si las letras de la palabra no estan en caracteres_usados ni en caracteres_especiales
        -- Index(texto, caracter) -> Devuelve la posicion del caracter en el texto
        -- Element(texto, posicion) -> Devuelve el caracter en la posicion del texto
        -- Replace_Element(texto, posicion, caracter) -> Cambia el caracter en la posicion del texto
        --Bucle... e ir mirando cada caracter
        for INDICE_ACTUAL in palabra_a_validar'Range loop
                           --1..Length(palabra_enmascarada) loop
            caracter_actual := Element(palabra_a_validar, INDICE_ACTUAL);
            if           Index(caracteres_usados, caracter_actual) = 0 
                and then Index(caracteres_especiales, caracter_actual) = 0 then
                Replace_Element(palabra_enmascarada, INDICE_ACTUAL, '_'); --- palabra_enmascarada(INDICE_ACTUAL) = '_';
            end if;
        end loop;
    end ENMASCARAR;
    
    function NORMALIZAR_PALABRA(palabra: String) return String is
    begin                               
        return Translate(palabra, Upper_Case_Map ); -- Convertimos a mayusculas la palabra (string)... explicado en el ejemplo de strings
    end NORMALIZAR_PALABRA;
    
    function NORMALIZAR_CARACTER(letra: Character) return String is
    begin
        return TO_UPPER(letra); -- Convertimos a mayusculas un caracter. Ada.Characters.Handling.TO_UPPER(character) 
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
        indice_palabra: Natural;
    begin
        indice_palabra := PEDIR_NUMERO_A_LA_COMPUTADORA(palabras.FIRST_INDEX, palabras.LAST_INDEX);
        return palabras(indice_palabra);
    end ELEGIR_PALABRA_ALEATORIAMENTE;

end HelpersJuegoAhorcado;