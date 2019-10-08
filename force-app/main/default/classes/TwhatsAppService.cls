@RestResource(urlMapping='/receive')
global with sharing class TwhatsAppService {
    
    @HttpPost
    global static String doPost() {
        RestRequest req = RestContext.request;
        List<TwhatsAppMessage__c> inserts = new List<TwhatsAppMessage__c>();
        inserts.add(new TwhatsAppMessage__c(
            To__c = req.params.get('To'),
            From__c = req.params.get('From'),
            Body__c = req.params.get('Body'),
            Inbound__c = true
        ));
        insert inserts;
        return 'success';
    }
}
