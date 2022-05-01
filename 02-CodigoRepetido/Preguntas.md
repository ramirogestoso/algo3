## Abstracción de los tests 01 y 02 
Creamos la entidad de “Cronometro” que agrupa código similar y que parametriza lo que cambiaba, agregando así la opción de reutilizar este método siempre que se quiera evaluar el tiempo que tarda en correrse un bloque de código.
## Cómo representar en Smalltalk
Utilizamos clases para representar un tipo de objeto genérico de la realidad e instancias para reproducir entes concretos que pertenecen a la idea de esa clase. También está la opción de representar objetos concretos sin la idea de clase mediante el DenotativeObjectBrowser.
## Teoría de Naur
Cuando uno saca código repetido es porque entiende la teoría del código, entiende el problema que se está tratando y sabe que el dominio de la realidad está mejor representado con esta nueva abstracción.
## Sobre el ejercicio
Remarcamos que, en cuanto a los tests 5 y 6, no nos pareció necesario abstraer las 4 líneas de asserts que, si bien eran muy parecidas, hubiésemos tenido que crear un código que respondiese exactamente a las 4 preguntas que hacían, lo que hubiese resultado en un código muy específico, que muy rara vez se podría volver a reutilizar en una situación real.
