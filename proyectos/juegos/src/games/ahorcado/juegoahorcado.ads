with Partida;
with juego; use juego;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package JuegoAhorcado is

    type ConfiguracionJuegoAhorcado is new Configuracion with Record
        tematica: Unbounded_String;
    end record;
    overriding function JUGAR_MANO(config: ConfiguracionJuegoAhorcado) return Partida.RESULTADO;

end JuegoAhorcado;