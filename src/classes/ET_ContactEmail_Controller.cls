/* 
* File Name: ET_ContactEmail_Controller
* Description : Sends Advance/ Mass Mail to Contact email Ids 
* Project/Case ID : ExactTarget
* Copyright : Cognizant Technology Solutions Corporation © Copyright 2013 
=========================== Modification Log ============================ 
Ver     Date         Author                              Modification 
0.1     19/12/2013   Cognizant Technology Solutions      Created.  
*/ 

public class ET_ContactEmail_Controller {
    public String selectedEmail{get;set;}   
    public boolean isAllOk{get;set;}
    public boolean isRecordSelected{get;set;}
    private final Contact con;
    Map<String, String> MapContactEmail;
    Map<String, String> MapContactOwner;
    List<Id> LstConId;
    public List<String> LstNoEmailContact{get;set;}
    Boolean isMassMail;   
    String returnUrl;   
    
    public ET_ContactEmail_Controller(ApexPages.StandardController stdController) {
        MapContactEmail = new Map<String, String>();
        MapContactOwner = new Map<String, String>();
        LstConId = new List<Id>();
        LstNoEmailContact = new List<String>();
        isAllOk = true;
        isMassMail = false;
        this.con = (Contact)stdController.getRecord();
        LstConId.add(con.Id);
        returnUrl = '/'+con.Id;
        
        Contact cntct = [Select HasOptedOutOfEmail from Contact where Id =: con.Id];
        if(cntct.HasOptedOutOfEmail){
            isAllOk = false;
            ApexPages.addmessage(new ApexPages.Message(ApexPages.severity.Error, Label.ET_SingleOptOut_ErrorMsg));
        }
    }
    
    public ET_ContactEmail_Controller(ApexPages.StandardSetController stdSetController) {
        MapContactEmail = new Map<String, String>();
        MapContactOwner = new Map<String, String>();
        LstConId = new List<Id>();
        LstNoEmailContact = new List<String>();
        isAllOk = true;
        isRecordSelected = true;
        isMassMail = true;
        returnUrl = Apexpages.currentPage().getparameters().get('retURL');        
        String strCOI = Apexpages.currentPage().getparameters().get('COI');        
        
        for(Contact con : (List<Contact>)stdSetController.getSelected()){
            LstConId.add(con.Id);
        }
        
        if(LstConId.size() == 0 && strCOI == null){
            isAllOk = false;
            isRecordSelected = false;
            ApexPages.addmessage(new ApexPages.Message(ApexPages.severity.Error, Label.ET_MassEmail_ErrorMsg));
        }
        
        if(LstConId.size() == 0 && strCOI != null){
            String JSONLstId = Apexpages.currentPage().getparameters().get('ListContactId');
            returnUrl = Apexpages.currentPage().getparameters().get('COIRetUrl');        
            LstConId = (List<Id>)JSON.deserialize(JSONLstId, List<Id>.class);
        }
        
        if(LstConId.size()>0){
            for(Contact con : [Select HasOptedOutOfEmail from Contact where Id IN: LstConId and HasOptedOutOfEmail = true]){
                ApexPages.addmessage(new ApexPages.Message(ApexPages.severity.Warning, Label.ET_MassOptOut_ErrorMsg));
                break;
            }
        }
    }    

    public PageReference proceed() {
        if(LstNoEmailContact.size()>0)
            LstNoEmailContact.clear();
                    
        String qry = 'Select Id, Name, Owner.Name, Owner.email, '+selectedEmail+' from Contact where Id IN :LstConId and HasOptedOutOfEmail = false' ;
        for(Contact con : Database.Query(qry)){
            MapContactOwner.put(con.Id, con.Owner.email+'_'+con.Owner.Name);
            if(con.get(selectedEmail) != null){                                                                                    
                MapContactEmail.put(con.Id, con.get(selectedEmail)+'_'+con.Name);
            }else{
                //MapContactEmail.put(con.Id, '<Email Not Specified>'+'_'+con.Name);
                LstNoEmailContact.add(con.Name);
            }           
        }
        
        if(LstNoEmailContact.size()>0){
            String warnMsg = '';
            isAllOk = false;
            if(isMassMail){
                warnMsg = 'Following Contacts does not have email address for selected Email :'+LstNoEmailContact +'<br/> Click Ok to proceed or Cancel to select other Mail.'; 
            }else{
                warnMsg = 'Contact does not have email address for selected Email.<br/> Click Ok to proceed or Cancel to select other Email.';
            }
             
            ApexPages.addmessage(new ApexPages.Message(ApexPages.severity.WARNING, warnMsg));
            return null;
        }else{
            String JSONMapContactEmail = JSON.serialize(MapContactEmail);
            String JSONMapContactOwner = JSON.serialize(MapContactOwner);
            
            Pagereference pgRef = Page.ET_Custom_SendEmail;
            pgRef.getParameters().put('MapMail', JSONMapContactEmail);
            pgRef.getParameters().put('MapOwner', JSONMapContactOwner);
            pgRef.getparameters().put('objName','CONTACT');
            pgRef.getparameters().put('returnUrl', returnUrl);          
            pgRef.setRedirect(true);
            
            /*For ET_SingleSend_Controller, ET_SingleSend_ContHandler and ET_API_Webservice_DE Testing */
         /*   if(Test.isRunningTest()){
                Test.setCurrentPage(pgRef);
                ET_MockHttpCalloutHandler mock = new ET_MockHttpCalloutHandler();
                mock.strRes =  '<Envelope>'+
                                '<Body><Name>TestName</Name><Subject>TestName</Subject>'+
                                '</Body></Envelope>';     
                Test.setMock(HttpCalloutMock.class, mock);
                ET_SingleSend_Controller etCont = new ET_SingleSend_Controller();
                etCont.agreeOptIn = false;
                etCont.subject = '';
                etCont.taskObj.ActivityDate = System.now().Date();  
                etCont.FetchTemplates();
                etCont.sendEmail_SD();
                etCont.emailFrom = 'Record Owner';
                etCont.sendEmail_API();
                etCont.saveTemplate();
                etCont.agreeOptIn = true;
                etCont.sendEmail_API();
                etCont.goBack();
            }          
          */  
            return pgRef;               
        }
    }
        
    public Pagereference cancel(){
        isAllOk = true;
        return null;
    }    
    
    public PageReference okToProceed(){
        
        String JSONMapContactEmail = JSON.serialize(MapContactEmail);
        String JSONMapContactOwner = JSON.serialize(MapContactOwner);
        
        Pagereference pgRef = Page.ET_Custom_SendEmail;
        pgRef.getParameters().put('MapMail', JSONMapContactEmail);
        pgRef.getParameters().put('MapOwner', JSONMapContactOwner);
        pgRef.getparameters().put('objName','CONTACT');
        pgRef.getparameters().put('returnUrl', returnUrl);
        pgRef.setRedirect(true);
        
        /*For ET_SingleSend_Controller, ET_SingleSend_ContHandler and ET_API_Webservice_DE Testing */
       /* if(Test.isRunningTest()){
            Test.setCurrentPage(pgRef);
            ET_MockHttpCalloutHandler mock = new ET_MockHttpCalloutHandler();
            mock.strRes =  '<Envelope>'+
                            '<Body><Name>TestName</Name><Subject>TestName</Subject>'+
                            '</Body></Envelope>';     
            Test.setMock(HttpCalloutMock.class, mock);
            ET_SingleSend_Controller etCont = new ET_SingleSend_Controller();
            etCont.agreeOptIn = false;
            etCont.subject = '';
            etCont.taskObj.ActivityDate = System.now().Date();  
            etCont.FetchTemplates();
            etCont.sendEmail_SD();
            etCont.emailFrom = Userinfo.getUserId();
            etCont.sendEmail_API();
            etCont.saveTemplate();
            etCont.agreeOptIn = true;
            etCont.sendEmail_API();
            etCont.goBack();
        }       
        
        */
        return pgRef;       
    }

    public PageReference goBack(){
        PageReference pgRef = new PageReference(returnUrl);
        pgRef.setRedirect(true);
        
        return pgRef;
    }       
    
    public List<SelectOption>getEmailFields(){
        if(selectedEmail == null)
            selectedEmail = 'email';
        return ET_EmailUtility.getObjectEmailFields('Contact');
    }
  
}