/* 
* File Name: ET_EmailUtility
* Description : Utility class used in all ET Operations
* Project/Case ID : ExactTarget
* Copyright : Cognizant Technology Solutions Corporation © Copyright 2013 
=========================== Modification Log ============================ 
Ver     Date         Author                              Modification 
0.1     19/12/2013   Cognizant Technology Solutions      Created.  
*/

public class ET_EmailUtility {

    /*This Method is to get all Email fields of Specified Object*/
    public static List<SelectOption> getObjectEmailFields(String objName){
        List<SelectOption> LstEmailFields = new List<SelectOption>();
        Map<String, Schema.SObjectField> fieldMap = Schema.getGlobalDescribe().get(objName).getDescribe().fields.getMap();
        
        for(String fieldName : fieldMap.keySet()){
            if(fieldMap.get(fieldName).getDescribe().getType() == Schema.DisplayType.Email){
                LstEmailFields.add(new SelectOption(fieldName,fieldMap.get(fieldName).getDescribe().getLabel()));
            }
        }
        
        system.debug('LstEmailFields >>>>>>> '+LstEmailFields);
        return LstEmailFields;
    }
    
    /*This method is to send Emails to all Campaign Members*/
    /*public static void sendEmailToCampaign(List<Id> LstCmpgnId, Map<String, String> MapOwners){
        Map<String, String> MapMails = new Map<String, String>();
        String sTemplateName= 'ExactTarget Sample Email';
        String subject = 'Campaign Promotional Email';
        String qry = 'select ContactId, Contact.Name, Contact.email,Contact.HasOptedOutOfEmail, LeadId, Lead.Name, Lead.email, Lead.HasOptedOutOfEmail from CampaignMember where CampaignId IN :LstCmpgnId';
    
        for(CampaignMember cm : Database.Query(qry)){
            if(cm.ContactId != null && cm.Contact.email != null && !cm.Contact.HasOptedOutOfEmail ){            
                MapMails.put(cm.ContactId, cm.Contact.email+'_'+cm.Contact.Name);
            }
            
            if(cm.LeadId != null && cm.Lead.email != null && !cm.Lead.HasOptedOutOfEmail){           
                    MapMails.put(cm.LeadId, cm.Lead.email+'_'+cm.Lead.Name);
            }                      
        }
        
        ET_SingleSend_ContHandler objEtss = new ET_SingleSend_ContHandler();
        objEtss.sendEmailToCampaign(LstCmpgnId, MapMails, MapOwners, sTemplateName, subject, System.now(), UserInfo.getuserId());
    }
    */
    /*This methos is to update Individual Email Result records based on Individual Link*/
   /* public static void updateIndivEmailResult(Set<Id> SetIndivERId, List<Id> LstIndivLinkId){
        Map<Id, String> MapERClicks = new Map<Id, String>();    
        List<ET4AE__IndividualEmailResult__c> LstERToUpdate;
        String strQry = 'Select sum(ET4AE__NumberOfTotalClicks__c) totalClicks, count(id) totalCount, ET4AE__Individual_Email_Result__c from ET4AE__IndividualLink__c where ET4AE__Individual_Email_Result__c IN : SetIndivERId';
        
        if(LstIndivLinkId.size() > 0){
            strQry+= ' and Id NOT IN : LstIndivLinkId';
        }
        strQry+= ' group by ET4AE__Individual_Email_Result__c';
        
       
        for(AggregateResult ar : Database.Query(strQry)){
            if(ar.get('totalClicks') != null)
                MapERClicks.put((Id)ar.get('ET4AE__Individual_Email_Result__c'), ar.get('totalClicks')+'-'+ar.get('totalCount'));
            else
                MapERClicks.put((Id)ar.get('ET4AE__Individual_Email_Result__c'), 0+'-'+ar.get('totalCount'));
        }
        
        if(MapERClicks.size()>0){
            LstERToUpdate = new List<ET4AE__IndividualEmailResult__c>();
            
            for(ET4AE__IndividualEmailResult__c er : [Select Id, ET4AE__NumberOfTotalClicks__c, ET4AE__NumberOfUniqueClicks__c from ET4AE__IndividualEmailResult__c where Id IN : MapERClicks.keySet()]){
                er.ET4AE__NumberOfTotalClicks__c = Integer.valueOf(MapERClicks.get(er.Id).split('-')[0]);
                er.ET4AE__NumberOfUniqueClicks__c = Integer.valueOf(MapERClicks.get(er.Id).split('-')[1]);
                LstERToUpdate.add(er);
            }
            
            if(LstERToUpdate.size()>0){
                try{
                    update LstERToUpdate;
                }catch(DMLException ex){
                    system.debug('Exception Occured while update Individual Email Result : '+ex.getMessage());
                    throw ex;
                }
            }
        }
    }*/
}