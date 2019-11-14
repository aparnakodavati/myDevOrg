public class DrawerBox implements SKUMapper{
    private static final List<String> mappingAttributes = new List<String>();
    private static final List<String> skuAttributes = new List<String>();
    
    public DrawerBox(){
        mappingAttributes.add('db_MaterialType');
        skuAttributes.add('db_skuNumber');       
    }
    
    public List<Object> getSkuNumber(List<Object> custom_Attributes){
        String materialType;
        String dbSkuNumber;
        integer i = 0;
        while(i < custom_Attributes.size()){
            Map<String, Object> customAttributeElement = (Map<String, Object>) custom_Attributes.get(i);
            if(mappingAttributes.contains(String.valueOf(customAttributeElement.get('key')))){
                if(String.valueOf(customAttributeElement.get('key')).equals('db_MaterialType')){
                    materialType = String.valueOf(customAttributeElement.get('value'));
                }
            }
            i++;
        }
        
        if(materialType != null){
            dbSkuNumber = SkuProductData.getDrawerBoxAndPulloutsData('DrawerBox', materialType);
        }
        
        i = 0;
        while(i < custom_Attributes.size()){
            Map<String, Object> customAttributeElement = (Map<String, Object>) custom_Attributes.get(i);
            if(skuAttributes.contains(String.valueOf(customAttributeElement.get('key')))){
                if(String.valueOf(customAttributeElement.get('key')).equals('db_skuNumber') && dbSkuNumber != null){
                    customAttributeElement.put('value', dbSkuNumber);
                }
            }  
            i++;
        }      
        return custom_Attributes;
    }
}