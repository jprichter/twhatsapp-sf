public with sharing class TwhatsAppUtility {
    
    public static Twilio_Setting__mdt getSettings() {
        return [SELECT AccountSid__c, AuthToken__c, From__c, To__c 
                FROM Twilio_Setting__mdt 
                LIMIT 1];
    } 
        

    public static void insertMessage(String msg) {
        Twilio_Setting__mdt settings = getSettings();
        insert new TwhatsAppMessage__c(
            From__c = settings.From__c,
            To__c = settings.To__c,
            Body__c = msg
        );
    }

    public static void sendWhatsAppMessage(String msg) {

        Twilio_Setting__mdt settings = getSettings();
        
        String auth = EncodingUtil.base64Encode(Blob.valueOf(settings.AccountSid__c + ':' + settings.AuthToken__c));
        
        String body =   'From=' + EncodingUtil.urlEncode(settings.From__c, 'UTF-8');
        body +=         '&Body=' + EncodingUtil.urlEncode(msg, 'UTF-8');
        body +=         '&To=' + EncodingUtil.urlEncode(settings.To__c, 'UTF-8');
        
        String endpoint =   'https://api.twilio.com/2010-04-01/Accounts/';
        endpoint +=         settings.AccountSid__c;
        endpoint +=         '/Messages.json';
        
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);
        req.setMethod('POST');
        req.setHeader('Accept', 'application/json');
        req.setHeader('Accept-Charset', 'utf-8');
        req.setHeader('Authorization', 'Basic ' + auth);
        req.setBody(body);
    
        Http http = new Http();
    
        HTTPResponse res = http.send(req);
        
        if (res.getStatusCode() == 201) {
            insertMessage(msg);
        }
        
    }
}