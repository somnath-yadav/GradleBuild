public class ET_SingleSendContent_Controller {


    public String getTemplateName() {
        return null;
    }

    public PageReference FetchTemplates() {
        this.showTemplateSelection=true;
        system.debug('+++'+showTemplateSelection);
        return null;
    }


    public Boolean isTemplate{get;set;}
    public String mailOption { get; set; }
    public List<SelectOption> sendMailOption {get;set;}
    public String TemplateName {get;set;}
    public boolean showTemplateSelection {get;set;}
    public boolean selectedFolder{get;set;}
    public List<SelectOption> LstFolder {get;set;}
    public List<SelectOption> TemplateList {get;set;}
    public Map<String,set<String>> MapFolderTemplate {get;set;}
    //Constructor
    public ET_SingleSendContent_Controller() {
    
    
    MapFolderTemplate=new Map<String,Set<String>>();
    
    if(sendMailOption==null){
        sendMailOption=new List<SelectOption>();
        sendMailOption.add(new SelectOption('Free Form Email','Free Form Email'));
        sendMailOption.add(new SelectOption('Use Email Template','Use Email Template'));
        }
        
    if (TemplateName==''||TemplateName==null) {
        this.TemplateName='Select Template';
        }
    }
    
    public PageReference setMailOption(){
        if(mailOption=='Free Form Email'){
            isTemplate=False;
            }
            else if(mailOption=='Use Email Template'){
            isTemplate=True;
            }
            system.debug('++'+isTemplate);
        return null;
        
       }
       
    public void selectTemplate(){
        TemplateList=new List<SelectOption>();
        /*if (MapFolderTemplate.containsKey(selectedFolder)){
            for (String TemplateName : MapFolderTemplate.get(selectedFolder) ){
                TemplateList.add(new SelectOption(TemplateName,TemplateName));
            }
        }*/
    }
       
       
    
}