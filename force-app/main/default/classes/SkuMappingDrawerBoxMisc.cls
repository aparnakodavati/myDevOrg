public class SkuMappingDrawerBoxMisc {

    public SkuMappingDrawerBoxMisc(){}
    
     public Map<String, String> getDrawerBoxMiscAttributes(){
        Map<String, String> drawerBoxMiscAttributes = new Map<String, String>();
        drawerBoxMiscAttributes.put('dbmisc_name','name');   
        drawerBoxMiscAttributes.put('dbmisc_description','description');
         drawerBoxMiscAttributes.put('dbmisc_part#','partNumber');
         drawerBoxMiscAttributes.put('dbmisc_quantity','qty');
        return drawerBoxMiscAttributes;
    }
    public List<String> dbMiscSkuNumberAttributes(){
        List<String> dbMiscSkuAtt = new List<String>();
        dbMiscSkuAtt.add('dbmisc_skuNumber');
        return dbMiscSkuAtt;
    }
    
}