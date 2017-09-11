@isTest 
private class HelloWorldTestClass {
    static testMethod void validateHelloWorld() {
       Book__c b = new Book__c(Name='Behind the Cloud', Price__c=100);
       System.debug('Price before inserting new book: ' + b.Price__c);

       // Insert book       
       insert b;
       
       //Retrieve new book
       b = [Select Price__c from Book__c where Id = :b.Id];
       System.debug('Price after trigger is fired:' + b.Price__c);
       
       //Test that the trigger correctly updated the price
       System.assertEquals(90, b.Price__c);
       
       //Test execution context
       System.debug ('Execution context'+system.trigger.isExecuting);
       
       //Test trigger.new output
       System.debug ('Execution context'+system.trigger.new);
}
}