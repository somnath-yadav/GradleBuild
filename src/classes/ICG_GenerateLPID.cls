public class ICG_GenerateLPID{
	public string LPID ;
    public HttpRequest req;
     
    public String retrieveLPID(String fname,String lname,String phone,String phonetype){ 
        Http h = new Http();
        req = new HttpRequest();
        req.setHeader('Content-Type', 'text/xml; charset=utf-8');
        req.setEndpoint('http://google.com');
        req.setMethod('POST');
        
        req.setBodyDocument( ICG_NetO_XMLUtility.buildProspectLPIDRequest(fname, lname, phone, phoneType));
        
        try{
        	HttpResponse res = h.send(req);
            System.debug('*********************Callout Response: '+res.getBody());
        }Catch(Exception ex){
            LPID = 'L-11222255';
        }
        System.debug('LPID is '+LPID);
        return LPID;
    }
}