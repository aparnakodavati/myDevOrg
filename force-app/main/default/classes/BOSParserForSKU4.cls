public class BOSParserForSKU4 {

public static SKUMappingStatusWrapper parseMethod(String JsonData){                
SKUMappingStatusWrapper mappingStatus;
Map<String, String> mappingErrors = new Map<String, String>();
List<Base_Tables_SKUs__mdt> skuData = [select Description__c, SKU__c from Base_Tables_SKUs__mdt];

Map<String, Object> root = (Map<String, Object>) JSON.deserializeUntyped(JsonData);
List<Object> products = (List<Object>) root.get('products');
Map<String, Object> parentTransacElement = (Map<String, Object>) root.get('parent_transaction');
Map<String, Object> clientElement = (Map<String, Object>) root.get('client'); 

BOSJSONMproV2 bosInput = new BOSJSONMproV2();
bosInput.version='1.0.0';
bosInput.schema='./bos.1.0.5.schema.json';
bosInput.object_type= 'bos';

// ~~~~~~~~~~~~~~~~~~~ "Client" Looping ~~~~~~~~~~~~~~~~~~~              
    
BOSJSONMproV2.client clientDetails = new BOSJSONMproV2.client();

clientDetails.application=String.valueOf(clientElement.get('application'));
clientDetails.applicationVersion=String.valueOf(clientElement.get('applicationVersion'));
clientDetails.channel=String.valueOf(clientElement.get('channel'));
clientDetails.object_type=String.valueOf(clientElement.get('object_type'));
if(clientElement.get('custom_attributes') != null){
List<Object> customAttributes = (List<Object>) clientElement.get('custom_attributes');
List<BOSJSONMproV2.Custom_attributes> listOfBOSFormatClientCustomAttributes = getBOSClassTypedListOfCustomAttributes(customAttributes);
clientDetails.custom_attributes=listOfBOSFormatClientCustomAttributes;           
}else{
clientDetails.custom_attributes = null;
}

bosInput.client = clientDetails;

// ~~~~~~~~~~~~~~~~~~~ "Parent_Transaction" Looping ~~~~~~~~~~~~~~~~~~~
BOSJSONMproV2.Custom_attributes parentCustomAtt;
List<BOSJSONMproV2.Custom_attributes> parentClientCustomAttributesList = new List<BOSJSONMproV2.Custom_attributes>();  
BOSJSONMproV2.parent_transaction ParentTranc = new BOSJSONMproV2.parent_transaction();

ParentTranc.id = String.valueOf(parentTransacElement.get('id'));
String jobNumber  = String.valueOf(parentTransacElement.get('id'));
parentTranc.external_id = String.valueOf(parentTransacElement.get('external_id'));
parentTranc.platform_type = String.valueOf(parentTransacElement.get('platform_type'));
ParentTranc.object_type = String.valueOf(parentTransacElement.get('object_type'));
ParentTranc.platform = String.valueOf(parentTransacElement.get('platform'));
if(parentTransacElement.get('custom_attributes') != null){
List<Object> customAttributes = (List<Object>) clientElement.get('custom_attributes');
List<BOSJSONMproV2.Custom_attributes> parentTranListOfBOSFormatCustomAttrbites = getBOSClassTypedListOfCustomAttributes(customAttributes);
parentTranc.Custom_attributes = parentTranListOfBOSFormatCustomAttrbites;          
}else{
ParentTranc.custom_attributes = null;
}
ParentTranc.custom_attributes=parentClientCustomAttributesList;
bosInput.Parent_transaction = ParentTranc;

// ~~~~~~~~~~~~~~~~~~~ "Products" Looping ~~~~~~~~~~~~~~~~~~~

List<BOSJSONMproV2.products> bosFormatProdList=new List<BOSJSONMproV2.products>();

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

Map<String, String> mapForBOSProductNameToObjectDescription = new Map<String, String>();
mapForBOSProductNameToObjectDescription.put('fg', 'ADD FINGER GROOVES');
mapForBOSProductNameToObjectDescription.put('Bore', 'HDI ADD BORE PER DOOR');
mapForBOSProductNameToObjectDescription.put('distressing', 'DISTRESSING UPCHARGE');
mapForBOSProductNameToObjectDescription.put('glazing', 'Glazing');
mapForBOSProductNameToObjectDescription.put('4Lites', 'MULLION LITES - 4');
mapForBOSProductNameToObjectDescription.put('glazeFeathered', 'Glaze Feathered');

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
    
    if(description.equalsIgnoreCase('fg') || description.equalsIgnoreCase('Bore') || description.equalsIgnoreCase('distressing') || description.equalsIgnoreCase('glazing') || description.equalsIgnoreCase('glazeFeathered')){    
    
        try{
            for(Base_Tables_SKUs__mdt record : skuData){                    
                if(record.Description__c.equals(mapForBOSProductNameToObjectDescription.get(description))){
                    target_sku = record.SKU__c;
                }
            }
        }catch(NullPointerException nulExp){
            mappingErrors.put(description + ' ' + id, 'Mapping Process Returned Null Value. Either Mapping Attribute or SKU Number Is Not Found');                        
        }

    List<BOSJSONMproV2.Custom_attributes> listOfBosFormatCustomAttributes = getBOSClassTypedListOfCustomAttributes(customAttributes);
    BOSJSONMproV2.product_lines productLine = new BOSJSONMproV2.product_lines(objType,retail_price,retail_price_per_item,id,quantity,description,parent_id,external_parent_id,source_sku,source_sku_type,target_sku,source_sku_type,external_id,unit_of_measure,null,null,listOfBosFormatCustomAttributes);
    bosFormatProdLinesList.add(productLine);
    }else if(description.equals('Lites')){
        String noOfLites = null;
        integer counter = 0;
        while(counter < customAttributes.size()){
            Map<String, Object> cutomAttributesElement = (Map<String, Object>) customAttributes.get(counter);
            if(String.valueOf(cutomAttributesElement.get('key')).equals('Number Of Lites')){
                noOfLites = String.valueOf(cutomAttributesElement.get('value'));
            }
            counter++;
        }

        if(noOfLites != null){
            try{               
                for(Base_Tables_SKUs__mdt record : skuData){
                    if(record.Description__c.equals(mapForBOSProductNameToObjectDescription.get(noOfLites + 'Lites'))){
                        target_sku = record.SKU__c;
                    }
                }
            }catch(Exception e){
                mappingErrors.put(description, 'Please check the Mapping Attributes of Lites in order to get the SKU Number');
            }
        }

        List<BOSJSONMproV2.Custom_attributes> litesListOfBOSFormatCustomAttributes = getBOSClassTypedListOfCustomAttributes(customAttributes);
        BOSJSONMproV2.product_lines litesProductLine = new BOSJSONMproV2.product_lines(objType,retail_price,retail_price_per_item,id,quantity,description,parent_id,external_parent_id,source_sku,source_sku_type,target_sku,source_sku_type,external_id,unit_of_measure,null,null,litesListOfBOSFormatCustomAttributes);
        bosFormatProdLinesList.add(litesProductLine);
    }else if(description.equals('DrawerBox') || description.equals('PullOuts')){
        Double maxHeight = 0.00, minHeight = 0.00, height = 0.00; String type = '', resultedCatalogItemName = '';
        integer counter = 0;
        while(counter < customAttributes.size()){
            Map<String, Object> customAttributeElement = (Map<String, Object>) customAttributes.get(counter);
            if(String.valueOf(customAttributeElement.get('key')).equals('Height')){
                height = Double.valueOf(customAttributeElement.get('value'));
            }else if(String.valueOf(customAttributeElement.get('key')).equals('Type')){
                type = String.valueOf(customAttributeElement.get('value'));
            }
            counter++;
        }
        system.debug('Type from BOS: ' + type);
        system.debug('Height from BOS: ' + height);
        List<CatalogItemAttribute> listOfCatalogItemsWithDetailsByProductName = CatalogItemMappingService.getAllCatalogItemAttributesByProductTypeName(description);

        system.debug('list Of Attibutes: ' + listOfCatalogItemsWithDetailsByProductName);
        if(height != null){
            Double tempMinValue = 0.00, tempMaxValue = 0.00; String tempType = null;
            Set<String> tempCatalogItemNameType = null, tempCatalogItemNameMinHeight = null, tempCatalogItemNameMaxHeight = null;
            String finalCatalogItemName = null; Set<String> skuNumbers = null;
            try{
                for(CatalogItemAttribute eachAttributeDetails : listOfCatalogItemsWithDetailsByProductName){
                    if(eachAttributeDetails.catalogItemAttributeName.equals('Type') && eachAttributeDetails.catalogItemAttributeValue.equalsIgnoreCase(type)){
                        tempType = eachAttributeDetails.catalogItemAttributeValue;
                        tempCatalogItemNameType = eachAttributeDetails.catalogItemNames;
                        system.debug('tempType: ' + tempType + ' || Set of tempCatalogItemNameType: ' + tempCatalogItemNameType);                    
                    }else if(eachAttributeDetails.catalogItemAttributeName.equals('Min Height') && tempType != null){
                        if(Double.valueOf(eachAttributeDetails.catalogItemAttributeValue) < height){
                            tempMinValue = Double.valueOf(eachAttributeDetails.catalogItemAttributeValue);
                            tempCatalogItemNameMinHeight = eachAttributeDetails.catalogItemNames;
                            system.debug('tempMinValue: ' + tempMinValue + ' || Set of tempCatalogItemNameMinHeight: ' + tempCatalogItemNameMinHeight);
                        }                    
                    }else if(eachAttributeDetails.catalogItemAttributeName.equals('Max Height') && tempType != null){
                        if(Double.valueOf(eachAttributeDetails.catalogItemAttributeValue) >= height){
                            tempMaxValue = Double.valueOf(eachAttributeDetails.catalogItemAttributeValue);
                            tempCatalogItemNameMaxHeight = eachAttributeDetails.catalogItemNames;
                            system.debug('tempMaxValue: ' + tempMaxValue + ' || Set of tempCatalogItemNameMaxHeight: ' + tempCatalogItemNameMaxHeight);
                        }
                    }
                    if(tempCatalogItemNameType != null && tempCatalogItemNameMinHeight != null && tempCatalogItemNameMaxHeight != null){                    
                        if(tempCatalogItemNameMinHeight.equals(tempCatalogItemNameMaxHeight)){
                            String tempheightCatalogItemName = '';
                            Iterator<String> itrForHeightCatalogItemName = tempCatalogItemNameMinHeight.iterator();
                            while(itrForHeightCatalogItemName.hasNext()){
                                tempheightCatalogItemName = itrForHeightCatalogItemName.next();
                                system.debug('tempheightCatalogItemName: ' + tempheightCatalogItemName);
                            }
                            if(tempCatalogItemNameType.contains(tempheightCatalogItemName)){
                                for(String catalogTypeElement : tempCatalogItemNameType){
                                    if(catalogTypeElement.equalsIgnoreCase(tempheightCatalogItemName)){
                                        finalCatalogItemName = tempheightCatalogItemName;
                                        break;
                                    }
                                }
                                // Iterator<String> itr = tempCatalogItemNameType.iterator();
                                // while(itr.hasNext()){
                                //     System.debug('itr value: ' + itr.next());
                                //     system.debug('tempheightCatalogItemName1: ' + tempheightCatalogItemName);
                                //     if(itr.next().equals(tempheightCatalogItemName)) finalCatalogItemName = tempheightCatalogItemName;
                                //     system.debug('finalCatalogItemName: ' + finalCatalogItemName);
                                //     break;
                                // }
                            }                        
                        }
                    }
                    //system.debug('finalCatalogItemName1: ' + finalCatalogItemName);
                    if(finalCatalogItemName != null) break;
                }
            }catch(Exception expdb){
                mappingErrors.put(description + ' ' + id, 'There is an error with the Height attribute of Drawer Box Or Pullouts' + expdb.getTypeName());
            }
            system.debug('finalCatalogItemName: ' + finalCatalogItemName);

            if(finalCatalogItemName != null){
                try{
                    skuNumbers = CatalogItemMappingService.findSKUsByCatalogItem(finalCatalogItemName);
                    system.debug('skuNumbers: ' + skuNumbers);
                }catch(NullPointerException nullExp){
                    mappingErrors.put(description + ' ' + id, 'Sku Number Not Found ' + nullExp.getTypeName());
                }
            }
            if(skuNumbers != null){
                Iterator<String> itr = skuNumbers.iterator();
                target_sku = '';
                while(itr.hasNext()){
                    target_sku += itr.next(); 
                }
            }
            List<BOSJSONMproV2.Custom_attributes> listOfBOSFormatCustomAttributes = getBOSClassTypedListOfCustomAttributes(customAttributes);
            BOSJSONMproV2.product_lines bosFormatProdLine = new BOSJSONMproV2.product_lines(objType,retail_price,retail_price_per_item,id,quantity,description,parent_id,external_parent_id,source_sku,source_sku_type,target_sku,source_sku_type,external_id,unit_of_measure,null,null,listOfBOSFormatCustomAttributes);
            bosFormatProdLinesList.add(bosFormatProdLine);            
        }       

    }else{
        Set<String> setOfAttributes; String catalogItemName; Set<String> skuNumbers;
        Map<String, String> attributeAndValues = new Map<String, String>();
        try{                
            setOfAttributes =  CatalogItemMappingService.findAttributesByProductType(description);            
            System.debug('Set of Attributes: ' + setOfAttributes);

            integer pickUpValuesCounter = 0; String maxHeight = '', minHeight = '';               
            while(pickUpValuesCounter < customAttributes.size()){
                Map<String, Object> customAttributeElement = (Map<String, Object>) customAttributes.get(pickUpValuesCounter);
                if(setOfAttributes.contains(String.valueOf(customAttributeElement.get('key')))){
                    String key = String.valueOf(customAttributeElement.get('key'));
                    String value = String.valueOf(customAttributeElement.get('value'));
                    System.debug('Key: ' + key);
                    System.debug('Value: ' + value);    
                    if(value != null){
                        attributeAndValues.put(key, value);
                    }                                                                      
                }
                // else if((setOfAttributes.equals('Max Height') || setOfAttributes.equals('Min Height')) && (description.equals('DrawerBox') || description.equals('PullOuts'))){
                //     if(String.valueOf(customAttributeElement.get('key')) != null && String.valueOf(customAttributeElement.get('key')).containsIgnoreCase('height')){
                //         if(setOfAttributes.equals('Max Height')){
                //             //maxHeight = 
                //         }
                //     }
                // }
                pickUpValuesCounter++;
            }
        }catch(Exception nullexcep){
            mappingErrors.put(description + ' ' + id, 'Found Errors During Mapping. Please check the Product Types And Mapping Attributes in BOS Json' + '\n' + 'Error Type: ' + description + ' | ' + nullexcep.getTypeName());
        } 
            system.debug('Attribute And Values Map: ' + attributeAndValues);
            
            try{
                catalogItemName = CatalogItemMappingService.findCatalogItem(description, attributeAndValues);
            }catch(Exception catItemExp){
                mappingErrors.put(description + ' ' + id, 'Catalog Item Missing ' + catItemExp.getTypeName());
            }
            try{
                skuNumbers = CatalogItemMappingService.findSKUsByCatalogItem(catalogItemName); 
            
            system.debug('Catalog item name: ' + catalogItemName);
            system.debug('SkuNumbers: ' + skuNumbers);
            system.debug('mappingErrors: ' + mappingErrors);
            Iterator<String> itr = skuNumbers.iterator();
            if(itr != null){
                target_sku = '';
                while(itr.hasNext()){
                    target_sku += itr.next();
                }
            }             
                    
            system.debug('Target SKU: ' + target_sku);            
            List<BOSJSONMproV2.Custom_attributes> listOfBOSFormatCustomAttributes = getBOSClassTypedListOfCustomAttributes(customAttributes);
            BOSJSONMproV2.product_lines bosFormatProdLine = new BOSJSONMproV2.product_lines(objType,retail_price,retail_price_per_item,id,quantity,description,parent_id,external_parent_id,source_sku,source_sku_type,target_sku,source_sku_type,external_id,unit_of_measure,null,null,listOfBOSFormatCustomAttributes);
            bosFormatProdLinesList.add(bosFormatProdLine);
            system.debug('Product: ' + JSON.serialize(bosFormatProdLine));    
             }catch(Exception skuNumExp){
                mappingErrors.put(description + ' ' + id, 'Sku Number Not Found ' + skuNumExp.getTypeName());
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

if(mappingErrors.size() > 0){
mappingStatus = new SKUMappingStatusWrapper('Failure', JSONRequest, mappingErrors);

List<String> toAddresses = new  List<String>();
toAddresses.add('aparna_kodavati@homedepot.com');
toAddresses.add('ankit_renduchintala@homedepot.com');

List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();            
Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
mail.setSubject('Cabinet Makeover Missing Information');
mail.setToAddresses(toAddresses); 
mail.setSenderDisplayName('SalesforceOrg');
        String htmlString = 'Below are the list of errors occured during the SKU Mapping at SPM</br></br>Job Number ID: ' + jobNumber;
        htmlString += '<table style="margin-top:20px; width:100%;" border="2">' +
        '<tr><th style="padding-left:10px;"> Product Name </th><th style="padding-left:10px;">Error Message</th></tr>';
        
    for(String productName : mappingErrors.keySet()){
        htmlString += '<tr><td style="padding-left:10px">' + '<strong>' + productName + '</strong></td><td style="padding-left:10px"><strong>' + mappingErrors.get(productName) + '</strong></td></tr>';
    }
htmlString += '</table>';
mail.setHtmlBody(htmlString); 
mails.add(mail);
Messaging.sendEmail(mails);
}else{
mappingStatus = new SKUMappingStatusWrapper('Success', JSONRequest, null);
}

return mappingStatus;
}
private static List<BOSJSONMproV2.Custom_attributes> getBOSClassTypedListOfCustomAttributes(List<Object> listOfObjectTypedCustomAttributes){
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