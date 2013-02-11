public class Foobar
{
    public List<Opportunity> getThings()
    {
        return [SELECT Id, Name, Amount, Custom_Field__c FROM Opportunity LIMIT 200];
    }
}
