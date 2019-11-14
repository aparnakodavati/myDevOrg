public class SendReturnResponse{
    
    @future (callout=true)
    public static void insertedJobId(String JobNumber, string returnResponse){

        
            Http httpProtocol     = new Http();
            //Creating HttpRequest
            HttpRequest request   = new HttpRequest();
            //Creating the HttpResponse 
            HttpResponse response = new HttpResponse();

         if(jobNumber !=null && returnResponse!= null){

            String jsonstr = '{"jobNumber":"'+ jobNumber +'","returnResponse":"'+ returnResponse+'"}';

            //request.setHeader('Authorization', 'Bearer ' +accesstoken);

            request.setHeader('Content-Type','application/json');

            request.setHeader('accept','application/json');

            request.setBody(jsonstr);

            request.setMethod('POST');

            request.setEndpoint('callout:Connected_App_Credentials/services/apexrest/getreturnResponseback/');

            response  = httpProtocol.send(request);
            System.debug('***'+response.getstatusCode());

        }    
    }   
}