@isTest
public class TestDataFactory {
    public static void createTestRecords(Integer numAccnts, Integer numContactsPerAccnt){
        List<Account> accnts = new List<Account>();
        
        for (Integer i=0;i<numAccnts;i++){
            Account a = new Account(Name='TestAccount'+i);
            accnts.add(a);
        }
        insert accnts;
                
         List<Contact> cons = new List<Contact>();
        for (Integer j=0; j<numAccnts; j++){
            Account accnt = accnts[j];
            //For each account just inserted, add contacts
            for (Integer k=numContactsPerAccnt*j;k<numContactsPerAccnt*(j+1);k++){
                cons.add(new Contact(firstname='Test'+k,lastname='Test'+k,AccountId=accnt.Id));
            }
       }
        insert cons;
     }
}