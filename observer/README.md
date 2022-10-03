## Observer

Observer define una dependencia de uno a muchos entre objetos, de modo que cuando un objeto
cambia de estado, todos sus dependientes son notificados y actualizados automáticamente. El patrón
tiene un propósito conductual y se aplica a los objetos.

### Cuándo usar

* cuando una abstracción tiene dos aspectos, uno dependiente del otro
* cuando un cambio en un objeto requiere cambiar otros y no sabe cuántos objetos necesita cambiar
* cuándo un objeto debería poder notificar a otros objetos sin hacer suposiciones sobre quiénes son estos objetos