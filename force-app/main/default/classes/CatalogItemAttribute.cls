public class CatalogItemAttribute {
    public String catalogItemAttributeName;
    public String catalogItemAttributeValue;
    // set holds all the applicable CatalogItemNames for this Name/Value pair.
    public Set<String> catalogItemNames;
    
    public CatalogItemAttribute(String catalogItemAttributeName, 
                                String catalogItemAttributeValue,
                                Set<String> catalogItemNames) {
        this.catalogItemAttributeName  = catalogItemAttributeName;
        this.catalogItemAttributeValue = catalogItemAttributeValue;
        this.catalogItemNames          = catalogItemNames;                             
    }
}