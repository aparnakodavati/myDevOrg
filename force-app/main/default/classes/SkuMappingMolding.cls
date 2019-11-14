public class SkuMappingMolding {
    public SkuMappingMolding(){}
   
    
      public Map<String,String> getMolding(){
        Map<String, String> moldingAttributes = new Map<String, String>();
          moldingAttributes.put('mold_type','type');   
        moldingAttributes.put('mold_name','name');   
        moldingAttributes.put('mold_partnumber','partNumber');
        return moldingAttributes;
    }
    
    
    public Map<String, String> getSelectionContainerMolding(){
        Map<String, String> selectionAttributesMolding = new Map<String, String>();
       selectionAttributesMolding.put('mold_speciesPaintedWood', 'selectedDoorType');
        return selectionAttributesMolding;
    }
    public Map<String, String> getSerieInSelectionContainerMolding(){
        Map<String, String> serieAttributesMolding = new Map<String, String>();
        serieAttributesMolding.put('mold_series', 'serieName');
        return serieAttributesMolding;
    }
    public Map<String, String> getSpecieInSelectionContainerMolding(){
        Map<String, String> specieAttributesMolding = new Map<String, String>();
        specieAttributesMolding.put('mold_speciesStainedWood', 'specieName');
        return specieAttributesMolding;
    }
   
    public Map<String, String> getSelectedColorMolding(){
        Map<String, String> colorAttributesMolding = new Map<String, String>();
        colorAttributesMolding.put('mold_color', 'colorName');
        return colorAttributesMolding;
    }
    
   public Map<String,String> getMoldingQty(){
        Map<String, String> moldingQtyAttributes = new Map<String, String>();
        moldingQtyAttributes.put('mold_qty','number');   
        return moldingQtyAttributes;
    }
   public List<String> getSkuAttributesMolding(){
        List<String> skuAttributesMolding = new List<String>();
        skuAttributesMolding.add('mold_skuNumber');
        return skuAttributesMolding; 
    }  
}