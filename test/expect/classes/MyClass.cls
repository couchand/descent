public class MyClass
{
    public String instanceProperty = 'foo';

    public static String classProperty = 'bar';

    public static final Decimal CLASS_CONSTANT = 3.141592653;

    public String instanceMethod()
    {
        return classMethod( instanceProperty );
    }

    public static String classMethod( str )
    {
        return str + classProperty;
    }
}
