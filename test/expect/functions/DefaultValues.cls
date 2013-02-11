public class DefaultValues
{
    public String fill( String container, String liquid )
    {
        if ( liquid == null )
        {
            liquid = 'coffee';
        }

        return 'Filling the #{container} with #{liquid}.';
}
