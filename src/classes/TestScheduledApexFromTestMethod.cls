global class TestScheduledApexFromTestMethod implements Schedulable{
    //This test runs a sheduled job at midnight Sept. 3rd 2022
    Public static String CRON_EXP='0 0 0 3 9 ? 2022';
    
    global void execute(SchedulableContext ctx){
    CronTrigger ct=[SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE Id = :ctx.getTriggerId()];

        
        system.assertEquals(CRON_EXP, ct.CronExpression);
        system.assertEquals(0,ct.TimesTriggered);
    
		Account a=[Select Id, Name from Account Where Name='testScheduledApexFromTestMethod'];
        a.name = 'testScheduledApexFromTestMethodUpdated';
		update a;
        
    }

}