public class Aliases
{
    public Boolean tautology()
    {
        if ( 1 == 1 && 1 != 2 )
        {
            if ( 1 == 2 || 1 != 2 )
            {
                if ( true == true && true is true )
                {
                    if ( false == false && false == false )
                    {
                        System.debug( 'whew' );
                    }
                }
            }
        }
    }

    public void confusing()
    {
        if ( !( ! false ) )
        {
            System.debug( 'how did i get here?' );
        }

        if ( !( ! false ) )
        {
            System.debug( 'same question' );
        }
    }
}
