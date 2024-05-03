
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
    begin
    end CARGAR_PALABRAS_DE_FICHERO;

    function ELEGIR_PALABRA_ALEATORIAMENTE(palabras: ListadoPalabras) return String is
    begin
    end ELEGIR_PALABRA_ALEATORIAMENTE;

end HelpersJuegoAhorcado;