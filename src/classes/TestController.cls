public with sharing class TestController {

    public PageReference save() {
        return null;
    }


    public Contact getContact() {
        return [select id,name from contact where id=:ApexPages.CurrentPage().getParameters().get('id')];
    }

    public Account getAccount(){
    return null;
    }
}