trigger MYTRIGGER on APEX_Customer__c (before insert) {
    
    for(APEX_Customer__c  cust : trigger.new){
        
    }

}