#include 'hbclass.ch'

/*
 * Product
 * the final object that will be created using Builder
 */
CLASS Product

    EXPORTED:

        METHOD makeA( cPart ) INLINE ::cPartA := cPart
        METHOD makeB( cPart ) INLINE ::cPartB := cPart
        METHOD makeC( cPart ) INLINE ::cPartC := cPart
        METHOD get() INLINE ::cPartA + ' ' + ::cPartB + ' ' + ::cPartC

    PROTECTED:

        DATA cPartA AS String INIT ''
        DATA cPartB AS String INIT ''
        DATA cPartC AS String INIT ''

END CLASS


/*
 * Builder
 * abstract interface for creating products
 */
CLASS Builder FROM Product

    EXPORTED:

        METHOD buildPartA() VIRTUAL
        METHOD buildPartB() VIRTUAL
        METHOD buildPartC() VIRTUAL

END CLASS

/*
 * Concrete Builder X and Y
 * create real products and stores them in the composite structure
 */
CLASS ConcreteBuilderX FROM Builder

    EXPORTED:

        METHOD buildPartA() INLINE ::Super:makeA( 'A-X' )
        METHOD buildPartB() INLINE ::Super:makeB( 'B-X' )
        METHOD buildPartC() INLINE ::Super:makeC( 'C-X' )

END CLASS

CLASS ConcreteBuilderY FROM Builder

    EXPORTED:

        METHOD buildPartA() INLINE ::Super:makeA( 'A-Y' )
        METHOD buildPartB() INLINE ::Super:makeB( 'B-Y' )
        METHOD buildPartC() INLINE ::Super:makeC( 'C-Y' )

END CLASS


/*
 * Director
 * responsible for managing the correct sequence of object creation
*/
CLASS Director

    EXPORTED:

        DATA oBuilder AS Object INIT nil

        METHOD New() 
        METHOD Set( oBuilder ) 
        METHOD Get() INLINE ::oBuilder:Get()
        METHOD Construct()

END CLASS

METHOD New() CLASS Director

    if hb_isobject( ::oBuilder )

        ::oBuilder := nil

    endif

Return( self )    

METHOD Set( oBuilder ) CLASS Director

    ::oBuilder := oBuilder 

Return( nil )

METHOD Construct() CLASS Director

    ::oBuilder:buildPartA()
    ::oBuilder:buildPartB()
    ::oBuilder:buildPartC()

Return( nil )    



FUNCTION Main

    //? ConcreteBuilderX():New():buildPartA()

    Local oDirector := Director():New()

    oDirector:Set( ConcreteBuilderX():New() )
    oDirector:Construct()

    ? '1st product parts : ' + oDirector:Get()

    oDirector:Set( ConcreteBuilderY():New() )
    oDirector:Construct()

    ? '2nd product parts : ' + oDirector:Get()

return( 0 )    