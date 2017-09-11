Public Class Customer
{
    public String compName { get; set; }

        Public String getName()
        {
        return 'Customer';
        }
     public void save() 
         {
         Account a = new Account(Name = compName);
         system.debug('Test'+a.Name);
        
         insert a;
         }
     Public List<Account> getAccountList() 
         {
         return [select name from account];
         }
}