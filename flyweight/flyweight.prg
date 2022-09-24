#include 'hbclass.ch'

#define ARR_KEY 1
#define ARR_OBJ 2

CLASS Flyweight

    EXPORTED:   

        METHOD operation() VIRTUAL

END CLASS

/*
 * UnsharedConcreteFlyweight
 * not all subclasses need to be shared
*/
CLASS UnsharedConcreteFlyweight FROM Flyweight

    EXPORTED:   

        DATA nIntrinsic_state AS Numeric INIT 0

        METHOD New( nIntrinsic_state )
        METHOD operation()

END CLASS

METHOD New( nIntrinsic_state ) CLASS UnsharedConcreteFlyweight

    ::nIntrinsic_state := nIntrinsic_state

return( self )

METHOD operation() CLASS UnsharedConcreteFlyweight

    ? 'Unshared Flyweight with state ' + str( ::nIntrinsic_state, 5 )
    
return( nil )


/*
 * ConcreteFlyweight
 * implements the Flyweight interface and adds storage
 * for intrinsic state
*/
CLASS ConcreteFlyweight FROM Flyweight

    EXPORTED:   

        DATA nAll_state AS Numeric INIT 0

        METHOD New( nAll_state )
        METHOD operation()

END CLASS

METHOD New( nAll_state ) CLASS ConcreteFlyweight

    ::nAll_state := nAll_state
    
return( self )

METHOD operation() CLASS ConcreteFlyweight

    ? 'Concrete Flyweight with state ' + Str( ::nAll_state, 5 )

return( nil )

/*
 * FlyweightFactory
 * creates and manages flyweight objects and ensures
 * that flyweights are shared properly
*/
CLASS FlyweightFactory

    EXPORTED:

        METHOD new()
        METHOD getFlyWeight( nKey )

    PROTECTED:
    
        DATA aFlies AS Array INIT {}

END CLASS


METHOD New() CLASS FlyweightFactory

    ::aFlies := {}

return( self )


METHOD getFlyWeight( nKey ) CLASS FlyweightFactory

    Local oFly

    if len( ::aFlies ) > 0 .and. hb_ascan( ::aFlies, { | aRec | aRec[ ARR_KEY ] == nKey }) != 0

        return( ::aFlies[ nKey, ARR_OBJ])

    endif

    oFly := ConcreteFlyweight():New( nKey )
    aAdd( ::aFlies, { nKey, oFly } )

return( oFly )

function main()

    Local oFactory

    oFactory := FlyweightFactory():New()

    oFactory:getFlyWeight( 1 ):operation()
    oFactory:getFlyWeight( 2 ):operation()
    oFactory:getFlyWeight( 1 ):operation()


return( 0 )