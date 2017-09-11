trigger TestingTrigger on Account (after update) {
    	
    	//Set captures all keys in map
    	set<id> Ids = Trigger.oldMap.KeySet();
    
    	//Variable assingment
       	Contact[] con = [select lastname from Contact where AccountId in : Ids];
        
    	//Variable to capture no of contacts in list (con)
    	integer size = con.size();
        
    	for (integer i=0; i<size ; i++){
            con[i].lastname = 'TestContact3';
        	}
            update con;
}