#include 'hbclass.ch'


/*
 * Component
 * defines an interface for all objects in the composition
 * both the composite and the leaf nodes
*/

CLASS Component

    EXPORTED:

        METHOD getChild() VIRTUAL 
        METHOD add() VIRTUAL
        METHOD operation() VIRTUAL

END CLASS

/*
 * Composite
 * defines behavior of the components having children
 * and store child components
 */
CLASS Composite FROM Component

    EXPORTED:

        DATA aChildren AS Array INIT {}

        METHOD new() INLINE aSize( ::aChildren, 0 )
        METHOD getChild( nIndex ) INLINE ::aChildren[ nIndex ]
        METHOD add( oComponent ) INLINE aAdd( ::aChildren, oComponent )
        METHOD remove( nIndex ) INLINE hb_Adel( ::aChildren, nIndex ), aSize( ::aChildren, len( ::aChildren )- 1 )
        METHOD operation()

END CLASS

METHOD operation() CLASS Composite

    Local nI

    for nI := 1 to len( ::aChildren )

        ::aChildren[ nI ]:operation()

    next

return ( nil )


/*
 * Leaf
 * defines the behavior for the elements in the composition,
 * it has no children
*/
CLASS Leaf FROM Component

    EXPORTED:

        DATA nId AS Numeric INIT 0

        METHOD new( nId ) INLINE ::nId := nId, Self
        METHOD operation() 

END CLASS

METHOD operation() CLASS Leaf

    ? 'leaf ' + Str( ::nId, 3, 0 ) + ' operation'

return( nil )


function main()

    Local oComposite
    Local nI

    oComposite := Composite()

    for nI := 1 to 5

        oComposite:add( Leaf():new( nI ) )

    next

    oComposite:remove( 3 )
    oComposite:operation()


return( 0 )