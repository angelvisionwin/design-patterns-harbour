## Adapter

Convierta la interfaz de una clase en otra interfaz que los clientes esperan.
El adaptador permite que las clases trabajen juntas que de otro modo no podrían debido a
interfaces incompatibles, es decir. permite utilizar un cliente con un incompatible
interfaz por un adaptador que hace la conversión. El adaptador tiene un propósito estructural
y se puede aplicar en clases y también en objetos. Un adaptador de clase utiliza múltiples
herencia para adaptar una interfaz a otra y el adaptador de objetos usa object
composición para combinar clases con diferentes interfaces.

### Cuándo usarlo

* desea utilizar una clase existente y su interfaz no coincide con la que necesita
* desea crear una clase reutilizable que coopere con clases que no necesariamente tienen interfaces compatibles
