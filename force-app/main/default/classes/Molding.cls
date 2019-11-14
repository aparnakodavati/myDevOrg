public class Molding implements SkuMapper{

      private static final List<String> mappingAttributes = new List<String>();
      private static final List<String> skuAttributes = new List<String>();
    
    public Molding(){
        mappingAttributes.add('mold_partnumber');
        mappingAttributes.add('mold_color');
         mappingAttributes.add('mold_type');
         mappingAttributes.add('mold_speciesStainedWood');
         mappingAttributes.add('mold_speciesPaintedWood');

      skuAttributes.add('mold_skuNumber');    
    }
    
        public List<Object> getSkuNumber(List<Object> custom_attributes){
            integer i = 0;
        String moldingType,partNumber, color, stainedSpecies ,paintedSpecies , moldingSkuNumber;
        while(i < custom_attributes.size()){
            Map<String, Object> customAttributeElement = (Map<String, Object>) custom_attributes.get(i);
            if(mappingAttributes.contains(String.valueOf(customAttributeElement.get('key')))){
                if(String.valueOf(customAttributeElement.get('key')).equals('mold_type')){
                    moldingType = String.valueOf(customAttributeElement.get('value'));
                }
                 if(String.valueOf(customAttributeElement.get('key')).equals('mold_partnumber')){
                    partNumber = String.valueOf(customAttributeElement.get('value'));
                }
                 if(String.valueOf(customAttributeElement.get('key')).equals('mold_color')){
                    color = String.valueOf(customAttributeElement.get('value'));

                }
                if(String.valueOf(customAttributeElement.get('key')).equals('mold_speciesStainedWood')){
                    stainedSpecies = String.valueOf(customAttributeElement.get('value'));

                }
                if(String.valueOf(customAttributeElement.get('key')).equals('mold_speciesPaintedWood')){
                    paintedSpecies = String.valueOf(customAttributeElement.get('value'));

                }
            } 
            i++;
        }
            if(moldingType != null && partNumber != null && color != null ){
            moldingSkuNumber = SkuProductData.getMoldingsData(moldingType,color,partNumber,stainedSpecies,paintedSpecies);
        }
            
             i = 0;
        while(i < custom_attributes.size()){
            Map<String, Object> customAttributeElement = (Map<String, Object>) custom_attributes.get(i);
            if(skuAttributes.contains(String.valueOf(customAttributeElement.get('key')))){
                if(String.valueOf(customAttributeElement.get('key')).equals('mold_skuNumber') && moldingSkuNumber != null){
                    customAttributeElement.put('value', moldingSkuNumber);
                }
            }
            i++;
        }          
           return custom_attributes;
         
        }
    
}