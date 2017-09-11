public with sharing class StatePicker {

    //Variable to store Country
    Public String Country {get;set;}
    
    //Method to populate country
    Public List<SelectOption> getCountrySelecetedList (){
        List<SelectOption> options = new List<SelectOption> ();
        options.add (new SelectOption (' ','--Select Option--'));
        
    //Find All Countries in the custom setting
        Map <String, Countries__c> MapCountries = Countries__c.getAll();  
    
    //Store country name
    //List<String> countryNames = new List<String>();
    //countryNames.addAll(Mapcountries.keySet());
    //countryNames.sort();

    
    //create Select Options.
        for (String countryname: Mapcountries.keySet()){
            Countries__c country=Mapcountries.get(countryname);
            options.add (new SelectOption (country.name,country.Country_Code__c));
        
        }
        return Options;
    
    }
}