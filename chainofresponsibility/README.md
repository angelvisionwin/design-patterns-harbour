## Chain of Responsibility

El patrón de cadena de responsabilidad evita vincular al remitente de una solicitud con su receptor
dando a más de un objeto la oportunidad de manejar la solicitud. Las cadenas de patrones
los objetos receptores y pasa la solicitud a lo largo de la cadena hasta que un objeto la maneja.
Tiene un propósito conductual y se ocupa de las relaciones entre los objetos.

### Cuándo usar

* más de un objeto puede manejar una solicitud, y el controlador debe determinarse automáticamente
* desea enviar una solicitud a uno de varios objetos sin especificar explícitamente el receptor
* el conjunto de objetos que pueden manejar una solicitud debe especificarse dinámicamente