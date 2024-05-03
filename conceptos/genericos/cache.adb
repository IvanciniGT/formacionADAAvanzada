
package body Cache is

    dato_guardado: TIPO_DE_DATO;

    procedure guardar( dato: TIPO_DE_DATO ) is
    begin
        dato_guardado := dato;
    end guardar;

    function recuperar return TIPO_DE_DATO is
    begin
        return dato_guardado;
    end recuperar;

end Cache;