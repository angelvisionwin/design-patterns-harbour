#include 'hbclass.ch'

/*
 * Visitor
 * declares a Visit operation for each class of ConcreteElement
 * in the object structure
*/
CLASS Visitor

    EXPORTED:

        METHOD visitElementA( oElementA ) VIRTUAL
        METHOD visitElementB( oElementB ) VIRTUAL

END CLASS

/*
 * Concrete Visitors
 * implement each operation declared by Visitor, which implement
 * a fragment of the algorithm defined for the corresponding class
 * of object in the structure
*/
CLASS ConcreteVisitor1 FROM Visitor

    EXPORTED:

        METHOD visitElementA( oElementA ) 
        METHOD visitElementB( oElementB ) 

END CLASS

METHOD visitElementA( oElementA ) CLASS ConcreteVisitor1

    ? 'Concrete Visitor 1: Element A visited.'

return( nil )    

METHOD visitElementB( oElementB ) CLASS ConcreteVisitor1

    ? 'Concrete Visitor 1: Element B visited.'

return( nil )    


CLASS ConcreteVisitor2 FROM Visitor

    EXPORTED:

        METHOD visitElementA( oElementA ) 
        METHOD visitElementB( oElementB ) 

END CLASS

METHOD visitElementA( oElementA ) CLASS ConcreteVisitor2

    ? 'Concrete Visitor 2: Element A visited.'

return( nil )    

METHOD visitElementB( oElementB ) CLASS ConcreteVisitor2

    ? 'Concrete Visitor 2: Element B visited.'

return( nil ) 


/*
 * Element
 * defines an accept operation that takes a visitor as an argument
*/
CLASS Element

    EXPORTED:

        METHOD accept ( oVisitor ) VIRTUAL

END CLASS


/*
 * Concrete Elements
 * implement an accept operation that takes a visitor as an argument
*/
CLASS ConcreteElementA FROM Element

    EXPORTED:

        METHOD accept( oVisitor ) INLINE oVisitor:visitElementA( Self )

END CLASS


CLASS ConcreteElementB FROM Element

    EXPORTED:

        METHOD accept( oVisitor ) INLINE oVisitor:visitElementB( Self )

END CLASS


function main()

    Local oElementA
    Local oElementB
    Local oVisitor1
    Local oVisitor2

    oElementA := ConcreteElementA():new()
    oElementB := ConcreteElementB():new()

    oVisitor1 := ConcreteVisitor1():new()
    oVisitor2 := ConcreteVisitor2():new()

    oElementA:accept( oVisitor1 )
    oElementA:accept( oVisitor2 )

    oElementB:accept( oVisitor1 )
    oElementb:accept( oVisitor2 )

return( 0 )