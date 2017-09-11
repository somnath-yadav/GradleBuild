public class HttpCalloutSample 
{
    
    //Pass in the endpoint to be used using the string url
    public String getCalloutResponseContent(String url)
        {
        
        // Instantiate a new HTTP object
        Http h = new Http();
        
        // Instantiate a new HTTP request, specify the method (POST) as well as endpoint
        HttpRequest req = new HttpRequest();
        req.setEndpoint(url);
        req.setMethod('GET');
        
        
        
        //Send the request, and return a response
        HttpResponse res = h.send(req);
        return res.getBody();
       
        }
}