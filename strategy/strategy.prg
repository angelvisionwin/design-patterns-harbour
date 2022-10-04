#include 'hbclass.ch'

/*
 * Strategy
 * declares an interface common to all supported algorithms
*/
CLASS Strategy

    EXPORTED:

        METHOD algorithmInterface() VIRTUAL

END CLASS

/*
 * Concrete Strategies
 * implement the algorithm using the Strategy interface
*/
CLASS ConcreteStrategyA FROM Strategy

    EXPORTED:

        METHOD algorithmInterface()

END CLASS

METHOD algorithmInterface() CLASS ConcreteStrategyA

    ? 'Concrete Strategy A'

return( nil )    

CLASS ConcreteStrategyB FROM Strategy

    EXPORTED:

        METHOD algorithmInterface()

END CLASS

METHOD algorithmInterface() CLASS ConcreteStrategyB

    ? 'Concrete Strategy B'

return( nil )   


CLASS ConcreteStrategyC FROM Strategy

    EXPORTED:

        METHOD algorithmInterface()

END CLASS

METHOD algorithmInterface() CLASS ConcreteStrategyC

    ? 'Concrete Strategy C'

return( nil )   

/*
 * Context
 * maintains a reference to a Strategy object
*/
CLASS Context

    EXPORTED:   

        METHOD new( oStrategy ) INLINE ::oStrategy := oStrategy, Self
        METHOD contextInterface() INLINE ::oStrategy:algorithmInterface()

    PROTECTED:

        DATA oStrategy AS Object INIT nil 

END CLASS


function main()

    Local oContext
    Local oContextC

    oContext := Context():new( ConcreteStrategyA():new() )
    oContext:contextInterface()

    oContextC := Context():new( ConcreteStrategyC():new() )
    oContextC:contextInterface()

return( 0 )

