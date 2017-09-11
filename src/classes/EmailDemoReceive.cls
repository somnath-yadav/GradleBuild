global class EmailDemoReceive implements Messaging.InboundEmailHandler {
        global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.Inboundenvelope envelope){
		
        Account account;
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        try {
            if ([select count() from Account where Name = :email.subject] == 0) {
                  account = new Account();
                  account.Name = email.subject;
                  insert account;

			} else {
  					account = [select Id from Account where Name = :email.subject];
				   }
        }
        catch (Exception e) {return null;}
        return result;   
        }
    }