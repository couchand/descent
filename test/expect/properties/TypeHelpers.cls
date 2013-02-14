public class TypeHelpers
{
    public Integer counter
    {
        get;
        set;
    }

    public String name
    {
        get;
        set;
    }

    public Opportunity opp
    {
        get;
        set;
    }

    public String oppName
    {
        get
        {
            return opp.Name;
        }
    }
}
