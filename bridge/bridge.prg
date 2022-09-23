#include 'hbclass.ch'


/*
 * Implementor
 * defines the interface for implementation classes
*/
CLASS Implementor

    EXPORTED:

        METHOD action() VIRTUAL

END CLASS


/*
 * Concrete Implementors
 * implement the Implementor interface and define concrete implementations
*/
CLASS ConcreteImplementorA FROM Implementor

    EXPORTED:

        METHOD action() 

END CLASS

METHOD action() CLASS ConcreteImplementorA

    ? 'Concrete Implementor A'

return( nil )    


CLASS ConcreteImplementorB FROM Implementor

    EXPORTED:

        METHOD action() 

END CLASS

METHOD action() CLASS ConcreteImplementorB

    ? 'Concrete Implementor B'

return( nil )


/*
 * Abstraction
 * defines the abstraction's interface
*/
CLASS Abstraction

    EXPORTED:

        METHOD operation() VIRTUAL

END CLASS


/*
 * RefinedAbstraction
 * extends the interface defined by Abstraction
*/
CLASS RefinedAbstraction FROM Abstraction

    EXPORTED:

        DATA oImplementor

        METHOD new( oImplementor )
        METHOD operation() 

END CLASS

METHOD new( oImplementor ) CLASS RefinedAbstraction

    ::oImplementor := oImplementor

return( self )    

METHOD operation() CLASS RefinedAbstraction

    ::oImplementor:action()

return( nil )    


function main()

    Local oImplementorA
    Local oImplementorB
    Local oAbstract1
    Local oAbstract2

    oImplementorA := ConcreteImplementorA()
    oImplementorB := ConcreteImplementorB()

    oAbstract1 := RefinedAbstraction():New( oImplementorA )
    oAbstract1:operation()

    oAbstract2 := RefinedAbstraction():New( oImplementorB )
    oAbstract2:operation()

return( 0 )    