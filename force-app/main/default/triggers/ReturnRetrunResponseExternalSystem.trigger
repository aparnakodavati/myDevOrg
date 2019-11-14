trigger ReturnRetrunResponseExternalSystem on Attachment(after insert) {
  if(trigger.isInsert && trigger.isAfter) 
  for(Attachment att : [SELECT id,name,body,parent.Name FROM Attachment WHERE Name = 'BOSJSON' AND id IN:Trigger.new])
  { 
        string jobNumber = att.parent.Name;
        string returnResponse    = 'Reached Destination';
        SendReturnResponse.insertedJobId(jobNumber,returnResponse);
  }
      
}