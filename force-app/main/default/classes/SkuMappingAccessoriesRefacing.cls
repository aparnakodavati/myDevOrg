public class SkuMappingAccessoriesRefacing {
    public SkuMappingAccessoriesRefacing(){}
    
    public Map<String,String> getAccessoriesOptions(){
        Map<String, String> accessoriesOptionAttributes = new Map<String, String>();
        accessoriesOptionAttributes.put('ra_option','accessoryName');  
         accessoriesOptionAttributes.put('ra_vendor','vendorId');   
        return accessoriesOptionAttributes;
    }
     public Map<String,String> getAccessoriesSizeModel(){
        Map<String, String> accModelAttributes = new Map<String, String>();
        accModelAttributes.put('ra_part#','partNumber');  
         accModelAttributes.put('ra_sizeModel','name');   
         accModelAttributes.put('ra_accpcc#','itemNumber');   
        return accModelAttributes;
    } 
    public Map<String,String> getAccessoriesItem(){
        Map<String, String> accessoriesItemAttributes = new Map<String, String>();
        accessoriesItemAttributes.put('ra_item','item');   
        return accessoriesItemAttributes;
    }
    
    public Map<String,String> getAccessoriesQty(){
        Map<String, String> accessoriesQtyAttributes = new Map<String, String>();
        accessoriesQtyAttributes.put('ra_quantity','number');   
        return accessoriesQtyAttributes;
    }
    
    public List<String> getSkuAttributesAcc(){
        List<String> skuAttributesAcc = new List<String>();
        skuAttributesAcc.add('ra_skuNumber');
        return skuAttributesAcc; 
    }  
    
}