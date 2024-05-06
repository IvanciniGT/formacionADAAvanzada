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

