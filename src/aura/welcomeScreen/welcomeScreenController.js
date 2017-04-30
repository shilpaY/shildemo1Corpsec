({
    myPreviousCases : function(component, event) {
        var event = $A.get("e.c:GoToMyCases");
        event.fire();
    },
    logACase : function(component, event) {
        var loggedInUserEmail = component.get("v.loggedInUserEmail");
        var event = $A.get("e.c:GoToCaseCreation");
        event.setParams({"userEmailVal":loggedInUserEmail});
        event.fire();
    }
})