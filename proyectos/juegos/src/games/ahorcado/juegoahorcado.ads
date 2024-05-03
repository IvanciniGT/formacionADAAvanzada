with Partida;

package JuegoAhorcado is

    type ConfiguracionJuegoAhorcado is new Configuracion with Record(
        tematica: String
    );
    overriding function JUGAR_MANO(config: ConfiguracionJuegoAhorcado) return Partida.RESULTADO;

end JuegoAhorcado;