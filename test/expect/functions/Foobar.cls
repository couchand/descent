public class Foobar
{
    public void doNothing()
    {
    }

    public Integer square( Integer x )
    {
        return x * x;
    }

    public Integer cube( Integer x )
    {
        return square(x) * x;
    }

    public Integer add( Integer a, Integer b )
    {
        return a + b;
    }

    public void log( String msg )
    {
        System.log( msg );
    }
}
