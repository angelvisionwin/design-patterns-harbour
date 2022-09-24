#include 'hbclass.ch'

/*
 * Subject
 * defines the common interface for RealSubject and Proxy
 * so that a Proxy can be used anywhere a RealSubject is expected
*/
CLASS Subject

    EXPORTED:

        METHOD request() VIRTUAL

END CLASS


/*
 * Real Subject
 * defines the real object that the proxy represents
 */
CLASS RealSubject

    EXPORTED:

        METHOD request()

END CLASS

METHOD request() CLASS RealSubject

    ? 'Real Subject request'

return( nil )


/*
 * Proxy
 * maintains a reference that lets the proxy access the real subject
 */
CLASS Proxy FROM Subject

    EXPORTED:

        METHOD new()
        METHOD request()

    PROTECTED:
    
        DATA oSubject AS Object INIT nil

END CLASS

METHOD new() CLASS Proxy

    ::oSubject := RealSubject():New()

return( self )

METHOD request() CLASS Proxy

    ::oSubject:request()

return( nil )


function main()

    Local oProxy

    oProxy := Proxy():New()
    oProxy:request()

return( 0 )