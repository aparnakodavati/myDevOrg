public class SkuMappingDrawerFronts {
    public SkuMappingDrawerFronts(){}    
    public Map<String, String> getDrawerFrontItemAttributes(){
        Map<String, String> drawerFrontItemAttibutes = new Map<String, String>();
        drawerFrontItemAttibutes.put('df_modelName','modelName');
        drawerFrontItemAttibutes.put('df_part#','partNumber');
        drawerFrontItemAttibutes.put('df_noPieces','dfNumberPieces');
        return drawerFrontItemAttibutes;
    }
    public Map<String, String> getDrawerFrontAttributes(){
        Map<String, String> drawerFrontAttibutes = new Map<String, String>();
        drawerFrontAttibutes.put('df_serialID','drawerId');
        drawerFrontAttibutes.put('df_fg','fingerGroove');
        drawerFrontAttibutes.put('df_dfGrain','grainDirection');
        drawerFrontAttibutes.put('df_notes','notes');        
        return drawerFrontAttibutes;
    }   
    public Map<String, String> getDfSelectionContainer(){
        Map<String, String> selectionAttributesDf = new Map<String, String>();
        selectionAttributesDf.put('df_drawerType', 'selectedDoorType');
        selectionAttributesDf.put('df_speciesPaintedWood', 'selectedDoorType');
        return selectionAttributesDf;
    }
    public Map<String, String> getDfSpecieInSelectionContainer(){
        Map<String, String> specieAttributes = new Map<String, String>();
        specieAttributes.put('df_speciesStainedWood', 'specieName');
        return specieAttributes;
    }
    public Map<String, String> getDfSerieInSelectionContainer(){
        Map<String, String> serieAttributes = new Map<String, String>();
        serieAttributes.put('df_series', 'serieName');
        return serieAttributes;
    }
    public Map<String, String> getDfCollectionName(){
        Map<String, String> collectionAttributes = new Map<String, String>();
        collectionAttributes.put('df_collection', 'collectionName');
        return collectionAttributes;
    }
    public Map<String, String> getDfSelectedColor(){
        Map<String, String> colorAttributesDf = new Map<String, String>();
        colorAttributesDf.put('df_doorColor', 'colorName');
        return colorAttributesDf;
    }
    public Map<String, String> getDfWidth(){
        Map<String, String> widthAttributesDf = new Map<String, String>();
        widthAttributesDf.put('whole', 'whole');
        widthAttributesDf.put('numerator', 'numerator');
        widthAttributesDf.put('denominator', 'denominator');
        return widthAttributesDf;
    }
    public Map<String, String> getDfHeight(){
        Map<String, String> heightAttributesDf = new Map<String, String>();
        heightAttributesDf.put('whole', 'whole');
        heightAttributesDf.put('numerator', 'numerator');
        heightAttributesDf.put('denominator', 'denominator');
        return heightAttributesDf;
    }
    public List<String> getDfSkuAttributes(){
        List<String> listOfSkuAtt = new List<String>();
        listOfSkuAtt.add('df_skuNumber');
        listOfSkuAtt.add('df_upcharge_numPieces_skuNumber');
        listOfSkuAtt.add('df_distressing_skuNumber');
        listOfSkuAtt.add('df_fg_skuNumber');
        return listOfSkuAtt;
    }
}