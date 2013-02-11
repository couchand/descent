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
            System.debug('how did i get here?');
        }
    }

    public String useful()
    {
        this.name = name;
    }

    public void example()
    {
        Integer volume;
        Boolean winner;

        if ( ignition == true )
        {
          launch();
        }

        if ( band != SpinalTap )
        {
          volume = 10;
        }

        if ( answer != false )
        {
          letTheWildRumpusBegin();
        }

        if ( car.speed < limit )
        {
          accelerate();
        }

        if ( pick == 47 || pick == 92 || pick == 13 )
        {
          winner = true;
        }

        System.debug( inspect( 'My name is ' + this.name ) );
    }
}
