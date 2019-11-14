public class CatalogItemMappingService {

    private static CatalogItemMapping mapper = null;
    
    public static Set<String> findAttributesByProductType(String productTypeName) {
        return getMapper().findAttributesByProductType(productTypeName);
    }
    
    public static String findCatalogItem(String productTypeName, Map<String, String> inputAttributesMap) {
        return getMapper().findCatalogItem(productTypeName, inputAttributesMap);
    }
    
    public static Set<String> findSKUsByCatalogItem(String catalogItemName) {
        return getMapper().findSKUsByCatalogItem(catalogItemName);
    }
    
    public static List<CatalogItemAttribute> getAllCatalogItemAttributesByProductTypeName(String productTypeName) {
        return getMapper().getAllCatalogItemAttributesByProductTypeName(productTypeName);
    }
    
    public static void enableDebug() {
        getMapper().enableDebug();
    }
    
    public static void disableDebug() {
        getMapper().disableDebug();
    }
    
    public static void printCache() {
        getMapper().printCache();
    }
    
    private static CatalogItemMapping getMapper() {
        if(mapper == null) {
            mapper = new CatalogItemMapping();
        }
        return mapper;
    }
    
}