/**
   @Author:Somnath
   @name:BookHandler
   @CreateDate:12/02/2016
   @Description:Trigger Handler for the Book__c SObject. This class implements the ITrigger interface to help ensure the trigger code is bulkified and all in one place.
   @Version <2.0>
*/



public with sharing class BookHandler implements ITrigger {
    //constructor to initialize
    //Comment to test change in code
    public BookHandler()
    {
        
    }
    
    
    public void bulkBefore()
    {
    }
    
    public void bulkAfter()
    {
    }
    
    public void beforeInsert(SObject so)
    {
        //cast Sobject to a Book
        Book__c Book = (Book__c)so;
        
        Book.price__c*=0.9;
      
     
    }
        
    
    
    public void beforeUpdate(SObject oldSo, SObject so)
    {
    }
    
    public void beforeDelete(SObject so)
    {
    }
    
    public void afterInsert(SObject so)
    {
    }
    
    public void afterUpdate(SObject oldSo, SObject so)
    {
    }
    
    public void afterDelete(SObject so)
    {
    }
    
    public void andFinally()
    {
    }
    
}