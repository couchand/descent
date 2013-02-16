public class Foobar
{
    public Integer publicInstance
    {
        get
        {
            if ( publicInstance == null )

            {
                publicInstance = 1;
            }
            return publicInstance;
        }
        set;
    }

    public static String publicClass
    {
        get
        {
            if ( publicClass == null )
            {
                publicClass = 'foo';
            }
        }
    }

    public String publicGet
    {
        get
        {
            if ( publicGet == null )
            {
                publicGet = 'bar';
            }
            return publicGet;
        }
    }
}
