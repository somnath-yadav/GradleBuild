//All test methods in this class can access all data

@isTest
public class TestDataAccessClass {
	
    //this test access an existing class
    //It also creates and accesses a new account
    @isTest(SeeAllData = True)
    static void myTestMethod1(){
        //Query an existing account in the organization
        Account a = [Select Id, Name from Account where Name = 'Acme' Limit 1];
        System.assert(a != null);
        
        //Create a test account based on the required account
        Account testAccount = a.clone();
        testAccount.Name = 'Acme Test';
        insert testAccount;
        
        //Query the test account that was inserted
        Account testAccount2 = [Select Id, Name from Account where Name = 'Acme Test' Limit 1];
        System.assert(testAccount2 != null);
    }
}