#include 'hbclass.ch'

/*
 * Observer
 * defines an updating interface for objects that should be notified
 * of changes in a subject
*/
CLASS Observer

    EXPORTED:

        METHOD getState() VIRTUAL
        METHOD update( oSubject ) VIRTUAL

END CLASS

/*
 * Concrete Observer
 * stores state of interest to ConcreteObserver objects and
 * sends a notification to its observers when its state changes

*/
CLASS ConcreteObserver FROM Observer

    EXPORTED:

        METHOD new( nState ) INLINE ::nObserver_State := nState, Self
        METHOD getState() INLINE ::nObserver_State
        METHOD update( oSubject )

    PROTECTED:

        DATA nObserver_State AS Numeric INIT 0

END CLASS

METHOD update( oSubject ) CLASS ConcreteObserver

    ::nObserver_State := oSubject:getState()
    ? 'Observer state updated.'

return( nil )


/*
 * Subject
 * knows its observers and provides an interface for attaching
 * and detaching observers
*/
CLASS Subject

    EXPORTED:

        METHOD attach( oObserver ) INLINE aAdd( ::aObservers, oObserver )
        METHOD detach( nIndex ) INLINE hb_ADel( ::aObservers, nIdex, .t. )
        METHOD notify()
        METHOD getState() VIRTUAL
        METHOD setState() VIRTUAL

    PROTECTED:  

        DATA aObservers AS Array INIT {}

END CLASS


METHOD notify() CLASS Subject

    Local nI

    for nI := 1 to Len( ::aObservers )

        ::aObservers[ nI ]:update( Self )

    next


return( nil )


/*
 * Concrete Subject
 * stores state that should stay consistent with the subject's
*/
CLASS ConcreteSubject FROM Subject

    EXPORTED:

        METHOD getState() INLINE ::nSubject_State
        METHOD setState( nState ) INLINE ::nSubject_State := nState

    PROTECTED:

        DATA nSubject_State AS Numeric INIT 0

END CLASS


function main()

    Local oObserver1
    Local oObserver2
    Local oSubject

    oObserver1 := ConcreteObserver():new( 1 )
    oObserver2 := ConcreteObserver():new( 2 )

    ? 'Observer 1 state: ' + str( oObserver1:getState() )
    ? 'Observer 2 state: ' + str( oObserver2:getState() )

    oSubject := ConcreteSubject()
    oSubject:attach( oObserver1 )
    oSubject:attach( oObserver2 )

    oSubject:setState( 10 )
    oSubject:notify()

    ? 'Observer 1 state: ' + str( oObserver1:getState() )
    ? 'Observer 2 state: ' + str( oObserver2:getState() )
   


return( 0 )