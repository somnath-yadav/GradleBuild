global class EP_HttpCallout
{  
    // POST method which will send customer infomation and update 'CustomerID' from response
    @future (Callout = true)    
    public static void restCallout(String Id)
        {
        // Query contact record which triggered this callout
        Contact con = [Select firstname, lastname, MailingCountry, Email, Password__c, Title, customerID__c from Contact where Id= :Id];
            
                          
        Http h = new Http();
                
        HttpRequest req = new HttpRequest();
        req.setHeader('Content-Type', 'application/json'); 
        
        req.setEndpoint('callout:EPEndPoint'); //Change EndPoint in NamedCredentials
        req.setMethod('POST');
            
                    JSONGenerator gen = JSON.createGenerator(true);
                                      
                    gen.writeStartObject();
                    gen.writeStringField('uid', con.Email);
                    gen.writeStringField('password', con.Password__c);
                    gen.writeStringField('firstName', con.FirstName);
                    gen.writeStringField('lastName', con.LastName);
                    gen.writeStringField('titleCode', con.title);
                        
                    gen.writeEndObject();
                    
                    String JSONBody = gen.getAsString();
                    System.debug('JSONBody: ' + JSONBody);
            
         req.setBody(JSONBody);
         System.debug('Body: '+ req.getBody());
                    
        // Send the request, and return a response
        try{
            HttpResponse res = h.send(req);
            System.debug('Response status is:'  + res.getStatus());
            System.debug('Response body is:' + res.getBody());
            
            // Update contact object using customer Id from response JSON
          
            String jsonStr = '{  "customerID": "b006bd01-2a0b-4375-a00f-e2fffeff73c8",  "uid": "rajsh0241@gmail.com"}';
            //String jsonStr = res.getBody();
            
            UpdateContact conObj = UpdateContact.parse(jsonStr);
            con.customerID__c = conObj.customerID;
            update con;
            
            // End of contact object update
            
                         
           }catch(CalloutException e){
             System.debug('An exception occured: '+ e);
           }
        }
    
    
    
     // PUT method which will send customer infomation and update 'CustomerID' from response
     @future (Callout = true)
     public static void restCalloutUpdate(String Id)
        {
        // Query contact record which triggered this callout
        Contact con = [Select firstname, lastname, MailingCountry, Email, Password__c, Title, customerID__c from Contact where Id= :Id];
            
                          
        Http h = new Http();
                
        HttpRequest req = new HttpRequest();
        req.setHeader('Content-Type', 'application/json'); 
        
        req.setEndpoint('callout:EPEndPoint'); //Change EndPoint in NamedCredentials
        req.setMethod('PUT');
            
                    JSONGenerator gen = JSON.createGenerator(true);
                                      
                    gen.writeStartObject();
                    gen.writeStringField('uid', con.Email);
                    gen.writeStringField('password', con.Password__c);
                    gen.writeStringField('firstName', con.FirstName);
                    gen.writeStringField('lastName', con.LastName);
                    gen.writeStringField('titleCode', con.title);
                        
                    gen.writeEndObject();
                    
                    String JSONBody = gen.getAsString();
                    System.debug('JSONBody: ' + JSONBody);
            
         req.setBody(JSONBody);
         System.debug('Body: '+ req.getBody());
                    
        // Send the request, and return a response
        try{
            HttpResponse res = h.send(req);
            System.debug('Response status is:'  + res.getStatus());
            System.debug('Response body is:' + res.getBody());
                                   
           }catch(CalloutException e){
             System.debug('An exception occured: '+ e);
           }
        }
}