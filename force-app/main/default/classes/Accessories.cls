public class Accessories implements SkuMapper{

    private static final List<String> mappingAttributes = new List<String>();
    private static final List<String> skuAttributes = new List<String>();
    
    public Accessories(){
        mappingAttributes.add('acc_part#');
        skuAttributes.add('acc_skuNumber');
    }
    
    public List<Object> getSkuNumber(List<Object> custom_Attributes){
        integer i = 0;
        String partNumber, skuNumber;
        while(i < custom_Attributes.size()){
            Map<String, Object> customAttributesElement = (Map<String, Object>) custom_Attributes.get(i);
            if(mappingAttributes.contains(String.valueOf(customAttributesElement.get('key')))){
                if(String.valueOf(customAttributesElement.get('key')).equals('acc_part#')){
                    partNumber = String.valueOf(customAttributesElement.get('value'));
                }
            }            
            i++;
        }
        
        if(partNumber != null){
            skuNumber = SkuProductData.getAccessories(partNumber);
        }
        i = 0;
        while(i < custom_Attributes.size()){
            Map<String, Object> customAttributesElement = (Map<String, Object>) custom_Attributes.get(i);
            if(skuAttributes.contains(String.valueOf(customAttributesElement.get('key')))){
                if(String.valueOf(customAttributesElement.get('key')).equals('acc_skuNumber') && skuNumber != null){
                    customAttributesElement.put('value', skuNumber);
                }
            }
            i++;
        }
        return custom_Attributes;
    }
}