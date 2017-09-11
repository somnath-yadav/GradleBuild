//Correlating Records with Query Result
/*trigger Trigger_Test on Account (before delete) {
    for (Account a : [SELECT Contact__c from Account where Id IN :Trigger.oldmap.keyset()])
            {
                Trigger.oldmap.get(a.id).addError('Cant delete Account with Contact');
            }
     }
*/

trigger Trigger_Test on Account (before delete) {
    for (Account a : [SELECT Contact__c from Account where Id IN :Trigger.oldmap.keyset()])
            {
                Trigger.oldmap.get(a.id).addError('Cant delete Account with Contact');
            }
     }