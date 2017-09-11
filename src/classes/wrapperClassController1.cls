public class wrapperClassController1 {

    public List<cContact> contactList {get; set;}     
    public List<cContact> getContacts (){
                return contactList;
      }
                public PageReference processSelected(){
        List<Contact> SelectedContacts=new List<Contact>();
        
        for(cContact cCon:getContacts()){
        if(cCon.Selected ==true){
        SelectedContacts.add(cCon.con);
        }
        }
        contactList=null;
        return null;
    }
                public class cContact{
                public Contact con {get;set;}
                Public Boolean selected{get;set;}
                
            public cContact(Contact c){
            con=c;
            selected=false;
            }
            }

  }