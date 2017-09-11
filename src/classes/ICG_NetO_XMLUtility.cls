public with sharing class ICG_NetO_XMLUtility{
    //method with return type DOM.Document which accepts 4 arguments.    
    public static DOM.Document buildProspectLPIDRequest(String fName, String lname, String phone, string phoneType)
    {
        String TransactionIdentifier = '00';
        String MessageIdentifier = '00';
        String MessageSequenceIdentifier = '00';
        String ServiceStatus = 'Request';
        String OriginatingApplicationName = 'FUSION';
        String ServerIdentifier = 'nxkoner';
        String ComponentIdentifier = 'FUSION';
        String CustomerType = 'CONSUMER';
        String ChannelCode = 'OTHER';
        String ProductGroup = 'RETAIL';
        String SystemIdentifier = 'FUSION';
        
        DOM.Document doc = new DOM.Document();
        String soapNS = 'http://schemas.xmlsoap.org/soap/envelope/';
        String usb = 'http://soa.usbank.com/USBSOACoreComponentsLibrary_V_2_0';
        String mes = 'http://soa.usbank.com/MessageProspectServices_V_3_0';
               
        dom.XmlNode envelope = doc.createRootElement('Envelope', soapNS, 'soapenv');
        envelope.setNamespace('mes', mes);
        envelope.setNamespace('usb', usb);
        
        dom.XmlNode header = envelope.addChildElement('Header', soapNS, null);
        dom.XmlNode USBSOAPHeader = header.addChildElement('USBSOAPHeader_3',usb, null);
        USBSOAPHeader.addChildElement('TransactionIdentifier', usb, null).addTextNode(TransactionIdentifier);
        USBSOAPHeader.addChildElement('MessageIdentifier', usb, null).addTextNode(MessageIdentifier);
        USBSOAPHeader.addChildElement('MessageSubmissionDateTime', usb, null).
           addTextNode(System.now().format('yyyy-MM-dd\'T\'hh:mm:ss\'Z\''));
        USBSOAPHeader.addChildElement('MessageSequenceIdentifier', usb, null).
           addTextNode(MessageSequenceIdentifier);
        USBSOAPHeader.addChildElement('ServiceStatus', usb, null).
           addTextNode(ServiceStatus);  
        USBSOAPHeader.addChildElement('OriginatingApplicationName', usb, null).
           addTextNode(OriginatingApplicationName); 
        
        dom.XmlNode RequestorInfo = USBSOAPHeader.addChildElement('RequestorInfo', usb, null);
        RequestorInfo.addChildElement('ServerIdentifier',usb, null).addTextNode(ServerIdentifier);
        RequestorInfo.addChildElement('ComponentIdentifier', usb, null).addTextNode(ComponentIdentifier);
        
        dom.XmlNode body = envelope.addChildElement('Body', soapNS, null);
        dom.XmlNode LookupProspectReq = body.addChildElement('LookupProspectRequest',mes, null);
        dom.XmlNode Prospect = LookupProspectReq.addChildElement('Prospect',mes, null);
        dom.XmlNode CustType = Prospect.addChildElement('CustomerType', mes, null).
            addTextNode(CustomerType);
        dom.XmlNode Consumer = Prospect.addChildElement('Consumer', mes, null);
        dom.XmlNode ContactInfo = Prospect.addChildElement('ContactInformation', mes, null);
        dom.XmlNode PhoneInfo = ContactInfo.addChildElement('PhoneInformation', mes, null);
        dom.XmlNode EmailInfo = ContactInfo.addChildElement('EmailAddress', mes, null);
        dom.XmlNode ProspectEnv = LookupProspectReq.addChildElement('ProspectEnvironment',mes, null);
        
        Consumer.addChildElement('FirstName', mes, null).
           addTextNode(fName.trim());
        Consumer.addChildElement('LastName', mes, null).
           addTextNode(lName.trim());
        ProspectEnv.addChildElement('ChannelCode', mes, null).
           addTextNode(ChannelCode); 
        ProspectEnv.addChildElement('ProductGroup', mes, null).
           addTextNode(ProductGroup);
        ProspectEnv.addChildElement('SystemIdentifier', mes, null).
           addTextNode(SystemIdentifier); 
        System.debug('----------'+doc.toXmlString());
        
        Return doc;
    }
}