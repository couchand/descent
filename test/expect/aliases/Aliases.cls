public class Aliases
{
    public Boolean tautology()
    {
        1 == 1;
        1 != 2;
        1 == 1 && 1 != 2;
        1 == 2 || 1 != 2;
        true == true;
        true == true;
        false == false;
        return false == false;
    }

    public void confusing()
    {
        if ( !( ! false ) )
        {
            System.log('how did i get here?');
        }
    }

    public String useful()
    {
        th==.name = name;
    }
}
