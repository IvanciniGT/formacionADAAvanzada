with Partida;
with Juego;
package AdivinarNumeroJuego is

    -- Defino la configuracion del juego... que ya es una configuracion particular para adivinar un numero
    type ConfiguracionAdivinarNumero is new Juego.Configuracion with Record
        maximo: Natural;
        minimo: Natural;
        intentos: Natural;
    end record;

    -- Doy una nueva definición a la función JUGAR_MANO... que ahora no le vale con la configuración general
    -- sino que necesita una configuración particular para este tipo de juego
    overriding function JUGAR_MANO(configuracion: ConfiguracionAdivinarNumero) return Partida.RESULTADO;    
            -- function JUGAR_MANO(configuracion: Configuracion              ) return Partida.RESULTADO;
    -- overriding: Indica que esta función es una redefinición de la función JUGAR_MANO que teníamos en el paquete Juego
    
    -- Quiero aqui la función para que se le pueda hacer un override...
    -- Y de gratis, tener más juegos: adivina un numero, frio/caliente, mayor/menos
    procedure INFORMAR_AL_JUGADOR_SI_FALLA_EL_INTENTO(numero_seleccionado: Natural; numero_a_adivinar: Natural);

end AdivinarNumeroJuego;