public class Basic
{
    public void doStuff()
    {
        for ( String food in ['toast', 'cheese', 'wine'] )
        {
            eat( food );
        }

        List<String> courses = new List<String>{ 'greens', 'caviar', 'truffles', 'roast', 'cake' };

        for ( Integer i = 0; i < courses.size(); i++ )
        {
            String dish = courses[i];
            menu( i + 1, dish );
        }

        List<String> foods = new List<String>{ 'broccoli', 'spinach', 'chocolate' }

        for ( String food in foods )
        {
            if ( food != 'chocolate' )
            {
                eat( food );
            }
        }
    }
}
