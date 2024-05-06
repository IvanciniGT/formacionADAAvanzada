
package HelpersJuegoAhorcado is

    package ListadoPalabrasVectors is new Ada.Containers.Vectors(
        Index_Type => Positive,
        Element_Type => String
    );
    subtype ListadoPalabras is ListadoPalabrasVectors.Vector;

    function ENMASCARAR(palabra_a_adivinar: String; palabra_a_validar: String; caracteres_usados: String; caracteres_especiales: String) return String;
    function NORMALIZAR_PALABRA(palabra: String) return String;
    function NORMALIZAR_CARACTER(letra: Character) return String;
    function CARGAR_PALABRAS_DE_FICHERO(tematica: String) return ListadoPalabras;
    function ELEGIR_PALABRA_ALEATORIAMENTE(palabras: ListadoPalabras) return String;

end HelpersJuegoAhorcado;