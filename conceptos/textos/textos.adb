with Ada.Text_IO; use Ada.Text_IO;

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Strings.Maps.Constants; use Ada.Strings.Maps.Constants; -- Este es el que trae los mapas de mayusculas, minusculas...
procedure Textos is

    mi_texto: String := "Hola Mundo"; -- me infiere el tamaño del valor que le asigno
    mi_texto_sin_inicializar: String(1..10); -- me reserva 10 caracteres

    --mi_texto2:String; -- esto no cuela
                      -- Un String en ada es un array de caracteres...
                      -- Y como todo array, al definirlo, he de especificar su tamaño... 
                      -- para que se pueda hacer la reserva de memoria
    respuesta: Character;
    --otra_respuesta: String;
    texto_que_no_puedo_inicializar_a_priori: Unbounded_String; -- este no hace falta inicializarlo a un tamaño fijo
begin
    
    mi_texto_sin_inicializar := "Hola Mundo";
    Put_Line(mi_texto_sin_inicializar);

    Put_Line(mi_texto);

    Put_Line("Quieres que me despida formalmente: (s/n) ");
    Get(respuesta);
    skip_line;
    if respuesta = 's' then
        declare
            mi_texto2:String := "Adios mundo cruel";
        begin
            Put_Line(mi_texto2);
        end;
    end if;

    Put_Line("Dime algo: ");
    declare
        otra_respuesta:String  := Get_Line;
    begin
        Put_Line(otra_respuesta);
        -- texto_que_no_puedo_inicializar_a_priori := otra_respuesta; -- no colaría. Problema de tipos
        texto_que_no_puedo_inicializar_a_priori := To_Unbounded_String(otra_respuesta);
    end;


    Put_Line("Texto que no pude inicializar a priori: ");
    Put_Line(To_String(texto_que_no_puedo_inicializar_a_priori));


    for posicion in To_String(texto_que_no_puedo_inicializar_a_priori)'Range loop
        Put_Line(To_String(texto_que_no_puedo_inicializar_a_priori)(posicion)'Image);
    end loop;
    --for posicion in texto_que_no_puedo_inicializar_a_priori'Range loop
    --    Put_Line("Otro caracter");
        --Put_Line(Element(texto_que_no_puedo_inicializar_a_priori, posicion));
    --end loop;

    for posicion in mi_texto'Range loop
        Put_Line(mi_texto(posicion)'Image);
    end loop;

    Put_Line(To_string(Translate(texto_que_no_puedo_inicializar_a_priori, Lower_Case_Map)));

    Put_Line(To_String(Translate(To_Unbounded_String(mi_texto), Upper_Case_Map )));--MAPA DE CARACTERES: Cada caracter de la cadena se sustituye por otro caracter...
                         -- Definido en el mapa de caracteres
                         -- Ada me da algunos mapas precreados
            -- En este caso usamos Translate(Unbounded_String) definiodo en el paquete Unbounded de Ada.Strings
            -- Esto es un sinsentido... Mejor usar la de abajo... ya que es un string
    Put_Line(Translate(mi_texto, Upper_Case_Map ));--MAPA DE CARACTERES: Cada caracter de la cadena se sustituye por otro caracter...
            -- En este caso usamos Translate(String) definiodo en el paquete fixed de Ada.Strings
end Textos;

