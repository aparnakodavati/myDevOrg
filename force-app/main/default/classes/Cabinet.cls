public class Cabinet implements SKUMapper {
    
    private static final List<String> mappingAttributes = new List<String>();
    private static final List<String> skuAttributes = new List<String>();
    
    public Cabinet(){
        mappingAttributes.add('cabinet_type'); 
        skuAttributes.add('cabinet_skuNumber');
    }
    
    public List<Object> getSkuNumber(List<Object> custom_attributes){
        integer i = 0;
        String cabinetType, cabinetSkuNumber;
        while(i < custom_attributes.size()){
            Map<String, Object> customAttributeElement = (Map<String, Object>) custom_attributes.get(i);
            if(mappingAttributes.contains(String.valueOf(customAttributeElement.get('key')))){
                if(String.valueOf(customAttributeElement.get('key')).equals('cabinet_type')){
                    cabinetType = String.valueOf(customAttributeElement.get('value'));
                }
            } 
            i++;
        }
        
        if(cabinetType != null){
            cabinetSkuNumber = SkuProductData.getCabinetData(cabinetType);
        }
        i = 0;
        while(i < custom_attributes.size()){
            Map<String, Object> customAttributeElement = (Map<String, Object>) custom_attributes.get(i);
            if(skuAttributes.contains(String.valueOf(customAttributeElement.get('key')))){
                if(String.valueOf(customAttributeElement.get('key')).equals('cabinet_skuNumber') && cabinetSkuNumber != null){
                    customAttributeElement.put('value', cabinetSkuNumber);
                }
            }
            i++;
        }
        return custom_attributes;
    }
    
}