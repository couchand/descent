public class Foobar
{
    public static List<Opportunity> getThings()
    {
        return [SELECT Id, Name, Amount, Custom_Field__c FROM Opportunity LIMIT 200];
    }
}
