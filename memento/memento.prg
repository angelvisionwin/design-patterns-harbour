#include 'hbclass.ch'

/*
 * Memento
 * stores internal state of the Originator object and protects
 * against access by objects other than the originator
*/
CLASS Memento

    EXPORTED:

    PROTECTED:

        DATA nState AS Numeric INIT 0

        METHOD new( nState ) INLINE ::nState := nState, Self
        METHOD getState() INLINE ::nState

    
    // accessible only to Originator

    FRIEND CLASS Originator         

END CLASS


/*
 * Originator
 * creates a memento containing a snapshot of its current internal
 * state and uses the memento to restore its internal state
*/
CLASS Originator

    EXPORTED:

        METHOD setState( nState )
        METHOD getState() INLINE ::nState
        METHOD setMememento( oMemento ) INLINE ::nState := oMemento:getState()
        METHOD createMemento() INLINE Memento():new( ::nState )

    PROTECTED:

        DATA nState AS Numeric INIT 0

END CLASS

METHOD setState( nState ) CLASS Originator

    ? 'Set state to ' + Str( nState ) + '.'
    ::nState := nState

return( nil )


/*
 * CareTaker
 * is responsible for the memento's safe keeping
*/
CLASS CareTaker

    EXPORTED:

        METHOD new( oOriginator ) 
        METHOD save()
        METHOD undo()

    PROTECTED:

        DATA oOriginator AS Object INIT nil
        DATA aHistory AS Array INIT {}

END CLASS

METHOD new( oOriginator ) CLASS CareTaker

    ::oOriginator := oOriginator
    ::aHistory := {}

return( self )    

METHOD save() CLASS CareTaker

    ? 'Save state.'
    aAdd( ::aHistory, ::oOriginator:createMemento() )

return( nil )

METHOD undo() CLASS CareTaker

    Local oMemento

    if len( ::aHistory ) == 0

        ? 'Unable to undo state.'
        return ( nil )

    endif

    oMemento := ::aHistory[ Len( ::aHistory ) ]

    ::oOriginator:setMememento( oMemento )
    ? 'Undo state.'

    hb_Adel( ::aHistory, len( ::aHistory ), .t. )

return( nil )


function main()

    Local oOriginator 
    Local oCareTaker

    oOriginator := Originator():new()
    oCareTaker  := CareTaker():new( oOriginator )

    oOriginator:setState( 1 )
    oCareTaker:save()

    oOriginator:setState( 2 )
    oCareTaker:save()

    oOriginator:setState( 3 )
    oCareTaker:undo()

    ? 'Actual state is ' + str( oOriginator:getState() ) + '.'

    // Esto genera un error de violación de Scope por la cláusula FRIEND CLASS
    Memento():new()


return( 0 )