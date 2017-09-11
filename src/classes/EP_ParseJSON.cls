/**
*@description: To parse JSON string from response and deserialize in Contact object
*/

public class EP_ParseJSON {
    public static void parseJSONString() {
        String jsonStr = '[' + '{  "customerID": "b006bd01-2a0b-4375-a00f-e2fffeff73c8",  "uid": "rajsh0241@gmail.com"}' + ']';
        
          
        // Deserialize the contacts from the JSON string.
        List<Contact> deserializedContact = (List<Contact>)JSON.deserialize(jsonStr, List<Contact>.class);
        
        Integer i=0;
        for (Contact deserializedCon :deserializedContact) {            
            //system.debug('deserializedContact:' + deserializedContact[i].firstName + ',' + deserializedContact[i].lastName  + ',' + deserializedContact[i].Order__c); 
            system.debug('deserlizedCon:' + deserializedCon.firstName + ',' + deserializedCon.lastName );
            //if(deserializedCon.Id='0039000001tYWaKAAW'){
            //    deserializedCon
            //}
            //String s = [SELECT Order__c FROM Contact WHERE deserializedCon.id='0039000001tYWaKAAW'].Order__c; //deserializedContact[i].id = deserializedCon.id LIMIT 1].Order__c;
            //deserializedCon.order__c = Order;
                
            
            //i++;
        }
       // update deserializedCon;
    }
}