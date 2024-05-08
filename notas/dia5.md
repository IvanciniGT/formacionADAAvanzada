
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

---

Que compliado es hacer un buen diseño de un sistema <<< JODIDO DE NARICES
Nos cuesta un huevo pensarlo... por mucha experiencia que tengamos...
Y para no regarla mucho, solemos adoptar una ARQUITECTURA DE DESARROLLO.
Hay muchas arquitecturas de desarrollo de software, 
igual que hay muchos patrones de desarrollo de sofytware.
Arquitecturas:
- Arquitectura limpia (CLEAN ARQUITECTURE)
- Arquitectura Hexagonal
- Arquitectura de cebolla

La idea es asegurar que respetamos esos principios SOLID.
En concreto el de responsabilidad UNICA.

Imaginad que la entrada a crear un nuevo jugador, la hago en Q_PLAYER.
    Imaginad ahora que quiero asociar una determinada LOGICA DE NEGOCIO a esa operacion: 
        Al dar de alta un jugador, se le debe mandar un email!
        Cuál sería el único lugar donde podría poner esa llamada? LA LLAMADA A ENVIAR EMAIL
        P_ENVIAR_EMAIL(EMILIO, ASUNTO=> "BIENVENIDA");

---
Aplicacion WEB

    DENTRO DEL NAVEGADOR                            SERVIDOR
----------------------------------------------   -------------------------------------------------------------------------------------------------
 Formulario de jugador > Servicio Jugadores    >   Controlador REST     > Servicio Jugadores   > Repositorio           >                BBDD

   Recoger unos datos     Comunicaciones            Recibir peticiones    Aportar lógica      Aportar lógica                        persistir
   válidos de un usuario    Servidor                 de clientes           de negocio         de persistencia                        datos
                                                                                                                                    validar DNI
                                                                            altaJugador
                                                                                validacion (1)                                       12345678W
                                                                                persistir
                                                                                solicitarEnvioEmail

                                                                        > Servicio de envío de email
    DENTRO DE UN TELEFONO
App. nativa Android
Formulario recoger datos >> Servicio que      >>
                            comunica con el servidor

Quier validar el DNI de la persona
Fecha de Nacimiento
    ¿Quién valida que la fecha sea una fecha?
    Estoy montando una pagina de apuestas deportivas.. y no puedo dar de alta a gente menor de 18 años. (1)


---

wins
losses
ties

felipe.txt
# Este es el fichero de: felipe
EMAIL=
LOSSES=10

# Otros comentarios
TIES=10
WINS=10


--->
# Este es el fichero de: felipe
LOSSES=10
TIES=10
WINS=10

--->

A nivel de SO, los archivos y la terminal se tratan de la misma form.

TODO PROCESO QUE CORRE EN UN SO (me da igual WINDOWS, LINUX, MACOS, UNIX(POSIX))
por defecto tiene 3 canales de comunicación:
  ID
- 0 - ENTRADA ESTANDAR
- 1 - SALIDA ESTANDAR
- 2 - SALIDA DE ERROR

Cuando hacemos un PUT_LINE(CANAL, TEXTO) ... si no le paso canal... se usa 1
Cuando hacemos un GET_LINE(CANAL,VARIABLE) .. si no le paso cana... se usa el 0

