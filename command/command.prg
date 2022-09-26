#include 'hbclass.ch'


/*
 * Receiver
 * knows how to perform the operations associated
 * with carrying out a request
*/
CLASS Receiver

    EXPORTED:

        METHOD action()

END CLASS

METHOD action() CLASS Receiver

    ? 'Receiver: execute action'

return( nil )


/*
 * Command
 * declares an interface for all commands
*/
CLASS Command

    EXPORTED:

        METHOD execute() VIRTUAL

END CLASS


/*
 * Concrete Command
 * implements execute by invoking the corresponding
 * operation(s) on Receiver
*/
CLASS ConcreteCommand FROM Command

    EXPORTED:

        METHOD new( oReceiver ) INLINE ::oReceiver := oReceiver, Self
        METHOD execute() INLINE ::oReceiver:action()

    PROTECTED:

        DATA oReceiver AS Object INIT nil

END CLASS


/*
 * Invoker
 * asks the command to carry out the request
*/
CLASS Invoker

    EXPORTED:

        METHOD set( oCommand ) INLINE ::oCommand := oCommand
        METHOD confirm() 

    PROTECTED:

        DATA oCommand AS Object INIT nil

END CLASS

METHOD confirm()

    if hb_isobject( ::oCommand )

        ::oCommand:execute()
    
    endif

return( nil )    


function main()

    Local oCommand
    Local oInvoker

    oCommand := ConcreteCommand():New( Receiver():new() )
    oInvoker := Invoker():new()

    oInvoker:set( oCommand )
    oInvoker:confirm()

return( 0 )    