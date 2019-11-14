public class SkuMappingDoors {
    public SkuMappingDoors(){}
    public Map<String, String> getDoorInfoAttributes(){
        Map<String, String> doorInfoAttibutes = new Map<String, String>();
        doorInfoAttibutes.put('door_ID', 'doorId');
        doorInfoAttibutes.put('door_location', 'location');
		doorInfoAttibutes.put('door_fg', 'fingerGrooves');
        doorInfoAttibutes.put('door_bore', 'boreLocation');
        doorInfoAttibutes.put('door_glassStyle', 'glassStyle');
        doorInfoAttibutes.put('door_notes', 'notes');
        return doorInfoAttibutes;
    }
    public Map<String, String> getToggleContainer(){
        Map<String, String> toggleAttributes = new Map<String, String>();
        toggleAttributes.put('door_distressing', 'glazeDoorDistressed');
        return toggleAttributes;
    }
    public Map<String, String> getDoorNumber(){
        Map<String, String> doorNumAttributes = new Map<String, String>();
        doorNumAttributes.put('door_Qty', 'number');
        return doorNumAttributes;
    } 
    public Map<String, String> getdoorInfoBoreUpFromBottom(){
        Map<String, String> boreUpFromBottomAttributes = new Map<String, String>();
		boreUpFromBottomAttributes.put('whole', 'whole');
        boreUpFromBottomAttributes.put('numerator', 'numerator');
        boreUpFromBottomAttributes.put('denominator', 'denominator');
        return boreUpFromBottomAttributes;
    }
    public Map<String, String> getdoorInfoBoreDownfromTop(){
        Map<String, String> boreDownfromTopAttributes = new Map<String, String>();
		boreDownfromTopAttributes.put('whole', 'whole');
        boreDownfromTopAttributes.put('numerator', 'numerator');
        boreDownfromTopAttributes.put('denominator', 'denominator');
        return boreDownfromTopAttributes;
    }
    public Map<String, String> getModelAtrributes(){
        Map<String, String> modelAttributes = new Map<String, String>();
        modelAttributes.put('door_modelName', 'modelName');
        modelAttributes.put('door_panelType', 'shapeName');
        modelAttributes.put('door_panelDesign', 'panelType');
        modelAttributes.put('door_part#','partNumber');
        modelAttributes.put('door_edgeId', 'edgeId');
        modelAttributes.put('door_frameId','frameId');
        modelAttributes.put('door_panelId', 'panelId');
        return modelAttributes;
    }
    public Map<String, String> getSelectionContainer(){
        Map<String, String> selectionAttributes = new Map<String, String>();
        selectionAttributes.put('door_type', 'selectedDoorType');
        selectionAttributes.put('door_painted_species', 'selectedDoorType');
        selectionAttributes.put('door_glassColor', 'selectedGlassColor');
        return selectionAttributes;
    }
    public Map<String, String> getSerieInSelectionContainer(){
        Map<String, String> serieAttributes = new Map<String, String>();
        serieAttributes.put('door_series', 'serieName');
        return serieAttributes;
    }
    public Map<String, String> getSpecieInSelectionContainer(){
        Map<String, String> specieAttributes = new Map<String, String>();
        specieAttributes.put('door_stained_species', 'specieName');
        return specieAttributes;
    }
    public Map<String, String> getCollectionInSelectionContainer(){
        Map<String, String> collectionAttributes = new Map<String, String>();
        collectionAttributes.put('door_collection', 'collectionName');
        return collectionAttributes;
    }
    public Map<String, String> getSelectedColor(){
        Map<String, String> colorAttributes = new Map<String, String>();
        colorAttributes.put('door_color', 'colorName');
        return colorAttributes;
    }
    public Map<String, String> getDoorWidth(){
        Map<String, String> widthAttributesDoor = new Map<String, String>();
        widthAttributesDoor.put('whole', 'whole');
        widthAttributesDoor.put('numerator', 'numerator');
        widthAttributesDoor.put('denominator', 'denominator');
        return widthAttributesDoor;
    }
    public Map<String, String> getDoorHeight(){
        Map<String, String> heightAttributesDoor = new Map<String, String>();
        heightAttributesDoor.put('whole', 'whole');
        heightAttributesDoor.put('numerator', 'numerator');
        heightAttributesDoor.put('denominator', 'denominator');
        return heightAttributesDoor;
    }
    public Map<String, String> getLites(){
        Map<String, String> litesAttributes = new Map<String, String>();
      	litesAttributes.put('door_lites', 'number');
        return litesAttributes;
    }
    public List<String> getSkuAttributes(){
        List<String> skuAttributes = new List<String>();
        skuAttributes.add('sku_door_distressing');
        skuAttributes.add('sku_door_fg');
        skuAttributes.add('sku_door_bore');
        skuAttributes.add('sku_door_lites');
        skuAttributes.add('door_skuNumber');
        return skuAttributes; 
    }
}