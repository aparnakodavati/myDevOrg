public class SkuMappingOtherMaterialParts {
    public SkuMappingOtherMaterialParts(){}
    
    public Map<String, String> getSelectionContainerOthMatParts(){
        Map<String, String> selectionAttributesOthMatParts = new Map<String, String>();
        selectionAttributesOthMatParts.put('othMatParts_speciesPaintedWood', 'selectedDoorType');
        return selectionAttributesOthMatParts;
    }
    public Map<String, String> getCollectionInSelectionContainer(){
        Map<String, String> collectionAttributesOthMatParts = new Map<String, String>();
        collectionAttributesOthMatParts.put('othMatParts_collection', 'collectionName');
        return collectionAttributesOthMatParts;
    }    
    public Map<String, String> getSerieInSelectionContainerOthMatParts(){
        Map<String, String> serieAttributesOthMatParts = new Map<String, String>();
        serieAttributesOthMatParts.put('othMatParts_series', 'serieName');
        return serieAttributesOthMatParts;
    }
    public Map<String, String> getSpecieInSelectionContainerOthMatParts(){
        Map<String, String> serieAttributesOthMatParts = new Map<String, String>();
        serieAttributesOthMatParts.put('othMatParts_speciesStainedWood', 'specieName');
        return serieAttributesOthMatParts;
    }   
    public Map<String, String> getSelectedColorOthMatParts(){
        Map<String, String> colorAttributesOthMatParts = new Map<String, String>();
        colorAttributesOthMatParts.put('othMatParts_color', 'colorName');
        return colorAttributesOthMatParts;
    } 
    public Map<String, String> getValences(){
        Map<String, String> valencesAttributes = new Map<String, String>();
        valencesAttributes.put('othMatParts_ValenceName','item');   
        valencesAttributes.put('othMatParts_ValPart#','partNumber');
        return valencesAttributes;
    }   
    public Map<String, String> getMeasurements(){
        Map<String, String> measureAttributes = new Map<String, String>();
        measureAttributes.put('whole', 'whole');
        measureAttributes.put('numerator', 'numerator');
        measureAttributes.put('denominator', 'denominator');
        return measureAttributes;
    }
    public Map<String, String> getValenceQty(){
        Map<String, String> valenceQtyAttributes = new Map<String, String>();
        valenceQtyAttributes.put('othMatParts_ValenceQty','number');   
        return valenceQtyAttributes;
    }    
    public Map<String, String> getCorbels(){
        Map<String, String> corbelsAttributes = new Map<String, String>();
        corbelsAttributes.put('othMatParts_CorbelName','description');   
        corbelsAttributes.put('othMatParts_CorbelPart#','partNo');
        return corbelsAttributes;
    }
    public Map<String, String> getCorbelQty(){
        Map<String, String> corbelQtyAttributes = new Map<String, String>();
        corbelQtyAttributes.put('othMatParts_Corbelqty','number');   
        return corbelQtyAttributes;
    }
    public Map<String, String> getAddOns(){
        Map<String, String> addOnsAttributes = new Map<String, String>();
        addOnsAttributes.put('othMatParts_AddOnName','accessoryName');   
        addOnsAttributes.put('othMatParts_AddOnPart#','partNumber');
        return addOnsAttributes;
    }
    public Map<String, String> getAddOnsQty(){
        Map<String, String> AddOnsQtyAttributes = new Map<String, String>();
        AddOnsQtyAttributes.put('othMatParts_Addonqty','number');   
        return AddOnsQtyAttributes;
    }
    public List<String> getSkuAttributesOthMatParts(){
        List<String> skuAttributesOthMatParts = new List<String>();
        skuAttributesOthMatParts.add('othMatParts_ValSkuNumber');
        skuAttributesOthMatParts.add('othMatParts_CorbSkuNumber');
        skuAttributesOthMatParts.add('othMatParts_AddonSkuNumber');
        return skuAttributesOthMatParts; 
    }  
    
}