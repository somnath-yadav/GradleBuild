public class MyVFController {

    Account account;

    public Account getAccount() {
        if (account == null)
        account = [select id, name from Account where id = :ApexPages.currentpage().getParameters().get('id')];
        return account;
    }
    
    
    public PageReference save1(){
        update account;
        return null;
    }

}