public with sharing class BOSJSONMproV2 {

public class Products {
    public String name;
    public String id;
    public String object_type;
    public String external_id;
    public List<Product_lines> product_lines;
    public List<Product_lines> labor_lines;
    public List<Product_Labor_Relationships> product_Labor_Relationships;
    public List<Custom_attributes> promotions;
    public List<Custom_attributes> taxes;
    public List<Custom_attributes> custom_attributes;
}

public class Product_Labor_Relationships {
    public String object_type;
    public String id;
    public String external_id;
    public String name;
    public String product_line_id;
    public String labor_line_id;
}

public class Parent_transaction {
    public String id;
    public String external_id;
    public String platform;
    public String platform_type;
    public String object_type;
    public List<Custom_attributes> custom_attributes;        
}

public class Client {
    public String object_type;
    public String channel;
    public String application;
    public String applicationVersion;
    public List<Custom_attributes> custom_attributes;
}

public class Custom_attributes {
    public String data_type;
    public String id;
    public String external_id;
    public String key;
    public String value;
    public String object_type;
    
    public Custom_attributes(String strdataType, String strid, String strexternal_id, String strkey, String strvalue, String strobjectType){
        data_type    = strdatatype;
        id           = strid;
        external_id  = strexternal_id;
        key          = strkey;
        value        = strvalue;
        object_type  = strobjecttype;            
    }
}

public class Product_lines {
    public String object_type;
    public Integer retail_price;
    public Integer retail_price_per_item;                                
    public String id;
    public Integer quantity;
    public String description;        
    public String parent_id;
    public String external_parent_id;
    public String source_sku;
    public String source_sku_type;
    public String target_sku;
    public String target_sku_type;
    public String external_id;
    public String unit_of_measure;
    public List<Custom_attributes> promotions;
    public List<Custom_attributes> taxes;
    public List<Custom_attributes> custom_attributes;
    
    public Product_lines(String strobject_type, Integer interetail_price, Integer interetail_price_per_item, String strid, Integer intequantity, String strdescription, String strparent_Id,
                            String strexternal_parent_id, String strsource_sku, String strsource_sku_type, String strtarget_sku, String strtarget_sku_type, String strexternal_id, String strunit_of_measure, List<Custom_attributes> listpromotions, List<Custom_attributes> listtaxes, List<Custom_attributes> listcustom_attributes){
                                
                                object_type           = strobject_type;
                                id                    = strid;
                                parent_Id             = strparent_Id;                     
                                external_parent_id    = strexternal_parent_id;
                                source_sku            = strsource_sku;
                                source_sku_type       = strsource_sku_type;
                                target_sku            = strtarget_sku;
                                target_sku_type       = strtarget_sku_type;
                                external_id           = strexternal_id;
                                quantity              = intequantity;
                                description           = strdescription; 
                                retail_price_per_item = interetail_price_per_item;
                                retail_price          = interetail_price;
                                unit_of_measure       = strunit_of_measure;
                                promotions            = listpromotions;
                                taxes                 = listtaxes;
                                custom_attributes     = listcustom_attributes;           
                            }
}

public String schema;
public String version;
public String object_type;
public Parent_transaction parent_transaction;
public Client client;
public List<Products> products;


public static BOSJSONMproV2 parse(String json) {
    return (BOSJSONMproV2) System.JSON.deserialize(json, BOSJSONMproV2.class);
}
}