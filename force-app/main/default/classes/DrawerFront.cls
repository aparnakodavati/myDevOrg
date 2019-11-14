public class DrawerFront implements SKUMapper {
    
    private static final List<String> mappingAttributes = new List<String>();
    private static final List<String> otherMappingAttributes = new List<String>();
    private static final List<String> skuAttributes = new List<String>();
    
    public DrawerFront(){
        mappingAttributes.add('df_modelName');
        mappingAttributes.add('df_doorColor');
        mappingAttributes.add('df_noPieces');
        mappingAttributes.add('df_series');
        mappingAttributes.add('df_speciesPaintedWood');
        mappingAttributes.add('df_speciesStainedWood');
        
        otherMappingAttributes.add('df_fg');
        otherMappingAttributes.add('df_distressing');
        otherMappingAttributes.add('df_glazeDF');  
        
        skuAttributes.add('df_skuNumber');
        skuAttributes.add('df_upcharge_numPieces_skuNumber');
        skuAttributes.add('df_fg_skuNumber');
        skuAttributes.add('skunumber_df_glazing');
        skuAttributes.add('df_distressing_skuNumber');
    }
    
    public List<Object> getSkuNumber(List<Object> customAtt){
        String modelName, color, serieName, stainedSpecies, paintedSpecies, numberOfPieces;
        String  dfFG , dfDistressing, dfGlazing ,df5piecesUpcharge;
        String dfSkuNumber, fgSkuNumber, distressingSkuNumber, glazingSkuNumber,upchargeSkuNumber;
        
        integer i = 0;
        while(i<customAtt.size()){
            Map<String, Object> customAttributeElement = (Map<String, Object>) customAtt.get(i);
            if(mappingAttributes.contains(String.valueOf(customAttributeElement.get('key')))){
                if(String.valueOf(customAttributeElement.get('key')).equals('df_modelName')){
                    modelName = String.valueOF(customAttributeElement.get('value'));  
                }
                if(String.valueOF(customAttributeElement.get('key')).equals('df_doorColor')){
                    color = String.valueOF(customAttributeElement.get('value'));
                }
                if(String.valueOF(customAttributeElement.get('key')).equals('df_noPieces')){
                    numberOfPieces = String.valueOF(customAttributeElement.get('value'));
                }
                
            }
            else if(otherMappingAttributes.contains(String.valueOf(customAttributeElement.get('key')))){
                if(String.valueOf(customAttributeElement.get('key')).equals('df_fg')){
                    dfFG = String.valueOf(customAttributeElement.get('value'));
                }
                if(String.valueOf(customAttributeElement.get('key')).equals('df_distressing')){
                    dfDistressing = String.valueOf(customAttributeElement.get('value'));
                }
                if(String.valueOf(customAttributeElement.get('key')).equals('df_glazeDf')){
                    dfGlazing = String.valueOf(customAttributeElement.get('value'));
                }
            }            
            i++;
            
            
        }
         if(modelName != null && numberOfPieces != null && color != null){
            dfSkuNumber = SkuProductData.getDrawerFrontsData(modelName,color,numberOfPieces);     
        }
        if(numberOfPieces != null && numberOfPieces.equals('5')){
            upchargeSkuNumber = SkuProductData.getDfUpchargeOf5pieces();
        }        
        if(dfFG != null && !dfFG.equals('false')){           
            fgSkuNumber = SkuProductData.getFgSkuNumber(); 
        }
        if(dfDistressing != null && !dfDistressing.equals('false')){
            distressingSkuNumber = SkuProductData.getDistressing();
        }
        if(dfGlazing != null && !dfGlazing.equals('false')){
            glazingSkuNumber = SkuProductData.getGlazing();
        }

        i = 0;
        while(i < customAtt.size()){                     
            Map<String, Object> customAttributeElement = (Map<String, Object>) customAtt.get(i);
            if(skuAttributes.contains(String.valueOf(customAttributeElement.get('key')))){
                String key = String.valueOf(customAttributeElement.get('key'));
                if(key.equals('df_skuNumber') && dfSkuNumber != null){
                    customAttributeElement.put('value', dfSkuNumber);
                }
                if(key.equals('df_fg_skuNumber') && fgSkuNumber != null){
                    customAttributeElement.put('value', fgSkuNumber);
                }
                if(key.equals('df_distressing_skuNumber') && distressingSkuNumber != null){
                    customAttributeElement.put('value', distressingSkuNumber);
                }
                if(key.equals('skunumber_df_glazing') && glazingSkuNumber != null){
                    customAttributeElement.put('value', glazingSkuNumber);
                }
                if(key.equals('df_upcharge_numPieces_skuNumber') && upchargeSkuNumber != null){
                    customAttributeElement.put('value', upchargeSkuNumber);
                }
            }
            i++;
        }
        return customAtt;
    }
}