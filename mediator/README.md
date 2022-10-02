## Mediator

El patrón mediador tiene un propósito conductual y se aplica a los objetos.
El patrón define un objeto que encapsula cómo interactúa un conjunto de objetos.
Promueve el acoplamiento flojo al evitar que los objetos se refieran entre sí explícitamente, 
y te permite variar su interacción de forma independiente.

### Cuándo usar

* un conjunto de objetos se comunican en formas bien definidas pero complejas
* reutilizar un objeto es difícil porque se refiere y se comunica con muchos otros objetos
* un comportamiento que se distribuye entre varias clases debe ser personalizable sin muchas subclases