public class TestJSONParse {	

	public void parseJSONString() {

	String jsonstr = '{"invoiceList":[' +
        '{"totalPrice":5.5,"statementDate":"2011-10-04T16:58:54.858Z","lineItems":[' +  '{"UnitPrice":1.0,"Quantity":5.0,"ProductName":"Pencil"},' +            '{"UnitPrice":0.5,"Quantity":1.0,"ProductName":"Eraser"}],' +
                '"invoiceNumber":1},' +
        '{"totalPrice":11.5,"statementDate":"2011-10-04T16:58:54.858Z","lineItems":[' +            '{"UnitPrice":6.0,"Quantity":1.0,"ProductName":"Notebook"},' +            '{"UnitPrice":2.5,"Quantity":1.0,"ProductName":"Ruler"},' +            '{"UnitPrice":1.5,"Quantity":2.0,"ProductName":"Pen"}],"invoiceNumber":2}' +']}';


	//Parse entire JSON response
	JSONParser parser = JSON.createParser(jsonstr);
	While (parser.nextToken() != Null){
		
		//Start at the array of invoices.
        if(parser.getCurrentToken() == JSONToken.START_ARRAY){
            While (parser.nextToken() != Null){
                if(parser.getCurrentToken() == JSONToken.START_OBJECT){
                    Invoice inv = (Invoice)parser.readValueAs(Invoice.class);
                    String s = JSON.serializePretty(inv);
                    
                    parser.skipChildren();
                	}
                
            	}
        	}
		}
	}
}