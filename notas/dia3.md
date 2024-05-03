
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