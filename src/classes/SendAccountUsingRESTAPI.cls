public class SendAccountUsingRESTAPI {
   private final String clientId = '3MVG9i1HRpGLXp.oN10QsC7kz6Dvkcm_5tas57dFaPh5Tgyp8ft0GwyX70qNlRHTvJprSnq5FAO6ohyugH.wz';
   private final String clientSecret = '3629665663077068996';
   private final String username = 'shildemo2@corpsec.com';
   private final String password = 'demoshil2ChW48MzcZc30nPIs7T6lq407e';
   String oauthTokenURL = 'https://na40.salesforce.com/services/oauth2/token';
   public class deserializeResponse
   {
      public String id;
      public String access_token;
   }
   
   public String ReturnAccessToken(SendAccountUsingRESTAPI case2)
   {
      system.debug('entered returnAccessToken method');
      String reqbody = 'grant_type=password&client_id='+clientId+'&client_secret='+clientSecret+'&username='+username+'&password='+password;
      Http h = new Http();
      HttpRequest req = new HttpRequest();
      req.setBody(reqbody);
      req.setMethod('POST');
      req.setEndpoint(oauthTokenURL);
      HttpResponse res = h.send(req);
      system.debug('response body' + res.getbody());
      deserializeResponse resp1 = (deserializeResponse)JSON.deserialize(res.getbody(),deserializeResponse.class);
      system.debug('AccessToken in returnaccessToken' + resp1.access_token); 
      return resp1.access_token;
   }
   
   public static void callcreateAcc(IncidentObj__c incident)
   {
      system.debug('entered callcreateAcc');
      
      SendAccountUsingRESTAPI case1 = new SendAccountUsingRESTAPI();
      String accessToken;
      accessToken = case1.ReturnAccessToken(case1);
      system.debug('AccessToken' + accessToken);     
      if(accessToken != null){
          String endPoint = 'https://na40.salesforce.com/services/data/v32.0/sobjects/Case/';
          String jsonstr = '{"Name" : "' + incident.caseOrigin__c + '"}';
          Http h2 = new Http();
          HttpRequest req1 = new HttpRequest();
          req1.setHeader('Authorization','Bearer ' + accessToken);
          req1.setHeader('Content-Type','application/json');
          req1.setHeader('accept','application/json');
          req1.setBody(jsonstr);
          req1.setMethod('POST');
          req1.setEndpoint(endPoint);
          HttpResponse res1 = h2.send(req1);
             
          deserializeResponse resp2 = (deserializeResponse)JSON.deserialize(res1.getbody(),deserializeResponse.class);
          System.debug('responseid' +resp2);
          IncidentObj__c incidentObj = [SELECT Id FROM IncidentObj__c WHERE Id = :incident.id];
          incidentObj.caseId__c = resp2.id;
          update incidentObj;
          system.debug('SecondOrgAccId' + incident.caseId__c);
       }
   }
}