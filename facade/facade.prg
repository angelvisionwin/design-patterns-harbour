#include 'hbclass.ch'

/*
 * Subsystems
 * implement more complex subsystem functionality
 * and have no knowledge of the facade
*/
CLASS SubsystemA

    EXPORTED:

        METHOD suboperation()

END CLASS

METHOD suboperation() CLASS SubsystemA

    ? 'Subsystem A method'

return( nil )


CLASS SubsystemB

    EXPORTED:

        METHOD suboperation()

END CLASS

METHOD suboperation() CLASS SubsystemB

    ? 'Subsystem B method'

return( nil )


CLASS SubsystemC

    EXPORTED:

        METHOD suboperation()

END CLASS

METHOD suboperation() CLASS SubsystemC

    ? 'Subsystem C method'

return( nil )


/*
 * Facade
 * delegates client requests to appropriate subsystem object
 * and unified interface that is easier to use
*/
CLASS Facade FROM SubsystemA, SubsystemB, SubsystemC

    EXPORTED:

        METHOD operation1() INLINE ::SubsystemA:suboperation(), ::SubsystemB:suboperation()
        METHOD operation2() INLINE ::SubsystemC:suboperation()

END CLASS


function main()

    Local oFacade

    oFacade := Facade():New()

    oFacade:operation1()
    oFacade:operation2()
    

return( 0 )