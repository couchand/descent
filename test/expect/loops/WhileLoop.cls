public class WhileLoop
{
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

    public void doIt()
    {
        while ( true )
        {
            application.run();
        }
    }
}
