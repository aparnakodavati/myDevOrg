public class parseDataCabinetSku {
    
    public static String parseMethod(String JsonData){                
        
        Map<String, Object> root = (Map<String, Object>) JSON.deserializeUntyped(JsonData);
        List<Object> products = (List<Object>) root.get('products');
        Map<String, Object> parentTransacElement = (Map<String, Object>) root.get('parent_transaction'); 
        
        BOSJSONMproV1 bosInput = new BOSJSONMproV1();
        bosInput.schema='./bos.1.0.3.schema.json';
        bosInput.object_type= 'bos';
        
        BOSJSONMproV1.parent_transaction ParentTranc = new BOSJSONMproV1.parent_transaction();
        
        ParentTranc.id = String.valueOf(parentTransacElement.get('id'));
        parentTranc.external_id = String.valueOf(parentTransacElement.get('external_id'));
        parentTranc.platform_type = String.valueOf(parentTransacElement.get('platform_type'));
        ParentTranc.object_type = String.valueOf(parentTransacElement.get('object_type'));
        ParentTranc.platform = String.valueOf(parentTransacElement.get('platform'));
        bosInput.Parent_transaction = ParentTranc;
        
        List<BOSJSONMproV1.products> bosFormatProdList=new List<BOSJSONMproV1.products>();
        
        SkuProductData skuData = new SkuProductData();
        integer i = 0;
        while(i < products.size()){            
            Map<String, Object> productsElement = (Map<String, Object>) products.get(i); 
            List<Object> productLines = (List<Object>) productsElement.get('product_lines');
            
            BOSJSONMproV1.products bosFormatProd = new BOSJSONMproV1.products();
            List<BOSJSONMproV1.product_lines> bosFormatProdLinesList=new List<BOSJSONMproV1.product_lines>(); 
            bosFormatProd.name= 'Makeover' ;
            bosFormatProd.id = '17';
            
            integer linesCounter = 0; 
            while(linesCounter < productLines.size()){
                Map<String, Object> productLinesElement = (Map<String, Object>) productLines.get(linesCounter);
                List<Object> customAttributes = (List<Object>) productLinesElement.get('custom_attributes');
                Type t = Type.forName(String.valueOf(productLinesElement.get('productName')));
                if(t != null){
                    SKUMapper prod = (SKUMapper) t.newInstance();
                    List<Object> updatedCustomAttributes = prod.getSkuNumber(customAttributes);              
                    
                    BOSJSONMproV1.product_lines bosFormatProdLinesDoor = new BOSJSONMproV1.product_lines();
                    List<BOSJSONMproV1.Custom_attributes> customAttributesList=new List<BOSJSONMproV1.Custom_attributes>();             
                    bosFormatProdLinesDoor.object_type = 'line';            
                    bosFormatProdLinesDoor.productName = String.valueOf(productLinesElement.get('productName'));
                    bosFormatProdLinesDoor.id = '0';
                    bosFormatProdLinesDoor.id_type = null;
                    bosFormatProdLinesDoor.external_id = null;
                    bosFormatProdLinesDoor.quantity = 1;
                    bosFormatProdLinesDoor.id_source = 'Measure Pro';
                    bosFormatProdLinesDoor.retail_price_per_item = null;
                    bosFormatProdLinesDoor.retail_price = null;
                    BOSJSONMproV1.Custom_attributes customAtt;
                    
                    integer k = 0;
                    while(k < updatedCustomAttributes.size()){
                        Map<String, Object> customAttrElementMap = (Map<String, Object>) updatedCustomAttributes.get(k);
                        customAtt = new BOSJSONMproV1.Custom_attributes();
                        customAtt.data_type = String.valueOf(customAttrElementMap.get('data_type'));
                        customAtt.key = String.valueOf(customAttrElementMap.get('key'));
                        customAtt.value = String.valueOf(customAttrElementMap.get('value'));
                        customAtt.object_type = String.valueOf(customAttrElementMap.get('object_type'));
                        customAttributesList.add(customAtt);                        
                        k++;
                    }                    
                    bosFormatProdLinesDoor.custom_attributes= customAttributesList;
                    bosFormatProdLinesList.add(bosFormatProdLinesDoor);    
                }
                linesCounter++;
            }
            bosFormatProd.product_lines=bosFormatProdLinesList;
            bosFormatProdList.add(bosFormatProd);
            
            i++;
        }
        bosInput.products=bosFormatProdList;
        String JSONRequest=JSON.serialize(bosInput);
        system.debug('BOS JSON: ' + JSONRequest);     
        return JSONRequest;
    }
}