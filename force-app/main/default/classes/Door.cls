public class Door implements SKUMapper {
    private static final List<String> mappingAttributes = new List<String>();
    private static final List<String> otherMappingAttributes = new List<String>();
    private static final List<String> skuAttributes = new List<String>();
    
    public Door(){
        mappingAttributes.add('door_modelName');
        mappingAttributes.add('door_panelType');
        mappingAttributes.add('door_panelDesign');
        mappingAttributes.add('door_color');
        mappingAttributes.add('door_series');
        mappingAttributes.add('door_stained_species');
        mappingAttributes.add('door_painted_species');
        
        otherMappingAttributes.add('door_fg');
        otherMappingAttributes.add('door_bore');
        otherMappingAttributes.add('door_lites');
        otherMappingAttributes.add('door_distressing');
        otherMappingAttributes.add('door_glazeDf');
        
        skuAttributes.add('door_skuNumber');
        skuAttributes.add('door_skuNumber_fg');
        skuAttributes.add('door_skuNumber_bore');
        skuAttributes.add('door_skuNumber_lites');
        skuAttributes.add('door_skuNumber_distressing');
        skuAttributes.add('door_skuNumber_glazing');
    }
    
    public List<Object> getSkuNumber(List<Object> custom_Attributes){
        integer i = 0;
        String modelName, panelType, panelDesign, color, serieName, stainedSpecies, paintedSpecies;
        String doorFg, doorBore, doorDistressing, doorGlazing;
        integer doorLites = 0;
        String doorSkuNumber, fgSkuNumber, boreSkuNumber, litesSkuNumber, distressingSkuNumber, glazingSkuNumber;
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
                if(String.valueOF(customAttributeElement.get('key')).equals('door_series')){
                    serieName = String.valueOF(customAttributeElement.get('value'));
                }
                if(String.valueOF(customAttributeElement.get('key')).equals('door_stained_species')){
                    stainedSpecies = String.valueOF(customAttributeElement.get('value'));
                }
                if(String.valueOF(customAttributeElement.get('key')).equals('door_painted_species')){
                    paintedSpecies = String.valueOF(customAttributeElement.get('value'));
                }
            }
            else if(otherMappingAttributes.contains(String.valueOf(customAttributeElement.get('key')))){
                if(String.valueOf(customAttributeElement.get('key')).equals('door_fg')){
                    doorFg = String.valueOf(customAttributeElement.get('value'));
                }
                if(String.valueOf(customAttributeElement.get('key')).equals('door_bore')){
                    doorBore = String.valueOf(customAttributeElement.get('value'));
                }
                if(String.valueOf(customAttributeElement.get('key')).equals('door_lites')){              
                    if(String.valueOf(customAttributeElement.get('value')) != null){
                        String getLitesInfo = String.valueOf(customAttributeElement.get('value'));
                        if(getLitesInfo.contains('-')){
                            doorLites = Integer.valueOf(getLitesInfo.substring(0, Integer.valueOf(getLitesInfo.indexOf('-'))));   
                        }else{
                            doorLites = Integer.valueOf(getLitesInfo);
                        }
                    }else{ doorLites = null;}                    
                }
                if(String.valueOf(customAttributeElement.get('key')).equals('door_distressing')){
                    doorDistressing = String.valueOf(customAttributeElement.get('value'));
                }
                if(String.valueOf(customAttributeElement.get('key')).equals('door_glazeDf')){
                    doorGlazing = String.valueOf(customAttributeElement.get('value'));
                }
            }            
            i++;
        }
        
        if(modelName != null && panelType != null && panelDesign != null && color != null){
            doorSkuNumber = SkuProductData.getDoorData(modelName, panelType, panelDesign, color, serieName, stainedSpecies, paintedSpecies);   
        }
      /*  if(!doorFg.equals('false') && doorFg != null){
            fgSkuNumber = SkuProductData.getFgSkuNumber(); 
        }
        if(doorBore != null){
            boreSkuNumber = SkuProductData.getBoreSkuNumber();
        }
        if(doorLites > 0 && doorLites != null){
            litesSkuNumber = SkuProductData.getLitesSkuNumber(doorLites);
        }
        if(doorDistressing != null && !doorDistressing.equals('false')){
            distressingSkuNumber = SkuProductData.getDistressing();
        }
        if(doorGlazing != null && !doorGlazing.equals('false')){
            glazingSkuNumber = SkuProductData.getGlazing();
        }
        */
        i = 0;
        while(i < custom_Attributes.size()){
            Map<String, Object> customAttributeElement = (Map<String, Object>) custom_attributes.get(i);
            if(skuAttributes.contains(String.valueOf(customAttributeElement.get('key')))){
                String key = String.valueOf(customAttributeElement.get('key'));
                if(key.equals('door_skuNumber') && doorSkuNumber != null){
                    customAttributeElement.put('value', doorSkuNumber);
                }
                if(key.equals('door_skuNumber_fg') && fgSkuNumber != null){
                    customAttributeElement.put('value', fgSkuNumber);
                }
                if(key.equals('door_skuNumber_bore') && boreSkuNumber != null){
                    customAttributeElement.put('value', boreSkuNumber);
                }
                if(key.equals('door_skuNumber_lites') && litesSkuNumber != null){
                    customAttributeElement.put('value', litesSkuNumber);
                }
                if(key.equals('door_skuNumber_distressing') && distressingSkuNumber != null){
                    customAttributeElement.put('value', distressingSkuNumber);
                }
                if(key.equals('door_skuNumber_glazing') && glazingSkuNumber != null){
                    customAttributeElement.put('value', glazingSkuNumber);
                }
            }
            i++;
        }
        return custom_Attributes;
    }
    
    public static String getStoredData(String modelName, String panelType, String panelDesign, String color, String serieName, String stainedSpecies, String paintedSpecies){
        String storedSkuNumber;
        
        return storedSkuNumber;
    }
}