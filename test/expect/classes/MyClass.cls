public class MyClass
{
    public String instanceProperty = 'foo';

    public static String classProperty = 'bar';

    public String instanceMethod()
    {
        return classMethod( instanceProperty );
    }

    public static String classMethod( str )
    {
        return str + classProperty;
    }
}
