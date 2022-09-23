#include 'hbclass.ch'

/*
 * Target
 * defines specific interface that Client uses
*/
CLASS Target

    EXPORTED:

        METHOD request VIRTUAL

END CLASS


/*
 * Adaptee
 * defines an existing interface that needs adapting and thanks
 * to Adapter it will get calls that client makes on the Target
 *
*/
CLASS Adaptee

    EXPORTED:

        METHOD specificRequest

END CLASS


METHOD specificRequest CLASS Adaptee

    ? 'specific request'

return( nil )    


/*
 * Adapter
 * implements the Target interface and when it gets a method call it
 * delegates the call to a Adaptee
*/
CLASS Adapter FROM Target

    EXPORTED:

        METHOD request INLINE Adaptee():specificRequest

END CLASS


function main()

    Local oTarget

    oTarget := Adapter()

    oTarget:request()

return( 0 )    
