/**
*@author Somnath Yadav
*@date 04/01/2016
*@description Class test pass by value nature of non-primitive data types
*/

public with sharing class PassNonPrimitiveByValueExample {
    
	/**
	*@description It accepts a interger list containing tempeture
	*/
    public static void createTempHistory(){
    	List<Integer> fillMe = new List<Integer>();
    	reference(fillMe);
    	System.assertEquals(fillMe.size(), 5);
    	
    	
    	
    	/**
    	*@description It tries to modify list m
    	*/
    	List<Integer> createNew = new List<Integer>();
    	referenceNew(createNew);
    	System.assertEquals(createNew.size(), 0);
    }
    
    
    
    /**
    *@description It initializes list m with temp for last five days
    */
    public static void reference(List<Integer> m){
    	m.add(70);
    	m.add(75);
    	m.add(80);
    	m.add(85);
    	m.add(90);
    }
    
    /**
    *@description It tries to modify list m by resetting temp for last five days
    */    
    public static void referenceNew(List<Integer> m){
    	m = new List<Integer>{45,45,45,45,45};
    }   
    
}