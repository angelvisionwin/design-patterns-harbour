#include 'hbclass.ch'

/*
 * State
 * defines an interface for encapsulating the behavior associated
 * with a particular state of the Context
*/
CLASS State

    EXPORTED:

        METHOD handle() VIRTUAL

END CLASS


/*
 * Concrete States
 * each subclass implements a behavior associated with a state
 * of the Context
*/
CLASS ConcreteStateA FROM State

    EXPORTED:

        METHOD handle() 

END CLASS

METHOD handle() CLASS ConcreteStateA

    ? 'State A handled'

return( nil )


CLASS ConcreteStateB FROM State

    EXPORTED:

        METHOD handle() 

END CLASS

METHOD handle() CLASS ConcreteStateB

    ? 'State B handled'

return( nil )


/*
 * Context
 * defines the interface of interest to clients
*/
CLASS Context

    EXPORTED:

        METHOD setState( oState ) INLINE ::oState := oState
        METHOD request() INLINE ::oState:handle()

    PROTECTED:

        DATA oState AS Object INIT nil

END CLASS


function main()

    Local oContext

    oContext := Context():new()

    oContext:setState( ConcreteStateA():new() )
    oContext:request()

    oContext:setState( ConcreteStateB():new() )
    oContext:request()

    
return( 0 )