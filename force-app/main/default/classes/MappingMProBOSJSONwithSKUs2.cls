@RestResource(urlMapping='/getBosJsonWithJobId/*')
global class MappingMProBOSJSONwithSKUs2 {    
    
    @HttpPost
    global static responseWrapper jobCreationLogic() {        
        RestRequest req = RestContext.request;
        responseWrapper responseJSON = new responseWrapper();
        string jsonText;
        string jobNumber;
        String returnResponse;
        String platform;
        Map<String, Object> body = new Map<String, Object>();
        
        try{
            String jsonBody = req.requestBody.toString(); 
            System.debug('jsonBody'+ jsonBody);
            if(!String.isBlank(jsonBody)){ 
                body = (Map<String, Object>)JSON.deserializeUntyped(jsonBody);
                if(body.containsKey('jobNumber')){
                    jobNumber = (String)body.get('jobNumber');
                    System.debug('****jobNumber***'+jobNumber); 
                    if(body.containskey('Bosjon') && body.get('Bosjon') != null)
                    {
                        jsonText = (string)body.get('Bosjon');
                        System.debug('*****jsonText****'+jsonText);
                    }                    
                    
                    responseJSON.status = 'Success';
                    String decodeResponse = EncodingUtil.base64Decode(jsonText).tostring();   
                    SKUMappingStatusWrapper mappingStatusResponse = BOSParserForSKU3.parseMethod(decodeResponse);
                        responseJSON = new responseWrapper();
                        responseJSON.status = mappingStatusResponse.status;
                        if(mappingStatusResponse.errorMap == null){
                            responseJSON.message = 'Successfully Completed SKU Mapping';
                        }else{
                            responseJSON.message = 'Failed To Complete SKU Mapping';
                        }                        
                        responseJSON.jobid = jobNumber;
                        responseJSON.errors = mappingStatusResponse.errorMap;
                        responseJSON.JsonReturnResponse= mappingStatusResponse.jsonBody;
                        return responseJSON;                                                    
                }else{ //otherwise, the JSON body was white space, empty ('') or null
                    responseJSON.status = 'failure';
                    responseJSON.message = 'The JobNumber is empty';
                }
            }else{
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
        global Map<String, String> errors {get;set;}
        
        global responseWrapper() {
            //default all values
            this.status = 'failure';
            this.jobid = null;
            this.message = null;
            this.errors = null;
            this.JsonReturnResponse = null;
        }
    }
    
}