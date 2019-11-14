global with sharing class ParserTestAgain {
    
    global static void parser(String jsonText){
        Map<String, Object> parser = (Map<String, Object>) JSON.deserializeUntyped(jsonText);
        Map<String, Object> jobParser = (Map<String, Object>) parser.get('job');
        Map<String, Object> selectionContainerParser = (Map<String, Object>) parser.get('selectionContainer');
        Map<String, Object> toggleContainerParser = (Map<String, Object>) parser.get('toggleContainer');
        Map<String, Object> measurement = (Map<String, Object>) jobParser.get('measurement');
        
        //			~~~~~~~~~~~~ Selection Container Inner Attributes ~~~~~~~~~~~~~~~
        Map<String, Object> selectedLaminateSerie = (Map<String, Object>) selectionContainerParser.get('selectedLaminateSerie');
        Map<String, Object> selectedStainedSpecie = (Map<String, Object>) selectionContainerParser.get('selectedStainedSpecie');
        Map<String, Object> selectedLaminateCollection = (Map<String, Object>) selectionContainerParser.get('selectedLaminateCollection');
        Map<String, Object> selectedColor = (Map<String, Object>) selectionContainerParser.get('selectedColor');
        //			~~~~~~~~~~~~ End Of Selection Container Inner Attributes ~~~~~~~~~~~~~
        
        String jobType = String.valueOf(jobParser.get('jobType'));
        Map<String, Object> jobDefinition = (Map<String, Object>) jobParser.get('jobDefinition');
        String jobNumber = String.valueOf(jobDefinition.get('jobNumber'));
        String customerJobNumber = String.valueOf(jobDefinition.get('customerJobNumber'));
        
        BOSJSONMproV1 bosInput = new BOSJSONMproV1();
        bosInput.schema='./bos.1.0.3.schema.json';
        bosInput.object_type= 'bos';
        
        BOSJSONMproV1.parent_transaction ParentTranc = new BOSJSONMproV1.parent_transaction();
        
        ParentTranc.id = jobNumber;
        parentTranc.external_id = customerJobNumber;
        parentTranc.platform_type = jobType;
        ParentTranc.platform_type = 'Cabinet Makeover';              
        ParentTranc.object_type = 'parent_transaction';
        bosInput.Parent_transaction = ParentTranc;
        
        BOSJSONMproV1.products bosFormatProd = new BOSJSONMproV1.products();
        List<BOSJSONMproV1.products> bosFormatProdList=new List<BOSJSONMproV1.products>();
        bosFormatProd.name= 'Makeover' ;              // Change the value
        bosFormatProd.id = '17';                      // Change the value
        
        List<BOSJSONMproV1.product_lines> bosFormatProdLinesList=new List<BOSJSONMproV1.product_lines>();  
        
        //			~~~~~~~~~~~~~~~~~~~~~~~~~ Doors ~~~~~~~~~~~~~~~~~~~~~~~~~
        List<Object> doorConfigs = (List<Object>) measurement.get('doorConfigurations');
        integer i = 0;
        SkuMappingDoors door = new SkuMappingDoors();
        
        // 							~~~~~~~~~~~ Getting Keys and Values from Doors class ~~~~~~~~~~~
        Map<String, String> modelAttributesMap = door.getModelAtrributes();
        Map<String, String> doorInfoAttributesMap = door.getDoorInfoAttributes();
        Map<String, String> toggleAttributesMap = door.getToggleContainer();
        Map<String, String> doorNumberAttributesMap = door.getDoorNumber();
        Map<String, String> bottomAttributesMap = door.getdoorInfoBoreUpFromBottom();
        Map<String, String> topAttributesMap = door.getdoorInfoBoreDownfromTop();
        Map<String, String> selectionContainerAttributesMap = door.getSelectionContainer();
        Map<String, String> serieAttributesMap = door.getSerieInSelectionContainer();
        Map<String, String> specieAttributesMap = door.getSpecieInSelectionContainer();
        Map<String, String> collectionAttributesMap = door.getCollectionInSelectionContainer();
        Map<String, String> selectedColorAttributesMap = door.getSelectedColor();
        Map<String, String> widthAttributesMap = door.getDoorWidth();
        Map<String, String> heightAttributesMap = door.getDoorHeight();
        Map<String, String> litesAttributesMap = door.getLites();
        List<String> skuAttributesList = door.getSkuAttributes();
        
        while(i < doorConfigs.size()){    
            BOSJSONMproV1.product_lines bosFormatProdLinesDoor = new BOSJSONMproV1.product_lines();
            List<BOSJSONMproV1.Custom_attributes> customAttributesList=new List<BOSJSONMproV1.Custom_attributes>(); 
            BOSJSONMproV1.Custom_attributes customAtt;
            
            bosFormatProdLinesDoor.object_type = 'line';            
            bosFormatProdLinesDoor.productName ='door';
            bosFormatProdLinesDoor.id = '0';
            bosFormatProdLinesDoor.id_type = null;
            bosFormatProdLinesDoor.external_id = null;
            bosFormatProdLinesDoor.quantity = 1;
            bosFormatProdLinesDoor.id_source = 'Measure Pro';
            bosFormatProdLinesDoor.retail_price_per_item = null;
            bosFormatProdLinesDoor.retail_price = null;
            
            Map<String, Object> doorConfigElement = (Map<String, Object>) doorConfigs[i];
            
            //		~~~~~~~~~~ Door Info and inner attributes ~~~~~~~~~~~~
            Map<String, Object> doorInfo = (Map<String, Object>) doorConfigElement.get('doorInfo');
            Map<String, Object> numberDoors = (Map<String, Object>) doorInfo.get('numberDoors');
            Map<String, Object> boreUpfromBottom = (Map<String, Object>) doorInfo.get('boreUpfromBottom');
            Map<String, Object> boreDownfromTop = (Map<String, Object>) doorInfo.get('boreDownfromTop');
            Map<String, Object> doorModel = (Map<String, Object>) doorInfo.get('doorModel');
            Map<String, Object> orderedWidth = (Map<String, Object>) doorInfo.get('orderedWidth');
            Map<String, Object> orderedHeight = (Map<String, Object>) doorInfo.get('orderedHeight');
            Map<String, Object> numberLites = (Map<String, Object>) doorInfo.get('numberLites');            
            
            Double whole = 0.0; Double numerator = 0.0; Double denominator = 0.0;
            
            for(String custKey : modelAttributesMap.keySet()){
                customAtt = new BOSJSONMproV1.Custom_attributes();
                customAtt.data_type = 'string';
                customAtt.key = custKey;
                customAtt.value = String.valueOf(doorModel.get(modelAttributesMap.get(custKey)));
                customAtt.object_type = 'custom_attribute';
                customAttributesList.add(customAtt);
            }            
            for(String custKey : doorInfoAttributesMap.keySet()){
                customAtt = new BOSJSONMproV1.Custom_attributes();
                customAtt.data_type = 'string';
                customAtt.key = custKey;
                if(custKey.equals('door_glassStyle') && doorInfo.get(doorInfoAttributesMap.get(custKey)) != null && numberLites.get('number') != null){
                    customAtt.value = numberLites.get('number') + '-Style ' + String.valueOf(doorInfo.get(doorInfoAttributesMap.get(custKey)));
                    system.debug('cust: ' + customAtt);
                }else{
                    customAtt.value = String.valueOf(doorInfo.get(doorInfoAttributesMap.get(custKey)));                    
                }
                customAtt.object_type = 'custom_attribute';
                customAttributesList.add(customAtt);   
            }
            for(String custKey : toggleAttributesMap.keySet()){
                customAtt = new BOSJSONMproV1.Custom_attributes();
                customAtt.data_type = 'string';
                customAtt.key = custKey;
                customAtt.value = String.valueOf(toggleContainerParser.get(toggleAttributesMap.get(custKey)));
                customAtt.object_type = 'custom_attribute';
                customAttributesList.add(customAtt);
            }
            for(String custKey : doorNumberAttributesMap.keySet()){
                customAtt = new BOSJSONMproV1.Custom_attributes();
                customAtt.data_type = 'string';
                customAtt.key = custKey;
                if(numberDoors != null){
                    customAtt.value = String.valueOf(numberDoors.get(doorNumberAttributesMap.get(custKey)));
                }
                customAtt.object_type = 'custom_attribute';
                customAttributesList.add(customAtt);  
            }
            for(String custKey : bottomAttributesMap.keySet()){
                if(custKey.equals('whole')){
                    whole = Double.valueOf(boreUpfromBottom.get(bottomAttributesMap.get(custKey)));
                }else if(custKey.equals('numerator')){
                    numerator = Double.valueOf(boreUpfromBottom.get(bottomAttributesMap.get(custKey)));
                }else if(custKey.equals('denominator')){
                    denominator = Double.valueOf(boreUpfromBottom.get(bottomAttributesMap.get(custKey)));
                }
            }
            customAtt = new BOSJSONMproV1.Custom_attributes();
            customAtt.data_type = 'string';
            customAtt.key = 'door_btm';
            customAtt.value = UtilityHolder.calculateMixedFraction(whole, numerator, denominator);
            customAtt.object_type = 'custom_attribute';
            customAttributesList.add(customAtt);
            
            whole = 0.0; numerator = 0.0; denominator = 0.0;
            
            for(String custKey : topAttributesMap.keySet()){
                if(custKey.equals('whole')){
                    whole = Double.valueOf(boreDownfromTop.get(topAttributesMap.get(custKey))); 
                }else if(custKey.equals('numerator')){
                    numerator = Double.valueOf(boreDownfromTop.get(topAttributesMap.get(custKey)));
                }else if(custKey.equals('denominator')){
                    denominator = Double.valueOf(boreDownfromTop.get(topAttributesMap.get(custKey)));
                }
            }
            customAtt = new BOSJSONMproV1.Custom_attributes();
            customAtt.data_type = 'string';
            customAtt.key = 'door_top';
            customAtt.value = UtilityHolder.calculateMixedFraction(whole, numerator, denominator);
            customAtt.object_type = 'custom_attribute';
            customAttributesList.add(customAtt);
            
            for(String custKey : selectionContainerAttributesMap.keySet()){
                customAtt = new BOSJSONMproV1.Custom_attributes();
                customAtt.data_type = 'string';
                customAtt.key = custKey;
                customAtt.value = String.valueOf(selectionContainerParser.get(selectionContainerAttributesMap.get(custKey)));
                customAtt.object_type = 'custom_attribute';
                customAttributesList.add(customAtt);
            }
            for(String custKey : serieAttributesMap.keySet()){
                customAtt = new BOSJSONMproV1.Custom_attributes();
                customAtt.data_type = 'string';
                customAtt.key = custKey;
                if(selectedLaminateSerie != null){
                    customAtt.value = String.valueOf(selectedLaminateSerie.get(serieAttributesMap.get(custKey)));   
                }
                customAtt.object_type = 'custom_attribute';
                customAttributesList.add(customAtt);
            }
            for(String custKey : specieAttributesMap.keySet()){
                customAtt = new BOSJSONMproV1.Custom_attributes();
                customAtt.data_type = 'string';
                customAtt.key = custKey;
                if(selectedStainedSpecie != null) {
                    customAtt.value = String.valueOf(selectedStainedSpecie.get(specieAttributesMap.get(custKey)));
                }
                customAtt.object_type = 'custom_attribute';
                customAttributesList.add(customAtt);
            }
            for(String custKey : collectionAttributesMap.keySet()){
                customAtt = new BOSJSONMproV1.Custom_attributes();
                customAtt.data_type = 'string';
                customAtt.key = custKey;
                if(selectedLaminateCollection != null){
                    customAtt.value = String.valueOf(selectedLaminateCollection.get(collectionAttributesMap.get(custKey)));   
                }
                customAtt.object_type = 'custom_attribute';
                customAttributesList.add(customAtt);
            }
            for(String custKey : selectedColorAttributesMap.keySet()){
                customAtt = new BOSJSONMproV1.Custom_attributes();
                customAtt.data_type = 'string';
                customAtt.key = custKey;
                if(selectedColor != null){
                    customAtt.value = String.valueOf(selectedColor.get(selectedColorAttributesMap.get(custKey)));   
                }
                customAtt.object_type = 'custom_attribute';
                customAttributesList.add(customAtt);
            }
            
            whole = 0.0; numerator = 0.0; denominator = 0.0;
            
            for(String custKey : widthAttributesMap.keySet()){
                if(custKey.equals('whole')){
                    whole = Double.valueOf(orderedWidth.get(widthAttributesMap.get(custKey))); 
                }else if(custKey.equals('numerator')){
                    numerator = Double.valueOf(orderedWidth.get(widthAttributesMap.get(custKey)));
                }else if(custKey.equals('denominator')){
                    denominator = Double.valueOf(orderedWidth.get(widthAttributesMap.get(custKey)));
                }
            }
            customAtt = new BOSJSONMproV1.Custom_attributes();
            customAtt.data_type = 'string';
            customAtt.key = 'door_width';
            customAtt.value = UtilityHolder.calculateMixedFraction(whole, numerator, denominator);
            customAtt.object_type = 'custom_attribute';
            customAttributesList.add(customAtt);
            
            whole = 0.0; numerator = 0.0; denominator = 0.0;
            
            for(String custKey : heightAttributesMap.keySet()){
                if(custKey.equals('whole')){
                    whole = Double.valueOf(orderedHeight.get(heightAttributesMap.get(custKey)));   
                }else if(custKey.equals('numerator')){
                    numerator = Double.valueOf(orderedHeight.get(heightAttributesMap.get(custKey)));
                }else if(custKey.equals('denominator')){
                    denominator = Double.valueOf(orderedHeight.get(heightAttributesMap.get(custKey)));
                }
            }
            customAtt = new BOSJSONMproV1.Custom_attributes();
            customAtt.data_type = 'string';
            customAtt.key = 'door_height';
            customAtt.value = UtilityHolder.calculateMixedFraction(whole, numerator, denominator);
            customAtt.object_type = 'custom_attribute';
            customAttributesList.add(customAtt);
            
            for(String custKey : litesAttributesMap.keySet()){
                customAtt = new BOSJSONMproV1.Custom_attributes();
                customAtt.data_type = 'string';
                customAtt.key = custKey;
                if(numberLites != null){
                    if(numberLites.get(litesAttributesMap.get(custKey)) != 0 && doorInfo.get('glassStyle') != null){
                        customAtt.value = numberLites.get(litesAttributesMap.get(custKey)) + '-Style ' + String.valueOf(doorInfo.get('glassStyle'));                    
                    }else{
                        customAtt.value = String.valueOf(numberLites.get(litesAttributesMap.get(custKey))); 
                    }
                }
                customAtt.object_type = 'custom_attribute';
                customAttributesList.add(customAtt);
            }
            for(String custKey : skuAttributesList){
                customAtt = new BOSJSONMproV1.Custom_attributes();
                customAtt.data_type = 'string';
                customAtt.key = custKey;
                customAtt.value = null;
                customAtt.object_type = 'custom_attribute';
                customAttributesList.add(customAtt);
            }
            
            bosFormatProdLinesDoor.custom_attributes=customAttributesList;
            bosFormatProdLinesList.add(bosFormatProdLinesDoor);
            i++;
        }
        
        //			~~~~~~~~~~~~~~~~~~~~~~~~~ Drawer Fronts ~~~~~~~~~~~~~~~~~~~~~~~~~
        List<Object> drawerConfigs = (List<Object>) measurement.get('drawerConfigurations');
        
        // 							~~~~~~~~~~~ Getting Keys and Values from DrawerFronts class ~~~~~~~~~~~
        SkuMappingDrawerFronts drawerFront = new SkuMappingDrawerFronts();
        Map<String, String> dfItemAttributesMap = drawerFront.getDrawerFrontItemAttributes();
        Map<String, String> dfAttributesMap = drawerFront.getDrawerFrontAttributes();
        Map<String, String> dfSelectionContainerMap = drawerFront.getDfSelectionContainer();
        Map<String, String> dfSpecieInSelectionContainerMap = drawerFront.getDfSpecieInSelectionContainer();
        Map<String, String> dfSerieInSelectionContainerMap = drawerFront.getDfSerieInSelectionContainer();
        Map<String, String> dfCollectionNameMap = drawerFront.getDfCollectionName();
        Map<String, String> dfSelectedColorMap = drawerFront.getDfSelectedColor();
        Map<String, String> dfWidthMap = drawerFront.getDfWidth();
        Map<String, String> dfHeightMap = drawerFront.getDfHeight();
        List<String> dfSkuAttributes = drawerFront.getDfSkuAttributes();
        
        i = 0;
        while(i < drawerConfigs.size()){
            Map<String, Object> drawerConfigElement = (Map<String, Object>) drawerConfigs[i];
            Map<String, Object> drawerDimensionContainer = (Map<String, Object>) drawerConfigElement.get('drawerDimensionContainer');
            List<Object> drawerFronts = (List<Object>) drawerDimensionContainer.get('drawerFronts');
            integer counterForDf = 0;
            while(counterForDf < drawerFronts.size()){
                Map<String, Object> drawerFrontElement = (Map<String, Object>) drawerFronts[counterForDf];
                Map<String, Object> dfItem = (Map<String, Object>) drawerFrontElement.get('item');
                Map<String, Object> width = (Map<String, Object>) drawerFrontElement.get('width');
                Map<String, Object> height = (Map<String, Object>) drawerFrontElement.get('height');
                
                BOSJSONMproV1.Product_lines productLineDf = new BOSJSONMproV1.Product_lines();
                List<BOSJSONMproV1.Custom_attributes> customAttibutesList = new List<BOSJSONMproV1.Custom_attributes>();
                BOSJSONMproV1.Custom_attributes custAtt;
                
                productLineDf.object_type = 'line';            
                productLineDf.productName ='drawerFront';
                productLineDf.id = '0';
                productLineDf.id_type = null;
                productLineDf.external_id = null;
                productLineDf.quantity = 1;
                productLineDf.id_source = 'Measure Pro';
                productLineDf.retail_price_per_item = null;
                productLineDf.retail_price = null;
                
                for(String custKey : dfItemAttributesMap.keySet()){
                    custAtt = new BOSJSONMproV1.Custom_attributes();
                    custAtt.data_type = 'string';
                    custAtt.key = custKey;
                    if(dfItem != null){
                        custAtt.value = String.valueOf(dfItem.get(dfItemAttributesMap.get(custKey)));
                    }
                    custAtt.object_type = 'custom_attribute';
                    customAttibutesList.add(custAtt);
                }
                for(String custKey : dfAttributesMap.keySet()){
                    custAtt = new BOSJSONMproV1.Custom_attributes();
                    custAtt.data_type = 'string';
                    custAtt.key = custKey;
                    if(drawerFrontElement != null){
                        custAtt.value = String.valueOf(drawerFrontElement.get(dfAttributesMap.get(custKey)));   
                    }
                    custAtt.object_type = 'custom_attribute';
                    customAttibutesList.add(custAtt);
                }
                for(String custKey : dfSelectionContainerMap.keySet()){
                    custAtt = new BOSJSONMproV1.Custom_attributes();
                    custAtt.data_type = 'string';
                    custAtt.key = custKey;
                    if(selectionContainerParser != null){
                        custAtt.value = String.valueOf(selectionContainerParser.get(dfSelectionContainerMap.get(custKey)));
                    }
                    custAtt.object_type = 'custom_attribute';
                    customAttibutesList.add(custAtt);
                }
                for(String custKey : dfSpecieInSelectionContainerMap.keySet()){
                    custAtt = new BOSJSONMproV1.Custom_attributes();
                    custAtt.data_type = 'string';
                    custAtt.key = custKey;
                    if(selectedStainedSpecie != null){
                        custAtt.value = String.valueOf(selectedStainedSpecie.get(dfSpecieInSelectionContainerMap.get(custKey)));   
                    }
                    custAtt.object_type = 'custom_attribute';
                    customAttibutesList.add(custAtt);
                }
                for(String custKey : dfSerieInSelectionContainerMap.keySet()){
                    custAtt = new BOSJSONMproV1.Custom_attributes();
                    custAtt.data_type = 'string';
                    custAtt.key = custKey;
                    if(selectedLaminateSerie != null){
                        custAtt.value = String.valueOf(selectedLaminateSerie.get(dfSerieInSelectionContainerMap.get(custKey)));   
                    }
                    custAtt.object_type = 'custom_attribute';
                    customAttibutesList.add(custAtt);
                }
                for(String custKey : dfCollectionNameMap.keySet()){
                    custAtt = new BOSJSONMproV1.Custom_attributes();
                    custAtt.data_type = 'string';
                    custAtt.key = custKey;
                    if(selectedLaminateCollection != null){
                        custAtt.value = String.valueOf(selectedLaminateCollection.get(dfCollectionNameMap.get(custKey)));   
                    }
                    custAtt.object_type = 'custom_attribute';
                    customAttibutesList.add(custAtt);
                }
                for(String custKey : dfSelectedColorMap.keySet()){
                    custAtt = new BOSJSONMproV1.Custom_attributes();
                    custAtt.data_type = 'string';
                    custAtt.key = custKey;
                    if(selectedColor != null){
                        custAtt.value = String.valueOf(selectedColor.get(dfSelectedColorMap.get(custKey)));   
                    }                    
                    custAtt.object_type = 'custom_attribute';
                    customAttibutesList.add(custAtt);
                }
                
                double whole = 0.0, numerator = 0.0, denominator = 0.0;
                
                for(String custKey : dfWidthMap.keySet()){
                    if(custKey.equals('whole')){
                        whole = Double.valueOf(width.get(dfWidthMap.get(custKey))); 
                    }else if(custKey.equals('numerator')){
                        numerator = Double.valueOf(width.get(dfWidthMap.get(custKey)));
                    }else if(custKey.equals('denominator')){
                        denominator = Double.valueOf(width.get(dfWidthMap.get(custKey)));
                    }
                }
                custAtt = new BOSJSONMproV1.Custom_attributes();
                custAtt.data_type = 'string';
                custAtt.key = 'df_width';
                custAtt.value = UtilityHolder.calculateMixedFraction(whole, numerator, denominator);
                custAtt.object_type = 'custom_attribute';
                customAttibutesList.add(custAtt);
                
                whole = 0.0; numerator = 0.0; denominator = 0.0;
                
                for(String custKey : dfHeightMap.keySet()){
                    if(custKey.equals('whole')){
                        whole = Double.valueOf(height.get(dfHeightMap.get(custKey))); 
                    }else if(custKey.equals('numerator')){
                        numerator = Double.valueOf(height.get(dfHeightMap.get(custKey)));
                    }else if(custKey.equals('denominator')){
                        denominator = Double.valueOf(height.get(dfHeightMap.get(custKey)));
                    }
                }
                custAtt = new BOSJSONMproV1.Custom_attributes();
                custAtt.data_type = 'string';
                custAtt.key = 'df_height';
                custAtt.value = UtilityHolder.calculateMixedFraction(whole, numerator, denominator);
                custAtt.object_type = 'custom_attribute';
                customAttibutesList.add(custAtt);
                
                for(String custKey : dfSkuAttributes){
                    custAtt = new BOSJSONMproV1.Custom_attributes();
                    custAtt.data_type = 'string';
                    custAtt.key = custKey;
                    custAtt.value = null;
                    custAtt.object_type = 'custom_attribute';
                    customAttibutesList.add(custAtt);
                }
                productLineDf.custom_attributes = customAttibutesList;
                bosFormatProdLinesList.add(productLineDf);
                counterForDf++;
            }            
            i++;
        } 
        
        //				~~~~~~~~~~~~~~~~~~~~~~~~ Glazing ~~~~~~~~~~~~~~~~~~~~~~~
        i = 0;
        // 							~~~~~~~~~~~ Getting Keys and Values from DrawerFronts class ~~~~~~~~~~~
        SkuMappingGlaze glaze = new SkuMappingGlaze();
        Map<String, String> toggleContainerAttributesMap = glaze.getToggleContainerAttributes();
        Map<String, String> glazeSelectionContainerMap = glaze.getGlazeSelectionContainer();
        
        BOSJSONMproV1.Product_lines productLineGlazing = new BOSJSONMproV1.Product_lines();
        List<BOSJSONMproV1.Custom_attributes> customAttibutesListGlazing = new List<BOSJSONMproV1.Custom_attributes>();
        BOSJSONMproV1.Custom_attributes custAttGlaze;
        productLineGlazing.object_type = 'line';            
        productLineGlazing.productName ='Glazing';
        productLineGlazing.id = '0';
        productLineGlazing.id_type = null;
        productLineGlazing.external_id = null;
        productLineGlazing.quantity = 1;
        productLineGlazing.id_source = 'Measure Pro';
        productLineGlazing.retail_price_per_item = null;
        productLineGlazing.retail_price = null;    
        
        for(String custKey : toggleContainerAttributesMap.keySet()){
            if(Boolean.valueOf(toggleContainerParser.get('glazing'))){
                if(custKey.equals('glazing_feathered')){
                    custAttGlaze = new BOSJSONMproV1.Custom_attributes();
                    custAttGlaze.data_type = 'string';
                    custAttGlaze.key = custKey;
                    custAttGlaze.value = String.valueOf(toggleContainerParser.get(toggleContainerAttributesMap.get(custKey)));
                    custAttGlaze.object_type = 'custom_attribute';
                    customAttibutesListGlazing.add(custAttGlaze);
                }else if(custKey.equals('glazing_glazeDf') && Boolean.valueOf(toggleContainerParser.get('glazeDF'))){
                    custAttGlaze = new BOSJSONMproV1.Custom_attributes();
                    custAttGlaze.data_type = 'string';
                    custAttGlaze.key = custKey;
                    custAttGlaze.value = String.valueOf(toggleContainerParser.get(toggleContainerAttributesMap.get(custKey)));
                    custAttGlaze.object_type = 'custom_attribute';
                    customAttibutesListGlazing.add(custAttGlaze);
                }else if(custKey.equals('glazing_molding') && Boolean.valueOf(toggleContainerParser.get('glazeMolding'))){
                    custAttGlaze = new BOSJSONMproV1.Custom_attributes();
                    custAttGlaze.data_type = 'string';
                    custAttGlaze.key = custKey;
                    custAttGlaze.value = String.valueOf(toggleContainerParser.get(toggleContainerAttributesMap.get(custKey)));
                    custAttGlaze.object_type = 'custom_attribute';
                    customAttibutesListGlazing.add(custAttGlaze);
                }                
            }            
        }
        for(String custKey : glazeSelectionContainerMap.keySet()){
            if(Boolean.valueOf(toggleContainerParser.get('glazing'))){
                custAttGlaze = new BOSJSONMproV1.Custom_attributes();
                custAttGlaze.data_type = 'string';
                custAttGlaze.key = custKey;
                custAttGlaze.value = String.valueOf(selectionContainerParser.get(glazeSelectionContainerMap.get(custKey)));
                custAttGlaze.object_type = 'custom_attribute';
                customAttibutesListGlazing.add(custAttGlaze);
            }
        }
        productLineGlazing.custom_attributes = customAttibutesListGlazing;
        bosFormatProdLinesList.add(productLineGlazing);
        
        //			~~~~~~~~~~~~~~~~~~~~~~~~~ Molding ~~~~~~~~~~~~~~~~~~~~~~~~~        
        i = 0;
        Map<String, Object> moldingMeasurementContainer = (Map<String, Object>) measurement.get('moldingMeasurementContainer');
        List<Object> actualMoldingsList = (List<Object>) moldingMeasurementContainer.get('actualMoldings'); 
        SkuMappingMolding moldings = new SkuMappingMolding();
        
        // 							~~~~~~~~~~~ Getting Keys and Values from Moldings class ~~~~~~~~~~~
        Map<String, String> moldingNameMap = moldings.getMolding();
        Map<String, String> selectionContainerMoldingMap = moldings.getSelectionContainerMolding();
        Map<String, String> serieInSelectionContainerMoldingMap = moldings.getSerieInSelectionContainerMolding(); 
        Map<String, String> specieInSelectionContainerMoldingMap = moldings.getSpecieInSelectionContainerMolding();
        Map<String, String>  selectedColorMoldingMap = moldings.getSelectedColorMolding();
        Map<String, String> moldingQtyMap = moldings.getMoldingQty();
        List<String> skuAttributesMoldingList = moldings.getSkuAttributesMolding();       
        
        while(i < actualMoldingsList.size()){  
            BOSJSONMproV1.product_lines bosFormatProdLinesMolding = new BOSJSONMproV1.product_lines();
            List<BOSJSONMproV1.Custom_attributes> customAttributesListMolding  =new List<BOSJSONMproV1.Custom_attributes>();
            BOSJSONMproV1.Custom_attributes customAtt;
            
            bosFormatProdLinesMolding.object_type = 'line';            
            bosFormatProdLinesMolding.productName ='Molding';
            bosFormatProdLinesMolding.id = '0';
            bosFormatProdLinesMolding.id_type = null;
            bosFormatProdLinesMolding.external_id = null;
            bosFormatProdLinesMolding.quantity = 1;
            bosFormatProdLinesMolding.id_source = 'Measure Pro';
            bosFormatProdLinesMolding.retail_price_per_item = null;
            bosFormatProdLinesMolding.retail_price = null;
            
            Map<String, Object> actualMoldingElement  = (Map<String, Object>) actualMoldingsList[i];         
            
            //		~~~~~~~~~~ Molding inner attributes ~~~~~~~~~~~~
            
            Map<String, Object> moldingData  = (Map<String, Object>) actualMoldingElement.get('molding');
            Map<String, Object> moldingqty  = (Map<String, Object>) actualMoldingElement.get('qty');
            
            for(String custKey : moldingQtyMap.keySet()){
                customAtt = new BOSJSONMproV1.Custom_attributes();
                customAtt.data_type = 'string';
                customAtt.key = custKey;
                customAtt.value = String.valueOf(moldingqty.get(moldingQtyMap.get(custKey)));
                customAtt.object_type = 'custom_attribute';
                customAttributesListMolding.add(customAtt);
                
            }    
            for(String custKey : moldingNameMap.keySet()){
                customAtt = new BOSJSONMproV1.Custom_attributes();
                customAtt.data_type = 'string';
                customAtt.key = custKey;
                customAtt.value = String.valueOf(moldingData.get(moldingNameMap.get(custKey)));
                customAtt.object_type = 'custom_attribute';
                customAttributesListMolding.add(customAtt);
                
            } 
            
            for(String custKey : selectionContainerMoldingMap.keySet()){
                customAtt = new BOSJSONMproV1.Custom_attributes();
                customAtt.data_type = 'string';
                customAtt.key = custKey;
                customAtt.value = String.valueOf(selectionContainerParser.get(selectionContainerMoldingMap.get(custKey)));
                customAtt.object_type = 'custom_attribute';
                customAttributesListMolding.add(customAtt);
            }
            for(String custKey : serieInSelectionContainerMoldingMap.keySet()){
                customAtt = new BOSJSONMproV1.Custom_attributes();
                customAtt.data_type = 'string';
                customAtt.key = custKey;
                if(selectedLaminateSerie != null){
                    customAtt.value = String.valueOf(selectedLaminateSerie.get(serieInSelectionContainerMoldingMap.get(custKey)));   
                }
                customAtt.object_type = 'custom_attribute';
                customAttributesListMolding.add(customAtt);
            }
            for(String custKey : specieInSelectionContainerMoldingMap.keySet()){
                customAtt = new BOSJSONMproV1.Custom_attributes();
                customAtt.data_type = 'string';
                customAtt.key = custKey;
                if(selectedStainedSpecie != null) {
                    customAtt.value = String.valueOf(selectedStainedSpecie.get(specieInSelectionContainerMoldingMap.get(custKey)));
                }
                customAtt.object_type = 'custom_attribute';
                customAttributesListMolding.add(customAtt);
            }
            
            for(String custKey : selectedColorMoldingMap.keySet()){
                customAtt = new BOSJSONMproV1.Custom_attributes();
                customAtt.data_type = 'string';
                customAtt.key = custKey;
                if(selectedColor != null){
                    customAtt.value = String.valueOf(selectedColor.get(selectedColorMoldingMap.get(custKey)));   
                }
                customAtt.object_type = 'custom_attribute';
                customAttributesListMolding.add(customAtt);
            }
            for(String custKey : skuAttributesMoldingList){
                customAtt = new BOSJSONMproV1.Custom_attributes();
                customAtt.data_type = 'string';
                customAtt.key = custKey;
                customAtt.value = null;
                customAtt.object_type = 'custom_attribute';
                customAttributesListMolding.add(customAtt);
            }
            
            
            bosFormatProdLinesMolding.custom_attributes=customAttributesListMolding;
            bosFormatProdLinesList.add(bosFormatProdLinesMolding);
            
            i++;
            system.debug('+++++++++ molding +++++++' + customAttributesListMolding );
        }
        
        
        //			~~~~~~~~~~~~~~~~~~~~~~~~~ Hardware ~~~~~~~~~~~~~~~~~~~~~~~~~        
        i = 0;
        SkuMappingHardware hardware = new SkuMappingHardware();
        
        // 							~~~~~~~~~~~ Getting Keys and Values from Hardware class ~~~~~~~~~~~
        Map<String, String> hardwareHingesMap = hardware.getHardwareHinges();
        Map<String, String> hardwarePullsMap = hardware.getHardwarePulls();
        Map<String, String> hardwareDrawerGlidesMap = hardware.getHardwareDrawerGlides();
        Map<String, String> pullsQtyMap = hardware.getPullsQty();
        Map<String, String> hingesQtyMap = hardware.getHingesQty();
        Map<String, String> glidesQtyMap = hardware.getGlidesQty();
        List<String> skuAttributesHardwareList = hardware.getSkuAttributesHardware();    
        
        //	                        	~~~~~~~~~~ HardwarePulls attributes ~~~~~~~~~~~~
        
        i=0;
        while(i < doorConfigs.size()){            
            Map<String, Object> doorConfigElement = (Map<String, Object>) doorConfigs[i];
            integer pullsArray =0;
            List<Object> pullHardwaresList = (List<Object>) doorConfigElement.get('pullHardwares');
            while(pullsArray < pullHardwaresList.size()){
                BOSJSONMproV1.product_lines bosFormatProdLinesHardware = new BOSJSONMproV1.product_lines();
                List<BOSJSONMproV1.Custom_attributes> customAttributesListHardware  =new List<BOSJSONMproV1.Custom_attributes>();
                BOSJSONMproV1.Custom_attributes customAtt;
                bosFormatProdLinesHardware.object_type = 'line';            
                bosFormatProdLinesHardware.productName ='Hardware';
                bosFormatProdLinesHardware.id = '0';
                bosFormatProdLinesHardware.id_type = null;
                bosFormatProdLinesHardware.external_id = null;
                bosFormatProdLinesHardware.quantity = 1;
                bosFormatProdLinesHardware.id_source = 'Measure Pro';
                bosFormatProdLinesHardware.retail_price_per_item = null;
                bosFormatProdLinesHardware.retail_price = null;
                
                Map<String, Object> hardwarePullsElement = (Map<String, Object>) pullHardwaresList[pullsArray]; 
                Map<String, Object> pullData  = (Map<String, Object>) hardwarePullsElement.get('pullHardware');
                Map<String, Object> pullQty  = (Map<String, Object>) hardwarePullsElement.get('qty'); 
                
                
                for(String custKey : hardwarePullsMap.keySet()){
                    customAtt = new BOSJSONMproV1.Custom_attributes();
                    customAtt.data_type = 'string';
                    customAtt.key = custKey;
                    customAtt.value = String.valueOf(pullData.get(hardwarePullsMap.get(custKey)));
                    customAtt.object_type = 'custom_attribute';
                    customAttributesListHardware.add(customAtt);
                    
                }  
                for(String custKey : pullsQtyMap.keySet()){
                    customAtt = new BOSJSONMproV1.Custom_attributes();
                    customAtt.data_type = 'string';
                    customAtt.key = custKey;
                    customAtt.value = String.valueOf(pullQty.get(pullsQtyMap.get(custKey)));
                    customAtt.object_type = 'custom_attribute';
                    customAttributesListHardware.add(customAtt);
                    
                }  
                for(String custKey : skuAttributesHardwareList){
                    customAtt = new BOSJSONMproV1.Custom_attributes();
                    customAtt.data_type = 'string';
                    customAtt.key = custKey;
                    customAtt.value = null;
                    customAtt.object_type = 'custom_attribute';
                    customAttributesListHardware.add(customAtt);
                }
                
                bosFormatProdLinesHardware.custom_attributes=customAttributesListHardware;
                bosFormatProdLinesList.add(bosFormatProdLinesHardware);
                pullsArray++;
            }
            i++;
        }    
        
        //	                    	~~~~~~~~~~ HardwareHinges attributes ~~~~~~~~~~~~
        
        i=0;
        while(i < doorConfigs.size()){              
            Map<String, Object> doorConfigElement = (Map<String, Object>) doorConfigs[i];
            
            integer hingesArray =0;
            List<Object> pullHardwaresHingesList = (List<Object>) doorConfigElement.get('hinges');
            while(hingesArray < pullHardwaresHingesList.size()){
                BOSJSONMproV1.product_lines bosFormatProdLinesHardware = new BOSJSONMproV1.product_lines();
                List<BOSJSONMproV1.Custom_attributes> customAttributesListHardware  =new List<BOSJSONMproV1.Custom_attributes>();
                BOSJSONMproV1.Custom_attributes customAtt;
                
                bosFormatProdLinesHardware.object_type = 'line';            
                bosFormatProdLinesHardware.productName ='Hardware';
                bosFormatProdLinesHardware.id = '0';
                bosFormatProdLinesHardware.id_type = null;
                bosFormatProdLinesHardware.external_id = null;
                bosFormatProdLinesHardware.quantity = 1;
                bosFormatProdLinesHardware.id_source = 'Measure Pro';
                bosFormatProdLinesHardware.retail_price_per_item = null;
                bosFormatProdLinesHardware.retail_price = null;
                
                Map<String, Object> hardwareHingesElement = (Map<String, Object>) pullHardwaresHingesList[hingesArray]; 
                Map<String, Object> hingesData  = (Map<String, Object>) hardwareHingesElement.get('item');
                Map<String, Object> hingesQty  = (Map<String, Object>) hardwareHingesElement.get('qty'); 
                
                
                for(String custKey : hardwareHingesMap.keySet()){
                    customAtt = new BOSJSONMproV1.Custom_attributes();
                    customAtt.data_type = 'string';
                    customAtt.key = custKey;
                    customAtt.value = String.valueOf(hingesData.get(hardwareHingesMap.get(custKey)));
                    customAtt.object_type = 'custom_attribute';
                    customAttributesListHardware.add(customAtt);
                    
                }  
                for(String custKey : hingesQtyMap.keySet()){
                    customAtt = new BOSJSONMproV1.Custom_attributes();
                    customAtt.data_type = 'string';
                    customAtt.key = custKey;
                    customAtt.value = String.valueOf(hingesQty.get(hingesQtyMap.get(custKey)));
                    customAtt.object_type = 'custom_attribute';
                    customAttributesListHardware.add(customAtt);
                    
                } 
                for(String custKey : skuAttributesHardwareList){
                    customAtt = new BOSJSONMproV1.Custom_attributes();
                    customAtt.data_type = 'string';
                    customAtt.key = custKey;
                    customAtt.value = null;
                    customAtt.object_type = 'custom_attribute';
                    customAttributesListHardware.add(customAtt);
                }
                
                bosFormatProdLinesHardware.custom_attributes=customAttributesListHardware;
                bosFormatProdLinesList.add(bosFormatProdLinesHardware);
                hingesArray ++;
            }
            i++;
        }    
        
        
        //	                    	~~~~~~~~~~ Hardware DrawerGlides attributes ~~~~~~~~~~~~
        
        i=0;
        while(i < doorConfigs.size()){  
            Map<String, Object> doorConfigElement = (Map<String, Object>) doorConfigs[i];            
            integer glidesArray =0;
            List<Object> pullHardwaresGlidesList = (List<Object>) doorConfigElement.get('drawerGlides');
            while(glidesArray < pullHardwaresGlidesList.size()){  
                BOSJSONMproV1.product_lines bosFormatProdLinesHardware = new BOSJSONMproV1.product_lines();
                List<BOSJSONMproV1.Custom_attributes> customAttributesListHardware  =new List<BOSJSONMproV1.Custom_attributes>();
                BOSJSONMproV1.Custom_attributes customAtt;
                
                bosFormatProdLinesHardware.object_type = 'line';            
                bosFormatProdLinesHardware.productName ='Hardware';
                bosFormatProdLinesHardware.id = '0';
                bosFormatProdLinesHardware.id_type = null;
                bosFormatProdLinesHardware.external_id = null;
                bosFormatProdLinesHardware.quantity = 1;
                bosFormatProdLinesHardware.id_source = 'Measure Pro';
                bosFormatProdLinesHardware.retail_price_per_item = null;
                bosFormatProdLinesHardware.retail_price = null;
                
                Map<String, Object> hardwareGlidesElement = (Map<String, Object>) pullHardwaresGlidesList[glidesArray]; 
                Map<String, Object> glidesData  = (Map<String, Object>) hardwareGlidesElement.get('item');
                Map<String, Object> glidesQty  = (Map<String, Object>) hardwareGlidesElement.get('qty'); 
                
                
                for(String custKey : hardwareDrawerGlidesMap.keySet()){
                    customAtt = new BOSJSONMproV1.Custom_attributes();
                    customAtt.data_type = 'string';
                    customAtt.key = custKey;
                    customAtt.value = String.valueOf(glidesData.get(hardwareDrawerGlidesMap.get(custKey)));
                    customAtt.object_type = 'custom_attribute';
                    customAttributesListHardware.add(customAtt);
                    
                }  
                for(String custKey : glidesQtyMap.keySet()){
                    customAtt = new BOSJSONMproV1.Custom_attributes();
                    customAtt.data_type = 'string';
                    customAtt.key = custKey;
                    customAtt.value = String.valueOf(glidesQty.get(glidesQtyMap.get(custKey)));
                    customAtt.object_type = 'custom_attribute';
                    customAttributesListHardware.add(customAtt);
                    
                }    
                
                for(String custKey : skuAttributesHardwareList){
                    customAtt = new BOSJSONMproV1.Custom_attributes();
                    customAtt.data_type = 'string';
                    customAtt.key = custKey;
                    customAtt.value = null;
                    customAtt.object_type = 'custom_attribute';
                    customAttributesListHardware.add(customAtt);
                }
                bosFormatProdLinesHardware.custom_attributes=customAttributesListHardware;
                bosFormatProdLinesList.add(bosFormatProdLinesHardware);
                
                glidesArray ++;
            }            
            i++;
        }    
        
        //			~~~~~~~~~~~~~~~~~~~~~~~~~ Accessories ~~~~~~~~~~~~~~~~~~~~~~~~~        
        
        SkuMappingAccessories accessories = new SkuMappingAccessories();
        
        List<Object> selectedHWAccessoriesList =  (List<Object>) selectionContainerParser.get('selectedHWAccessories');
        // 							~~~~~~~~~~~ Getting Keys and Values from Accessories class ~~~~~~~~~~~
        Map<String, String> accessoriesOptionsMap = accessories.getAccessoriesOptions();
        Map<String, String> accessoriesSizeModelMap = accessories.getAccessoriesSizeModel();
        Map<String, String> accessoriesItemMap = accessories.getAccessoriesItem();
        Map<String, String> accessoriesQtyMap = accessories.getAccessoriesQty();
        List<String> skuAttributesAccList = accessories.getSkuAttributesAcc();    
        
        //	                        	~~~~~~~~~~ Accessories attributes ~~~~~~~~~~~~
        
        i=0;
        
        while(i< selectedHWAccessoriesList.size()){
            Map<String, Object> accessoriesElements = (Map<String, Object>) selectedHWAccessoriesList[i];
            BOSJSONMproV1.product_lines bosFormatProdLinesAccessories= new BOSJSONMproV1.product_lines();
            List<BOSJSONMproV1.Custom_attributes> customAttributesListAccessories  =new List<BOSJSONMproV1.Custom_attributes>();
            BOSJSONMproV1.Custom_attributes customAtt;
            
            bosFormatProdLinesAccessories.object_type = 'line';            
            bosFormatProdLinesAccessories.productName ='Accessories';
            bosFormatProdLinesAccessories.id = '0';
            bosFormatProdLinesAccessories.id_type = null;
            bosFormatProdLinesAccessories.external_id = null;
            bosFormatProdLinesAccessories.quantity = 1;
            bosFormatProdLinesAccessories.id_source = 'Measure Pro';
            bosFormatProdLinesAccessories.retail_price_per_item = null;
            bosFormatProdLinesAccessories.retail_price = null;
            
            
            Map<String, Object> optionsData  = (Map<String, Object>) accessoriesElements.get('option');
            Map<String, Object> sizeModel  = (Map<String, Object>) accessoriesElements.get('sizeModel');
            Map<String, Object> qty  = (Map<String, Object>) accessoriesElements.get('qty');
            
            for(String custKey : accessoriesOptionsMap.keySet()){
                customAtt = new BOSJSONMproV1.Custom_attributes();
                customAtt.data_type = 'string';
                customAtt.key = custKey;
                customAtt.value = String.valueOf(optionsData.get(accessoriesOptionsMap.get(custKey)));
                customAtt.object_type = 'custom_attribute';
                customAttributesListAccessories.add(customAtt);
                
            }  
            for(String custKey : accessoriesSizeModelMap.keySet()){
                customAtt = new BOSJSONMproV1.Custom_attributes();
                customAtt.data_type = 'string';
                customAtt.key = custKey;
                customAtt.value = String.valueOf(sizeModel.get(accessoriesSizeModelMap.get(custKey)));
                customAtt.object_type = 'custom_attribute';
                customAttributesListAccessories.add(customAtt);
                
            } 
            for(String custKey : accessoriesItemMap.keySet()){
                customAtt = new BOSJSONMproV1.Custom_attributes();
                customAtt.data_type = 'string';
                customAtt.key = custKey;
                customAtt.value = String.valueOf(accessoriesElements.get(accessoriesItemMap.get(custKey)));
                customAtt.object_type = 'custom_attribute';
                customAttributesListAccessories.add(customAtt);
                
            } 
            
            for(String custKey : accessoriesQtyMap.keySet()){
                customAtt = new BOSJSONMproV1.Custom_attributes();
                customAtt.data_type = 'string';
                customAtt.key = custKey;
                customAtt.value = String.valueOf(qty.get(accessoriesQtyMap.get(custKey)));
                customAtt.object_type = 'custom_attribute';
                customAttributesListAccessories.add(customAtt);
                
            } 
            for(String custKey : skuAttributesAccList){
                customAtt = new BOSJSONMproV1.Custom_attributes();
                customAtt.data_type = 'string';
                customAtt.key = custKey;
                customAtt.value = 'null';
                customAtt.object_type = 'custom_attribute';
                customAttributesListAccessories.add(customAtt);
                
            } 
            
            bosFormatProdLinesAccessories.custom_attributes=customAttributesListAccessories;
            bosFormatProdLinesList.add(bosFormatProdLinesAccessories);
            i++;
        }
        
        
        
        //			~~~~~~~~~~~~~~~~~~~~~~~~~ Accessories Refacing ~~~~~~~~~~~~~~~~~~~~~~~~~        
        
        SkuMappingAccessoriesRefacing accessoriesRefacing = new SkuMappingAccessoriesRefacing();
        
        List<Object> selectedHWAccessoriesRefacingList =  (List<Object>) selectionContainerParser.get('selectedHWAccessories');
        // 							~~~~~~~~~~~ Getting Keys and Values from Accessories class ~~~~~~~~~~~
        Map<String, String> accessoriesOptionsRefMap = accessoriesRefacing.getAccessoriesOptions();
        Map<String, String> accessoriesSizeModelRefMap = accessoriesRefacing.getAccessoriesSizeModel();
        Map<String, String> accessoriesItemRefMap = accessoriesRefacing.getAccessoriesItem();
        Map<String, String> accessoriesQtyRefMap = accessoriesRefacing.getAccessoriesQty();
        List<String> skuAttributesAccRefList = accessoriesRefacing.getSkuAttributesAcc();    
        
        
        
        //	                        	~~~~~~~~~~ Accessories Refacing attributes ~~~~~~~~~~~~
        
        i=0;
        
        while(i< selectedHWAccessoriesRefacingList.size()){
            Map<String, Object> accessoriesElements = (Map<String, Object>) selectedHWAccessoriesRefacingList[i];
            BOSJSONMproV1.product_lines bosFormatProdLinesAccessories= new BOSJSONMproV1.product_lines();
            List<BOSJSONMproV1.Custom_attributes> customAttributesListAccessories  =new List<BOSJSONMproV1.Custom_attributes>();
            BOSJSONMproV1.Custom_attributes customAtt;
            
            bosFormatProdLinesAccessories.object_type = 'line';            
            bosFormatProdLinesAccessories.productName ='Refacing Accessories';
            bosFormatProdLinesAccessories.id = '0';
            bosFormatProdLinesAccessories.id_type = null;
            bosFormatProdLinesAccessories.external_id = null;
            bosFormatProdLinesAccessories.quantity = 1;
            bosFormatProdLinesAccessories.id_source = 'Measure Pro';
            bosFormatProdLinesAccessories.retail_price_per_item = null;
            bosFormatProdLinesAccessories.retail_price = null;
            
            
            Map<String, Object> optionsData  = (Map<String, Object>) accessoriesElements.get('option');
            Map<String, Object> sizeModel  = (Map<String, Object>) accessoriesElements.get('sizeModel');
            Map<String, Object> qty  = (Map<String, Object>) accessoriesElements.get('qty');
            
            for(String custKey : accessoriesOptionsRefMap.keySet()){
                customAtt = new BOSJSONMproV1.Custom_attributes();
                customAtt.data_type = 'string';
                customAtt.key = custKey;
                customAtt.value = String.valueOf(optionsData.get(accessoriesOptionsRefMap.get(custKey)));
                customAtt.object_type = 'custom_attribute';
                customAttributesListAccessories.add(customAtt);
                
            }  
            for(String custKey : accessoriesSizeModelRefMap.keySet()){
                customAtt = new BOSJSONMproV1.Custom_attributes();
                customAtt.data_type = 'string';
                customAtt.key = custKey;
                customAtt.value = String.valueOf(sizeModel.get(accessoriesSizeModelRefMap.get(custKey)));
                customAtt.object_type = 'custom_attribute';
                customAttributesListAccessories.add(customAtt);
                
            } 
            for(String custKey : accessoriesItemRefMap.keySet()){
                customAtt = new BOSJSONMproV1.Custom_attributes();
                customAtt.data_type = 'string';
                customAtt.key = custKey;
                customAtt.value = String.valueOf(accessoriesElements.get(accessoriesItemRefMap.get(custKey)));
                customAtt.object_type = 'custom_attribute';
                customAttributesListAccessories.add(customAtt);
                
            } 
            
            for(String custKey : accessoriesQtyRefMap.keySet()){
                customAtt = new BOSJSONMproV1.Custom_attributes();
                customAtt.data_type = 'string';
                customAtt.key = custKey;
                customAtt.value = String.valueOf(qty.get(accessoriesQtyRefMap.get(custKey)));
                customAtt.object_type = 'custom_attribute';
                customAttributesListAccessories.add(customAtt);
                
            } 
            for(String custKey : skuAttributesAccList){
                customAtt = new BOSJSONMproV1.Custom_attributes();
                customAtt.data_type = 'string';
                customAtt.key = custKey;
                customAtt.value = 'null';
                customAtt.object_type = 'custom_attribute';
                customAttributesListAccessories.add(customAtt);
                
            } 
            
            bosFormatProdLinesAccessories.custom_attributes=customAttributesListAccessories;
            bosFormatProdLinesList.add(bosFormatProdLinesAccessories);
            i++;
        }
        
        // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Cabinet ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        SkuMappingCabinets cabinets = new SkuMappingCabinets();      
        // 							~~~~~~~~~~~ Getting Keys and Values from Cabinets class ~~~~~~~~~~~        
        Map<String, String> cabinetConfigAttributesMap = cabinets.cabinetConfigAttributes();
        Map<String, String> innerCabinetAttributesMap = cabinets.innerCabinetAttributes();
        Map<String, String> shelvesOptionAttributesMap = cabinets.shelvesOptionAttributes();
        Map<String, String> clipsOptionAttributesMap = cabinets.clipsOptionAttributes();
        Map<String, String> measureAttributesMap = cabinets.measureAttributes();
        Map<String, String> cabOptionsAttributesMap = cabinets.cabOptionsAttributes();
        
        i = 0;
        List<Object> cabinetConfigs = (List<Object>) measurement.get('cabinetConfigurations');
        while(i < cabinetConfigs.size()){
            Map<String, Object> cabinetConfigElement = (Map<String, Object>) cabinetConfigs[i];
            BOSJSONMproV1.Product_lines cabinetProductLine = new BOSJSONMproV1.Product_lines();
            List<BOSJSONMproV1.Custom_attributes> custAttributesList = new List<BOSJSONMproV1.Custom_attributes>();
            BOSJSONMproV1.Custom_attributes custAtt;
            
            cabinetProductLine.object_type = 'line';            
            cabinetProductLine.productName ='Cabinet';
            cabinetProductLine.id = '0';
            cabinetProductLine.id_type = null;
            cabinetProductLine.external_id = null;
            cabinetProductLine.quantity = 1;
            cabinetProductLine.id_source = 'Measure Pro';
            cabinetProductLine.retail_price_per_item = null;
            cabinetProductLine.retail_price = null;
            
            Map<String, Object> cabinet = (Map<String, Object>) cabinetConfigElement.get('cabinet');
            Map<String, Object> options = (Map<String, Object>) cabinetConfigElement.get('options');
            Map<String, Object> revealLeft = (Map<String, Object>) cabinetConfigElement.get('revealLeft');
            Map<String, Object> revealRight = (Map<String, Object>) cabinetConfigElement.get('revealRight');
            Map<String, Object> clipsOption = (Map<String, Object>) cabinetConfigElement.get('clipsOption');
            Map<String, Object> shelvesOption = (Map<String, Object>) cabinetConfigElement.get('shelvesOption');
            List<Object> inputs = (List<Object>) cabinetConfigElement.get('inputs');
            
            for(String custKey : cabinetConfigAttributesMap.keySet()){
                custAtt = new BOSJSONMproV1.Custom_attributes();
                custAtt.data_type = 'string';
                custAtt.key = custKey;
                custAtt.value = String.valueOf(cabinetConfigElement.get(cabinetConfigAttributesMap.get(custKey)));
                custAtt.object_type = 'custom_attribute';
                custAttributesList.add(custAtt);
            }
            for(String custKey : innerCabinetAttributesMap.keySet()){
                custAtt = new BOSJSONMproV1.Custom_attributes();
                custAtt.data_type = 'string';
                custAtt.key = custKey;
                custAtt.value = String.valueOf(cabinet.get(innerCabinetAttributesMap.get(custKey)));
                custAtt.object_type = 'custom_attribute';
                custAttributesList.add(custAtt);
            }
            for(String custKey : shelvesOptionAttributesMap.keySet()){
                custAtt = new BOSJSONMproV1.Custom_attributes();
                custAtt.data_type = 'string';
                custAtt.key = custKey;
                custAtt.value = String.valueOf(shelvesOption.get(shelvesOptionAttributesMap.get(custKey)));
                custAtt.object_type = 'custom_attribute';
                custAttributesList.add(custAtt);
            }
            for(String custKey : clipsOptionAttributesMap.keySet()){
                custAtt = new BOSJSONMproV1.Custom_attributes();
                custAtt.data_type = 'string';
                custAtt.key = custKey;
                custAtt.value = String.valueOf(clipsOption.get(clipsOptionAttributesMap.get(custKey)));
                custAtt.object_type = 'custom_attribute';
                custAttributesList.add(custAtt);
            }
            
            double whole = 0.0, numerator = 0.0, denominator = 0.0;
            
            for(String custKey : measureAttributesMap.keySet()){
                if(custKey.equals('whole')){
                    whole = Double.valueOf(revealLeft.get(measureAttributesMap.get(custKey)));   
                }else if(custKey.equals('numerator')){
                    numerator = Double.valueOf(revealLeft.get(measureAttributesMap.get(custKey)));
                }else if(custKey.equals('denominator')){
                    denominator = Double.valueOf(revealLeft.get(measureAttributesMap.get(custKey)));
                }
            }
            custAtt = new BOSJSONMproV1.Custom_attributes();
            custAtt.data_type = 'string';
            custAtt.key = 'cabinet_sideRevealL';
            custAtt.value = UtilityHolder.calculateMixedFraction(whole, numerator, denominator);
            custAtt.object_type = 'custom_attribute';
            custAttributesList.add(custAtt);
            
            whole = 0.0; numerator = 0.0; denominator = 0.0;
            
            for(String custKey : measureAttributesMap.keySet()){
                if(custKey.equals('whole')){
                    whole = Double.valueOf(revealRight.get(measureAttributesMap.get(custKey)));   
                }else if(custKey.equals('numerator')){
                    numerator = Double.valueOf(revealRight.get(measureAttributesMap.get(custKey)));
                }else if(custKey.equals('denominator')){
                    denominator = Double.valueOf(revealRight.get(measureAttributesMap.get(custKey)));
                }
            }
            custAtt = new BOSJSONMproV1.Custom_attributes();
            custAtt.data_type = 'string';
            custAtt.key = 'cabinet_sideRevealR';
            custAtt.value = UtilityHolder.calculateMixedFraction(whole, numerator, denominator);
            custAtt.object_type = 'custom_attribute';
            custAttributesList.add(custAtt);
            
            integer inputsCounter = 0;
            while(inputsCounter < inputs.size()){
                Map<String, Object> inputElement = (Map<String, Object>) inputs[inputsCounter];
                Map<String, Object> inputMeasure = (Map<String, Object>) inputElement.get('measure');
                
                whole = 0.0; numerator = 0.0; denominator = 0.0;
                
                for(String measure : measureAttributesMap.keySet()){                    
                    if(measure.equals('whole')){
                        whole = Double.valueOf(inputMeasure.get(measureAttributesMap.get(measure)));   
                    }else if(measure.equals('numerator')){
                        numerator = Double.valueOf(inputMeasure.get(measureAttributesMap.get(measure)));
                    }else if(measure.equals('denominator')){
                        denominator = Double.valueOf(inputMeasure.get(measureAttributesMap.get(measure)));
                    }
                }
                custAtt = new BOSJSONMproV1.Custom_attributes();
                custAtt.data_type = 'string';
                custAtt.key = String.valueOf(inputElement.get('inputId'));
                custAtt.value = UtilityHolder.calculateMixedFraction(whole, numerator, denominator);
                custAtt.object_type = 'custom_attribute';
                custAttributesList.add(custAtt);
                
                inputsCounter++;
            }
            
            for(String custKey : cabOptionsAttributesMap.keySet()){
                if(!custKey.equals('notes') && Boolean.valueOf(options.get(custKey))){
                    custAtt = new BOSJSONMproV1.Custom_attributes();
                    custAtt.data_type = 'string';
                    custAtt.key = cabOptionsAttributesMap.get(custKey);
                    custAtt.value = custKey;
                    custAtt.object_type = 'custom_attribute';
                    custAttributesList.add(custAtt);
                }else if(custKey.equals('notes') && options.get(custKey) != null && options.get(custKey) != ''){
                    custAtt = new BOSJSONMproV1.Custom_attributes();
                    custAtt.data_type = 'string';
                    custAtt.key = 'cabinet Options Notes';
                    custAtt.value = String.valueOf(options.get(custKey));                        
                    custAtt.object_type = 'custom_attribute';
                    custAttributesList.add(custAtt);
                }
            }            
            
            cabinetProductLine.custom_attributes = custAttributesList;
            bosFormatProdLinesList.add(cabinetProductLine);
            i++;
        }
      
        bosFormatProd.product_lines=bosFormatProdLinesList;    
        bosFormatProdList.add(bosFormatProd);
        bosInput.products=bosFormatProdList;
        String JSONRequest=JSON.serialize(bosInput);
        system.debug('BOS JSON: ' + JSONRequest);
    }
}