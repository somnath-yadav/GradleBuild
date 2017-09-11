public class wrapperClassController2 
{

    public List<cContact> contactList {get; set;}    
    public List<cContact> getContacts ()
    {
                if (contactList==null) 
                {
                contactList=new list<cContact>();
                for (Contact c: [select Id,Name,Email, Phone from Contact limit 10])
                    {
                    contactList.add(new cContact(c));
                    }
                }
            return contactList;
    }
                                  
                
    public PageReference processSelected()
    {
        return null;
    }
    
                
    public class cContact
    {
    public Contact con {get;set;}
    Public Boolean selected{get;set;}
        
        public cContact(Contact c)
        {
            con=c;
            selected=false;
        }
    }
}