public class Comprehensions
{
    public void doStuff()
    {
        List<Integer> countdown = new List<Integer>();

        for ( Integer num = 10; num >= 1; num-- )
        {
            countdown.add( num );
        }
    }

    public void maps()
    {
        Map<String, Integer> yearsOld = new Map<String, Integer>() {
            'max' => 10,
            'ida' => 9,
            'tim' => 11
        };

        List<String> ages = new List<String>();

        for ( String child : yearsOld.keySet() )
        {
            Integer age = yearsOld.get( child );
            ages.add( '' + child + ' is ' + age );
        }
    }
}
