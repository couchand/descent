public class SwitchGenerate
{
    String favoriteLanguage = 'Sass';

    public void check()
    {
        if ( favoriteLanguage == 'Ruby' )
        {
            System.debug('Ruby is great');
        }
        else if ( favoriteLanguage == 'JavaScript' || favoriteLanguage == 'ActionScript' )
        {
            System.debug('Love making web apps');
        }
        else if ( favoriteLanguage == 'Descent' )
        {
            System.debug('Of course');
        }
        else
        {
            System.debug('I don\'t know that one');
        }
    }
}
