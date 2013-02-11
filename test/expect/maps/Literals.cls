public class Literals
{
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
