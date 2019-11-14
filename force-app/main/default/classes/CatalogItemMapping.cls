public class CatalogItemMapping {

    private Map<String, Set<String>> productTypeAttributesMap = null;
    private Map<String, Map<KeyValuePair, Set<String>>> catalogItemAttributesMap = null;
    private Map<String, Set<String>> catalogItemNameSKUNumberMap = null;
    
    private boolean debug = false;
    
    public void enableDebug() {
        this.debug = true;
    }
    
    public void disableDebug() {
        this.debug = false;
    }
    
    public class KeyValuePair {
        public String attributeName = null, attributeValue = null;
        
        public KeyValuePair(String k, String v) {
            attributeName  = k;
            attributeValue = v;
        }

        public Boolean equals(Object obj) {
            if(obj instanceof KeyValuePair && obj != null) {
                KeyValuePair p = (KeyValuePair)obj;
                return (this.attributeName == p.attributeName && this.attributeValue == p.attributeValue);
            }
            return false;
        }
        
        public Integer hashCode() {
            integer value = 17;
            value = 31 * value + (attributeName == null ? 0 : attributeName.hashCode());
            value = 31 * value + (attributeValue == null ? 0 : attributeValue.hashCode());
            return value;
        }
    }
    
    public CatalogItemMapping() {
        loadAllProductTypesAndAttributes();
        loadAllCatalogItemMappings();
        loadAllCatalogItemNameSKUNumbers();
    }
    
    public List<CatalogItemAttribute> getAllCatalogItemAttributesByProductTypeName(String productTypeName) {
        Map<KeyValuePair, Set<String>> dataMap = catalogItemAttributesMap.get(productTypeName);
        if(dataMap == null || dataMap.size() == 0) {
            return null;
        }
        List<CatalogItemAttribute> resultList = new List<CatalogItemAttribute>();
        for(KeyValuePair pair : dataMap.keySet()) {
            // do not return the cache collection refernces as is. 
            // Instead, create a new object, copy data and return the collection.
            Set<String> s = dataMap.get(pair);
            Set<String> newSet = new Set<String>();
            if(s != null) {
                newSet.addAll(s);
            }
            resultList.add(new CatalogItemAttribute(pair.attributeName, pair.attributeValue, newSet));
        }
        return resultList;
    }
    
    public Set<String> findAttributesByProductType(String productTypeName) {
        Set<String> attributeSet = productTypeAttributesMap.get(productTypeName);
        if(debug) {
            System.debug('findAttributesByProductType: The applicable attribute names for the given ProductTypeName <' + productTypeName + '> are: ' + attributeSet);
        }
        // return null if no attributes are found for the given ProductTypeName
        if(attributeSet == null || attributeSet.size() == 0) {
            return null;
        }
        return new Set<String>(attributeSet);
    }
    
    public String findCatalogItem(String productTypeName, Map<String, String> inputAttributesMap) {
        // return null if input data is invalid
        if(productTypeName == null || !productTypeAttributesMap.keySet().contains(productTypeName)
           || inputAttributesMap == null || inputAttributesMap.size() == 0) {
               if(debug) {
                   System.debug('findCatalogItem: Invalid input data: ProductTypeName = ' + productTypeName + ', InputAttributesMap = ' + inputAttributesMap);
               }
               return null;
        }
            
        // convert input attributes into Pairs for faster retrival from Map.
        List<KeyValuePair> inputPairList =  new List<KeyValuePair>();
        for(String key : inputAttributesMap.keySet()) {
            inputPairList.add(new KeyValuePair(key, inputAttributesMap.get(key)));
        }

        Map<KeyValuePair, Set<String>> tempMap = catalogItemAttributesMap.get(productTypeName);  
        if(tempMap == null) {
            if(debug) {
                System.debug('findCatalogItem: Mapping Attributes does not exist for given ProductTypeName : ' + productTypeName);
            }
            return null;
        }
        List<String> applicableCatalogItemNames =  new List<String>();
        for(KeyValuePair inputPair : inputPairList) {
            Set<String> tempSet = tempMap.get(inputPair);
            if(tempSet != null) {
                applicableCatalogItemNames.addAll(tempSet);
            }
        }
        
        return filterCatalogItems(inputAttributesMap.size(), applicableCatalogItemNames);
    }
    
    public Set<String> findSKUsByCatalogItem(String catalogItemName) {
        Set<String> tempSet = catalogItemNameSKUNumberMap.get(catalogItemName);
        
        // return null if no SKUs are found for the given CatalogItemName
        if(tempSet == null || tempSet.size() == 0) {
            return null;
        }
        
        Set<String> skuSet = new Set<String>();
        skuSet.addAll(tempSet);
        return skuSet;
    }

    
    private void loadAllProductTypesAndAttributes() {
        productTypeAttributesMap = new Map<String, Set<String>>();
        
        List<Product_Type_Attributes__c> productList = [SELECT Product_TypeID__r.Name__c, Attribute_Name__c 
                                                            FROM Product_Type_Attributes__c];
                
        if(productList == null || productList.size() == 0) {
            System.debug('ProductType-AttributeNames data does not exist in the database.');
            return;
        }
        
        for(Product_Type_Attributes__c obj : productList) {
            String productTypeName = obj.Product_TypeID__r.Name__c;
            String attributeName   = obj.Attribute_Name__c;
            
            Set<String> attributeSet = productTypeAttributesMap.get(productTypeName);
            if(attributeSet == null) {
                attributeSet = new Set<String>();
                productTypeAttributesMap.put(productTypeName, attributeSet);
            }
            attributeSet.add(attributeName);
        }
    }
    
    private void loadAllCatalogItemMappings() {
        catalogItemAttributesMap = new Map<String, Map<KeyValuePair, Set<String>>>();
        
        Set<String> productTypeNames = productTypeAttributesMap.keySet();
        for(String productTypeName : productTypeNames) {
            
            List<CatalogItem_Attributes_Mapping__c> tempList = 
                        [SELECT Product_Type__r.Name__c, CatalogItem_Attributes__r.Name, CatalogItem_Attributes__r.Value__c, CatalogItem__r.Name 
                         FROM CatalogItem_Attributes_Mapping__c
                         WHERE Is_Required_For_SKUMapping__c = true
                         AND Product_Type__r.Name__c = :productTypeName];
        
            if(tempList == null || tempList.size() == 0) {
                System.debug('CatalogItem-Mapping data does not exist in the database for the ProductTypeName: ' + productTypeName);
                continue;
            }
            
            for(CatalogItem_Attributes_Mapping__c obj : tempList) {
                String attributeName   = obj.CatalogItem_Attributes__r.Name;
                String attributeValue  = obj.CatalogItem_Attributes__r.Value__c;
                String catalogItemName = obj.CatalogItem__r.Name;
                
                Map<KeyValuePair, Set<String>> tempMap = catalogItemAttributesMap.get(productTypeName);
                if(tempMap == null) {
                    tempMap = new Map<KeyValuePair, Set<String>>();
                    catalogItemAttributesMap.put(productTypeName, tempMap);
                }
                KeyValuePair pair = new KeyValuePair(attributeName, attributeValue);
                Set<String> tempSet = tempMap.get(pair);
                if(tempSet == null) {
                    tempSet = new Set<String>();
                    tempMap.put(pair, tempSet);
                }
                tempSet.add(catalogItemName);
            }
        }
    }
    
    private void loadAllCatalogItemNameSKUNumbers() {
        
        catalogItemNameSKUNumberMap = new Map<String, Set<String>>();
        
        List<SKU_CatalogItem_Mapping__c> tempList = 
            [SELECT CatalogItem__r.Name, SKU__r.Name  
                 FROM SKU_CatalogItem_Mapping__c 
                 WHERE CatalogItem__c IN (SELECT CatalogItem__c 
                                               FROM CatalogItem_Attributes_Mapping__c 
                                               WHERE Is_Required_For_SKUMapping__c = true)];
        
        if(tempList == null || tempList.size() == 0) {
            System.debug('CatalogItem-SKUMapping data not exist in the database.');
            return;
        }
        
        for(SKU_CatalogItem_Mapping__c obj : tempList) {
            String catalogItemName = obj.CatalogItem__r.Name;
            String skuNumber       = obj.SKU__r.Name;
            
            Set<String> skuSet = catalogItemNameSKUNumberMap.get(catalogItemName);
            if(skuSet == null) {
                skuSet = new Set<String>();
                catalogItemNameSKUNumberMap.put(catalogItemName, skuSet);
            }
            skuSet.add(skuNumber);
        }
    }
    
    private String filterCatalogItems(integer inputAttributeCount, List<String> applicableCatalogItemNames) {
        Set<String> uniqueCatalogItemNames = new Set<String>(applicableCatalogItemNames);
        Map<Integer, String> tempMap = new Map<Integer, String>();
        for(String uniqueName : uniqueCatalogItemNames) {
            integer counter = 0;
            for(String possibleName : applicableCatalogItemNames) {
                if(possibleName == uniqueName) {
                    counter ++;
                }
            }
            tempMap.put(counter, uniqueName);
        }
        return tempMap.get(inputAttributeCount);
    }
    
    
    public void printCache() {
        System.debug('|======= Mapping Cache =======|');
        printProductTypesAndAttributesMap();
        printCatalogItemMappingsMap();
        printCatalogItemNameSKUNumberMap();
        System.debug('|======= End of Mapping Cache =======|');
    }
    
    private void printProductTypesAndAttributesMap() {
        System.debug('|------- ProductTypeName - Attribute Names -------|');
        for(String key : productTypeAttributesMap.keySet()) {
            System.debug(key +' = ' + productTypeAttributesMap.get(key));
        }
    }
    
    private void printCatalogItemMappingsMap() { 
        System.debug('|------- ProductTypeName - Mapping Attributes -------|');
        for(String key : catalogItemAttributesMap.keySet()) {
            System.debug('--->' + key);
            Map<KeyValuePair, Set<String>> tempMap = catalogItemAttributesMap.get(key);
            for(KeyValuePair pair : tempMap.keySet()) {
                System.debug(pair + ' --- ' + tempMap.get(pair));
            }
        }
    }
    
    private void printCatalogItemNameSKUNumberMap() {
        System.debug('|------- CatalogItemName - SKUNumbers -------|');
        for(String key : catalogItemNameSKUNumberMap.keySet()) {
            System.debug(key +' = ' + catalogItemNameSKUNumberMap.get(key));
        }
    }

}