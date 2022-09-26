## Command

El patrón de comando encapsula una solicitud como un objeto, lo que le permite parametrizar
clientes con diferentes solicitudes, solicitudes de cola o registro, y admite deshacer
operaciones. El patrón tiene un propósito de comportamiento y se ocupa de las relaciones entre los objetos.

### Cuándo usar

* desea parametrizar objetos por una acción a realizar
* desea especificar, poner en cola y ejecutar solicitudes en diferentes momentos
* apoyo deshacer
* admite el registro de cambios para que se puedan volver a aplicar en caso de un bloqueo del sistema
* estructurar un sistema en torno a operaciones de alto nivel basadas en operaciones primitivas
