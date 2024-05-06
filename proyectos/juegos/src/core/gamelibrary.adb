with UIGameEngine; use UIGameEngine;
with Partida;
with Ada.Containers.Vectors;
with Ada.Containers.Indefinite_Ordered_Maps;
with Juego; use Juego;
with AdivinarNumeroJuego; use AdivinarNumeroJuego;
with JuegoAhorcado; use JuegoAhorcado;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
package body GameLibrary is

    V_MAPA_JUGABLES:            T_MAPA_JUGABLES;
    V_LISTADO_NOMBRES_JUEGOS:   T_LISTADO_NOMBRES_JUEGOS;


    -- FUNCIONES DE LOS JUEGOS -------------------------------------------------------------

    function JUGAR_JUEGO_ADIVINAR_NUMERO return RESULTADO is
        miConfiguracion: ConfiguracionAdivinarNumero := ConfiguracionAdivinarNumero'( minimo => 0, maximo => 20, intentos => 3);
    begin
        return AdivinarNumeroJuego.JUGAR_MANO(miConfiguracion); -- AdivinarNumeroJuego.JUGAR_MANO
                                            -- En este caso, hay 2 definiciones de la función JUGAR_MANO compatibles con el tipo de argumento
                                            -- Pero el compilador va a elegir la que está en AdivinarNumeroJuego
                                            -- Ya que es más específica
    end JUGAR_JUEGO_ADIVINAR_NUMERO;

    function JUGAR_JUEGO_AHORCADO_PAISES return RESULTADO is
        miConfiguracion: ConfiguracionJuegoAhorcado := ConfiguracionJuegoAhorcado'( tematica => To_Unbounded_String("paises") );
    begin
        return --JuegoAhorcado.
                JUGAR_MANO(miConfiguracion);
    end JUGAR_JUEGO_AHORCADO_PAISES;

    -- FUNCIONES DE LA LIBRERIA DE JUEGOS -------------------------------------------------------------

    function F_GET_GAME_NAMES return T_LISTADO_NOMBRES_JUEGOS is
    begin
        return V_LISTADO_NOMBRES_JUEGOS;
    end F_GET_GAME_NAMES;

    function F_GET_JUGABLE (V_GAME_NAME : String) return Partida.Jugable is
    begin
        return --Jugable'Image(V_MAPA_JUGABLES(V_GAME_NAME));
                V_MAPA_JUGABLES(To_Unbounded_String(V_GAME_NAME));
    end F_GET_JUGABLE;

    procedure P_INIT_LIBRARY is
        V_GAME_NAME: Unbounded_String;
        V_JUGABLE: Partida.Jugable;
    begin
        -- Un juego--
        V_GAME_NAME := To_Unbounded_String("Adivinar un numero (sin pistas)");
        V_JUGABLE := JUGAR_JUEGO_ADIVINAR_NUMERO'Access;
        V_MAPA_JUGABLES.Include(V_GAME_NAME, V_JUGABLE);
        V_LISTADO_NOMBRES_JUEGOS.Append(V_GAME_NAME);
        -- Otro juego--
        V_GAME_NAME := To_Unbounded_String("Ahorcado (paises)");
        V_JUGABLE := JUGAR_JUEGO_AHORCADO_PAISES'Access;
        V_MAPA_JUGABLES.Include(V_GAME_NAME, V_JUGABLE);
        V_LISTADO_NOMBRES_JUEGOS.Append(V_GAME_NAME);
    end P_INIT_LIBRARY;

end GameLibrary;




    --function JUGAR_JUEGO_DUMMY return RESULTADO is
    --    type ConfiguracionDummy is new Configuracion with null record;
    --    miConfiguracion: ConfiguracionDummy := ConfiguracionDummy'(null record);
    --begin
    --    return JUGAR_MANO(miConfiguracion); -- Juego.JUGAR_MANO
                                            -- Nosotros tenemos varias definiciones de la función JUGAR_MANO
                                            -- Esas definiciones usan tipos distintos para los argumentos
                                            -- En AdivinarNumeroJuego hemos SOBREESCRITO la función JUGAR_MANO
                                            -- Sobreescritura (override) es un concepto de la programación orientada a objetos
                                            -- por el cual damos una nueva definición de una función que ya existía previamente
                                            -- Y al hacerlo, personalizamos el comportamiento de esa función para un TIPO CONCRETO
                                            -- El compilador va a decidir a qué función llamar en función del TIPO de los argumentos
                                            -- En automático
                                            -- En este caso, no hay declaración de la función JUGAR_MANO que defina directamente
                                            -- El tipo de argumento ConfiguraciónDummy.
                                            -- Pero ConfiguracionDummy es una Configuracion...
                                            -- Y si hay una definición de JUGAR_MANO que admite Configuracion
                                            -- Y es la que se va a llamar
    --end JUGAR_JUEGO_DUMMY;

