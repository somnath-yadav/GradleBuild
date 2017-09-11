public with sharing class TestController1 {
    Account accnt;

    public PageReference Save() {
        update accnt;
        PageReference newPage = Page.MyFirstVFPage;
        newPage.setRedirect(true);
        newPage.getParameters().put('id',accnt.id);
        return newPage;
    }


    public Account getAccount() {
        
        accnt = [select id,name from Account where id=:ApexPages.CurrentPage().getParameters().get('id')];
        return accnt;
        
    }



           
}