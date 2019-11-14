public class SkuMappingShelves {
    public SkuMappingShelves(){}
    
    public Map<String, String> finishedShelvesAccAttributes(){
        Map<String, String> finishedShelvesAccAtt = new Map<String, String>();
        finishedShelvesAccAtt.put('shelves_FinishedShelvesAccesory', 'accessoryName');
        finishedShelvesAccAtt.put('shelves_FinishedShelvespart#', 'partNumber');
        return finishedShelvesAccAtt;
    }
    public Map<String, String> plywoodShelvesAccAttributes(){
        Map<String, String> plywoodShelvesAccAtt = new Map<String, String>();
        plywoodShelvesAccAtt.put('shelves_PlywoodShelvesAccesory', 'accessoryName');
        plywoodShelvesAccAtt.put('shelves_PlywoodShelvespart#', 'partNumber');
        return plywoodShelvesAccAtt;
    }
    
          public Map<String, String> getSelectionContainerShelves(){
        Map<String, String> selectionAttributesShelves = new Map<String, String>();
       selectionAttributesShelves.put('shelves_SpeciesPaintedWood', 'selectedDoorType');
        return selectionAttributesShelves;
    } 
     public Map<String, String> getSerieInSelectionContainerShelves(){
        Map<String, String> serieAttributesShelves= new Map<String, String>();
        serieAttributesShelves.put('shelves_series', 'serieName');
        return serieAttributesShelves;
    }
    public Map<String, String> getSpecieInSelectionContainerShelves(){
        Map<String, String> serieAttributesShelves = new Map<String, String>();
        serieAttributesShelves.put('shelves_speciesStainedWood', 'specieName');
        return serieAttributesShelves;
    }
   
    public Map<String, String> getSelectedColorShelves(){
        Map<String, String> colorAttributesShelves = new Map<String, String>();
        colorAttributesShelves.put('shelves_color', 'colorName');
        return colorAttributesShelves;
    }
     public Map<String, String> getMeasurementShelves(){
        Map<String, String> measurmentShelves = new Map<String, String>();
        measurmentShelves.put('whole', 'whole');
        measurmentShelves.put('numerator', 'numerator');
        measurmentShelves.put('denominator', 'denominator');
        return measurmentShelves;
    }
     public Map<String,String> getFinishedShelvesQty(){
        Map<String, String> finishedShelvesAttributes = new Map<String, String>();
        finishedShelvesAttributes.put('shelves_FinishedShelvesQty','number');   
        return finishedShelvesAttributes;
    }
    
    public Map<String,String> getPlywoodShelvesQty(){
        Map<String, String> plywoodShelvesAttributes = new Map<String, String>();
        plywoodShelvesAttributes.put('shelves_PlywoodShelvesQty','number');   
        return plywoodShelvesAttributes;
    }
     public List<String> getSkuAttfinishedShelves(){
        List<String> skuAttributesFinishedShelves = new List<String>();
        skuAttributesFinishedShelves.add('finishedShelves_SkuNumber');
        return skuAttributesFinishedShelves; 
    }  
    public List<String> getSkuAttPlywoodShelves(){
        List<String> skuAttributesPlywoodShelves = new List<String>();
        skuAttributesPlywoodShelves.add('plywoodShelves_SkuNumber');
        return skuAttributesPlywoodShelves; 
    }  
    
    
}