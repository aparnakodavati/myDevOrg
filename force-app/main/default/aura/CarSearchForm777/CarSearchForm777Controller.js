({
    doInit : function(component, event, helper) {
        
        var createCarRecord = $A.get("e.force:createRecord");
        if(createCarRecord){
            component.set("v.shownew", true); 
        } else{
            component.set("v.shownew", false);
            console.log("event is not supported")
        }
        
        helper.getCarType(component,helper);
    },
    
    
    onSearchClick : function(component, event, helper) {
alert('Search button was clicked');		},
    
    
    newValueSelected  : function(component, event, helper) {
        var carTypeId = component.find("carType").get("v.value");
        alert(carTypeId + "Option selected");
    },    
    
    createRecord : function(component, event, helper) { 
    var createCarRecord = $A.get("e.force:createRecord");
    createCarRecord.setParams({
        "entityApiName" : "Car_Type__c"
});
    
        createCarRecord.fire();
    
}
    
})