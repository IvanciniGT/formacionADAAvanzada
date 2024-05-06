Subtipos de Integer:

- Natural incluye el 0
- Positive empieza en el 1

---

Debe depender el gameEngine del juego elegido? Cambia su lógica? NO

En cambio, el gameEngine depende de los juegos que tengo disponibles.
    with Juego; use Juego;
    with AdivinarNumeroJuego; use AdivinarNumeroJuego; --- Aquí estoy creando una dependencia!

Aquí nos estamos cagando en el quinto principio SOLID de desarrollo de software:
D: Inversión de la dependencia = PROGRAMACION ORIENTADA A OBJETOS

    Un componente de alto nivel del sistema NUNCA debe depender de implementaciones concretas de componentes de más bajo nivel. SINO que ambos deben depender de abstracciones.

A que quieres jugar:
1- Adivinar número (sin pistas)     ----> Jugable (función a la que puedo llamar para jugar... con una configuración concreta)
2- Adivinar número (frio caliente)
3- Ahorcado - Frutas
4- Ahorcado - Países

En un vector, podría guardar los Jugables... y los textos identificativos? en otro vector?
    2 vectores... que mantener sincronizados entre si... por ejemplo por posiciones. 
        El texto 5 va asociado al jugable 5
    No tiene sentido.
    Quiero una estructura de datos que me permita guardar ESA ASOCIACION entre texto y jugable. No quiero que sea implicita... La quiero EXPLICITA

    Maps: Es una colección clave-valor
        claves: UNICAS
        Los valores pueden obtenerse de las claves
    Los mapas se bassan en HASHES (huellas) para poder hacer búsquedas eficaces.
        Como clave podríamos meter cualquier cosa... un texto... un vector..
        Cuando me pidan buscar por un texto concreto, tendré que mirar el valor asociado a ese texto...
            Y esto me obliga a comprarar muchos textos entre si... lo que computacionalmente es caro!
                Al menos mucho más caro que comparar números
        El concepto es: DADA una clave, del tipo que sea, la voy a transformar en un número, de forma que las comprobaciones seán mucho más eficientes.
        Esto es algo que gestiona internamente ADA.Containers.HASMAP
---

# Algoritmos de HASH (huella)

Es una función que:
- el valor devuelto para una entrada es múcho más pequeño / manejable que el valor original
- Para la misma entrada siempre tengo el mismo resultado
- La probabilidad de COLISIÓN (es decir, que 2 datos de entrada produzcan el mismo valor de salida) sea lo suficientemente baja (para mis intereses).
- El valor original no puede ser regenerado desde el resultado. ES UN RESUMEN de la información

# LETRA DEL DNI es un algoritmo de huella (HASH)

    Dado un número de DNI 2300001, para calcular la letra:
        Dividir el número entre 23... división ENTERA (sin decimales) ...
        Descartamos el resultado de la división
            Y ME QUEDO CON EL RESTO

            2300001 -> RESTO de la división entre 23 (OPERADOR REMAINDER o MODULE) = 1... y está acotado entre 0-22
        El ministerio de interior nos da una tabla, donde se asocian a los números entre 0 y 22 una letra... es la que le toca... es su HUELLA
            En este caso, la R
    En el caso de los DNIS, cual es la probabilidad de que 2 números entreguen la misma letra? 1/23

    En computación solemos usar algoritmos de huella con una probabilidad de colisión mucho menor: MD5, SHA-512, SHA-1024.. 2048

---

Jugadores

- Al empezar a jugar, me pide el nombre
- Si ya tengo juegos previos (estadísticas) que las cargue... y las muestre por pantalla
- Si no tengo, que genere unas nuevas... y me de la bienvenida

- Cada vez que acabe una partida, que se actualicen las estadísticas:
    GANADO, PERDIDO o EMPATADO
- Las estadísticas serán: número total de partidas jugadas: Ganadas/Perdidas/Empatadas
- Vamos a tener un fichero por persona

PRIMERA VERSION DE LAS ESTADISTICAS
---
En segunda versión:
- Las estadísticas serán: 
    número total de partidas jugadas: Ganadas/Perdidas/Empatadas por juego
        + TOTAL

---
Cuándo leo el archivo de un jugador?
Después de meter el nombre
Cuándo lo escribo?
Cuando termine de jugar cada partida

Y entonces.. Si solo lo leo cuando escribe su nombre... 
Si quiero volver a sacar las estadísticas después de una partida, necesito:
- O lo vuelvo a leer después de modificarlo
- O Las estadísticas las guardo en RAM (cache)
    - Y uso el fichero sólo para persistencia! Que una vez acabado el programa, no pierda los datos.

Cómo vamos a manejar el fichero?
MODOS DE ACCESO A UN FICHERO?
- Podemos trabajar a nivel de caracter... o como binario.
- Los ficheros tienen 2 formas de trabajarse en escritura:
    - Acceso secuencial
    - Acceso aleatorio

En acceso secuencial, leo o escribo desde una determinada posición del archivo
    - Cuando lo abro en modo lectura: La posición se establece en el byte 0 del archivo
    - Cuando lo abro en modo escritura, puedo elegir si la posición se establece en el byte 0 o en el último (APPEND)

En acceso aletorio, la diferencia es que yo elijo en que byte quiero posicionar la aguja del HDD:
Dónde quiero empezar a leer/escribir?... y hasta dónde?

De cara a editar un archivo:
- Cuando trabajo con acceso secuencial, el problema es que: O reescribo el fichero o le añado cosas al final:
    Ejemplos de programas que trabajan de esta forma: Cualquier editor de texto, Word, excel
        Si tengo un archivo muy grande... y le cambio 4 letras... en guardar tarda lo mismo que si cambio todas as letras del archivo.

    VERSION 1

- Cuando trabajo con acceso aletaorio, puedo elegir que porción del archivo edito:  BBDD (cualquier BBDD)
    Problema: Gestión mucho más compleja.

    VERSION 2