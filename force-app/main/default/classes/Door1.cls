public class Door1{
    private static final List<String> mappingAttributes = new List<String>();
    private static final List<String> otherMappingAttributes = new List<String>();
    private static final List<String> skuAttributes = new List<String>();
    
    public Door1(){
        mappingAttributes.add('door_modelName');
        mappingAttributes.add('door_panelType');
        mappingAttributes.add('door_panelDesign');
        mappingAttributes.add('door_color');
        
        otherMappingAttributes.add('door_fg');
        otherMappingAttributes.add('door_bore');
        otherMappingAttributes.add('door_lites');
        
        skuAttributes.add('door_skuNumber');
        skuAttributes.add('skuNumber_door_fg');
        skuAttributes.add('skuNumber_door_bore');
        skuAttributes.add('skuNumber_door_lites');
    }
    
    public List<Object> getSkuNumber(List<Object> custom_Attributes){
        integer i = 0;
        String modelName, panelType, panelDesign, color;
        String doorFg, doorBore;
        integer doorLites = 0;
        String doorSkuNumber, fgSkuNumber, boreSkuNumber, litesSkuNumber;
        while(i < custom_Attributes.size()){
            Map<String, Object> customAttributeElement = (Map<String, Object>) custom_attributes.get(i);
            if(mappingAttributes.contains(String.valueOf(customAttributeElement.get('key')))){
                if(String.valueOF(customAttributeElement.get('key')).equals('door_modelName')){
                    modelName = String.valueOF(customAttributeElement.get('value'));
                }
                if(String.valueOF(customAttributeElement.get('key')).equals('door_panelType')){
                    panelType = String.valueOF(customAttributeElement.get('value'));
                }
                if(String.valueOF(customAttributeElement.get('key')).equals('door_panelDesign')){
                    panelDesign = String.valueOF(customAttributeElement.get('value'));
                }
                if(String.valueOF(customAttributeElement.get('key')).equals('door_color')){
                    color = String.valueOF(customAttributeElement.get('value'));
                }
                //mappingAttributes.add(String.valueOf(customAttributeElement.get('key')), String.valueOf(customAttributeElement.get('value')));
            }
            else if(otherMappingAttributes.contains(String.valueOf(customAttributeElement.get('key')))){
                if(String.valueOf(customAttributeElement.get('key')).equals('door_fg')){
                    doorFg = String.valueOf(customAttributeElement.get('value'));
                }
                if(String.valueOf(customAttributeElement.get('key')).equals('door_bore')){
                    doorBore = String.valueOf(customAttributeElement.get('value'));
                }
                if(String.valueOf(customAttributeElement.get('key')).equals('door_lites')){
                    doorLites = Integer.valueOf(customAttributeElement.get('value'));
                }
            }            
            i++;
        }
        if(modelName != null && panelType != null && panelDesign != null && color != null){
            doorSkuNumber = runQuery(modelName, panelType, panelDesign, color);   
        }
        if(!doorFg.equals('false') && doorFg != null){
            fgSkuNumber = runQueryFg(doorFg); 
        }
        if(doorBore != null){
            boreSkuNumber = runQueryBore(doorBore);
        }
        if(doorLites > 0 && doorLites != null){
            litesSkuNumber = runQueryLites(doorLites);
        }
        
        i = 0;
        while(i < custom_Attributes.size()){
            Map<String, Object> customAttributeElement = (Map<String, Object>) custom_attributes.get(i);
            if(skuAttributes.contains(String.valueOf(customAttributeElement.get('key')))){
                String key = String.valueOf(customAttributeElement.get('key'));
                if(key.equals('door_skuNumber') && doorSkuNumber != null){
                    customAttributeElement.put('value', doorSkuNumber);
                }
                if(key.equals('skuNumber_door_fg') && fgSkuNumber != null){
                    customAttributeElement.put('value', fgSkuNumber);
                }
                if(key.equals('skuNumber_door_bore') && boreSkuNumber != null){
                    customAttributeElement.put('value', boreSkuNumber);
                }
                if(key.equals('skuNumber_door_lites') && litesSkuNumber != null){
                    customAttributeElement.put('value', litesSkuNumber);
                }
            }
            i++;
        }
        return custom_Attributes;
    }
    //String modelName, String panelType, String panelDesign, String Color
    public String runQuery(String modelName, String panelType, String panelDesign, String color){
        return '12345';
    }
    public String runQueryFg(String fg){
        return '[]';
    }
    public String runQueryBore(String bore){
        return '[]';
    }
    public String runQueryLites(integer lites){
        return '[]';
    }
}