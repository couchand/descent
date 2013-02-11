public class WhileLoop
{
    Boolean studyingEconomics = true;
    Integer supply = 5;
    Integer demand = 4;

    public Integer buy()
    {
        return --supply;
    }

    public Integer sell()
    {
        return --demand;
    }

    public void econ101()
    {
        if ( this.studyingEconomics )
        {
            while ( supply > demand )
            {
                buy();
            }
            while ( !( supply > demand ) )
            {
                sell();
            }
        }
    }

    public void nurseryRhyme()
    {
        Integer num = 6;
        List<String> lyrics = new List<String>();

        while ( num -= 1 )
        {
            lyrics.add( '' + num + 'little monkeys, jumping on the bed.    One fell out and bumped his head.' );
        }
    }

    public void purgatory()
    {
        while ( true )
        {
            econ101();
        }
    }
}
