
Jugador - Un jugador será un NUEVO TIPO DE DATO
    - Nombre
    - Email    - ID
    - Estadistica

Estadistica
    - Partidas jugadas
    - Partidas ganadas
    - Partidas empatadas

Cuando juguemos, nos pedirá nuestro email. 
Si no lo reconoce, nos dirá que ese jugador no está reconocido... que si lo queremos dar de alta:
    NO: Vuelve a meter el email
    SI: Pide el nombre + Genera unas estadisticas iniciales (vacias)

Cuando acabamos:
    - Quieres jugar otra vez a este juego? NO:
        - Quieres jugar a otro juego? NO: 
            - Quiere jugar otro jugador? 

Nosotros hemos dicho que vamos a leer el fichero del jugador una única vez por ejecución del programa (lo usamos para persistencia):
    + Rendimiento... Solo lo leemos una vez... que es una operación lenta (el leer de un HDD comparado con leer de RAM)
    - Tengo más tiempo cierta cantidad de RAM bloqueada.

Operaciones sobre los Jugadores
    Mostrar estadisticas
        Imprimo un titulo: ESTADISTTICAS!!!!
        Imprimo los datos del jugador
        // Para cada estadistica que tenga: Imprimo esa estadisticas
        Imprimo su estadisticas
    Nuevo Jugador
    (Borrar jugadores, Editarlos)
    comprobar si existe previamente?
    persistirlo (save)
    load

    Esto tiene que ver con el conceto de jugador... y su gestión...
        Operaciones de gestión de jugadores     GESTION DE JUGADORES                                            MANAGER
            Alta
            Borrado
            Recuperacion (búsqueda)
        
        Ya teniendo un jugador                  GESTIONAR LAS COSAS DE UN JUGADOR CONCRETO
            Editar sus datos
            Persistir sus datos
            Actualizar las estaidticas de un jugador

    Esto tiene que ver con cómo uso ahora esas cosas que gestiono.
        COSAS que hago con mis jugadores        HELPERS
        imprimir por pantalla los datos de un jugador       

Operaciones sobre Estadisticas
    actualizarEstadísticas
    (resetear)
    >>mostrarEstadisticas

Empezamos definirnedo el API: .ads
    - Records (Tipos)
    - Las operaciones que podré ir haciendo .... Spec (ads)

# Programación Orientada a Objetos

Decimos que un lenguaje soporta programación orientada a objetos cuando nos permite definir nuestros propios tipos de datos.
Esos tipos de datos tendrán sus propias características que los definan (propiedades suyas).
Y sobre esos tipos de datos nuevos, podré ejecutar ciertas operaciones que antes no existían y puedo definir.

    Fecha
        dia
        mes
        año
    
    Operaciones
        resta(de 2 fechas)
        suma(número de días)
        suma(meses)
        suma(años)
        comparar 2 fechas
        si es un día entre semana
        si es fin de semana
        si el año es bisiesto
        días hasta hoy
        tiempo hasta hoy
            7 de Mayo de 2024
                7 de Abril de 2024 > "Hace un mes"
                10 de Mayo de 2024 > "Dentro de 3 días"

