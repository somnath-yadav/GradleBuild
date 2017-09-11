Public class AccountUtility{
    Public static void accountProcessing(){
        try{
            insertAccount();
        }catch (MyException me){
            System.debug('Message'+me.getMessage());
        }
    }


Public static void insertAccount(){
    try {
        Account a = new Account();
    	insert a;
   		} catch(DmlException e) {
    throw new MyException ('Account insert failed');
		}
	}//insertAccount method ends
}//AccountUtility class body ends