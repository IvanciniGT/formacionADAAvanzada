generic
    type TIPO_DE_DATO is(<>); -- que pueda ser cualquier cosa. Tipos discretos.


package Cache is

    -- quiero guardar textos?, números? valores lógicos?... LO QUIERO TODO... quiero que me puedan guardar cualquier tipo de dato.

    procedure guardar( dato: TIPO_DE_DATO );
    function recuperar return TIPO_DE_DATO;

end Cache;
