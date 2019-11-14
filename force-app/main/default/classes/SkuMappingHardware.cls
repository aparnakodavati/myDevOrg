public class SkuMappingHardware {
    public SkuMappingHardware(){
        
    }
   public Map<String,String> getHardwareHinges(){
        Map<String, String> hingesAttributes = new Map<String, String>();
          hingesAttributes.put('hardware_hingesName','name');   
        hingesAttributes.put('hardware_hingeType ','hingeRecordType');   
        hingesAttributes.put('hardware_hingesPart#','partNumber');
       hingesAttributes.put('hardware_hingesAccpcc#','itemNumber');
        return hingesAttributes;
    }
    public Map<String,String> getHardwarePulls(){
        Map<String, String> pullsAttributes = new Map<String, String>();
          pullsAttributes.put('hardware_pullsPart#','partNumber');   
        pullsAttributes.put('hardware_pullsName ','name');   
        pullsAttributes.put('hardware_pullsType','type');
       pullsAttributes.put('hardware_pullsHW#','hwNumber');
        return pullsAttributes;
    }
     public Map<String,String> getHardwareDrawerGlides(){
        Map<String, String> drawerGlidesAttributes = new Map<String, String>();
          drawerGlidesAttributes.put('hardware_glideType','glideRecordtype');   
        drawerGlidesAttributes.put('hardware_glidesName ','name');   
        drawerGlidesAttributes.put('hardware_glidesPart#','partNumber');
       drawerGlidesAttributes.put('hardware_glidesAccpcc#','itemNumber');
        return drawerGlidesAttributes;
    }
    
      public Map<String,String> getPullsQty(){
        Map<String, String> pullsQtyAttributes = new Map<String, String>();
        pullsQtyAttributes.put('hardware_pullsQuantity','number');   
        return pullsQtyAttributes;
    }
    public Map<String,String> getHingesQty(){
        Map<String, String> hingesQtyAttributes = new Map<String, String>();
        hingesQtyAttributes.put('hardware_hingesQuantity','number');   
        return hingesQtyAttributes;
    }
    public Map<String,String> getGlidesQty(){
        Map<String, String> glidesQtyAttributes = new Map<String, String>();
        glidesQtyAttributes.put('hardware_glidesQuantity','number');   
        return glidesQtyAttributes;
    }
    public List<String> getSkuAttributesHardware(){
        List<String> skuAttributesHardware = new List<String>();
        skuAttributesHardware.add('hardware_skuNumber');
        return skuAttributesHardware; 
    }  
}