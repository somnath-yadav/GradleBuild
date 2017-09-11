@isTest
private class MyTestClass_Test {
    static testMethod void validateTestClass(){
        Book__c b=new Book__c(Name='Behind the Cloud',Price__c=100);
        system.debug('Price of the book before insert'+b.Price__c);
        
        //insert book
        insert b;
        
        //Retrieve the new book
        b=[Select Price__c from Book__c where ID=:b.Id];
        system.debug('price after trigger is executed'+b.Price__c);
        
        //Test that the trigger correctly updated the price
        system.assertEquals(90, b.Price__c);
    }
}