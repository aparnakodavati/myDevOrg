@RestResource(urlMapping='/getBosJsonWithJobId123/*')
global class insertBosJsonWithJobId {
    
    
    @HttpPost
    global static responseWrapper jobCreationLogic() {
        
        RestRequest req = RestContext.request; 
        responseWrapper responseJSON = new responseWrapper();
        string jsonText;
        string jobNumber;
        
        
        Map<String, Object> body = new Map<String, Object>();
        Map<string,blob> body1 = new Map<String,blob>(); 
        
        
        String jsonBody = req.requestBody.toString(); 
            if (!String.isBlank(jsonBody)) { 
                body = (Map<String, Object>)JSON.deserializeUntyped(jsonBody);
                    if(body.containsKey('jobNumber')) {
                        jobNumber = (String)body.get('jobNumber');
                        System.debug('****jobNumber***'+jobNumber); 
                        if(body.containskey('Bosjon'))
                        {
                            
                            jsonText = (string)body.get('Bosjon');
                            //System.debug('***blob***'+k);
                            System.debug('*****jsonText****'+jsonText);
                        }
                                            
                        List<job__C> jobNumberlist = [SELECT id,name FROM job__c where Name =:jobNumber LIMIT 1];
                        if(jobNumberlist.size()<=0){
                                job__c j = new job__c();
                                j.name = jobNumber;
                                Database.SaveResult insertNewJob = Database.insert(j); 
                                if (!insertNewJob.isSuccess()) { 
                                    List<Database.Error> errors = insertNewJob.getErrors(); 
                                    responseJSON.status = 'failure';
                                    responseJSON.message = errors[0].getMessage();
                                    responseJSON.jobid = string.valueOf(jobNumber); 
                                } 
                                else{ 
                                        responseJSON.jobid = insertNewJob.getId();//populate the Id of the Task record to our response object
                                        //System.debug('***jobid****'+responseJSON.jobid);
                                        Attachment att = new Attachment();
                                        att.Name       = 'BOSJSON';
                                        att.ParentId   = j.Id;
                                        att.body       = EncodingUtil.base64Decode(jsonText);
                                        att.ContentType = 'text/csv; charset=UTF-8';
                                        Database.SaveResult insertattachment = Database.insert(att);
                                        if (!insertattachment.isSuccess()) { //if the insert DML was NOT successful
                                            List<Database.Error> errors = insertattachment.getErrors(); //grab the error array from the SaveResult object
                                            //respond with failure
                                            responseJSON.status = 'failure';
                                            responseJSON.message = errors[0].getMessage(); //set the message to the first error in the array
                                            responseJSON.jobid = jobNumber;
                                        } 
                                        else{                               
                                            System.debug('****attachment inserted Successfully*****');
                                            responseJSON.status = 'Success';
                                            responseJSON.message = 'Reached Destination';
                                            responseJSON.jobid = jobNumber;
                                            
                                        }
                                    }
                        }
                        else{
                              List<Attachment> Attachlist = [select id,name,Body FROM Attachment WHERE Parent.NAME =: jobNumber AND Name = 'BOSJSON' limit 1];
                              if(Attachlist.size()>0){
                                  Attachment attach = new Attachment();
                                  attach.Body = EncodingUtil.base64Decode(jsonText);
                                  attach.id   = attachlist[0].id; 
                                  Database.SaveResult Updateattachment = Database.update(attach);
                                  if (!Updateattachment.isSuccess()) { //if the insert DML was NOT successful
                                            List<Database.Error> errors = Updateattachment.getErrors(); //grab the error array from the SaveResult object
                                            //respond with failure
                                            responseJSON.status = 'failure';
                                            responseJSON.message = errors[0].getMessage(); //set the message to the first error in the array
                                            responseJSON.jobid = string.valueOf(jobNumber);
                                        } 
                                        else{                               
                                            responseJSON.status = 'Success';
                                            responseJSON.message = 'Reached Destination';
                                            responseJSON.jobid = jobNumber;
                                            
                                        }
                              }
                        }
                    
                    
                    
                }
                else { //otherwise, the JSON body was white space, empty ('') or null
                        //respond with failure
                        responseJSON.status = 'failure';
                        responseJSON.message = 'The JobNumber is empty';
                    }
            }
            else{
                responseJSON.status = 'failure';
                responseJSON.message = 'The attached json is empty';
                
            }
            return responseJSON; //return the JSON response
    
    }
    //wrapper class for the response to an API request
    global class responseWrapper {
        
        global String status {get;set;} //status string
        //global String contactid {get;set;} //18 character Contact record Id
        global string jobid {get;set;} //18 character Task record Id
        global String message {get;set;} //message string
        
        //constructor
        global responseWrapper() {
            //default all values
            this.status = 'success';
            //this.contactid = '';
            this.jobid = '';
            this.message = '';
        }
    }

}