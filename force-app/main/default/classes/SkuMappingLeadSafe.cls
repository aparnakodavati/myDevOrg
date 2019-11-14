public class SkuMappingLeadSafe {
    public SkuMappingLeadSafe() {}
    
     public Map<String, String> getLeadSafeAttributes(){
        Map<String, String> leadSafeAttributes = new Map<String, String>();
        leadSafeAttributes.put('leadSafe_Name','name');   
        leadSafeAttributes.put('leadSafe_Description','description');
         leadSafeAttributes.put('leadSafe_UOM','UOM');
         leadSafeAttributes.put('leadSafe_qty','qty');
        return leadSafeAttributes;
    }
    public List<String> leadSafeSkuNumberAttributes(){
        List<String> leadSafeSkuAtt = new List<String>();
        leadSafeSkuAtt.add('leadSafe_skuNumber');
        return leadSafeSkuAtt;
    }

}