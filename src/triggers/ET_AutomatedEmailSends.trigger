/*
*   This trigger will prepare the data for ET automated send and call the respective handler classes
*/
trigger ET_AutomatedEmailSends on Lead (after update) {
    Integer i= 0;

    Map<String,String> recordMap_CCProd = new Map<String,String>();
    Map<String,String> recordOwnerMap_CCProd = new Map<String,String>();
    
    //System.debug('ET_SingleSend_ContHandler.ET_RunTriggerFlag---'+ET_SingleSend_ContHandler.ET_RunTriggerFlag);
    //if(ET_SingleSend_ContHandler.ET_RunTriggerFlag){
        if(Trigger.isUpdate){
            for(Lead curr_ld : Trigger.new){
                // Workflow: icgSendBankBrandedCreditCardProductInfo
                //System.debug('--Send_CC_Prod_Info__c-'+curr_ld.Send_CC_Prod_Info__c);
                //if(Trigger.old[i].Send_CC_Prod_Info__c == false && curr_ld.Send_CC_Prod_Info__c){
                    System.debug('---Setting...  ');
                    recordMap_CCProd.put(curr_ld.id,curr_ld.Email);
                    recordOwnerMap_CCProd.put(curr_ld.id,curr_ld.ownerId);
                }
            }
            i++;
        }

        //if(recordMap_CCProd.size() > 0){
           // ET_SingleSend_ContHandler objEtss = new ET_SingleSend_ContHandler();
           // String sTemplateName = 'Bank Branded Credit Cards Product Info';
           // ET_Email_Template_Mapping__c templateDetObj = ET_Email_Template_Mapping__c.getInstance(sTemplateName);
            //System.debug('---Setting123...  ');
            //if(templateDetObj != null){
           // System.debug('---Setting666...  ');
                //String s_result = objEtss.sendEmail(recordMap_CCProd,recordOwnerMap_CCProd,'Bank Branded Credit Cards Product Info',templateDetObj.Subject__c,System.now(),Userinfo.getUserId());            
               // System.debug('---Setting 444...  ');
                //ET_SingleSend_ContHandler.ET_RunTriggerFlag =  true ;
            //}
       // }       
    //}
//}