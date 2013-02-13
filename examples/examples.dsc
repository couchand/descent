AccountServices
  ::getAccounts (ids) ->
    [select Id, Name from Account ids?(where Id  in ids)]

  ::getAccounts (opps) ->
    accountIds = (opp.AccountId for opp in opps);
    getAccounts accountIds

  ::PI = 3.14159




  public static final Decimal PI = 3.14...



  readable str foo



  public String foo
  {
    get;
    private set;
  }



Strategy < OpportunityLineItemModel



public class Strategy extends OpportunityLineItemModel
{



  run


  run();



  print ex.message

  System.debug( ex.getMessage() );



   message ex.message

  ApexPages.currentPage().getMessages().add( new ApexPages.Message( ex.getMessage() ) );


