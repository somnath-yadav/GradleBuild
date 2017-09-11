@RestResource(urlMapping='/Contact/*')
global with sharing class EP_ContactRestResource {
    	@HttpGet
            global static Contact doGet() {
                RestRequest req = RestContext.request;
                RestResponse res = RestContext.response;
                String contactId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
                Contact result = [Select Id, FirstName, LastName, MailingCountry From Contact Where Id = :contactId];
                return result;
            }
    
    
    	@HttpPost
    		global static String doPost(String FirstName, String LastName, String Country){
                
                Contact con = new Contact();
                con.FirstName = FirstName;
                con.LastName = LastName;
                con.MailingCountry = Country;
                
                
                
                insert con;
                return con.Id;
        
    }

}