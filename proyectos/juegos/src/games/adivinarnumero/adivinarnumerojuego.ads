with Partida;
with Juego; use Juego;
package AdivinarNumeroJuego is

    -- Defino la configuracion del juego... que ya es una configuracion particular para adivinar un numero
    type ConfiguracionAdivinarNumero is new Configuracion with Record
        maximo: Integer;
        minimo: Integer;
        intentos: Integer;
    end record;

    -- Doy una nueva definición a la función JUGAR_MANO... que ahora no le vale con la configuración general
    -- sino que necesita una configuración particular para este tipo de juego
    overriding function JUGAR_MANO(configuracion: ConfiguracionAdivinarNumero) return Partida.RESULTADO;
    -- overriding: Indica que esta función es una redefinición de la función JUGAR_MANO que teníamos en el paquete Juego

end AdivinarNumeroJuego;