## Visitor

Visitante representa una operación a realizar sobre los elementos de un objeto
estructura. Le permite definir una nueva operación sin cambiar las clases de
los elementos sobre los que opera. El patrón tiene un propósito conductual y se aplica
a los objetos

### Cuándo usar

* una estructura de objeto contiene muchas clases de objetos con diferentes interfaces,
y desea realizar operaciones en estos objetos que dependen de sus clases concretas
* muchas operaciones distintas y no relacionadas deben realizarse en objetos en una estructura de objeto,
y quiere evitar "contaminar" sus clases con estas operaciones
* las clases que definen la estructura del objeto rara vez cambian, pero a menudo desea
para definir nuevas operaciones sobre la estructura