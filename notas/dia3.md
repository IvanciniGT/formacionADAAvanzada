
JUEGO AHORCADO

La computadora elige una palabra... y tengo un numero de fallos máximo que puedo cometer al intentar adivinar las letras de la palabra

CABEZA > CUERPO > 2 BRAZOS > 2 PIERNAS = 6 fallos
La palabra que elige la computadora... de donde la saco? DE UN FICHERO!
De hecho... de multiples ficheros.
- paises.txt
- animales.txt

Y la persona elige (CONFIGURACION) la temática de la palabra.
Una vez elegida una temática, lo primero será cargar el fichero... todas las palabras que ahí vienen.
De esas elegiré una al azar...
Pero donde ubico en RAM las palabras que leo del fichero? En un ARRAY? Necesitaría a priori saber cuántas palabras tengo.
Lo metemos en un Containers.Vector... me da la flexibilidad de ir añadiendo cosas dinamicamente.

Los Containers utilizan un concepto del lenguaje llamado? GENERICOS => TIPOS DE DATOS

Cuando trabajamos con GENERICOS, lo que tenemos son paquetes que pueden trabajar con distintos tipos de datos... 
Con datos de datos PERSONALIZABLES... y lo primero que nevcesito es especificar el TIPO DE DATO CONCRETO... ya que el paquete me permite trabajar con TIPOS GENERICOS.

Cuando empieza el juego, el ordenador piensa en una palabra... Y me presenta una pantalla:

--------------------------------------- (1)
Número de vidas restantes: 3            <<< La podemos pintar como un muñecote colgao!

_ A _ _ _ _ _ _ _

Letras usadas: A, J
Nueva letra: _

---------------------------------------
La palabra puede tener espacios en blanco y guiones ("Estados Unidos")
El usuario puede introducir la letra en Mayúsculas o minúsculas
Eso si... la representación, como se carga del fichero.

Estados Unidos
Est____ ______    <<<  MOSTRAMOS LA PALABRA ENMASCARADA

e-> Buena
s-> Buena
T-> Buena

Si elige una letra que ya ha usado... también le quito vida, por pringao!

---
VARIABLES: 
Listado de todas las palabras : CONTENEDOR (VECTOR)
Palabra_a_adivinar
    Una cosa es la palabra que muestro por pantalla: LA ORIGINAL (con mayusculas y minúsculas)
    Otra cosa es la palabra que uso para VERIFICAR si una letra se usa o no... (MAYUSCULAS o MINUSCULAS)
        Tiene pinta que la comprobación la voy a hacer con cierta frecuencia... CADA LETRA QUE ELIJA
        2 Opciones:
            - Cada vez que tenga que comparar, puedo pasar la palabra a MAYUSCULAS
                - Más uso de CPU
                + A ratos (cuando no estoy haciendo validación) no ocupo esa memoria extra
            - Puedo tener la palabra PRECONVERTIDA a MAYUSCULAS (para su uso en comparaciones)
                + Menos uso de CPU
                - Tengo todo el rato en uso cierta cantidad de memoria
            DECISIONES : PRECONVERTIDA
Palabra enmascarada (la que se muestra por pantalla):
    - Opción 1: Cada vez que pinte el estado:
        + Menos uso de RAM ( a ratos )
        - Más uso de CPU
    - Opción 2: Cada vez que se acierta / Y además: INICIALMENTE (la primera vez)
        + Optimizo el uso de CPU... un huevo
        + Más uso de RAM (No en cantidad... si en tiempo)
        DECISIONES: LA SEGUNDA !
Vidas
Letras usadas: ARRAY??? No se a priori cuantas usará.. 
                        Puedo inicializarlo a 28. Estoy reservando más memoria de la que puedo necesitar.
               VECTOR   Esto me resuelve el problema de saber a priori cuantos caracteres se van a usar...
                        Pero... me da que es matar moscas a cañonazos en este caso!!!
               UNBOUNDED_STRING? Voy generando un texto con las letras que vaya usando... las añado a la 
                        "palabra" que voy formando "ANSHFDKSUR"
Fichero... donde me va a venir eso?
              vvvvv
JUGAR_MANO(configuracion):
    + Por defecto, establecer ganadora a la COMPUTADORA
    + cargar las potenciales palabras (fichero)                       \
    + elegir la palabra aleatoriamente (de entre las potenciales)     / Helpers
    + Guardar convertida a MAYUSCULAS | MINUSCULAS                   /
    + ENMASCARAR                                                    /
    + BUCLE: Mientras le queden vidas:
        + mostrar el estado del juego en este punto:PINTAR POR PANTALLA (1) - UI
        + Pedir una letra                                                   - UI
        + la añado a las usadas
        + Si la palabra tiene la letra: -> CONDICIONAL
            - REENMASCARAR
            - Si ya acertó todas las letras: GANADOR... Y SALGO
        + Si no la tiene:
            - Le quito vida
    
    + Cuando salgo del bucle:
        + Muestro el estado final del juego.
        + Le felicito o de digo que es un paquete!                          - UI