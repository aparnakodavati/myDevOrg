public class Paneling implements SKUMapper{
 private static final List<String> mappingAttributes = new List<String>();
      private static final List<String> skuAttributes = new List<String>();
    
    public Paneling(){
        mappingAttributes.add('paneling_locationFacing');
        mappingAttributes.add('paneling_locationEnds');
         mappingAttributes.add('paneling_color');
         mappingAttributes.add('paneling_MaterialFacing');
         mappingAttributes.add('paneling_MaterialEnds');

      skuAttributes.add('paneling_FacingSkuNumber');
        skuAttributes.add('paneling_EndsSkuNumber');
    }
    
    
      public List<Object> getSkuNumber(List<Object> custom_attributes) {
             integer i = 0;
        String materialEnds, materialFacing , locationEnds , locationFacing , color , panelingEndsSkuNumber , panelingFacingSkuNumber;
        while(i < custom_attributes.size()){
            Map<String, Object> customAttributeElement = (Map<String, Object>) custom_attributes.get(i);
            if(mappingAttributes.contains(String.valueOf(customAttributeElement.get('key')))){
                if(String.valueOf(customAttributeElement.get('key')).equals('paneling_MaterialEnds')){
                    materialEnds = String.valueOf(customAttributeElement.get('value'));
                }
            }
            if(mappingAttributes.contains(String.valueOf(customAttributeElement.get('key')))){
                if(String.valueOf(customAttributeElement.get('key')).equals('paneling_MaterialFacing')){
                    materialFacing = String.valueOf(customAttributeElement.get('value'));

                }
            }
            if(mappingAttributes.contains(String.valueOf(customAttributeElement.get('key')))){
                if(String.valueOf(customAttributeElement.get('key')).equals('paneling_locationEnds')){
                    locationEnds = String.valueOf(customAttributeElement.get('value'));

                }
            }
            if(mappingAttributes.contains(String.valueOf(customAttributeElement.get('key')))){
                if(String.valueOf(customAttributeElement.get('key')).equals('paneling_locationFacing')){
                    locationFacing = String.valueOf(customAttributeElement.get('value'));

                }
            }
            if(mappingAttributes.contains(String.valueOf(customAttributeElement.get('key')))){
                if(String.valueOf(customAttributeElement.get('key')).equals('paneling_color')){
                    color = String.valueOf(customAttributeElement.get('value'));
                 }
            } 
            i++;
        }
           //panelingEndsSkuNumber = SkuProductData.getPanelingData(materialEnds,locationEnds, color);

            //panelingFacingSkuNumber = SkuProductData.getPanelingData(materialFacing,locationFacing,color);
          
         i=0;
         while(i<custom_Attributes.size()){
            Map<String, Object> customAttributeElement = (Map<String, Object>) custom_Attributes.get(i);
            if(skuAttributes.contains(String.valueOf(customAttributeElement.get('key')))){
                if(String.valueOf(customAttributeElement.get('key')).equals('paneling_FacingSkuNumber') && panelingFacingSkuNumber != null){     
                    customAttributeElement.put('value', panelingFacingSkuNumber);
                }
                else if(String.valueOf(customAttributeElement.get('key')).equals('paneling_EndsSkuNumber') && panelingEndsSkuNumber != null){     
                    customAttributeElement.put('value', panelingEndsSkuNumber);


                }
            }  
            i++;
             
         }
         return custom_Attributes;
    }

}