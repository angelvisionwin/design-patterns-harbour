#include 'hbclass.ch'

/*
 * Component
 * defines an interface for objects that can have responsibilities
 * added to them dynamically
*/
CLASS Component

    EXPORTED:

        METHOD operation() VIRTUAL

END CLASS

/*
 * Concrete Component
 * defines an object to which additional responsibilities
 * can be attached
*/
CLASS ConcreteComponent FROM Component

    EXPORTED:

        METHOD operation()

END CLASS

METHOD operation() CLASS ConcreteComponent

    ? 'Concrete Component operation'

return( nil )


/*
 * Decorator
 * maintains a reference to a Component object and defines an interface
 * that conforms to Component's interface
*/
CLASS Decorator FROM Component

    EXPORTED:

        METHOD operation( oComponent ) 

END CLASS

METHOD operation( oComponent )

    oComponent:operation()

return( nil )    


/*
 * Concrete Decorators
 * add responsibilities to the component (can extend the state
 * of the component)
*/
CLASS ConcreteDecoratorA FROM Decorator

    EXPORTED:

        DATA oComponent

        METHOD New( oComponent ) INLINE ::oComponent := oComponent, Self
        METHOD operation()

END CLASS

METHOD operation() CLASS ConcreteDecoratorA

    ::Super:operation( ::oComponent)
    ? 'Decorator A'

return( nil )


CLASS ConcreteDecoratorB FROM Decorator

    EXPORTED:

        DATA oComponent

        METHOD New( oComponent ) INLINE ::oComponent := oComponent, Self
        METHOD operation()

END CLASS

METHOD operation() CLASS ConcreteDecoratorB

    ::Super:operation( ::oComponent)
    ? 'Decorator B'

return( nil )


function main()

    Local oCC
    Local oDB
    Local oDA

    oCC := ConcreteComponent():New()
    oDB := ConcreteDecoratorB():New( oCC )
    oDA := ConcreteDecoratorA():New( oDB )

    oDA:operation()

return( 0 )
