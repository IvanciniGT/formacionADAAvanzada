1- Quiero hacer pruebas a mi Game Engine
   Responsabilidad del game engine = Que tiene que hacer?
   Cuál es su misión?

   NOK - Decir hola y adios
   OK  - Llamar a mostrar bienvenida y despedida

   Cómo lo compruebo?
      1- Llamare a PLAY                     Si meto corriente a los frenos
      2- Mirar la salida por consola?       Y miro si la rueda se frena
   
   Qué tipo de prueba acabo de realizar?
      UNITARIA (I)

---
    Game engine no tiene que sacar cosas por la consola.
    Eso es responsabildidad del UIGameEngime... para eso lo hemos creado
    Si hago esa prueba... y falla... que ha fallao?
    - Que dentro del fichero GameEngine.adb no se llama a las funciones del UIGameEngine?
    - Que las funciones dentro del UIGameEngine están mal implementadas?

    NO LO SE. 
    Lo que estamos definiendo es una prueba de integración,
    entre 2 componentes: Game Engine + UIGameEngine
    ESA ES LA PRUEBA QUE QUIERO? NO
    Es más, podría ser que UIGameEngine ni siquiera esté implementado aún.
    Y entonces que? No puedo probar mi código? En serio?
    Estoy bloqueado?

    Para conseguir esto, tendré que montar un banco de pruebas.
    4 hierros solados... que luego van a la basura...
    Bueno... los guardo... por si hay que repetir la prueba en el futuro.
    Los 4 hierros, no van a formar parte del código final (del tren)
    pero aún así los necesito para mis prueba.
    En el mundo del software, a esos 4 hierros, los llamamos test-doubles:
    - Stub
    - Fakes
    - Spies ** SENSOR:
        Una implementación de mentirijilla del UIGameEngine
            que cuando reciba una petición a MOSTRAR_BIENVENIDA
            o a MOSTRAR_DESPEDIDA: 
                Guarde un booleano: Me han llamado.
            Y al final, cuando ejecute PLAY, tendré que ver que esos booleanos están a true.
    - Mocks
    - Dummies

    Pregunta nueva. Sería este un buen momento para diseñar nuestras pruebas UNITARIAS del GameEngine?
        Es timely? NO lo es... 
            No porque me haya adelantado.
            VOY TARDE !
            La tenía que tener ya antes!
    
    En paralelo puedo tener otro equipo desarrollando el 
    UIGameEngine... Ellos tendrán que hacer sus pruebas unitarias.
    Yo las mias.
    Luego nos juntaremos: Y haremos las pruebas de integración.

    TDD -> Si tengo primero las pruebas, podré ver el AVANCE DEL PROYECTO. Cómo voy?
    Cuántas pruebas he superado esta semana?
    Total definidas: 100 pruebas: He superado 37. Voy bien!

    DEVOPS
        Cultura que muchas empresas (TODAS) están adoptando.
        Es un cultura, un movimiento, una filosofía en pro de la AUTOMATIZACION.
        Integración continua
            Cuando tengo la ultima version de los desarrolaldores en un entorno de integración (pruebas), sometida a pruebas automatizadas.
            El producto de un procedimiento de CI es UN PUÑETERO INFORME DE PRUEBAS. Para qué? Para saber cómo va mi proyecto!
---

  Una función podrá hacer muchas cosas y tener muchos flujos dentro.
  Y cuando le hago una prueba, elijo un camino/flujo dentro de esa función

```ada
procedure MOSTRAR_RESULTADO_MANO(ganador: RESULTADO) is
begin
   if ganador = JUGADOR then
         Put_Line("Has ganado TU.... suerte del principiante!!!");
   elsif ganador = COMPUTADORA then
         Put_Line("He ganado yo.... paquete!!!"); 
   else 
         Put_Line("Hemos Empatado....");
   end if;
end MOSTRAR_RESULTADO_MANO;
```

Cuantos flujos tiene? Complejidad ciclomática: 3

Tendré que probar por tanto, cada uno de los flujos: 3 casos de prueba

Cada flujo puede tener muchas acciones asociadas... que querré probar
Para cada flujo tendré que probar todas las cosas que deben realizarse asociadas a ese flujo.

SOLID = Principios para desarrollar software facilmente mantenible y evolucionable
FIRST = Principios para desarrollar pruebas de software. 
    F   Fast                - Rápidas
    I   Independent         - Independientes
    R   Repeteable          - Repetibles
    S   Self-validating     - Deben de validar todo el trabajo que sea necesario 
    T   Timely              - Oportunas... en el momento adecuado
---

# Comentar / Documentar un código

## Comentar

Explico cómo funciona un código

## Documentar

Explico cómo se usa un código