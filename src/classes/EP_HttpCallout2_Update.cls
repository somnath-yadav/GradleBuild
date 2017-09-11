global class EP_HttpCallout2_Update
{  
    @future (Callout = true)
    
    public static void restCallout(String Id,String OldCustId)
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
        if(con.Email!=null)        gen.writeStringField('uid', con.Email);
        if(con.Password__c!=null)  gen.writeStringField('password', con.Password__c);
        if(con.FirstName!=null)    gen.writeStringField('firstName', con.FirstName);
        if(con.LastName!=null)     gen.writeStringField('lastName', con.LastName);
        if(con.title!=null)        gen.writeStringField('titleCode', con.title);
        
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
            String jsonStr2 = '[{  "customerID": "b006bd01-2a0b-4375-a00f-e2fffeff73c8",  "uid": "rajsh0241@gmail.com"}]';
            //String jsonStr = res.getBody();
            
            UpdateContact conObj = UpdateContact.parse(jsonStr);
            
            /*   list<UpdateContact> uplist;
                 uplist.add(conObj);
                 ContactInfo newCon=(ContactInfo)JSON.deserializeUntyped(jsonStr); 
                 List<String> myList =(List<String>)System.JSON.deserialize(jsonStr , List<String>.class);*/
           
           /* <<Making Bulkify>>  
           
               List<JsonLead> jslist;
             jslist= (List<JsonLead >) System.JSON.deserialize(jsonStr2 , List<JsonLead >.class);   
             System.debug('Test Jsont List'+jslist);
             List<Contact> conlist=new List<Contact>();
             for(JsonLead jl: jslist){
             Contact c=new Contact();            
             c.id='0039000001tvh6Q';
             c.customerID__c =jl.customerID;            
             conlist.add(c);
             }
             If(OldCustId!=conObj.customerID)
             update conlist;
                */
                 
            
            
            con.customerID__c = conObj.customerID;  
            // Utility.isFutureUpdate = true;            
           If(OldCustId!=conObj.customerID)
              update con;
            
            // End of contact object update
            
            
        }catch(CalloutException e){
            System.debug('An exception occured: '+ e);
        }
    }
    
    public with sharing Class JsonLead {
          public String customerID{get;set;}
          public String uid {get;set;}
   }
    
}