/**
*@Author Somnath
*@Created 2-Apr-2016
*@Description This is a http callout on Contact create.
*/
public class EP_HttpCalloutWithAuth {

@future (Callout = true)
    
    public static void restCallout(String Id)
        {
        // Query contact record which triggered this callout
        Contact con = [Select firstname, lastname, MailingCountry from Contact where Id= :Id];
                                           
        Http h = new Http();
                
        HttpRequest req = new HttpRequest();
            req.setEndpoint('http://localhost:8080/cares/service/customers/1'); 
            req.setMethod('GET');
            
            /**
            String username = 'admin';
            String password = 'password';
            
            Blob headerValue = Blob.valueOf(username + ':' + password);
            String authorizationHeader = 'BASIC' + EncodingUtil.base64Encode(headerValue);
            req.setHeader('Authorization', authorizationHeader);
			*/              



        //Send the request, and return a response
        try{
            HttpResponse res = h.send(req);
            System.debug('Header: ' + req.getHeader('Authorization'));
            System.debug('Response body is:'  + res.getBody());
                         
           }catch(CalloutException e){
             System.debug('An exception occured: '+ e);
           }
        }

}