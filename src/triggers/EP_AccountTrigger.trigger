trigger EP_AccountTrigger on Account (after insert,after update) {
    
    //NOT bulkified trigger though fine for POC purpose to create/update contact from UI
    
    Account[] cons = Trigger.new;
    
    //insert trigger will callout 'restCallout' and update customerID from response.
    If(trigger.isAfter && trigger.isInsert)  {
        EP_HttpCallout_Account.restCallout(Trigger.new[0].Id); 
    }
    
    //update trigger will callout 'restCalloutUpdate' and will not update anything from response

    If(trigger.isAfter && trigger.isUpdate)  {
        for (Account acc: Trigger.new) {
            Account oldAcc = Trigger.oldMap.get(acc.Id);
            //Check if CustomerID is blank which means it is inserted contact getting updated from response, further update is not needed
          System.debug('Check block-->'+string.isNotBlank(oldAcc.customer_id__c));
            if (string.isNotBlank(oldAcc.customer_id__c)){
                EP_HttpCallout_Account.restCalloutUpdate(Trigger.new[0].Id);  
                System.debug (Trigger.new[0].Id);
            }           
        }
    }   
}