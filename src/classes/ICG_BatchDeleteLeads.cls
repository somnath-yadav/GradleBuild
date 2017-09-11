global class ICG_BatchDeleteLeads implements  Database.Batchable<sObject>{
		global string q = 'Select Id from Account where name=\'Test1\' limit 1';
    //Start
    global database.QueryLocator start(database.BatchableContext BC){
    	return database.getQueryLocator(q);}
	//Execute
    global void Execute (database.BatchableContext BC,List<Account> scope){
        system.debug('++'+q);
    	
        for(Account a :scope){ 
           a.Name = 'Test2'; 
           System.assertEquals('Test1', a.Name);
        } 
        
      }
    //Finish
    global void finish (database.BatchableContext BC){
    	
    }

}