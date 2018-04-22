# Quién es Quién en Prolog

## Introducción

Esta aplicación consigue que el ordenador juegue al Quién es Quién. Al cargar el programa, se te asigna aleatoriamente un presonaje de entre todos los que están registrados. Es entonces cuando puedes hacer que el ordenador pregunte (además de otras opciones) hasta encontrar el personaje que te fue asignado.

## Motivación

El programa fue fruto de una práctica para la Universidad de Alcalá, concretamente en la asignatura Conocimiento y Razonamiento Automatizado.

## Instalación

Para poder hacer uso del programa, habrá que tener instalado previamente SWI-Prolog (http://www.swi-prolog.org/download/stable). Después, en la carpeta Documentos/Prolog/ se encontrará el directorio de trabajo por defecto de la aplicación. Poniendo los archivos .pl en el directorio de trabajo.

Este juego tiene dos modos: aleatorio e inteligente, en función del modo, se iniciará con el siguiente comando en Prolog:

1) [hechos], [reglas], [aleatorio].

2) [hechos], [reglas], [inteligente].

Para comenzar a usar el programa, se recomienda mirar la memoria o teclear la orden "ayuda." para listar las órdenes disponibles.

## Funcionalidades

### Crear un juego (asignar un personaje aleatorio) y reiniciar el juego.

-? juego.

-? reiniciar.

### Determinar si el ordenador ya conoce la solución.

-? resuelto.

### Ver los personajes que sean posible solución.

-? listing(seleccionable).

### Ver las preguntas hechas y sin hacer:

-? mostrarPreguntasHechas.

-? listing(pregunta_sin_hacer).

### Ver el personaje asignado.

-? solucion(X).

### Ver la probabilidad de descarte de cada pregunta (solo en el modo inteligente)

La probabilidad de descarte es un porcentaje que indica la mayor posiblidad de personajes.

-? listing(probabilidad).

## Pruebas

Varias fueron las pruebas que se realizaron a este juego. A pesar de ello, es muy posible que ocurran excepciones durante la ejecución del juego que no terminan de ser tratadas por el programa, sino por el IDE, pudiendo llegar incluso a parar la ejecución.

## Contacto

Correo electrónico: miguelangel.garciar@edu.uah.es, miguel.romeral@gmail.com

LinkedIn: Miguel Romeral (https://www.linkedin.com/in/miguelromeral/)

Twitter: @MiguelRomeral (https://twitter.com/MiguelRomeral)

## Licencia

Licencia Pública General GNU 3.0
