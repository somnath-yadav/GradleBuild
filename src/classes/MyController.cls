public class MyController {

    Account account;
    
    public PageReference save(){
        update account;
        system.debug('New account value : '+account.Name);
    PageReference SecondPage=Page.MySecondPage;  //Assigning MySecondPage to SecondPage var.
    SecondPage.setRedirect(true); //navigation
    SecondPage.getParameters().put('id',account.id);//Maintains id reference after navigation
    Return SecondPage;
     }
    
    public string getName() {
        return 'MyController';
        
     }
    
    
           
    public Account getAccount(){
        if (account==null)
            account=[select id,name from Account where id=:ApexPages.currentPage().getParameters().get ('id')];
            
    return account;
      
    }
    
}