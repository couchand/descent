public class Foobar
{
    {
        List<String> song = new List<String>{ 'do', 're', 'mi', 'fa', 'sol', 'la', 'ti', 'do' };

        Map<String, String> singers = new Map<String, String>{ 'Jagger' => 'Rock', 'Elvis' => 'Roll' };

        List<Integer> bitlist = new List<Integer>{ 1, 0, 1, 0, 0, 1, 1, 1, 0 };

        Map<String, Map<String, Object>> kids = new Map<String, Map<String, Object>>{
            'brother' => new Map<String, Object> {
                'name' => 'Max',
                'age' => 11
            },
            'sister' => new Map<String, Object> {
                'name' => 'Ida',
                'age' => 9
            }
        };
    }
}
