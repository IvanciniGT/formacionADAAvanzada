
package HelpersJuegoAhorcado is

    function ENMASCARAR(palabra: String; caracteres_usados: String; caracteres_especiales: String) return String;
    function NORMALIZAR_PALABRA(palabra: String) return String;
    function NORMALIZAR_CARACTER(letra: Character) return String;
    function CARGAR_PALABRAS_DE_FICHERO(tematica: String) return Vector; --??  Que almacene las palabras
    function ELEGIR_PALABRA_ALEATORIAMENTE(palabras: Vector) return String;

end HelpersJuegoAhorcado;