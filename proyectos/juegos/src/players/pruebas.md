q_player.ads
q_player.adb

q_statictics.ads
q_statictics.adb

q_player.q_player_manager.ads
q_player.q_player_manager.adb

q_player.q_repository.ads
q_player.q_repository.adb

A cuáles quiero definir pruebas?

Las pruebas que hago a las especificaciones de que tipo son? Sistema/Funcionales

POR DEFINICION TODA PRUEBA QUE HAGO CONTRA UN API ES DE SISTEMA. 
- Conozco lo que hay detrás? NPI ... es un API
  - Nunca podré entonces garantizar que esas funciones
    no dependan de otros componentes.

El API es como se comunica mi sistema (subsistema)
con el exterior.

Pero al llamar al API estoy llamando por tanto al sistema/subsistema. NUNCA A UN COMPONENTE AISLADO

POR DEFINICION NO SON UNITARIAS . SIEMPRE DE SISTEMA

q_player.ads
q_player.q_player_manager.ads
q_player.q_repository.ads

---

q_statictics.ads

1- T_STATISCTICS_COUNT .. y que está definido con unos determinados rangos de valores.
Voy a mirar si el rango está entre 0 y 255

SOLID
FIRST
F - Fast
I - Independientes
R - Repeteable
S - Selfvalidating
T - TIMELY