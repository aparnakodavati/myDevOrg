trigger attachTrigger on Attachment (after insert) {
    
        String Title;
        Id pId;
        String attBody;
        List<Attachment> attlist = new List<Attachment>();
    if(Trigger.isInsert && Trigger.isAfter){
                
            for(Attachment att: Trigger.new){
                String sobjectType = att.ParentId.getSObjectType().getDescribe().getName();
                System.debug('****the sonject type****'+sobjectType);
              if(sobjectType == 'Input_Files__c'){
                  attlist.add(att);
                  System.debug('****AccountsobjectType*****'+sobjectType);
              }
            }
            if(attlist.size() > 0){
                System.debug('******list is not empty****'+attlist.size());
                for(Attachment attch : attlist){
                    Title=attch.Name;
                    pId=attch.ParentId;
                    attBody=(attch.body).toString();
                    ParserTestAgain.parser(attBody);
                    
                   
                }
             }
          }    
    }