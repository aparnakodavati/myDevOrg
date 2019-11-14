public class Shelves implements SKUMapper{

    
      private static final List<String> mappingAttributes = new List<String>();
      private static final List<String> skuAttributes = new List<String>();
    
    public Shelves(){
        mappingAttributes.add('shelves_FinishedShelvesAccesory');
        mappingAttributes.add('shelves_PlywoodShelvesAccesory');
         mappingAttributes.add('shelves_color');
         mappingAttributes.add('shelves_FinishedShelvespart#');
         mappingAttributes.add('shelves_PlywoodShelvespart#');

      skuAttributes.add('finishedShelves_SkuNumber');
        skuAttributes.add('plywoodShelves_SkuNumber');
    }
   public List<Object> getSkuNumber(List<Object> custom_attributes) {
             integer i = 0;
        String finishedShelves, plywoodShevels, finishedPartNum, plywoodPartNum , color , finishedShelveSkuNumber , plywoodShelvesSkuNumber;
        while(i < custom_attributes.size()){
            Map<String, Object> customAttributeElement = (Map<String, Object>) custom_attributes.get(i);
            if(mappingAttributes.contains(String.valueOf(customAttributeElement.get('key')))){
                if(String.valueOf(customAttributeElement.get('key')).equals('shelves_FinishedShelvesAccesory')){
                    finishedShelves = String.valueOf(customAttributeElement.get('value'));
                }
                 if(String.valueOf(customAttributeElement.get('key')).equals('shelves_PlywoodShelvesAccesory')){
                    plywoodShevels = String.valueOf(customAttributeElement.get('value'));
                }
                 if(String.valueOf(customAttributeElement.get('key')).equals('shelves_color')){
                    color = String.valueOf(customAttributeElement.get('value'));
                }
                if(String.valueOf(customAttributeElement.get('key')).equals('shelves_FinishedShelvespart#')){
                    finishedPartNum = String.valueOf(customAttributeElement.get('value'));
                }
                if(String.valueOf(customAttributeElement.get('key')).equals('shelves_PlywoodShelvespart#')){
                    plywoodPartNum = String.valueOf(customAttributeElement.get('value'));
                }
            } 
            i++;
        } 
       if(finishedShelves != null && color != null && finishedPartNum != null ){
            finishedShelveSkuNumber = SkuProductData.getFinishedShelvesData(finishedShelves,color,finishedPartNum);
        }
       
       if(plywoodShevels != null && color != null && plywoodPartNum != null ){
           plywoodShelvesSkuNumber = SkuProductData.getPlywoodShelvesData(plywoodShevels,color,plywoodPartNum);
        }
                    i = 0;
        while(i < custom_attributes.size()){
            Map<String, Object> customAttributeElement = (Map<String, Object>) custom_attributes.get(i);
            if(skuAttributes.contains(String.valueOf(customAttributeElement.get('key')))){
                if(String.valueOf(customAttributeElement.get('key')).equals('finishedShelves_SkuNumber') && finishedShelveSkuNumber != null){
                    customAttributeElement.put('value', finishedShelveSkuNumber);
                }
            }
             if(skuAttributes.contains(String.valueOf(customAttributeElement.get('key')))){
                if(String.valueOf(customAttributeElement.get('key')).equals('plywoodShelves_SkuNumber') && plywoodShelvesSkuNumber != null){
                    customAttributeElement.put('value', plywoodShelvesSkuNumber);
                }
            }
            i++;
        }             
           return custom_attributes;  
     
            
        }
}