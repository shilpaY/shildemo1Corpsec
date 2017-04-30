public with sharing class SendDataUsingRESTAPI {
    public static IncidentObj__c incObj;
    public SendDataUsingRESTAPI(ApexPages.StandardController controller) {
        incObj = (IncidentObj__c)controller.getRecord();
        system.debug('incidentObjVal' + incObj);
    }


   public static void callcreateCase()
   {
      ApexPages.StandardController sc = new ApexPages.StandardController(incObj);
      SendDataUsingRESTAPI sendDateAPI = new SendDataUsingRESTAPI(sc);
      
   }
}