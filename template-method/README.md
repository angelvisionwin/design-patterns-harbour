## Template Method

El método de plantilla define el esqueleto de un algoritmo en una operación, aplazando algunos
pasos a las subclases. Permite que las subclases redefinan ciertos pasos de un algoritmo.
sin cambiar la estructura del algoritmo. El patrón tiene un propósito conductual y
se aplica a las clases.

### Cuándo usar

* para implementar las partes invariantes de un algoritmo una vez y dejar que las subclases implementen el comportamiento que puede variar
* cuando el comportamiento común entre las subclases debe factorizarse y localizarse en una clase común para evitar la duplicación de código
* para controlar extensiones de subclases