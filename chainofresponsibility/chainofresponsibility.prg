#include 'hbclass.ch'

/*
 * Handler
 * defines an interface for handling requests and
 * optionally implements the successor link
*/
CLASS Handler

    EXPORTED:   

        METHOD setHandler( oHandler ) INLINE ::oSuccessor := oHandler
        METHOD handleRequest()

    PROTECTED: 

        DATA oSuccessor AS Object INIT nil

END CLASS

METHOD handleRequest() CLASS Handler

    if hb_isobject( ::oSuccessor )

        ::oSuccessor:handleRequest()

    endif

return( nil )    


/*
 * Concrete Handlers
 * handle requests they are responsible for
*/
CLASS ConcreteHandler1 FROM Handler

    EXPORTED:

        METHOD canHandle() INLINE ( .f. )
        METHOD handleRequest()

END CLASS


METHOD handleRequest() CLASS ConcreteHandler1

    if ::canHandle()

        ? 'Handled by Concrete Handler 1'

    else

        ? 'Cannot be handle by Handler 1'
        ::Handler:handleRequest()

    endif

return( nil )    


CLASS ConcreteHandler2 FROM Handler

    EXPORTED:

        METHOD canHandle() INLINE ( .t. )
        METHOD handleRequest()

END CLASS


METHOD handleRequest() CLASS ConcreteHandler2

    if ::canHandle()

        ? 'Handled by Concrete Handler 2'

    else

        ? 'Cannot be handle by Handler 2'
        ::Handler:handleRequest()

    endif

return( nil )  


function main()

    Local oHandler1
    Local oHandler2

    oHandler1 := ConcreteHandler1():New()
    oHandler2 := ConcreteHandler2():New()

    oHandler1:setHandler( oHandler2 )
    oHandler1:handleRequest()

return( 0 )    