## Flyweight

El patrón de peso mosca tiene un propósito estructural, se aplica a objetos y se usa para compartir para apoyar
gran cantidad de objetos de grano fino de manera eficiente. El patrón se puede utilizar para reducir
uso de memoria cuando necesita crear una gran cantidad de objetos similares.

### Cuándo usar

* cuando una instancia de una clase se puede utilizar para proporcionar muchas "instancias virtuales"
* cuando todo lo siguiente es verdadero
* una aplicación utiliza una gran cantidad de objetos
* los costos de almacenamiento son altos debido a la gran cantidad de objetos
* la mayoría de los estados del objeto se pueden hacer extrínsecos
* muchos grupos de objetos pueden ser reemplazados por relativamente pocos objetos compartidos una vez que se elimina el estado extrínseco
* la aplicación no depende de la identidad del objeto