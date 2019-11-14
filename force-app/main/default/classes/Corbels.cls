public class Corbels implements SKUMapper{
    
     private static final List<String> mappingAttributes = new List<String>();
      private static final List<String> skuAttributes = new List<String>();
    
    public Corbels(){
        mappingAttributes.add('othMatParts_CorbelName');
        mappingAttributes.add('othMatParts_color');
         mappingAttributes.add('othMatParts_CorbelPart#');
         mappingAttributes.add('othMatParts_speciesPaintedWood');
         mappingAttributes.add('othMatParts_speciesStainedWood');

      skuAttributes.add('othMatParts_CorbSkuNumber');    
    }
        
 public List<Object> getSkuNumber(List<Object> custom_attributes){     
         
          integer i = 0;
        String corbelsName,corbelsPartNumber, color, stainedSpecies ,paintedSpecies , corbelsSkuNumber;
        while(i < custom_attributes.size()){
            Map<String, Object> customAttributeElement = (Map<String, Object>) custom_attributes.get(i);
            if(mappingAttributes.contains(String.valueOf(customAttributeElement.get('key')))){
                if(String.valueOf(customAttributeElement.get('key')).equals('othMatParts_CorbelName')){
                    corbelsName = String.valueOf(customAttributeElement.get('value'));
                }
                 if(String.valueOf(customAttributeElement.get('key')).equals('othMatParts_CorbelPart#')){
                    corbelsPartNumber = String.valueOf(customAttributeElement.get('value'));
                     
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
         
          if(corbelsName != null && color != null ){
            corbelsSkuNumber = SkuProductData.getOMPartsData(corbelsName,color,corbelsPartNumber,stainedSpecies,paintedSpecies);
        }
     i=0;
         while(i<custom_Attributes.size()){             
            Map<String, Object> customAttributeElement = (Map<String, Object>) custom_Attributes.get(i);
            if(skuAttributes.contains(String.valueOf(customAttributeElement.get('key')))){
                if(String.valueOf(customAttributeElement.get('key')).equals('othMatParts_CorbSkuNumber') && corbelsSkuNumber != null){
                    customAttributeElement.put('value', corbelsSkuNumber);
                }
            }  
            i++;
             
         }
         return custom_Attributes;
    }

}