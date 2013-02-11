public class Slice
{
    public void doIt()
    {
        List<Integer> numbers = new List<Integer>{ 1, 2, 3, 4, 5, 6, 7, 8, 9 };

        List<Integer> start = new List<Integer>();
        for ( Integer i = 0; i <= 2; i++ )
        {
            start.add( numbers.get( i ) );
        }

        List<Integer> middle = new List<Integer>();
        for ( Integer i = 3; i < 6; i++ )
        {
            middle.add( numbers.get( i ) );
        }

        List<Integer> end = new List<Integer>();
        for ( Integer i = 6; i < numbers.size() i++ )
        {
            end.add( numbers.get( i ) );
        }

        List<Integer> copy = new List<Integer>();
        for ( Integer i = 0; i < numbers.size(); i++ )
        {
            copy.add( numbers.get( i ) );
        }
    }
    public void replaceIt()
    {
        List<Integer> numbers = new List<Integer>{ 1, 2, 3, 4, 5, 6, 7, 8, 9 };

        List<Integer> ref = new List<Integer>{ -3, -4, -5, -6 };
        for ( Integer i = 3; i < 6; i++ )
        {
            Integer j = i - 3;
            numbers[i] = ref[j];
        }
    }
}
