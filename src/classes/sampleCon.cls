public class sampleCon {
    

    //countries variable definition
    
    String[] countries = new String[]{}; 
    
    public pagereference test (){
        return null;
    }

    // Items method definition
    public List<SelectOption> getItems() {
        List<SelectOption> options = new List<SelectOption> ();
        options.add(new SelectOption('US','US'));
        options.add(new SelectOption('Canada','Canada'));

        return options;
    }


    
    //get and set for countries method

    public String[] getCountries() {
        return countries;
    }
    
    public void setCountries(String[] countries) {
        this.countries = countries;
    }
    
    //testing maps
    
    Account a1=new Account(Name='A1');
    map<sObject,integer> m=new map <sObject,integer> {a1=>1};
    
        //System.assertEquals(null, a1.Id);


    
}