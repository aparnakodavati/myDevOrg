public class SkuMappingGlaze {
    public SkuMappingGlaze(){}
    public Map<String, String> getToggleContainerAttributes(){
        Map<String, String> toggleAttributes = new Map<String, String>();
        toggleAttributes.put('glazing_feathered', 'glazeDoorFeathered');
        toggleAttributes.put('glazing_glazeDf', 'glazeDF');
        toggleAttributes.put('glazing_molding', 'glazeMolding');
        return toggleAttributes;
    }
    public Map<String, String> getGlazeSelectionContainer(){
        Map<String, String> glazeAtt = new Map<String, String>();
        glazeAtt.put('glaze_color', 'selectedGlazeColor');
        return glazeAtt;
    }
    public List<String> getSkuGlazing(){
    	List<String> skuGlazingAtt = new List<String>();
        skuGlazingAtt.add('glazing_skuNumber');
        return skuGlazingAtt;
    }
}