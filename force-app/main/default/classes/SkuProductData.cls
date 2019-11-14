public class SkuProductData {
    static List<Unique_Mapping_SKUs__c> listOfDoorData = new List<Unique_Mapping_SKUs__c>();
    static List<Unique_Mapping_SKUs__c> listOfCabinetData = new List<Unique_Mapping_SKUs__c>();
    static List<Unique_Mapping_SKUs__c> listOfDrawerFrontData = new List<Unique_Mapping_SKUs__c>();
    static List<Unique_Mapping_SKUs__c> listOfMoldingsData = new List<Unique_Mapping_SKUs__c>();
    static List<Unique_Mapping_SKUs__c> listOfdrawerBoxAndPullouts = new List<Unique_Mapping_SKUs__c>();
    static List<Unique_Mapping_SKUs__c> listOfHardwares = new List<Unique_Mapping_SKUs__c>();
    static List<Unique_Mapping_SKUs__c> listOfShelves = new List<Unique_Mapping_SKUs__c>();
    static List<Unique_Mapping_SKUs__c> listOfOMParts = new List<Unique_Mapping_SKUs__c>();
    static List<Unique_Mapping_SKUs__c> listOfPanelingData = new List<Unique_Mapping_SKUs__c>();
    static List<Unique_Mapping_SKUs__c> listOfAccessories = new List<Unique_Mapping_SKUs__c>();
    
    
    static String upchargeSkuNumber;
    static String storedModelName, storedPanelType, storedPanelDesign, storedColor, storedSerieName, storedStainedSpecies, storedPaintedSpecies, storedSkuNumber;
    static Separate_SKUs__c separateSkus;
    
    public SKUProductData(){
        listOfDoorData = [select Model_Name__c, Panel_Type__c, Panel_Design__c, Color__c, Species__c, Series__c, SKU_Number__c from Unique_Mapping_SKUs__c where RecordType.Name = 'Door'];
        listOfCabinetData = [select Cabinet_Type__c, SKU_Number__c from Unique_Mapping_SKUs__c where RecordType.Name = 'Cabinet'];
        listOfDrawerFrontData = [select Model_Name__c, Number_of_Pieces__c, Color__c, SKU_Number__c from Unique_Mapping_SKUs__c where RecordType.Name = 'Drawer Fronts'];
        listOfMoldingsData= [Select Type__c,Part__c,Color__c,Species__c, SKU_Number__c from Unique_Mapping_SKUs__c where RecordType.Name = 'Molding'];
        listOfdrawerBoxAndPullouts = [select Drawer_Type__c, Material_Type__c, SKU_Number__c from Unique_Mapping_SKUs__c where RecordType.Name = 'Drawer Box'];
        listOfShelves=[Select FinishedPart__c,FinishedShelves__c,PlywoodPart__c,PlywoodShelves__c,Color__c,Finished_SkuNumber__c,Plywood_SkuNumber__c from Unique_Mapping_SKUs__c where RecordType.Name = 'Shelves'];
        listOfOMParts = [Select Name__c,Color__c,Part__c,Species__c ,SKU_Number__c from Unique_Mapping_SKUs__c where RecordType.Name = 'Other Material Parts'];
        listOfHardwares = [Select Hw__c, Accpcc__c, Part__c, Hardware_Type__c, SKU_Number__c from Unique_Mapping_SKUs__c where RecordType.Name = 'Hardware'];
        listOfPanelingData = [Select Material__c, Color__c, Location__c, SKU_Number__c from Unique_Mapping_SKUs__c where RecordType.Name = 'Paneling'];
        listOfAccessories = [Select Part__c, SKU_Number__c from Unique_Mapping_SKUs__c where RecordType.Name = 'Accessories'];
        separateSkus = [select FG_SKU__c, Bore_SKU__c, Lites_1_SKU__c, Lites_4_SKU__c, Lites_8_SKU__c, Lites_11_SKU__c, Distressing_SKU__c, Glazing_SKU__c,Upcharge_SKU__c from Separate_SKUs__c where ID = 'a2U6A000000m6GS'];
    }
    
    public static String getStoredDoorData(String modelName, String panelType, String panelDesign, String color, String serieName, String stainedSpecies, String paintedSpecies){
        String storedSkuNumber;
        
        return storedSkuNumber;
    }
    
    public static String getDoorData(String modelName, String panelType, String panelDesign, String color, String serieName, String stainedSpecies, String paintedSpecies){        
        for(Unique_Mapping_SKUs__c record : listOfDoorData){
            if(record.Model_Name__c.equals(modelName) && record.Panel_Type__c.equals(panelType) && record.Panel_Design__c.equals(panelDesign) && record.Color__c.equals(color)){
                if(record.Series__c != null && serieName != null && record.Series__c.equals(serieName)){
                    return record.SKU_Number__c;
                }else if(record.Species__c != null){
                    if(stainedSpecies != null || paintedSpecies != null){
                        return record.SKU_Number__c;
                    }
                }
            }
        }
        return '';
    }
    public static String getCabinetData(String cabinetType){
        for(Unique_Mapping_SKUs__c record : listOfCabinetData){
            if(record.Cabinet_Type__c != NULL) {
                if(record.Cabinet_Type__c.equals(cabinetType)){
                   return record.SKU_Number__c;
                }
            }
        }
        return null;
    }
    public static String getDrawerFrontsData(String modelName, String color, String nOfPieces){
        String skuNumber;
        for(Unique_Mapping_SKUs__c record : listOfDrawerFrontData){
         /*   if(record.Model_Name__c.equals(modelName) && record.Color__c.equals(color) && record.Number_of_Pieces__c.equals(nOfPieces)){
                skuNumber = record.SKU_Number__c;
            } */
        }
        return skuNumber;
    }
    public static String getMoldingsData(String moldingtType, String color,String partNumber, String stainedSpecies , string paintedSpecies){
        String skuNumber;
        for(Unique_Mapping_SKUs__c record : listOfMoldingsData){
            if(record.Type__c.equals(moldingtType) && record.Color__c.equals(color) && record.Part__c.equals(partNumber) ){
                if(record.Species__c != null){
                    if(record.Species__c.equals(stainedSpecies) || record.Species__c.equals(paintedSpecies)){
                        skuNumber = record.SKU_Number__c;
                        break;
                    }   
                }else{
                    skuNumber = record.SKU_Number__c;
                    break;
                }                  
            }
        }
        return skuNumber;
    }   
    public static String getFinishedShelvesData(String finishedShelves, String color, String finishedPartNum){
        String skuNumber;
        for(Unique_Mapping_SKUs__c record : listOfShelves){
            if(record.FinishedShelves__c.equals(finishedShelves) && record.Color__c.equals(color) && record.FinishedPart__c.equals(finishedPartNum)){
                skuNumber = record.Finished_SkuNumber__c; 
                break;
            }
        }
        return skuNumber;
    }
    public static String getPlywoodShelvesData(String finishedShelves, String color, String finishedPartNum){
        String skuNumber;
        for(Unique_Mapping_SKUs__c record : listOfShelves){
            if(record.PlywoodPart__c != null) {
                if(record.PlywoodShelves__c.equals(finishedShelves) && record.Color__c.equals(color) && record.PlywoodPart__c.equals(finishedPartNum)){
                    skuNumber = record.Plywood_SkuNumber__c;  
                }
            }
            else{
                skuNumber = record.Plywood_SkuNumber__c;   
            }
        }
        return skuNumber;
    }
    public static String getDrawerBoxAndPulloutsData(String drawerType, String materialType){
        String skuNumber;
        for(Unique_Mapping_SKUs__c record : listOfdrawerBoxAndPullouts){
            if(record.Drawer_Type__c.equalsIgnoreCase(drawerType) && record.Material_Type__c.equals(materialType)){
                skuNumber = record.SKU_Number__c;
                system.debug('' + skuNumber);
                break;
            }
        }
        return skuNumber;
    }
    public static String getHardwaresData(String hardwareType, String partNumber, String hardwareNum, String accpccNum){
        for(Unique_Mapping_SKUs__c record : listOfHardwares){
            if(hardwareType.equals('Pulls') && accpccNum == null){
                if(record.Hardware_Type__c.equals(hardwareType) && record.Part__c.equals(partNumber) && record.Hw__c.equals(hardwareNum)){
                    return record.SKU_Number__c;
                }
            }else if(hardwareType.equals('Hinges') && hardwareNum == null){
                if(record.Hardware_Type__c.equals(hardwareType) && record.Part__c.equals(partNumber) && record.Accpcc__c.equals(accpccNum)){
                    return record.SKU_Number__c;
                }
            }else if(hardwareType.equals('Drawer Glides') && hardwareNum == null){
                if(record.Hardware_Type__c.equals(hardwareType) && record.Part__c.equals(partNumber) && record.Accpcc__c.equals(accpccNum)){
                    return record.SKU_Number__c;
                }
            }
        }
        return null;
    } 
    public static String getOMPartsData(String name, String color,String partNumber, String stainedSpecies , string paintedSpecies){
        String skuNumber; 
        for(Unique_Mapping_SKUs__c record : listOfOMParts){
            if(record.Name__c.equals(name) && record.Color__c.equals(color) && record.Part__c.equals(partNumber) ) {
                if(record.Species__c != null){
                    if(record.Species__c.equals(stainedSpecies) || record.Species__c.equals(paintedSpecies)){
                        skuNumber = record.SKU_Number__c;
                        break;
                    }   
                }else{
                    skuNumber = record.SKU_Number__c;
                    break;
                }                  
            }
        }
        return skuNumber;
    } 
    public static String getPanelingData(String material, String location ,String color){
        String skuNumber;
        for(Unique_Mapping_SKUs__c record : listOfPanelingData){
            if(record.Material__c.equals(material) && record.Color__c.equals(color) && record.Location__c.equals(location) ){                
                skuNumber = record.SKU_Number__c;
                break;                   
            }
        }
        return skuNumber;
    }  
    public static String getAccessories(String partNumber){
        for(Unique_Mapping_SKUs__c record : listOfAccessories){
            if(record.Part__c.equals(partNumber)){
                return record.SKU_Number__c;
            }
        }
        return '';
    }
    public static String getFgSkuNumber(){
        return separateSkus.FG_SKU__c;
    }
    public static String getBoreSkuNumber(){
        return separateSkus.Bore_SKU__c;
    }
    public static String getDfUpchargeOf5pieces(){
        return separateSkus.Upcharge_SKU__c;
    } 
    public static String getLitesSkuNumber(integer noOfLites){
        if(noOfLites == 1){
            return separateSkus.Lites_1_SKU__c;
        }else if(noOfLites == 4){
            return separateSkus.Lites_4_SKU__c;
        }else if(noOfLites == 8){
            return separateSkus.Lites_8_SKU__c;
        }else if(noOfLites == 11){
            return separateSkus.Lites_11_SKU__c;
        }else{
            return '';
        }
    }
    public static String getDistressing(){
        return separateSkus.Distressing_SKU__c;
    }
    public static String getGlazing(){
        return separateSkus.Glazing_SKU__c;
    }
    public static String getDrawerFront5piecesUpcharge(){
        return upchargeSkuNumber;
    }
}