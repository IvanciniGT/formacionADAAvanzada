-- Definir los juegos que hay disponibles


procedure A_JUGAR
-- Vamos a dar al jugador la posibilidad de elegir un juego
-- Una vez elegido un juego... Echamos una partida a ese juego (con una configuración de manos)
-- Capturaré el resultado de la partida
-- Informar del resultado (---> Lo guardamos en un fichero)
-- Preguntaré si quiere jugar de nuevo a ese juego
    -- Caso que no, peguntaré si desea jugar a otro juego
end A_JUGAR

-- Este procedimiento depende de otros componentes:
-- - Juego
-- - Interfaz de comunicación gráfica con el usuario.

-- Si ejecuto la prueba... y falla? Qué ha fallao? NPI
-- Para hacer una prueba unitaria, necesito aislar al componente: Montarlo en un bastidor,
-- y desligarlo del resto de componentes
-- Si mi diseño no permite el aislar a un componente, será imposible hacer una prueba unitaria (por definición)
--  Y no va a ser fácil aislar al componente en muchos escenarios...