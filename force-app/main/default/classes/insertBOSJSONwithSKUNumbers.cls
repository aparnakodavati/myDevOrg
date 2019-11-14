@RestResource(urlMapping='/getBosJsonWithJobId234324552/*')
global class insertBOSJSONwithSKUNumbers {
    
    
    @HttpPost
    global static responseWrapper jobCreationLogic() {        
        RestRequest req = RestContext.request;
        responseWrapper responseJSON = new responseWrapper();
        string jsonText;
        string jobNumber;
        String retruResponse;
   
        Map<String, Object> body = new Map<String, Object>();

        try{
        String jsonBody = req.requestBody.toString(); 
            if (!String.isBlank(jsonBody)) { 
                body = (Map<String, Object>)JSON.deserializeUntyped(jsonBody);
                    if(body.containsKey('jobNumber')) {
                        jobNumber = (String)body.get('jobNumber');
                        System.debug('****jobNumber***'+jobNumber); 
                        if(body.containskey('Bosjon') && body.get('Bosjon') != null)
                        {
                            
                            jsonText = (string)body.get('Bosjon');
                            System.debug('*****jsonText****'+jsonText);
                        }
                          String decodeResponse = EncodingUtil.base64Decode(jsonText).tostring();                  
                        retruResponse = parseDataCabinetSku.parseMethod(decodeResponse);
                        responseJSON.status = 'Success';
                        responseJSON.message = 'Reached Destination';
                        responseJSON.jobid = jobNumber;
                        responseJSON.JsonReturnResponse= retruResponse ;
                    
                    
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
        System.debug(' got to the end');
            return responseJSON; //return the JSON response
      }
      catch(Exception e)
      {
          responseJSON.status = 'failure';
          responseJSON.jobid = jobNumber;
          responseJSON.message = e.getmessage();
          responseJSON.JsonReturnResponse = string.valueOF(e.getLineNumber())+' '+e.getStackTraceString();
      }
      System.debug(' got to the end');
      return responseJSON; //return the JSON response
 
    }
    //wrapper class for the response to an API request
    global class responseWrapper {
        
        global String status {get;set;} //status string
        //global String contactid {get;set;} //18 character Contact record Id
        global String jobid {get;set;} //18 character Task record Id
        global String message {get;set;} //message string
        global String JsonReturnResponse {get;set;}

        global responseWrapper() {
            //default all values
            this.status = 'success';
            //this.contactid = '';
            this.jobid = '';
            this.message = '';
        }
    }

}