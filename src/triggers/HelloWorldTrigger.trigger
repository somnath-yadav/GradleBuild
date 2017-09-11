trigger HelloWorldTrigger on Book__c (before insert)
{
    TriggerFactory.createHandler(Book__c.sObjectType);

}