public class SkuMappingAccessories {
    public SkuMappingAccessories(){}
    
    public Map<String,String> getAccessoriesOptions(){
        Map<String, String> accessoriesOptionAttributes = new Map<String, String>();
        accessoriesOptionAttributes.put('acc_option','accessoryName');  
         accessoriesOptionAttributes.put('acc_vendorId','vendorId');   
        return accessoriesOptionAttributes;
    }
     public Map<String,String> getAccessoriesSizeModel(){
        Map<String, String> accModelAttributes = new Map<String, String>();
        accModelAttributes.put('acc_part#','partNumber');  
         accModelAttributes.put('acc_sizeModel','name');   
        return accModelAttributes;
    } 
    public Map<String,String> getAccessoriesItem(){
        Map<String, String> accessoriesItemAttributes = new Map<String, String>();
        accessoriesItemAttributes.put('acc_item','item');   
        return accessoriesItemAttributes;
    }
    
    public Map<String,String> getAccessoriesQty(){
        Map<String, String> accessoriesQtyAttributes = new Map<String, String>();
        accessoriesQtyAttributes.put('acc_qty','number');   
        return accessoriesQtyAttributes;
    }
    
    
    public List<String> getSkuAttributesAcc(){
        List<String> skuAttributesAcc = new List<String>();
        skuAttributesAcc.add('acc_skuNumber');
        return skuAttributesAcc; 
    }  
    
}