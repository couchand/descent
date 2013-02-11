public class Example
{
    Boolean ignition = false;
    Integer volume = 11;
    String band = 'Peter, Paul, and Mary';
    Boolean answer = true;
    Boolean winner;
    Car car = new Car();
    Integer limit = 60;
    String name;

    public void launch()
    {
    }

    public void letTheWildRumpusBegin()
    {
    }

    public void accelerate()
    {
    }

    public Integer pick()
    {
        return 42;
    }

    public String useful( String name )
    {
        return this.name = name;
    }

    public void doIt()
    {
        if ( ignition == true )
        {
            launch();
        }

        if ( band != 'SpinalTap' )
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

        Integer ref = pick();
        if ( ref == 47 || ref == 92 || ref == 13 )
        {
            winner = true;
        }

        System.debug( 'My name is ' + this.name );
    }

    public class SpinalTap
    {
    }

    public class Car
    {
        Integer speed;

        public Car()
        {
            this.speed = 15;
        }
    }
}
