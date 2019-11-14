public class AddOns implements SKUMapper{

  private static final List<String> mappingAttributes = new List<String>();
      private static final List<String> skuAttributes = new List<String>();
    
    public AddOns(){
        mappingAttributes.add('othMatParts_AddOnName');
        mappingAttributes.add('othMatParts_color');
         mappingAttributes.add('othMatParts_AddOnPart#');
         mappingAttributes.add('othMatParts_speciesPaintedWood');
         mappingAttributes.add('othMatParts_speciesStainedWood');

      skuAttributes.add('othMatParts_AddonSkuNumber');    
    }
        
     public List<Object> getSkuNumber(List<Object> custom_attributes){     
         
          integer i = 0;
        String addOnName,addOnpartNumber, color, stainedSpecies ,paintedSpecies , addOnSkuNumber;
        while(i < custom_attributes.size()){
            Map<String, Object> customAttributeElement = (Map<String, Object>) custom_attributes.get(i);
            if(mappingAttributes.contains(String.valueOf(customAttributeElement.get('key')))){
                if(String.valueOf(customAttributeElement.get('key')).equals('othMatParts_AddOnName')){
                    addOnName = String.valueOf(customAttributeElement.get('value'));
                }
                 if(String.valueOf(customAttributeElement.get('key')).equals('othMatParts_AddOnPart#')){
                    addOnpartNumber = String.valueOf(customAttributeElement.get('value'));
                }
                 if(String.valueOf(customAttributeElement.get('key')).equals('othMatParts_color')){
                    color = String.valueOf(customAttributeElement.get('value'));
                }
                if(String.valueOf(customAttributeElement.get('key')).equals('othMatParts_speciesPaintedWood')){
                    stainedSpecies = String.valueOf(customAttributeElement.get('value'));
                }
                if(String.valueOf(customAttributeElement.get('key')).equals('othMatParts_speciesStainedWood')){
                    paintedSpecies = String.valueOf(customAttributeElement.get('value'));
                }
            } 
            i++;
        }
         
          if(addOnName != null && color != null ){
            addOnSkuNumber = SkuProductData.getOMPartsData(addOnName,color,addOnpartNumber,stainedSpecies,paintedSpecies);
        }
         i=0;
         while(i<custom_Attributes.size()){
                
            Map<String, Object> customAttributeElement = (Map<String, Object>) custom_Attributes.get(i);
            if(skuAttributes.contains(String.valueOf(customAttributeElement.get('key')))){
                if(String.valueOf(customAttributeElement.get('key')).equals('othMatParts_AddonSkuNumber') && addOnSkuNumber != null){
                    customAttributeElement.put('value', addOnSkuNumber);
                }
            }  
            i++;
             
         }
         return custom_Attributes;
    }

}