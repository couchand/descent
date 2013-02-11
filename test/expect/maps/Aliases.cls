public class Aliases
{
    public void in()
    {
        Map<String, String> catColors = new Map<String, String>{ 'Igor': 'black', 'Peggy Sue': 'tortiseshell' };

        if ( catColors.containsKey( someCat ) )
        {
            System.debug('my cat');
        }

        for ( String cat : catColors.keySet() )
        {
            System.debug( cat + ' is ' + catColors[cat] );
        }
    }
}
