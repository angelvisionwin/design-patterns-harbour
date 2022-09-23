#include 'hbclass.ch'


/*
 * Prototype
 * declares an interface for cloning itself
*/
CLASS Prototype

    EXPORTED:

        METHOD clone() VIRTUAL
        METHOD type() VIRTUAL

END CLASS

/*
 * Concrete Prototype A and B
 * implement an operation for cloning itself
*/
CLASS ConcretePrototypeA FROM Prototype

    EXPORTED:

        METHOD clone() INLINE ConcretePrototypeA():New()
        METHOD type() INLINE 'type A'
        

END CLASS


CLASS ConcretePrototypeB FROM Prototype

    EXPORTED:

        METHOD clone() INLINE ConcretePrototypeB():New()
        METHOD type() INLINE 'type B'
        

END CLASS


/*
 * Client
 * creates a new object by asking a prototype to clone itself
*/
CLASS Client

    EXPORTED:

        METHOD New() INLINE ::Init(), Self 
        METHOD Init()
        METHOD Remove()
        METHOD Make( nIndex )

    PROTECTED:  

        DATA aTypes AS Array Init { nil, nil }


END CLASS

METHOD Init() CLASS Client

    ::aTypes[ 1 ] := ConcretePrototypeA():New()
    ::aTypes[ 2 ] := ConcretePrototypeB():New()

return( nil )

METHOD Remove() CLASS Client

    ::aTypes[ 1 ] := nil
    ::aTypes[ 2 ] := nil

return( nil )

METHOD Make( nIndex ) CLASS Client

    if nIndex > len( ::aTypes )

        return( nil )

    endif

return( ::aTypes[ nIndex ]:clone() )    


function Main()

    Local oPrototype
    Local oClient1
    Local oClient2

    oPrototype := Client():New()

    oClient1 := oPrototype:make( 1 )
    ? 'Prototype : ' + oClient1:type()

    
    oClient2 := oPrototype:make( 2 )
    ? 'Prototype : ' + oClient2:type()


return( nil )