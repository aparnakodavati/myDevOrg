public class SkuMappingDrawerBox {
    public SkuMappingDrawerBox(){}
    
    
     public Map<String, String> getDrawerBoxAtrributes(){
        Map<String, String> drawerBoxAttributes = new Map<String, String>();
        drawerBoxAttributes.put('db_id', 'drawerId');
        drawerBoxAttributes.put('db_fg', 'fingerGroove');
        drawerBoxAttributes.put('db_notch', 'notch');
        drawerBoxAttributes.put('db_qty', 'qty');
        return drawerBoxAttributes;
    }
    
    public Map<String, String> getPullOutsAtrributes(){
        Map<String, String> pullOutsAttributes = new Map<String, String>();
        pullOutsAttributes.put('db_id', 'drawerId');
        pullOutsAttributes.put('db_fg', 'fingerGroove');
        pullOutsAttributes.put('db_notch', 'notch');
        pullOutsAttributes.put('db_qty', 'qty');
        return pullOutsAttributes;
    }
    
     public Map<String, String> getDrawerBoxDimensions(){
        Map<String, String> DrawerBoxDimenAttributes = new Map<String, String>();
        DrawerBoxDimenAttributes.put('whole', 'whole');
        DrawerBoxDimenAttributes.put('numerator', 'numerator');
        DrawerBoxDimenAttributes.put('denominator', 'denominator');
        return DrawerBoxDimenAttributes;
    }
    public List<String> getDrawerBoxSkuAttributes(){
        List<String> skuAttributes = new List<String>();
        skuAttributes.add('db_skuNumber');
        skuAttributes.add('pullouts_skuNumber');
        skuAttributes.add('db_fg_sku');
        skuAttributes.add('db_pullouts_fg_sku');
        return skuAttributes; 
    }
    
    
}