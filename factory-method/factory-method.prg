#include 'hbclass.ch'


/*
 * Product
 * products implement the same interface so that the classes can refer
 * to the interface not the concrete product
*/
CLASS Product

    EXPORTED:

        METHOD getName() VIRTUAL

END CLASS


/*
 * Concrete Product
 * define product to be created
*/
CLASS ConcreteProductA FROM Product

    EXPORTED:

        METHOD getName() INLINE 'type A'

END CLASS


/*
 * Concrete Product
 * define product to be created
*/
CLASS ConcreteProductB FROM Product

    EXPORTED:

        METHOD getName() INLINE 'type B'

END CLASS


/*
 * Creator
 * contains the implementation for all of the methods
 * to manipulate products except for the factory method
*/
CLASS Creator

    EXPORTED:

        METHOD CreateProductA() VIRTUAL
        METHOD CreateProductB() VIRTUAL
        METHOD removeProduct() VIRTUAL

END CLASS


/*
 * Concrete Creator
 * implements factory method that is responsible for creating
 * one or more concrete products ie. it is class that has
 * the knowledge of how to create the products
*/
CLASS ConcreteCreator FROM Creator

    EXPORTED:

        METHOD createProductA() INLINE ConcreteProductA():New()
        METHOD createProductB() INLINE ConcreteProductB():New()

        METHOD removeProduct( oProduct ) INLINE ::Super:removeProduct()

END CLASS


Function Main()

    Local oCreator
    Local oProduct1
    Local oProduct2

    oCreator := ConcreteCreator():New()

    oProduct1 := oCreator:createProductA()
    ? 'Product: ' + oProduct1:getName()
    oCreator:removeProduct( oProduct1 )

    oProduct2 := oCreator:createProductB()
    ? 'Product: ' + oProduct2:getName()
    oCreator:removeProduct( oProduct2 )


return( 0 )