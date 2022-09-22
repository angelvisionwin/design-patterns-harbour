#include 'hbclass.ch'

CLASS Singleton

    EXPORTED :
    
        CLASSDATA oInstance    AS Object  INIT nil

        METHOD get()
        METHOD tell()
        METHOD restart()


END CLASS


METHOD get() CLASS Singleton

    if hb_isnil( ::oInstance )

        ::oInstance := Self

    endif

return( ::oInstance )    


METHOD restart() CLASS Singleton

    if hb_isobject( ::oInstance )

        ::oInstance := nil

    endif

return( nil )


METHOD tell() CLASS Singleton

    ? 'This is Singleton'

retur( nil )    


Function Main()

    Local oSingleton

    Singleton():New():get():tell()
    Singleton():restart()

return( 0 )