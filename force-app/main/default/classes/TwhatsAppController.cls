public with sharing class TwhatsAppController {
    
    @AuraEnabled
    public static List<TwhatsAppMessage__c> getTwhatsAppMessages() {
        return [SELECT Id, Body__c, To__c, From__c, Inbound__c 
                FROM TwhatsAppMessage__c
                ORDER BY CreatedDate];
    }

    @AuraEnabled
    public static void sendMsg(string msg) {
        TwhatsAppUtility.sendWhatsAppMessage(msg);
    }
}
