trigger EP_ContactTrigger on Contact (after insert,after update) {
    
    //NOT bulkified trigger though fine for POC purpose to create/update contact from UI
    
    Contact[] cons = Trigger.new;
  	
    //insert trigger will callout 'restCallout' and update customerID from response.
    If(trigger.isAfter && trigger.isInsert)  {
        EP_HttpCallout.restCallout(Trigger.new[0].Id); 
    }
    
    //update trigger will callout 'restCalloutUpdate' and will not update anything from response

    If(trigger.isAfter && trigger.isUpdate)  {
        for (Contact Con: Trigger.new) {
            Contact oldCon = Trigger.oldMap.get(Con.Id);
            //Check if CustomerID is blank which means it is inserted contact getting updated from response, further update is not needed
            if (string.isNotBlank(oldCon.customerID__c)){
                EP_HttpCallout.restCalloutUpdate(Trigger.new[0].Id);  
                System.debug (Trigger.new[0].Id);
            }           
		}
    }   
}