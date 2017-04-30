({
	doInit : function(component, event, helper) {
        //added the case picklist values using Helper class   
        helper.getStatus(component, event);
        helper.getCaseOrigin(component, event);
    },
    CreateNewCase : function(component, event, helper) { 
        //Find Components
        
        var Status = component.find("StatusType");
        var CaseOrigin = component.find("CaseOriginType");        
        //Get input values
        var StatusVal = Status.get("v.value");
        var CaseOriginVal = CaseOrigin.get("v.value");
        if(StatusVal== "" || StatusVal == undefined ||StatusVal=="--None--"
           || CaseOriginVal== "" || CaseOriginVal == undefined ||CaseOriginVal=="--None--") {
            helper.displayErrorMessage(StatusVal,CaseOriginVal,component, event);  
        } else {
            //var StatusTypeDiv = component.find("StatusId");
        	//var CaseOriginTypeDiv = component.find("CaseOriginId");
            //$A.util.removeClass(StatusTypeDiv, 'slds-has-error');
            //$A.util.removeClass(CaseOriginTypeDiv, 'slds-has-error');
            var userEmailVal = component.get("v.userEmailValue");
            var newCase = component.get("v.newCaseRecord");
            var evt = $A.get("e.c:GoToSuccessPage");
            evt.setParams({
                "caseInfo": newCase, 
                "loggedInUsrEmail" : userEmailVal
            });
            evt.fire();             
            /*var action = component.get("c.saveCaseRecord");
            action.setParams({
                    "caseOrigin": CaseOriginVal,
                    "status" : StatusVal
                });
            
            //Status.set("v.value",'');
            //CaseOrigin.set("v.value",'');             
            $A.enqueueAction(action);*/
        }        
    }
})