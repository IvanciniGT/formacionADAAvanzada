
# Lenguaje ADA

## Respecto a la gestión de los tipos de variable

- Tipado dinámico - Las variables NO TIENE TIPO
    ```py
    texto = 'hola'
    ```
    'hola' -> Pone un objeto de tipo texto en RAM, con valor HOLA
    texto  -> Crear una variable
    =      -> Operador asignación... pero no asigna 'hola' a la variable texto
              Asigna la variable al objeto 'hola'
    
    ```py
    texto = 55
    ```
    
- Tipado estático - Las variables/funciones si tienen tipos

    ```java
        String texto = "hola";
    ```
    "hola"          -> Pone un objeto de tipo texto en RAM, con valor "hola"
    String texto    -> Crear una variable de tipo texto
    =               -> Operador asignación... pero no asigna 'hola' a la variable texto
                       Asigna la variable al objeto 'hola'
    ```java
        texto = "adios";
    ```
    "adios"         -> Pone un objeto de tipo texto en RAM, con valor "adios"
                        ¿Dónde se pone? en el mismo sitio en RAM dónde estaba "hola" o en otro?
                            De hecho en otro...
                            Y llegados a este punto tenemos 2 objetos en RAM: "hola" y "adios"
    texto           -> Desasigna la variable de donde estaba asiganada
    =               -> Asignar la variable a el nuevo dato... qué esta en otro sitio.
    
        En JS, PYTHON, JAVA, sería imposible volver a acceder al dato antiguo ("hola") al no haber ya ninguna variable que punte a ese dato. Ese dato se convierte en BASURA (GARBAGE).
        Y estará en RAM... npi de cuánto tiempo... ocupando espacio.
        Hasta que entre el GARBAGE COLLECTOR (que es un proceso que se ejecuta por el intérprete de esos lenguajes)... o no! Dependiendo si hace falta... 
            ESTO DA LUGAR A UN COMPORTAMIENTO NO DETERMINISTA! -> INVALIDA A estos lenguajes para cierto tipo de desarrollos.
            Por contra, nos evitamos hacer toda la gestión de RAM...
    ```ada
    NUMERO: Integer := 33;
    NUMERO := 34;
    ```

        El compilador aquí hace sus cositas!!!!
            1º Reserva de memoria RAM, para qué? para almacenar un número entero -> Tamaño de reserva
            2º A ese espacio/zona de memoria me voy a referir con el nombre de la variable.
            3º El dato se guarda en ese espacio de memoria.

## Paradigmas de programación

Formas en las que uso un lenguaje para expresar un concepto.

    > Felipe, pon una silla debajo de la ventana! IMPERATIVO
    > Felipe, ejecuta el procedimiento 33 (donde se explica cómo poner una silla debajo de una ventana) sobre esta ventana X ! PROCEDURAL

### Imperativo

Dar ordenes, que deben ejecutarse secuencialmete. En ocasiones, queremos romper esa secuencialidad:
    CONTROL DE FLUJO: (condicionales y bucles)
ADA. Soporta lenguaje imperativo? CLARO... la mayor parte del código que escribimos es imperativo

### Procedural

El lenguaje permite definir procedimientos (funciones, métodos, subrutinas), e invocarlos posteriormente.
ADA: Soporta lenguaje procedural.

### Funcional

Cuando el lenguaje me permite que una variable albergue una función!    \ Las funciones son ciudadanos de 
Y posteriormente invocar la función desde la variable!                  / primer nivel.

```py
    def saludo_informal(nombre):
        print("hola " + nombre)
    def saludo_formal(nombre):
        print("Buenos días, Don/Doña " + nombre)

    saluda("Felipe")

    mi_funcion_de_saludo = saludo_informal
    mi_funcion_de_saludo("Felipe")

    mi_funcion_de_saludo = saludo_formal
    mi_funcion_de_saludo("Felipe")
    saludo_formal("Felipe")
```

La gracia de esto, es que una vez que el lenguaje me permite hacerlo, podemos empezar a pasar funciones a otras funciones como argumentos... o incluso que una función devuelva otra función... Y ESTO ES UNA LOCURA... pero delicioso!

ADA: Soporta lenguaje funcional? SI. Y desde ADA 2012 MUCHO MAS !!!!!!

### Orientado a objetos

Cuando el lenguaje me permite definir mis propios tipos de datos... con sus métodos/funciones/procedimientos... y características particulares.
Todo lenguaje viene con sus tipos de datos: NUMEROS, TEXTOS, FECHAS, LOGICOS...
    - Tipo RADAR
        - encender
        - apagar

ADA: Soporta orientación a objetos? SI... en parte.

## Compilado vs interpretado

Al final, quién ejecuta mi programa? Quién lo arranca? quien lo controla? El SO
Con quien se comunica mi programa es con el SO.

Pregunta: Saben los SO (Windows, Linux, MacOS...) de Python? NO, JAVA? NPI, C? Nasti de plasti, ADA? NOP !!!!
Entonces? qué lenguaje hablan los SO? El suyo propio!

Es necesario traducir el código que hacemos en un lenguaje de programación al código del SO de turno, donde vaya a ejecutar mi programa:
- Compilación: Cuando realizo una pretraducción estática al lenguaje de un determinado SO.
    - Ventajas
        - Da lugar a un programa que tendrá una ejecución más rápida... está listo para su ejecución por parte de SO.
        - La compilación en si misma! Es un momento de reflexión... de revisión del código, de optimización del código, donde podemos detectar un huevo de problemas, antes de intentar ejecutarlo:
            - Errores de sintaxis
            - Tipos que no coinciden
            - Importaciones no satisfechas
    - Inconvenientes
        - Más laborioso el generar un entregable
        - Y además, necesito compilaciones para cada SO destino!
    Ejemplos: ADA, C, C++, Fortrán, JAVA
- Interpretación: Cuando la traducción se hace en tiempo real al lenguaje del SO.
    - Ventajas          
        - Me quito del follón de gestionar un huevo de distribuciones de mi programa:
            - Traduce a Windows
            - Traduce a Linux
            - Traduce a MacOS
    - Inconvenientes
        - Da lugar a un programa que tendrá una ejecución más lenta.
        - Al no tener compilación, perdemos ese momento de revisión del código... 
            - Lo ejecutamos... cruzamos los dedos ... y a ver si explota!
    Ejemplos: JS, PYTHON, JAVA

Para compilar un código, necesito un compilador:
En ADA los ficheros tienen extensión:
    .adb -> compilamos -> .ali -> linkado -> Binario ejecutable... para un SO concreto!
              gnat        .o        make
                    gnatmake
              
                
    .ads: Ada Specification 
    .adb: Ada Body
    .ali: Ada library information file
    .o:   Object file (compilado)

 # ADA

 Lenguaje creado a petición del Dpto de Defensa de USA! Hace 50 años!
 - LEGIBILIDAD DEBE PRIMAR SOBRE TODO LO DEMAS! 
    Un programa se escribe una vez, se modifica muchas y se lee muchísimas veces
                                                        -------------------------
    No me importa gastar tiempo al escribir el código... pero que todo quede muy clarito!

Hacer un programa es algo muy sencillo! Da igual el programa! Solo es cuestion de horas!
Aquí no esta el problema!
El problema gordo... gordísimo está en montar un programa que sea mantenible en el tiempo!
                                                                    ^^ ESTO ES LO DIFICIL = MUY COMPLICADO

---

# Juego de Adivinar un número.

La computadora, pensará un número aleatorio entre 0 y 10 < Qué hago aquí?
    - Definiendo una lógica: pensará un número aleatorio
    - Limitando el rango de valores del sistema / Juego
Me pregunta por el número... y me ofrece 3 posibilidades... a ver si acierto.
Quiero poder varias veces al juego (Cuando acabe, que me pregunte si quiero volver a jugar)

VUESTRO MEJOR INTENTO !

2 ficheros... el ads y el abd...
1 fichero... para qué ads...

                        RESPONSABILIDAD?
- Ejecutable...         Arrancar el programa
- JuegoHelpers          Generar números aletarios
- ComunicaionUsuario    Comunicarse con el usuario:
                            Pedir un número al usuario
                            Informar a un usuario si ha ganado una partida
- Juego                 Definir lo que es un juego... algo conceptual. genérico
    jugar()
    - AdivinarNúmero
        - Rango
        - Número de oportunidades
    - Lógica del Juego en cuestión (flujo) 
                        -> Más comunicaciones con el usuario
- Jugar al juego 1 o muchas partidas... mientras el jugador quiera jugar: Mantener mi programa corriendo a lo largo del tiempo o pararlo.

Una responsabilidad no tiene porqué ser un único procedimiento o función.
Una responsabilidad puede englobar múltiples funciones o procedimientos.

# Principios SOLID DE DESARROLLO DE SOFTWARE!

Principio orientados a crear software facilmente ampliable y mantenible en el futuro! Que es el problema gordo!
Esos principios son cosas que debo respetar.

S - Principio de Responsabilidad Unica = CRITICO !
        Un objeto debe tener una única razón para existir... y por ende un único motivo para ser modificado.
        Cada objeto debe tner una Responsabilidad única
        Las responsabilidades pueden ser de diferente naturaleza:
            - Lógica
            - Gestión de Datos
O - Principio de Abierto/Cerrado
        Un componente está abierto cuando se puede extender
        Un componente está cerrado cuando es utilizable por otro otros componentes => Tiene una interfaz pública conocida
L - Principio de sustitución de Liskov
        Un objeto de un programa debe poder ser reemplazado por un subtipo... sin alterar el correcto comportamiento del sistema:
            En nuestro programa de Juegos:
                - JuegoAdivinarNúmero : SI / NO     Limitado a 1-20 o el 1-10
                    A ese juego, le puedo aplicar diversas lógicas:
                        - En cada oportunidad te respondo: ACERTASTE / NO ACERTASTE
                        - ACERTASTE / MI NUMERO ES MAS BAJO / MI NUMERO ES MAS ALTO
                        - ACERTASTE, MUY FRIO, FRIO, TEMPLADO, CALIENTE, MUY CALIENTE
                - JuegoAhorcado: SI / NO
                - JuegoPiedraPapelTijera: SI/NO/EMPATADO
I - Principio de segregación de la interfaz
D - Principio de la inversión de la dependencia
    Un componente de alto nivel no debe depender de implementaciones concretas de un componente de bajo nivel... sino de abstracciones. <<<< ESTA ES LA UNICA FORMA DE HACER PRUEBAS UNITARIAS.
    - Mis componentes, no van a crear instancias de los objetos que necesiten.
      Le van a ser suministradas: PATRON DE INYECCION DE DEPENDENCIAS

---

# Pruebas de Software

## Vocabulario en el mundo del testing

- Error     Los humanos cometemos errores (errar es de humanos). 
            Las máquinas no se equivocan, no cometen errores.
            Causas: Cansancio, falta de atención, falta de conocimiento
- Defecto   Al cometer un error, un humano, introduce un DEFECTO en un producto.
            Los productos tiene defectos: BUG
- Fallo     Un defecto, en tiempo de ejecución, puede provocar un fallo.
            Un comportamiento que se aleja de lo especificado (requisitos)

## Para qué sirven las pruebas 

- Para asegurar el cumplimiento de unos requisitos.
- Para tratar de identificar el mayor número posible de DEFECTOS antes de la puesta en producción del sistema.
    Una vez identificado un defecto, trataré de eliminarlo de mi producto.
    Eso si... para ello, lo primero es identificarlo:
    Hacer pruebas que busquen defectos... esto ha sido menos habitual. Hoy  en día lo integramos de serie como parte del desarrollo de software: SONARQUBE!: 
        SONAR hace lo que antaño hacía un desarrollador senior: REVISION!
- Para tratar de identificar el mayor número posible de FALLOS, antes del paso a producción.
    Luego... me tocará sabiendo el fallo que ha ocurrido, identificar el defecto que lo ha provocado: DEPURACION o DEBUGGING.
- Para aportar la mayor cantidad posible de información que facilite el proceso de DEBUGGING. (1)
- Haciendo un análisis a posteriori de causas raices, identificar el origen de los errores... y planificar acciones preventivas que eviten nuevos ERRORES > DEFECTOS > FALLOS.
- Para saber qué tal va mi proyecto? voy retrasado? Voy bien? 
    Cuántas pruebas se han superado esta semana!
- ...

# Metodologías ágiles de desarrollo de software

El software funcionando es la MEDIDA principal de progreso. 
La MEDIDA principal de progreso es el "software funcionando" ---> DEFINIR UN INDICADOR PARA UN CUADRO DE MANDO

Cómo vamos a medir que tal va el proyecto? Lo haremos con el concepto SOFTWARE FUNCIONANDO!

* HITO 17 de Mayo... R1, R3, R5, R6 -> Pregunto al desarrollador.

SOFTWARE FUNCIONANDO = Software que funciona... que hace lo que tiene que hacer.
Y quién dice eso?
    - El CLIENTE.... TOCATE LOS HUEVOS !!!!! 
        Al cliente le tiene que llegar un producto ACABADO... LISTO... que FUNCIONE !!!
        La RESPONSABILIDAD ES MIA!
    - El desarrollador? 
        Ya hemos dicho que no... ya lo hemos sufrido.. incontables retrasos en las entregas durante décadas.
    - LAS PRUEBAS ! Las pruebas se hacen contra unos requisitos.

## Tipos de pruebas 

Las pruebas las podemos clasificar en base a múltiples taxonomías... paralelas entre si.
Cualquier prueba se debe centrar en una única característica del objeto de prueba: (1)

### En base al objeto de prueba

- Pruebas funcionales: Requisitos funcionales
- Pruebas no funcionales: Requisitos no funcionales
    - De rendimiento
    - De seguridad
    - De UX
    - De estrés
    - De carga

### En base a nivel de la prueba (scope)

- Unitarias                 Se centra en una caracterísca (igual que todas las pruebas) de un componente AISLADO
    TREN:
        Motor. Me lo provee una empresa. Y me lo mandan.
            Lo pruebo. UNITARIA: FUNCIONAL: 
                Lo instalo en un bastidor: 4 hierros soldaos <<< Esto sirve luego para el tren en producción? NO
                Le meto corriente y a ver si gira!
        Asientos. Me los mandan!
            Los pruebo:
                - UNITARIA UX: Es cómoda? Aguanta un tio ahí sentado 3 horas!
                - UNITARIA SEGURIDAD: Sujeta al tio en una curva
                - UNITARIA CARGA: Soporta a Monolón... que pesa 150Kgs
                - UNITARIA ESTRES: 700 personas al día sentandose sin parar... meses... sueltan los tornillos.. aflojan la colchoneta
        Ruedas
        Sistema de frenada
            Monto en un bastidor el sistema de frenos...
            Le meto corriente y veo si las pinzas cierran
        CONFIANZA +1 ... vamos bien!

- Integración               Se centran en la COMUNICACION de 2 COMPONENTES.
        Monto en un bastidor el sistema de frenos... Y en medio de las pinzas, la rueda... 
        Le meto corriente y veo si la rueda se para.
            Es capaz la pinza de comunicar la energía de rozamiento a la rueda (disco de freno?)

        CONFIANZA +1 ... vamos bien!

- Sistema / Subsistema      Se centran en el comportamiento del sistema en su conjunto
    - Aceptación: Un subconjunto de las de sistema.

### En base al conocimiento previo del código

- De caja blanca
- De caja negra

### En base al procedimiento de ejecución

- Estáticas: No requieren ejecución del código: SONARQUBE: REVISIÓN: Detectan DEFECTOS
- Dinámicas: Si requieren ejecución del código: Detectan FALLOS

