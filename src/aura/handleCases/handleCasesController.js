({
	doInit : function(component, event, helper) {
        var loggedInUserVarl = component.get("v.userParameter");
        var loggedInEmailVal = component.get("v.userEmailParameter");
        $A.createComponent(
            "c:welcomeScreen", 
            {
                "loggedInUser" : loggedInUserVarl,
                "loggedInUserEmail" : loggedInEmailVal
            }, 
            function(newCmp) {
                if (component.isValid()) {
                    component.set("v.body", newCmp);
                }
            }
        );                
    },
    goToMyCases : function(component, event, helper) {
        $A.createComponent(
            "c:displayMyCases", 
            {
                
            }, 
            function(newCmp) {
                if (component.isValid()) {
                    component.set("v.body", newCmp);
                }
            }
        );
    },
    goToCaseCreation : function(component, event, helper) {
        var usrEmail = event.getParam("userEmailVal");
        $A.createComponent(
            "c:caseFormCmp", 
            {
            	"userEmailValue": usrEmail
            }, 
            function(newCmp) {
                if (component.isValid()) {
                    component.set("v.body", newCmp);
                }
            }
        );
    },
    goToSucessPage : function(component, event, helper) {
        var loggedInUserVal = component.get("v.userParameter");
        var caseInfo = event.getParam("caseInfo");
        var userEmailVal = event.getParam("loggedInUsrEmail");
        console.log('getemailval' + userEmailVal);
        var action = component.get("c.saveCaseRecord");     
        action.setParams({
            "caseOrigin": caseInfo.origin,
            "status" : caseInfo.status,
            "loggedInUser" : loggedInUserVal,
            "loggedInEmailVal" : userEmailVal
        });
        action.setCallback(this, function(a){
            debugger;
            var responseState =a.getState();
            if (responseState === "SUCCESS") {
                console.log("resultVal****" + a.getReturnValue());
                $A.createComponent(
                    "c:successForm", 
                    {
                     	"resultVal" : a.getReturnValue()   
                    }, 
                    function(newCmp) {
                        if (component.isValid()) {
                            component.set("v.body", newCmp);
                        }
                    }
                );
            }
        });      
       $A.enqueueAction(action);
    }
    /*
    goToSucessPage : function(component, event, helper) {
         var Case = event.getParam("CaseSucInfo");
         var action = component.get("c.SaveCases"); 
        console.log("****D**E*M***"+Case);
        action.setParams({
                "Newcases": Case                
            });
        action.setCallback(this, function(a){
            var responseState =a.getState();
            console.log("***responseState***"+responseState);
            if (responseState === "SUCCESS") { 
                 console.log("***Result***"+a.getReturnValue().Status);
                $A.createComponent(
                    "c:GOC_SuccessCmp", 
                    {
                    	"res" : a.getReturnValue()
                    }, 
                    function(newCmp) {
                        if (component.isValid()) {
                            component.set("v.body", newCmp);
                        }
                    }
                );
            }
        });      
       $A.enqueueAction(action);
    }*/
})