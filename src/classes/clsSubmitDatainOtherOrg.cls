public class clsSubmitDatainOtherOrg {
    public class OAuth2{
 public String id{get;set;}
 public String issued_at{get;set;}
 public String instance_url{get;set;}
 public String signature{get;set;}
 public String access_token{get;set;}    
}
// we'll be making Oauth Request first to get token,
// One we've token we'll make Rest API call to get data updated in target Org.
public Integer noOfEmployees{get;set;}
public string AccountId{get;set;}

// This four variables are required for authentication to Oauth Token
String clientId = '3MVG9i1HRpGLXp.oN10QsC7kz6Dvkcm_5tas57dFaPh5Tgyp8ft0GwyX70qNlRHTvJprSnq5FAO6ohyugH.wz' ;
String clientSecret = '3629665663077068996';
String username= 'shildemo2@corpsec.com';
String password= 'demoshil2';

//This method is called form VF page on Submit
public PageReference SubmitDataUsingGet() {

//using this request body we'll make API call
String reqbody = 'grant_type=password&client_id='+clientId+'&client_secret='
+clientSecret+'&username='+username+'&password='+password;

Http h = new Http();
HttpRequest req = new HttpRequest();
req.setBody(reqbody);
req.setMethod('POST');
req.setEndpoint('https://login.salesforce.com');
//Note if my domain is set,use the proper domain name else use login.salesforce.com
// for prod or developer environment, and test.salesforce.com for sandbox

HttpResponse res = h.send(req);
OAuth2 objAuthenticationInfo = (OAuth2)JSON.deserialize(res.getbody(), OAuth2.class);

// proceed further only if you get token
if(objAuthenticationInfo.access_token!=null){

// First create http and req object and set EndPoint
// Note Endpt, this part is common' https://ap1.salesforce.com/services/apexrest/
//'getAccountData' name is URLMapping you set while creating Rest 
//resource in Receiving org.

Http h1 = new Http();
HttpRequest req1 = new HttpRequest();
string EndPt = 'https://ap1.salesforce.com/services/apexrest/getAccountData?' +
'AccountId='+AccountId+'&noOfEmployees='+noOfEmployees ;

// Set request header to send token, setMethod, and set Endpoint
req1.setHeader('Authorization','Bearer '+objAuthenticationInfo.access_token);
req1.setMethod('GET');
req1.setEndpoint(EndPt);


//finally make a call
HttpResponse res1 = h1.send(req1);
system.debug('RESPONSE_BODY'+res1.getbody());
}
return null;
}
}