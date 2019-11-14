public class  BOSJSONMproV1{

    public class Products {
        public String name;
        public String id;
        public List<Product_lines> product_lines;
    }

    public class Parent_transaction {
        public String id;
        public String external_id;
        public String platform;
        public String platform_type;
        public String object_type;
    }

    public class Custom_attributes {
        public String data_type;
        public String key;
        public String value;
        public String object_type;
    }

    public class Product_lines {
        public String object_type;
        public String productName;
        public String id;
        public String id_type;
        public String external_id;
        public Integer quantity;
        public String id_source;
        public Integer retail_price_per_item;
        public Integer retail_price;
        public String skunumber;
        public List<Custom_attributes> custom_attributes;
  
    }

    public String schema;
    public String object_type;
    public Parent_transaction parent_transaction;
    public List<Products> products;

    
    public static BOSJSONMproV1 parse(String json) {
        return (BOSJSONMproV1) System.JSON.deserialize(json, BOSJSONMproV1.class);
    }
}