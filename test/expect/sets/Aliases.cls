public class Aliases
{
    public void in()
    {
        Set<String> cats = new Set<String>{ 'Igor', 'Peggy Sue' };

        if ( cats.contains( someCat ) )
        {
            System.log('my cat');
        }

        for ( String cat : cats )
        {
            System.log( cat );
        }
}
