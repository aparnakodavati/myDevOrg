({
	getCarType : function(component,helper) {
       var action = component.get("c.getCarTypes");
        action.setCallback(this,function(data) {
        var state = data.getState();
        if( state === "SUCCESS"){
            component.set("v.carTypes",data.getReturnValue());
            
        }else if (state === "ERROR") {
            Alert('Unknown Error');
        }
    });
		$A.enqueueAction(action);
	}
})