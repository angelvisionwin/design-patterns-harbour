#include 'hbclass.ch'

/*
 * Product A
 * products implement the same interface so that the classes can refer
 * to the interface not the concrete product
*/
CLASS ProductA

    EXPORTED:

        METHOD getName() VIRTUAL

END CLASS


/*
 * ConcreteProductAX and ConcreteProductAY
 * define objects to be created by concrete factory
*/
CLASS ConcreteProductAX FROM ProductA

    EXPORTED:

        METHOD getName() INLINE 'A-X'
    
END CLASS

CLASS ConcreteProductAY FROM ProductA

    EXPORTED:

        METHOD getName() INLINE 'A-Y'
    
END CLASS


/*
 * Product A
 * products implement the same interface so that the classes can refer
 * to the interface not the concrete product
*/
CLASS ProductB

    EXPORTED:

        METHOD getName() VIRTUAL

END CLASS


/*
 * ConcreteProductBX and ConcreteProductBY
 * same as previous concrete product classes
*/
CLASS ConcreteProductBX FROM ProductB

    EXPORTED:

        METHOD getName() INLINE 'B-X'
    
END CLASS

CLASS ConcreteProductBY FROM ProductB

    EXPORTED:

        METHOD getName() INLINE 'B-Y'
    
END CLASS


/*
 * Abstract Factory
 * provides an abstract interface for creating a family of products
*/
CLASS AbstractFactory 

    EXPORTED:

        METHOD createProductA() VIRTUAL
        METHOD createProductB() VIRTUAL

END CLASS


/*
 * Concrete Factory X and Y
 * each concrete factory create a family of products and client uses
 * one of these factories so it never has to instantiate a product object
*/
CLASS ConcreteFactoryX FROM AbstractFactory

    EXPORTED:

        METHOD createProductA() INLINE ConcreteProductAX():New()
        METHOD createProductB() INLINE ConcreteProductBX():New()

END CLASS

CLASS ConcreteFactoryY FROM AbstractFactory

    EXPORTED:

        METHOD createProductA() INLINE ConcreteProductAY():New()
        METHOD createProductB() INLINE ConcreteProductBY():New()

END CLASS


Function Main()

    Local oFactoryX 
    Local oFactoryY 

    oFactoryX := ConcreteFactoryX():New()
    ? 'Product: ' + oFactoryX:createProductA():getName()


    oFactoryY := ConcreteFactoryY():New()
    ? 'Product: ' + oFactoryY:createProductA():getName()


return( 0 )