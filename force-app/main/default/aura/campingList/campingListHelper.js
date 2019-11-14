({
    createItem : function(component,event,item) {
        console.log('step6');
        var action=component.get("c.saveItem");
        action.setParams({
            "item": item
        });
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state=="SUCCESS"){
                console.log('step7');
                var items=component.get("v.items");
                items.push(response.getReturnValue());
                component.set("v.items",items);
            }
            else{
                console.log('State Returned '+state);
            }
        });
        $A.enqueueAction(action);
    }
})