with Partida; use Partida;
with Juego; use Juego;
with UIAdivinarNumeroJuego; use UIAdivinarNumeroJuego;
with AdivinarNumeroHelpers; use AdivinarNumeroHelpers;

package body AdivinarNumeroJuego is

    overriding function JUGAR_MANO(configuracion: ConfiguracionAdivinarNumero) return Partida.RESULTADO is
        numero_a_adivinar: Natural;
        numero_seleccionado: Natural;
        numero_de_intentos_restantes: Natural;
        ganador: Partida.RESULTADO;
    begin
        ganador:= COMPUTADORA; -- Asumo por defecto que gana la computadora
        numero_de_intentos_restantes := configuracion.intentos;
        numero_a_adivinar := PEDIR_NUMERO_A_LA_COMPUTADORA(configuracion.minimo, configuracion.maximo);
        while numero_de_intentos_restantes > 0 loop
            numero_seleccionado := PEDIR_NUMERO_AL_JUGADOR;
            if numero_seleccionado = numero_a_adivinar then
                ganador := JUGADOR;
                exit;
            end if;
            INFORMAR_AL_JUGADOR_SI_FALLA_EL_INTENTO(numero_seleccionado,numero_a_adivinar);
            numero_de_intentos_restantes := numero_de_intentos_restantes - 1;
        end loop;
        return ganador;
    end JUGAR_MANO;

    procedure INFORMAR_AL_JUGADOR_SI_FALLA_EL_INTENTO(numero_seleccionado: Natural; numero_a_adivinar: Natural) is
    begin
        MOSTRAR_MENSAJE_AL_USUARIO("El numero seleccionado es incorrecto");
    end INFORMAR_AL_JUGADOR_SI_FALLA_EL_INTENTO;

end AdivinarNumeroJuego;