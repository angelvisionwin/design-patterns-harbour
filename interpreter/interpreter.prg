#include 'hbclass.ch'

/*
 * Context
 * contains information that's global to the interpreter
*/
CLASS Context

    EXPORTED:

        METHOD set( cKey, lValue ) INLINE ::aVars[ cKey ] := lValue
        METHOD get( cKey ) INLINE ::aVars[ cKey ]

    PROTECTED:

        DATA aVars AS Array INIT { => }

END CLASS

/*
 * Abstract Expression
 * declares an abstract Interpret operation that is common to all nodes
 * in the abstract syntax tree
*/
CLASS AbstractExpression

    EXPORTED:

        METHOD interpret( oContext ) INLINE ( .f. )

END CLASS


/*
 * Terminal Expression
 * implements an Interpret operation associated with terminal symbols
 * in the grammar (an instance is required for every terminal symbol
 * in a sentence)
*/
CLASS TerminalExpression FROM AbstractExpression

    EXPORTED:

        METHOD new( cKey ) INLINE ::cKey := cKey, Self
        METHOD interpret( oContext ) INLINE oContext:get( ::cKey )

    PROTECTED:

        DATA cKey AS String INIT ''

END CLASS

/*
 * Nonterminal Expression
 * implements an Interpret operation for nonterminal symbols
 * in the grammar (one such class is required for every rule in the grammar)
*/
CLASS NonterminalExpression FROM AbstractExpression

    EXPORTED:

        METHOD new( oLeft, oRight ) INLINE ::oLop := oLeft, ::oRop := oRight, Self
        METHOD interpret( oContext ) INLINE ::oLop:interpret( oContext ) .AND. ::oRop:interpret( oContext )

    PROTECTED:

        DATA oLop AS Object INIT nil
        DATA oRop AS Object INIT nil

END CLASS


function main()

  // An example of very simple expression tree
  // that corresponds to expression (A AND B)

  Local A, B, C, exp, exp2
  Local oContext

  A := TerminalExpression():new( 'A' )
  B := TerminalExpression():new( 'B')
  C := TerminalExpression():new( 'C')
  exp := NonterminalExpression():New( A, B )
  exp2 := NonterminalExpression():New( A, C )

  oContext := Context():New()
  oContext:set( 'A', .t. )
  oContext:set( 'B', .f. )
  oContext:set( 'C', .t. )

  ? hb_ValToStr( oContext:get( 'A' ) ) + ' AND ' + hb_ValToStr( oContext:get( 'B' ) ) + ' = ' + hb_ValToStr( exp:interpret( oContext ) )
  ? hb_ValToStr( oContext:get( 'A' ) ) + ' AND ' + hb_ValToStr( oContext:get( 'C' ) ) + ' = ' + hb_ValToStr( exp2:interpret( oContext ) )

return( 0 )  