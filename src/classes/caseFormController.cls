public class caseFormController {
	@AuraEnabled
    public static List<String> getStatusPicklistval(){
        List<String> options = new List<String>();
        Schema.DescribeFieldResult fieldResult = Case.Status.getDescribe();
        system.debug('FieldResultValue' + fieldResult);
        List<Schema.PicklistEntry> PlstEntry = fieldResult.getPicklistValues();
        system.debug('PicklistValue' + PlstEntry);
        options.add('--None--');
        for (Schema.PicklistEntry FieldVal: PlstEntry) {
            options.add(FieldVal.getLabel());
        } 
        return options;
    }
    @AuraEnabled
    public static List<String> getCaseOriginPicklistval(){        
        List<String> options = new List<String>();
        Schema.DescribeFieldResult fieldResult = Case.Origin.getDescribe();
        system.debug('FieldResultValue' + fieldResult);
        List<Schema.PicklistEntry> PlstEntry = fieldResult.getPicklistValues();
        system.debug('PicklistValue' + PlstEntry);
        options.add('--None--');
        for (Schema.PicklistEntry FieldVal: PlstEntry) {
            options.add(FieldVal.getLabel());
        }    
        return options;
    }
    @AuraEnabled    
    public static String saveCaseRecord(String caseOrigin, String status, String loggedInUser, String loggedInEmailVal) {
        Case newCaseObj = new Case();
        newCaseObj.Origin = caseOrigin;
        newCaseObj.Status = status;
        Contact testContact = [select id,Email from Contact where email = :loggedInEmailVal limit 1];
        if(testContact != null) {
            newCaseObj.ContactId = testContact.id;
        }
        insert newCaseObj;
        System.debug('shilpa');
        system.debug('caseID' + newCaseObj.id);
        return newCaseObj.id;
    }
}