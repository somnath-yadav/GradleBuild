//Test class for VisibleSampleClass
@isTest
public class VisibleSampleClassTest {
	
    // This test method can access private members of another class
    // That are annotated with @TestVisible.
    static testmethod void test1(){
        VisibleSampleClass sample = new VisibleSampleClass();
        
        //access private member and update their values
        sample.recordNumber=100;
        sample.areaCode='501';
    
    
    	//access private innner class
    	VisibleSampleClass.Employee emp = new VisibleSampleClass.Employee('Somnath','555');
    
    	//call private method
    	String s = sample.privateMethod(emp);
    	
    	//verify result
    	System.assert(s.contains('501') && s.contains('Somnath') && s.contains('555'));
    }
    
    //This test method can throw private exception defined in another class
    static testmethod void test2(){
        //throw private exception
        try{
            throw new VisibleSampleClass.MyException('Throw from the test');
        } catch(VisibleSampleClass.MyException e) {
            //Handle exception
        }
     }
            static testmethod void test3(){
            //Access public method.
            //No @TestVisible is used.
            VisibleSampleClass sample = new VisibleSampleClass ();
            sample.publicMethod();
    }
}