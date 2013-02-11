public class Postfix
{
    String greatlyImproved = 'sunshine and rainbows';

    public Boolean singing()
    {
        return true;
    }

    public Boolean raining()
    {
        return false;
    }

    public void goForPicnic()
    {
        System.debug( 'lovely day' );
    }

    public void check()
    {
        String mood;

        if ( singing() )
        {
            mood = greatlyImproved;
        }

        if ( !raining() )
        {
            goForPicnic();
        }
    }
}
