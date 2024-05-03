with Ada.Text_IO; use Ada.Text_IO;
with Cache; 

procedure Main is
   type mi_tipo is new Integer range 1..10;
   dato: mi_tipo := 5;
   package CacheNumeros is new Cache(
    TIPO_DE_DATO => mi_tipo
   ); use CacheNumeros;
begin
    guardar(dato);
    if recuperar = dato then
        Put_Line("OK");
    else
        Put_Line("ERROR");
    end if;


end Main;