public class Basic
{
    public void eat( String food )
    {
        System.debug( 'eating ' + food );
    }

    public void menu( Integer num, String item )
    {
        System.debug( '' + num + '.) ' + item );
    }

    public void doStuff()
    {
        for ( String food : new List<String>{ 'toast', 'cheese', 'wine' } )
        {
            eat( food );
        }

        List<String> courses = new List<String>{ 'greens', 'caviar', 'truffles', 'roast', 'cake' };

        for ( Integer i = 0; i < courses.size(); i++ )
        {
            String dish = courses.get( i );
            menu( i + 1, dish );
        }

        List<String> foods = new List<String>{ 'broccoli', 'spinach', 'chocolate' }

        for ( String food : foods )
        {
            if ( food != 'chocolate' )
            {
                eat( food );
            }
        }
    }
}
