public class SKUMappingStatusWrapper{
    public String status{set; get;}
    public String jsonBody{set; get;}
    public Map<String, String> errorMap{set; get;}

    public SKUMappingStatusWrapper(String status, String json, Map<String, String> errMap){
        this.status = status;
        this.errorMap = errMap;
        this.jsonBody = json;
    }

    public static Map<String, String> errorCodeWithMessages(){
        Map<String, String> errorCode = new Map<String, String>();
    
        return errorCode;
    }    
}