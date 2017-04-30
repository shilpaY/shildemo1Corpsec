({
	getStatus : 	function(component,event){
        var action   = component.get("c.getStatusPicklistval");
        var inputsel = component.find("StatusType");
        var opts = [];
        action.setCallback(this, function(a) {
            for(var i=0;i< a.getReturnValue().length;i++){
                opts.push({"class": "optionClass", label: a.getReturnValue()[i], value: a.getReturnValue()[i]});
            }
            inputsel.set("v.options", opts);
        });        
        $A.enqueueAction(action);
    },
    getCaseOrigin : 	function(component,event){
        var action   = component.get("c.getCaseOriginPicklistval");
        var inputsel1 = component.find("CaseOriginType");
        var opts1 = [];
        action.setCallback(this, function(a) {
            for(var i=0;i< a.getReturnValue().length;i++){
                opts1.push({"class": "optionClass", label: a.getReturnValue()[i], value: a.getReturnValue()[i]});
            }
            inputsel1.set("v.options", opts1);
        });        
        $A.enqueueAction(action);
    },
    displayErrorMessage : function(StatusVal, CaseOriginVal, component, event) {
        var StatusTypeDiv = component.find("StatusId");
        var CaseOriginTypeDiv = component.find("CaseOriginId");
    	if(StatusVal==undefined || StatusVal=="" || StatusVal=="--None--"){
            $A.util.addClass(StatusTypeDiv, 'slds-has-error');
        }
        else{
            $A.util.removeClass(StatusTypeDiv, 'slds-has-error');
        }
        if(CaseOriginVal==undefined || CaseOriginVal=="" || CaseOriginVal=="--None--"){
            $A.util.addClass(CaseOriginTypeDiv, 'slds-has-error');
        }
        else{
            $A.util.removeClass(CaseOriginTypeDiv, 'slds-has-error');
        }
	}
})