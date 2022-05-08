### Aporte de los mensajes de DD
En un double dispatch (DD), ¿qué información aporta cada uno de los dos llamados?

En el caso del test13 que tenemos "oneFifth + one" tenemos el primer llamado que llama a la suma de Fraccion con "one" de colaborador. El segundo llama a la suma con fraccion pero de el "one".

En general el primer mensaje es polimorfico para tanto las clases que lo entiendan. En el segundo llamado, tenemos mas informacion acerca de quien es "self". Para cada uno de aquellos tipos que puede tomar "self" se crea otro mensaje polimorfico para tratar especificamente con ese tipo, y así con todos los posibles casos. Por ejemplo el mensaje "beAddedToAFraccion:" seria un caso del mensaje de segundo tipo.


### Lógica de instanciado
Con lo que vieron y saben hasta ahora, ¿donde les parece mejor tener la lógica de cómo instanciar un objeto? ¿por qué? ¿Y si se crea ese objeto desde diferentes lugares y de diferentes formas? ¿cómo lo resuelven?

Nos parece mejor que la logica para instanciar un objeto este dentro de la clase concreta y no en su superclase, ya que esta puede ser superclase de otras clases y no sería claro como instanciar una de sus subclases. No seria claro que una superclase tenga la logica para instanciar cada una de sus subclases.

Si se crea un objeto de distintas formas y distintos lugares, estos de cierta forma van a recurrir a una misma solucion para este problema y no es que cada caso se resuelve de forma distinta. En este caso es indiferente cómo y de donde se crea el objeto ya que en todos los casos se recurre a una misma forma.


### Nombres de las categorías de métodos
Con lo que vieron y trabajaron hasta ahora, ¿qué criterio están usando para categorizar métodos?

En el caso que tuvimos que aplicar la tecnica de Double Dispatch, estos nuevos mensajes polimórficos los ubicamos dentro de una categoria similar en donde estaba el primer mensaje, pero con indicando que son privados.

De forma general, categorizamos los métodos segun su función en la clase a la que corresponden.


### Subclass Responsibility
Si todas las subclases saben responder un mismo mensaje, ¿por qué ponemos ese mensaje sólo con un “self subclassResponsibility” en la superclase? ¿para qué sirve?

Es una manera de indicar (y obligar) que una subclase debe implementar este mensaje. Si no lo hace, ocurrirá un error dentro del sistema.


### No rompas
¿Por qué está mal/qué problemas trae romper encapsulamiento?

Por una parte pensamos que va en contra de lo que estamos viendo de polimorfismo, siendo de esta forma que quita "generalidad" al código que escribimos, accediendo a las implementaciones de los objetos cuando en realidad esto no deberia hacerse.

Encontramos el ejemplo dentro del ejercicio como si a Entero le preguntaramos quien es su integerValue para sumarlo con un SmallInteger, en vez de dejar a la clase Entero decidir como manejar la suma.

Teniendo estos problemas nos encontramos con un modelo que no es escalable y flexible a cambios.