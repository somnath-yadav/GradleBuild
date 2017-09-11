public class EmailTest{
    Public void Test(){
    	Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {'som2004@gmail.com'}; 

		mail.setToAddresses(toAddresses);
		
        mail.setSubject('This is test mail');
        
        mail.setPlainTextBody('This is ' + ' a test mail.');
        mail.setHtmlBody('This is<b> ' + '<p> </b>a test mail.</b></p>');

		Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
                
   }
}