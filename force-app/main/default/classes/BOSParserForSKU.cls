public class BOSParserForSKU {

public static String parseMethod(String JsonData){                
    
    Map<String, Object> root = (Map<String, Object>) JSON.deserializeUntyped(JsonData);
    List<Object> products = (List<Object>) root.get('products');
    Map<String, Object> parentTransacElement = (Map<String, Object>) root.get('parent_transaction');
    Map<String, Object> clientElement = (Map<String, Object>) root.get('client'); 
    
    BOSJSONMproV2 bosInput = new BOSJSONMproV2();
    bosInput.version='1.0.0';
    bosInput.schema='./bos.1.0.5.schema.json';
    bosInput.object_type= 'bos';
    
    // ~~~~~~~~~~~~~~~~~~~ "Client" Looping ~~~~~~~~~~~~~~~~~~~
    BOSJSONMproV2.Custom_attributes clientCustomAtt;
    List<BOSJSONMproV2.Custom_attributes> clientCustomAttributesList=new List<BOSJSONMproV2.Custom_attributes>();               
            
    BOSJSONMproV2.client clientDetails = new BOSJSONMproV2.client();

    clientDetails.application=String.valueOf(clientElement.get('application'));
    clientDetails.applicationVersion=String.valueOf(clientElement.get('applicationVersion'));
    clientDetails.channel=String.valueOf(clientElement.get('channel'));
    clientDetails.object_type=String.valueOf(clientElement.get('object_type'));
    if(clientElement.get('custom_attributes') != null){
        List<Object> customAttributes = (List<Object>) clientElement.get('custom_attributes');
        integer i = 0;          
        while(i < customAttributes.size()){
            Map<String, Object> customAttributesElement = (Map<String, Object>) customAttributes.get(i);
            clientCustomAtt = new BOSJSONMproV2.Custom_attributes(String.valueOf(customAttributesElement.get('data_type')), String.valueOf(customAttributesElement.get('id')), String.valueOf(customAttributesElement.get('external_id')), String.valueOf(customAttributesElement.get('key')), String.valueOf(customAttributesElement.get('value')), String.valueOf(customAttributesElement.get('object_type')));
            clientCustomAttributesList.add(clientCustomAtt);
            i++;
        }            
    }else{
        clientDetails.custom_attributes = null;
    }
    clientDetails.custom_attributes=clientCustomAttributesList;
    bosInput.client=clientDetails;

    // ~~~~~~~~~~~~~~~~~~~ "Parent_Transaction" Looping ~~~~~~~~~~~~~~~~~~~
    BOSJSONMproV2.Custom_attributes parentCustomAtt;
    List<BOSJSONMproV2.Custom_attributes> parentClientCustomAttributesList = new List<BOSJSONMproV2.Custom_attributes>();  
    BOSJSONMproV2.parent_transaction ParentTranc = new BOSJSONMproV2.parent_transaction();
    
    ParentTranc.id = String.valueOf(parentTransacElement.get('id'));
    parentTranc.external_id = String.valueOf(parentTransacElement.get('external_id'));
    parentTranc.platform_type = String.valueOf(parentTransacElement.get('platform_type'));
    ParentTranc.object_type = String.valueOf(parentTransacElement.get('object_type'));
    ParentTranc.platform = String.valueOf(parentTransacElement.get('platform'));
    if(parentTransacElement.get('custom_attributes') != null){
        List<Object> customAttributes = (List<Object>) clientElement.get('custom_attributes');
        integer i = 0;          
        while(i < customAttributes.size()){
            Map<String, Object> customAttributesElement = (Map<String, Object>) customAttributes.get(i);
            parentCustomAtt = new BOSJSONMproV2.Custom_attributes(String.valueOf(customAttributesElement.get('data_type')), String.valueOf(customAttributesElement.get('id')), String.valueOf(customAttributesElement.get('external_id')), String.valueOf(customAttributesElement.get('key')), String.valueOf(customAttributesElement.get('value')), String.valueOf(customAttributesElement.get('object_type')));
            parentClientCustomAttributesList.add(parentCustomAtt);
            i++;
        }            
    }else{
        ParentTranc.custom_attributes = null;
    }
    ParentTranc.custom_attributes=parentClientCustomAttributesList;
    bosInput.Parent_transaction = ParentTranc;

    // ~~~~~~~~~~~~~~~~~~~ "Products" Looping ~~~~~~~~~~~~~~~~~~~
    
    List<BOSJSONMproV2.products> bosFormatProdList=new List<BOSJSONMproV2.products>();
    
    SkuProductData skuData = new SkuProductData();
    integer i = 0;
    while(i < products.size()){            
        Map<String, Object> productsElement = (Map<String, Object>) products.get(i); 
        List<Object> productLines = (List<Object>) productsElement.get('product_lines');
        
        BOSJSONMproV2.products bosFormatProd = new BOSJSONMproV2.products();
        List<BOSJSONMproV2.product_lines> bosFormatProdLinesList=new List<BOSJSONMproV2.product_lines>(); 
        bosFormatProd.name = String.valueOf(productsElement.get('name'));
        bosFormatProd.id = String.valueOf(productsElement.get('id'));
        bosFormatProd.object_type = String.valueOf(productsElement.get('object_type'));
        bosFormatProd.product_Labor_Relationships = null;
        bosFormatProd.external_id = String.valueOf(productsElement.get('external_id'));
        bosFormatProd.labor_lines = null;
        bosFormatProd.promotions = null;
        bosFormatProd.taxes = null;
        
        integer linesCounter = 0;
        while(linesCounter < productLines.size()){
            Map<String, Object> productLinesElement = (Map<String, Object>) productLines.get(linesCounter);
            List<Object> customAttributes = (List<Object>) productLinesElement.get('custom_attributes');
            
                String objType = String.valueOf(productLinesElement.get('object_type'));         
                String parent_id = String.valueOf(productLinesElement.get('parent_id'));
                String external_parent_id = String.valueOf(productLinesElement.get('external_parent_id'));
                String id = String.valueOf(productLinesElement.get('id'));
                String external_id = String.valueOf(productLinesElement.get('external_id'));
                Integer quantity = Integer.valueOf(productLinesElement.get('quantity'));
                Integer retail_price_per_item = Integer.valueOf(productLinesElement.get('retail_price_per_item'));
                Integer retail_price = Integer.valueOf(productLinesElement.get('retail_price'));
                String description= String.valueOf(productLinesElement.get('description'));
                String source_sku = String.valueOf(productLinesElement.get('source_sku'));
                String source_sku_type = String.valueOf(productLinesElement.get('source_sku_type'));
                String target_sku = String.valueOf(productLinesElement.get('target_sku'));
                String target_sku_type = String.valueOf(productLinesElement.get('target_sku_type'));
                String unit_of_measure = String.valueOf(productLinesElement.get('unit_of_measure'));
            
            if(description.equals('fg')){
                target_sku = SkuProductData.getFgSkuNumber();
                integer customAttCounter = 0;
                List<BOSJSONMproV2.Custom_attributes> fgListOfCustomAttributes = new List<BOSJSONMproV2.Custom_attributes>();
                BOSJSONMproV2.Custom_attributes fgCustomAttributes; 
                while(customAttCounter < customAttributes.size()){
                    Map<String, Object> customAttributesElement = (Map<String, Object>) customAttributes.get(customAttCounter);
                    fgCustomAttributes = new BOSJSONMproV2.Custom_attributes(String.valueOf(customAttributesElement.get('data_type')), String.valueOf(customAttributesElement.get('id')), String.valueOf(customAttributesElement.get('external_id')), String.valueOf(customAttributesElement.get('key')), String.valueOf(customAttributesElement.get('value')), String.valueOf(customAttributesElement.get('object_type')));
                    fgListOfCustomAttributes.add(fgCustomAttributes);
                    
                    customAttCounter++;
                }
                BOSJSONMproV2.product_lines fgProductLine = new BOSJSONMproV2.product_lines(objType,retail_price,retail_price_per_item,id,quantity,description,parent_id,external_parent_id,source_sku,source_sku_type,target_sku,source_sku_type,external_id,unit_of_measure,null,null,fgListOfCustomAttributes);
                bosFormatProdLinesList.add(fgProductLine);

            }else if(description.equals('Bore')){
                target_sku = SkuProductData.getBoreSkuNumber();

            }else if(customAttributes == null){
                BOSJSONMproV2.product_lines bosFormatProdLines = new BOSJSONMproV2.product_lines(objType,retail_price,retail_price_per_item,id,quantity,description,parent_id,external_parent_id,source_sku,source_sku_type,target_sku,source_sku_type,external_id,unit_of_measure,null,null,null);
                bosFormatProdLinesList.add(bosFormatProdLines); 
            }else{
                Type t = Type.forName(String.valueOf(productLinesElement.get('description')));
                if(t != null){
                SKUMapper prod = (SKUMapper) t.newInstance();
                List<Object> updatedCustomAttributes = prod.getSkuNumber(customAttributes);              
                
                List<BOSJSONMproV2.Custom_attributes> listOfCustomAttributes = new List<BOSJSONMproV2.Custom_attributes>();
                BOSJSONMproV2.Custom_attributes customAtt1;                        
                integer k = 0;
                while(k < updatedCustomAttributes.size()){
                    Map<String, Object> customAttrElementMap = (Map<String, Object>) updatedCustomAttributes.get(k); 
                    String datatype = String.valueOf(customAttrElementMap.get('data_type'));
                    String custId = String.valueOf(customAttrElementMap.get('id'));
                    String extId = String.valueOf(customAttrElementMap.get('extId'));
                    String key = String.valueOf(customAttrElementMap.get('key'));
                    String value = String.valueOf(customAttrElementMap.get('value'));
                    String object_type = String.valueOf(customAttrElementMap.get('object_type'));
                    customAtt1= new BOSJSONMproV2.Custom_attributes(datatype,custId,extId,key,value,object_type);
                    listOfCustomAttributes.add(customAtt1);                        
                    k++;
                    
                } 

                BOSJSONMproV2.product_lines bosFormatProdLine = new BOSJSONMproV2.product_lines(objType,retail_price,retail_price_per_item,id,quantity,description,parent_id,external_parent_id,source_sku,source_sku_type,target_sku,source_sku_type,external_id,unit_of_measure,null,null,listOfCustomAttributes);
                bosFormatProdLinesList.add(bosFormatProdLine);    
            } 
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
private List<BOSJSONMproV2.Custom_attributes> getBOSClassTypedListOfCustomAttributes(List<Object> listOfObjectTypedCustomAttributes){
    List<BOSJSONMproV2.Custom_attributes> listOfBOSTypedCustomAttributes = new List<BOSJSONMproV2.Custom_attributes>();
    BOSJSONMproV2.Custom_attributes customAttribute;
    integer i = 0;
    while(i < listOfObjectTypedCustomAttributes.size()){
        Map<String, Object> customAttributesElement =  (Map<String, Object>) listOfObjectTypedCustomAttributes.get(i);
        customAttribute = new BOSJSONMproV2.Custom_attributes(String.valueOf(customAttributesElement.get('data_type')), String.valueOf(customAttributesElement.get('id')), String.valueOf(customAttributesElement.get('external_id')), String.valueOf(customAttributesElement.get('key')), String.valueOf(customAttributesElement.get('value')), String.valueOf(customAttributesElement.get('object_type')));
        listOfBOSTypedCustomAttributes.add(customAttribute);
        
        i++;
    }
    return listOfBOSTypedCustomAttributes;
} 
}