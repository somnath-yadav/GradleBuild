@isTest
Class TVRemoteControlTest {
    @isTest static void testVolumnincreaseeeeeee(){
        TVRemoteControl rc = new TVRemoteControl(10);
        Integer newVolume = rc.increaseVolume(15);
        System.assertEquals(40, newVolume);
    }
    
    @isTest static void testVVolumedecreasing(){
        TVRemoteControl rc = new TVRemoteControl(10);
        Integer newVolume = rc.decreaseVolume(5);
        System.assertEquals(5, newVolume);
    }
    
    @isTest static void testMenuoptions(){
        String menu = TVRemoteControl.getMenuOptions();
        System.assertEquals('AUDIO SETTINGS - VIDEO SETTINGS', menu);
    }
}