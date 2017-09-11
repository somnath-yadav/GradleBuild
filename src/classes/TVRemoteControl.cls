public class TVRemoteControl {
	//Volumn to be modified
	Integer Volume;
    //Constant for maximum volumn value
    static final Integer MAX_VOLUME = 50;
    
    //Constructor
    public TVRemoteControl (Integer v){
        //set initial volue for volume
        volume = v;
    }
    
    //Method1 to set volume at max volume
    public Integer increaseVolume(Integer amount){
        volume += amount;
        if (volume >MAX_VOLUME){
            volume = MAX_VOLUME;
        }
        return volume;
    }
    
    //Mehtod2 to set volume to 0
    
    public Integer decreaseVolume(Integer amount){
        volume -= amount;
        if (volume < 0){
            volume = 0;
        }
        return volume;
    }
    
    public static String getMenuOptions() {
        return 'AUDIO SETTINGS - VIDEO SETTINGS';             
    }
}