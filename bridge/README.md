## Bridge

Desacople una abstracción de su implementación para que las dos puedan variar de forma independiente.
El patrón de puente tiene un propósito estructural y se aplica a los objetos, por lo que se ocupa de la composición de los objetos.

### Cuándo usarlo

* desea evitar un enlace permanente entre una abstracción y su implementación
* tanto las abstracciones como sus implementaciones deben ser extensibles mediante subclases
* los cambios en la implementación de una abstracción no deberían tener impacto en los clientes
* desea ocultar la implementación de una abstracción por completo de los clientes