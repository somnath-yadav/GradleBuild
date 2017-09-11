/* 
* File Name: ET_MockHttpCalloutHandler
* Description : Mock Test Class for Http Callouts
* Project/Case ID : ExactTarget
* Copyright : Cognizant Technology Solutions Corporation © Copyright 2013 
=========================== Modification Log ============================ 
Ver     Date         Author                              Modification 
0.1     31/01/2014   Cognizant Technology Solutions      Created.  
*/

@isTest
global class ET_MockHttpCalloutHandler implements HttpCalloutMock{

    global String strRes = '';
    // Implementing interface method
    global HTTPResponse respond(HTTPRequest req) {        
        // Create a fake response
        system.debug('REsponse >>>>>>>'+strRes);
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'text/xml');
        res.setBody(strRes);      
        res.setStatusCode(200);
        return res;
    }
}