public class ChainedComparison
{
    Integer cholesterol = 127;

    public Boolean healthy()
    {
        return ( 200 > cholesterol && cholesterol > 60 );
    }
}
