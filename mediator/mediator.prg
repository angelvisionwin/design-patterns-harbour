#include 'hbclass.ch'

/*
 * Colleague classes
 * each colleague communicates with its mediator whenever
 * it would have otherwise communicated with another colleague
*/

CLASS Colleague

    EXPORTED:

        METHOD new( oMediator, nID )
        METHOD getID() INLINE ::nID
        METHOD send( cMsg ) VIRTUAL
        METHOD receive( cMsg ) VIRTUAL

    PROTECTED:

        DATA oMediator  AS Object  INIT nil
        DATA nID        AS Numeric INIT 0

END CLASS

METHOD new() CLASS Colleague

    ::oMediator := oMediator
    ::nId       := nID

return( self )


CLASS ConcreteColleague FROM Colleague

    EXPORTED:

        METHOD new( oMediator, nID ) 
        METHOD send( cMsg ) 
        METHOD receive( cMsg )


END CLASS


METHOD New( oMediator, nID ) CLASS ConcreteColleague

    ::oMediator := oMediator
    ::nId       := nID

return( self )



METHOD receive( cMsg ) CLASS ConcreteColleague

    ? 'Message ' + cMsg + ' received by Colleague ' + str( ::nId )

return( nil )


METHOD send( cMsg ) CLASS ConcreteColleague

    ? 'Message ' + cMsg + ' sent by Colleague ' + str( ::nId )
    ::oMediator:distribute( Self, cMsg )

return( nil )    


/*
 * Mediator
 * defines an interface for communicating with Colleague objects
*/
CLASS Mediator

    EXPORTED:

        METHOD add( oColleage ) VIRTUAL
        METHOD distribute( oSender, cMsg ) VIRTUAL

    PROTECTED:

        METHOD Mediator() VIRTUAL

END CLASS


/*
 * Concrete Mediator
 * implements cooperative behavior by coordinating Colleague objects
 * and knows its colleagues
*/
CLASS ConcreteMediator FROM Mediator

    EXPORTED:

        METHOD new()
        METHOD add( oColleague ) INLINE aAdd( ::aColleagues, oColleague )
        METHOD distribute( oSender, cMsg )
        //METHOD send( cMsg )

    PROTECTED:

        DATA aColleagues AS Array INIT {}

END CLASS


METHOD new() CLASS ConcreteMediator

    ::aColleagues := {}

return( self )


METHOD distribute( oSender, cMsg ) CLASS ConcreteMediator

    Local nI

    for nI := 1 to len( ::aColleagues )

        if ::aColleagues[ nI ]:getId() != oSender:getID()

            ::aColleagues[ nI ]:receive( cMsg )

        endif

    next

return( nil )


function main()

    Local oMediator
    Local oC1
    Local oC2
    Local oC3

    oMediator := ConcreteMediator():New()

    oC1 := ConcreteColleague():new( oMediator, 1 )
    oC2 := ConcreteColleague():new( oMediator, 2 )
    oC3 := ConcreteColleague():new( oMediator, 3 )

    oMediator:add( oC1 )
    oMediator:add( oC2 )
    oMediator:add( oC3 )

    oC1:send( 'Hi!' )
    oC3:send( 'Hello!' )

return( 0 )    