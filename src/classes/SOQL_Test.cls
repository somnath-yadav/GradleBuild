public class SOQL_Test{
    public void Test(){
        /*List<Account> aa = [Select Id, Name from Account where id='0019000000OZEAS'];
        //List<List<SObject>> searchList = [FIND 'test*' IN ALL FIELDS RETURNING Account (Id, Name), Contact];
        insert new Account(Name = 'Singha');
		Account acc = [SELECT Id FROM Account WHERE Name = 'Singha' LIMIT 1];
		string name = [SELECT name FROM Account WHERE Name = 'Singha' LIMIT 1].name;
        */
        Account a = new Account(Name = 'Acme');
		insert a; 
        Contact c = new Contact(LastName = 'Weissman');
		c.AccountId = a.Id;
		insert c;
		c = [SELECT Account.Name FROM Contact WHERE Id = :c.Id];
        system.debug('>>'+ c);
    }
}