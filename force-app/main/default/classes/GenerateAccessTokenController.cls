Public class GenerateAccessTokenController{
public static string GenerateAccessToken(){
ConnectedSourceOrgDetails__c app=ConnectedSourceOrgDetails__c.getOrgDefaults();
System.debug(UserInfo.getSessionID());

String clientId = app.ClientId__c;
String clientSecret =app.ClientSecreat__c; 
String username=app.UserName__c;
String password1 = app.Password__c+app.SecurityToken__c;
String password= Password1;
String URL=app.URL__c;

String reqbody = 'grant_type=password&client_id='+clientId+'&client_secret='+clientSecret+'&username='+username+'&password='+password;

Http h = new Http();
HttpRequest req = new HttpRequest();
req.setBody(reqbody);
req.setMethod('POST');
req.setEndpoint(URL+'/services/oauth2/token');
req.setTimeout(120000);
HttpResponse res = h.send(req);
system.debug('====body====='+res.getbody());
OAuth2 objAuthenticationInfo =new OAuth2 ();
objAuthenticationInfo = (OAuth2)JSON.deserialize(res.getbody(), OAuth2.class);
 return  objAuthenticationInfo.access_token;
}

Public class OAuth2{
 Public String access_token;
}
}