public class SkuMappingPaneling {
    public SkuMappingPaneling (){}
    
    
    
     public Map<String,String> getPanelingLocationFacing(){
        Map<String, String> panelingLocationFacingAttribute = new Map<String, String>();
        panelingLocationFacingAttribute.put('paneling_locationFacing','location'); 
        return panelingLocationFacingAttribute;
    }
    public Map<String,String> getPanelingLocationEnds(){
        Map<String, String> panelingLocationEndsAttribute = new Map<String, String>();
        panelingLocationEndsAttribute.put('paneling_locationEnds','location'); 
        return panelingLocationEndsAttribute;
    }
    
      public Map<String, String> getSelectionContainerPaneling(){
        Map<String, String> selectionAttributesPaneling = new Map<String, String>();
       selectionAttributesPaneling.put('paneling_speciesPaintedWood', 'selectedDoorType');
        return selectionAttributesPaneling;
    } 
     public Map<String, String> getSerieInSelectionContainerPanelings(){
        Map<String, String> serieAttributesPaneling= new Map<String, String>();
        serieAttributesPaneling.put('paneling_series', 'serieName');
        return serieAttributesPaneling;
    }
    public Map<String, String> getSpecieInSelectionContainerPaneling(){
        Map<String, String> serieAttributesPaneling = new Map<String, String>();
        serieAttributesPaneling.put('paneling_speciesStainedWood', 'specieName');
        return serieAttributesPaneling;
    }
   
    public Map<String, String> getSelectedColorPaneling(){
        Map<String, String> colorAttributesPaneling = new Map<String, String>();
        colorAttributesPaneling.put('paneling_color', 'colorName');
        return colorAttributesPaneling;
    }
    public Map<String, String> getMaterialEndPaneling(){
        Map<String, String> materialEndPaneling = new Map<String, String>();
        materialEndPaneling.put('paneling_ MaterialEnds', 'selectedEndPanel');
        return materialEndPaneling;
    }
    public Map<String, String> getMaterialFrontPaneling(){
        Map<String, String> materialFrontPaneling = new Map<String, String>();
        materialFrontPaneling.put('paneling_MaterialFacing', 'selectedFrontFace');
        return materialFrontPaneling;
    }
    
 
    public Map<String,String> getFacingQty(){
        Map<String, String> panelingFacingQtyAttributes = new Map<String, String>();
        panelingFacingQtyAttributes.put('paneling_qtyFacing','number');   
        return panelingFacingQtyAttributes;
    }
    
     public Map<String, String> getMeasurementPaneling(){
        Map<String, String> measurment = new Map<String, String>();
        measurment.put('whole', 'whole');
        measurment.put('numerator', 'numerator');
        measurment.put('denominator', 'denominator');
        return measurment;
    }
    public Map<String,String> getEndsQty(){
        Map<String, String> panelingQtyAttributesEnds = new Map<String, String>();
        panelingQtyAttributesEnds.put('paneling_qtyFacing','number');   
        return panelingQtyAttributesEnds;
    }
    
    
    public List<String> getSkuAttFacingPaneling(){
        List<String> skuAttributesPaneling = new List<String>();
        skuAttributesPaneling.add('paneling_FacingSkuNumber');
        return skuAttributesPaneling; 
    }  
    
     public List<String> getSkuAttEndsPaneling(){
        List<String> skuAttributesPaneling = new List<String>();
        skuAttributesPaneling.add('paneling_EndsSkuNumber');

        return skuAttributesPaneling; 
    }  
    
}