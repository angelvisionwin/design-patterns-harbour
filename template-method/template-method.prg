#include 'hbclass.ch'

/*
 * AbstractClass
 * implements a template method defining the skeleton of an algorithm
*/
CLASS AbstractClass

    EXPORTED:

        METHOD templateMethod() INLINE ::primitiveOperation1(), ::primitiveOperation2(), nil 

    PROTECTED:

        METHOD primitiveOperation1() VIRTUAL
        METHOD primitiveOperation2() VIRTUAL

END CLASS


/*
 * Concrete Class
 * implements the primitive operations to carry out specific steps
 * of the algorithm, there may be many Concrete classes, each implementing
 * the full set of the required operation
*/
CLASS ConcreteClass FROM AbstractClass

    PROTECTED:

        METHOD primitiveOperation1()
        METHOD primitiveOperation2()


END CLASS

METHOD primitiveOperation1() CLASS ConcreteClass

    ? 'Primitive operation 1'

return( nil )    

METHOD primitiveOperation2() CLASS ConcreteClass

    ? 'Primitive operation 2'

return( nil )    


function main()

    Local oTm

    oTm := ConcreteClass():new()
    oTm:templateMethod()

return( 0 )    