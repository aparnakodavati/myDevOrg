public class sfdcProductJSONParsing {

    public class MoldingMeasurementContainer {
        public CalculatedMoldings calculatedMoldings {get;set;} 
        public List<ActualMoldings> actualMoldings {get;set;} 
        public MaterialMeasurementContainer materialMeasurementContainer {get;set;} 
        public Boolean initialized {get;set;} 

        public MoldingMeasurementContainer(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'calculatedMoldings') {
                            calculatedMoldings = new CalculatedMoldings(parser);
                        } else if (text == 'actualMoldings') {
                            actualMoldings = arrayOfActualMoldings(parser);
                        } else if (text == 'materialMeasurementContainer') {
                            materialMeasurementContainer = new MaterialMeasurementContainer(parser);
                        } else if (text == 'initialized') {
                            initialized = parser.getBooleanValue();
                        } else {
                            System.debug(LoggingLevel.WARN, 'MoldingMeasurementContainer consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class Customer {
        public String name {get;set;} 
        public String address {get;set;} 
        public String suite {get;set;} 
        public String zip {get;set;} 
        public String city {get;set;} 
        public String state {get;set;} 
        public String phone {get;set;} 
        public String phone2 {get;set;} 
        public Integer branchDistance {get;set;} 
        public String notes {get;set;} 

        public Customer(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'name') {
                            name = parser.getText();
                        } else if (text == 'address') {
                            address = parser.getText();
                        } else if (text == 'suite') {
                            suite = parser.getText();
                        } else if (text == 'zip') {
                            zip = parser.getText();
                        } else if (text == 'city') {
                            city = parser.getText();
                        } else if (text == 'state') {
                            state = parser.getText();
                        } else if (text == 'phone') {
                            phone = parser.getText();
                        } else if (text == 'phone2') {
                            phone2 = parser.getText();
                        } else if (text == 'branchDistance') {
                            branchDistance = parser.getIntegerValue();
                        } else if (text == 'notes') {
                            notes = parser.getText();
                        } else {
                            System.debug(LoggingLevel.WARN, 'Customer consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class CabinetWidths {
        public String id {get;set;} 
        public Depth width {get;set;} 
        public Depth height {get;set;} 
        public Boolean pantryOven {get;set;} 
        public String newExteriorType {get;set;} 
        public Boolean flushBottoms {get;set;} 
        public Boolean lightRail {get;set;} 
        public Boolean inside90 {get;set;} 
        public Boolean diagonal {get;set;} 

        public CabinetWidths(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'id') {
                            id = parser.getText();
                        } else if (text == 'width') {
                            width = new Depth(parser);
                        } else if (text == 'height') {
                            height = new Depth(parser);
                        } else if (text == 'pantryOven') {
                            pantryOven = parser.getBooleanValue();
                        } else if (text == 'newExteriorType') {
                            newExteriorType = parser.getText();
                        } else if (text == 'flushBottoms') {
                            flushBottoms = parser.getBooleanValue();
                        } else if (text == 'lightRail') {
                            lightRail = parser.getBooleanValue();
                        } else if (text == 'inside90') {
                            inside90 = parser.getBooleanValue();
                        } else if (text == 'diagonal') {
                            diagonal = parser.getBooleanValue();
                        } else {
                            System.debug(LoggingLevel.WARN, 'CabinetWidths consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class ActualMoldings {
        public Molding molding {get;set;} 
        public ContractAmount qty {get;set;} 

        public ActualMoldings(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'molding') {
                            molding = new Molding(parser);
                        } else if (text == 'qty') {
                            qty = new ContractAmount(parser);
                        } else {
                            System.debug(LoggingLevel.WARN, 'ActualMoldings consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class SizeModel {
        public Integer id {get;set;} 
        public String name {get;set;} 
        public String description {get;set;} 
        public String partNumber {get;set;} 
        public String itemNumber {get;set;} 
        public String lineItem {get;set;} 
        public Object updateDate {get;set;} 
        public Object updateUser {get;set;} 
        public Integer refAccessory_id {get;set;} 

        public SizeModel(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'id') {
                            id = parser.getIntegerValue();
                        } else if (text == 'name') {
                            name = parser.getText();
                        } else if (text == 'description') {
                            description = parser.getText();
                        } else if (text == 'partNumber') {
                            partNumber = parser.getText();
                        } else if (text == 'itemNumber') {
                            itemNumber = parser.getText();
                        } else if (text == 'lineItem') {
                            lineItem = parser.getText();
                        } else if (text == 'updateDate') {
                            updateDate = parser.readValueAs(Object.class);
                        } else if (text == 'updateUser') {
                            updateUser = parser.readValueAs(Object.class);
                        } else if (text == 'refAccessory_id') {
                            refAccessory_id = parser.getIntegerValue();
                        } else {
                            System.debug(LoggingLevel.WARN, 'SizeModel consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class CabinetWidths_Z {
        public String id {get;set;} 
        public Depth width {get;set;} 
        public Depth height {get;set;} 
        public Boolean pantryOven {get;set;} 
        public String newExteriorType {get;set;} 

        public CabinetWidths_Z(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'id') {
                            id = parser.getText();
                        } else if (text == 'width') {
                            width = new Depth(parser);
                        } else if (text == 'height') {
                            height = new Depth(parser);
                        } else if (text == 'pantryOven') {
                            pantryOven = parser.getBooleanValue();
                        } else if (text == 'newExteriorType') {
                            newExteriorType = parser.getText();
                        } else {
                            System.debug(LoggingLevel.WARN, 'CabinetWidths_Z consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class SelectedColor {
        public Integer id {get;set;} 
        public String colorName {get;set;} 
        public Object imageFile {get;set;} 
        public Boolean isGlaze {get;set;} 
        public Boolean isRegular {get;set;} 
        public Boolean isHighGloss {get;set;} 
        public Object hasBackDoorColors {get;set;} 
        public List<Integer> doorModelIds {get;set;} 
        public List<Integer> drawerFrontModelIds {get;set;} 
        public List<String> backDoorColors {get;set;} 
        public List<String> endPanels {get;set;} 
        public List<String> frontFaces {get;set;} 

        public SelectedColor(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'id') {
                            id = parser.getIntegerValue();
                        } else if (text == 'colorName') {
                            colorName = parser.getText();
                        } else if (text == 'imageFile') {
                            imageFile = parser.readValueAs(Object.class);
                        } else if (text == 'isGlaze') {
                            isGlaze = parser.getBooleanValue();
                        } else if (text == 'isRegular') {
                            isRegular = parser.getBooleanValue();
                        } else if (text == 'isHighGloss') {
                            isHighGloss = parser.getBooleanValue();
                        } else if (text == 'hasBackDoorColors') {
                            hasBackDoorColors = parser.readValueAs(Object.class);
                        } else if (text == 'doorModelIds') {
                            doorModelIds = arrayOfInteger(parser);
                        } else if (text == 'drawerFrontModelIds') {
                            drawerFrontModelIds = arrayOfInteger(parser);
                        } else if (text == 'backDoorColors') {
                            backDoorColors = arrayOfString(parser);
                        } else if (text == 'endPanels') {
                            endPanels = arrayOfString(parser);
                        } else if (text == 'frontFaces') {
                            frontFaces = arrayOfString(parser);
                        } else {
                            System.debug(LoggingLevel.WARN, 'SelectedColor consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class DrawerGlides {
        public Item_Z item {get;set;} 
        public ContractAmount qty {get;set;} 

        public DrawerGlides(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'item') {
                            item = new Item_Z(parser);
                        } else if (text == 'qty') {
                            qty = new ContractAmount(parser);
                        } else {
                            System.debug(LoggingLevel.WARN, 'DrawerGlides consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class Hinges {
        public Item item {get;set;} 
        public ContractAmount qty {get;set;} 

        public Hinges(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'item') {
                            item = new Item(parser);
                        } else if (text == 'qty') {
                            qty = new ContractAmount(parser);
                        } else {
                            System.debug(LoggingLevel.WARN, 'Hinges consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class Item {
        public String hingeRecordType {get;set;} 
        public Integer id {get;set;} 
        public String cabinetType {get;set;} 
        public String hingeType {get;set;} 
        public String name {get;set;} 
        public String description {get;set;} 
        public Double overlay {get;set;} 
        public String overlayDisplay {get;set;} 
        public String itemNumber {get;set;} 
        public Object lineItem {get;set;} 
        public String vendorNumber {get;set;} 
        public String partNumber {get;set;} 

        public Item(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'hingeRecordType') {
                            hingeRecordType = parser.getText();
                        } else if (text == 'id') {
                            id = parser.getIntegerValue();
                        } else if (text == 'cabinetType') {
                            cabinetType = parser.getText();
                        } else if (text == 'hingeType') {
                            hingeType = parser.getText();
                        } else if (text == 'name') {
                            name = parser.getText();
                        } else if (text == 'description') {
                            description = parser.getText();
                        } else if (text == 'overlay') {
                            overlay = parser.getDoubleValue();
                        } else if (text == 'overlayDisplay') {
                            overlayDisplay = parser.getText();
                        } else if (text == 'itemNumber') {
                            itemNumber = parser.getText();
                        } else if (text == 'lineItem') {
                            lineItem = parser.readValueAs(Object.class);
                        } else if (text == 'vendorNumber') {
                            vendorNumber = parser.getText();
                        } else if (text == 'partNumber') {
                            partNumber = parser.getText();
                        } else {
                            System.debug(LoggingLevel.WARN, 'Item consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class Accessory {
        public Integer id {get;set;} 
        public Integer vendorId {get;set;} 
        public String accessoryType {get;set;} 
        public String accessoryTypeDescription {get;set;} 
        public String materialType {get;set;} 
        public String accessoryName {get;set;} 
        public String accessoryDescription {get;set;} 
        public String itemNumber {get;set;} 
        public String partNumber {get;set;} 
        public Integer minWidth {get;set;} 
        public Integer minHeight {get;set;} 
        public Integer minLength {get;set;} 
        public Integer maxWidth {get;set;} 
        public Integer maxHeight {get;set;} 
        public Integer maxLength {get;set;} 

        public Accessory(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'id') {
                            id = parser.getIntegerValue();
                        } else if (text == 'vendorId') {
                            vendorId = parser.getIntegerValue();
                        } else if (text == 'accessoryType') {
                            accessoryType = parser.getText();
                        } else if (text == 'accessoryTypeDescription') {
                            accessoryTypeDescription = parser.getText();
                        } else if (text == 'materialType') {
                            materialType = parser.getText();
                        } else if (text == 'accessoryName') {
                            accessoryName = parser.getText();
                        } else if (text == 'accessoryDescription') {
                            accessoryDescription = parser.getText();
                        } else if (text == 'itemNumber') {
                            itemNumber = parser.getText();
                        } else if (text == 'partNumber') {
                            partNumber = parser.getText();
                        } else if (text == 'minWidth') {
                            minWidth = parser.getIntegerValue();
                        } else if (text == 'minHeight') {
                            minHeight = parser.getIntegerValue();
                        } else if (text == 'minLength') {
                            minLength = parser.getIntegerValue();
                        } else if (text == 'maxWidth') {
                            maxWidth = parser.getIntegerValue();
                        } else if (text == 'maxHeight') {
                            maxHeight = parser.getIntegerValue();
                        } else if (text == 'maxLength') {
                            maxLength = parser.getIntegerValue();
                        } else {
                            System.debug(LoggingLevel.WARN, 'Accessory consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class Valances {

        public Valances(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        {
                            System.debug(LoggingLevel.WARN, 'Valances consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class NewLaminateCounterTopDefinition {
        public Boolean includeCounterTop {get;set;} 
        public String bsHt {get;set;} 
        public String edge {get;set;} 
        public String color {get;set;} 
        public Boolean includeWallLaminate {get;set;} 
        public NumberWallDecorativeDoors wallLaminateSize {get;set;} 
        public NumberWallDecorativeDoors numberSplays {get;set;} 

        public NewLaminateCounterTopDefinition(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'includeCounterTop') {
                            includeCounterTop = parser.getBooleanValue();
                        } else if (text == 'bsHt') {
                            bsHt = parser.getText();
                        } else if (text == 'edge') {
                            edge = parser.getText();
                        } else if (text == 'color') {
                            color = parser.getText();
                        } else if (text == 'includeWallLaminate') {
                            includeWallLaminate = parser.getBooleanValue();
                        } else if (text == 'wallLaminateSize') {
                            wallLaminateSize = new NumberWallDecorativeDoors(parser);
                        } else if (text == 'numberSplays') {
                            numberSplays = new NumberWallDecorativeDoors(parser);
                        } else {
                            System.debug(LoggingLevel.WARN, 'NewLaminateCounterTopDefinition consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class SinkFaucetDefinition {
        public Boolean includeSink {get;set;} 
        public Boolean includeFaucet {get;set;} 
        public String sinkModel {get;set;} 
        public String faucetModel {get;set;} 
        public NumberWallDecorativeDoors strainers {get;set;} 
        public Boolean includeSoapDispenser {get;set;} 
        public Boolean includeHoleCover {get;set;} 

        public SinkFaucetDefinition(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'includeSink') {
                            includeSink = parser.getBooleanValue();
                        } else if (text == 'includeFaucet') {
                            includeFaucet = parser.getBooleanValue();
                        } else if (text == 'sinkModel') {
                            sinkModel = parser.getText();
                        } else if (text == 'faucetModel') {
                            faucetModel = parser.getText();
                        } else if (text == 'strainers') {
                            strainers = new NumberWallDecorativeDoors(parser);
                        } else if (text == 'includeSoapDispenser') {
                            includeSoapDispenser = parser.getBooleanValue();
                        } else if (text == 'includeHoleCover') {
                            includeHoleCover = parser.getBooleanValue();
                        } else {
                            System.debug(LoggingLevel.WARN, 'SinkFaucetDefinition consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class GlazeDefinition {
        public Boolean doorAndDrawerFrontGlazing {get;set;} 
        public Boolean moldingGlazing {get;set;} 
        public Boolean doorAndDrawerFrontDistressing {get;set;} 
        public Boolean feathered {get;set;} 

        public GlazeDefinition(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'doorAndDrawerFrontGlazing') {
                            doorAndDrawerFrontGlazing = parser.getBooleanValue();
                        } else if (text == 'moldingGlazing') {
                            moldingGlazing = parser.getBooleanValue();
                        } else if (text == 'doorAndDrawerFrontDistressing') {
                            doorAndDrawerFrontDistressing = parser.getBooleanValue();
                        } else if (text == 'feathered') {
                            feathered = parser.getBooleanValue();
                        } else {
                            System.debug(LoggingLevel.WARN, 'GlazeDefinition consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class MaterialMeasurementContainer {
        public List<MaterialEnds> materialEnds {get;set;} 
        public List<Valances> materialFacing {get;set;} 
        public Boolean initialized {get;set;} 

        public MaterialMeasurementContainer(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'materialEnds') {
                            materialEnds = arrayOfMaterialEnds(parser);
                        } else if (text == 'materialFacing') {
                            materialFacing = arrayOfValances(parser);
                        } else if (text == 'initialized') {
                            initialized = parser.getBooleanValue();
                        } else {
                            System.debug(LoggingLevel.WARN, 'MaterialMeasurementContainer consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class MoldingContainer {
        public Molding ceiling {get;set;} 
        public Molding floor {get;set;} 
        public Molding verticals {get;set;} 
        public Molding lightRail {get;set;} 

        public MoldingContainer(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'ceiling') {
                            ceiling = new Molding(parser);
                        } else if (text == 'floor') {
                            floor = new Molding(parser);
                        } else if (text == 'verticals') {
                            verticals = new Molding(parser);
                        } else if (text == 'lightRail') {
                            lightRail = new Molding(parser);
                        } else {
                            System.debug(LoggingLevel.WARN, 'MoldingContainer consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class Items {
        public String name {get;set;} 
        public Integer index {get;set;} 
        public String nextPageName {get;set;} 
        public String previousPageName {get;set;} 

        public Items(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'name') {
                            name = parser.getText();
                        } else if (text == 'index') {
                            index = parser.getIntegerValue();
                        } else if (text == 'nextPageName') {
                            nextPageName = parser.getText();
                        } else if (text == 'previousPageName') {
                            previousPageName = parser.getText();
                        } else {
                            System.debug(LoggingLevel.WARN, 'Items consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class SelectedCorbels {
        public Corbel corbel {get;set;} 
        public Height height {get;set;} 
        public Height width {get;set;} 
        public ContractAmount qty {get;set;} 

        public SelectedCorbels(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'corbel') {
                            corbel = new Corbel(parser);
                        } else if (text == 'height') {
                            height = new Height(parser);
                        } else if (text == 'width') {
                            width = new Height(parser);
                        } else if (text == 'qty') {
                            qty = new ContractAmount(parser);
                        } else {
                            System.debug(LoggingLevel.WARN, 'SelectedCorbels consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class Job {
        public String jobType {get;set;} 
        public JobDefinition jobDefinition {get;set;} 
        public Customer customer {get;set;} 
        public String notes {get;set;} 
        public String exteriorActionType {get;set;} 
        public String existingCabinetType {get;set;} 
        public DoorDefinition doorDefinition {get;set;} 
        public DrawerFrontDefinition drawerFrontDefinition {get;set;} 
        public GlazeDefinition glazeDefinition {get;set;} 
        public GlassDoorDefinition glassDoorDefinition {get;set;} 
        public MetalAndGrooveDefinition metalAndGrooveDefinition {get;set;} 
        public HingeDefinition hingeDefinition {get;set;} 
        public ValanceDefinition valanceDefinition {get;set;} 
        public KnickKnackDefinition knickKnackDefinition {get;set;} 
        public AccessoryDefinition accessoryDefinition {get;set;} 
        public RefacingSurfaceDefinition refacingSurfaceDefinition {get;set;} 
        public NewCabinetDefinition newCabinetDefinition {get;set;} 
        public DrawerBoxDefinition drawerBoxDefinition {get;set;} 
        public NewLaminateCounterTopDefinition newLaminateCounterTopDefinition {get;set;} 
        public InstallationExtraDefinition installationExtraDefinition {get;set;} 
        public ToeKickDefinition toeKickDefinition {get;set;} 
        public SinkFaucetDefinition sinkFaucetDefinition {get;set;} 
        public Measurement measurement {get;set;} 
        public Boolean verified {get;set;} 

        public Job(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'jobType') {
                            jobType = parser.getText();
                        } else if (text == 'jobDefinition') {
                            jobDefinition = new JobDefinition(parser);
                        } else if (text == 'customer') {
                            customer = new Customer(parser);
                        } else if (text == 'notes') {
                            notes = parser.getText();
                        } else if (text == 'exteriorActionType') {
                            exteriorActionType = parser.getText();
                        } else if (text == 'existingCabinetType') {
                            existingCabinetType = parser.getText();
                        } else if (text == 'doorDefinition') {
                            doorDefinition = new DoorDefinition(parser);
                        } else if (text == 'drawerFrontDefinition') {
                            drawerFrontDefinition = new DrawerFrontDefinition(parser);
                        } else if (text == 'glazeDefinition') {
                            glazeDefinition = new GlazeDefinition(parser);
                        } else if (text == 'glassDoorDefinition') {
                            glassDoorDefinition = new GlassDoorDefinition(parser);
                        } else if (text == 'metalAndGrooveDefinition') {
                            metalAndGrooveDefinition = new MetalAndGrooveDefinition(parser);
                        } else if (text == 'hingeDefinition') {
                            hingeDefinition = new HingeDefinition(parser);
                        } else if (text == 'valanceDefinition') {
                            valanceDefinition = new ValanceDefinition(parser);
                        } else if (text == 'knickKnackDefinition') {
                            knickKnackDefinition = new KnickKnackDefinition(parser);
                        } else if (text == 'accessoryDefinition') {
                            accessoryDefinition = new AccessoryDefinition(parser);
                        } else if (text == 'refacingSurfaceDefinition') {
                            refacingSurfaceDefinition = new RefacingSurfaceDefinition(parser);
                        } else if (text == 'newCabinetDefinition') {
                            newCabinetDefinition = new NewCabinetDefinition(parser);
                        } else if (text == 'drawerBoxDefinition') {
                            drawerBoxDefinition = new DrawerBoxDefinition(parser);
                        } else if (text == 'newLaminateCounterTopDefinition') {
                            newLaminateCounterTopDefinition = new NewLaminateCounterTopDefinition(parser);
                        } else if (text == 'installationExtraDefinition') {
                            installationExtraDefinition = new InstallationExtraDefinition(parser);
                        } else if (text == 'toeKickDefinition') {
                            toeKickDefinition = new ToeKickDefinition(parser);
                        } else if (text == 'sinkFaucetDefinition') {
                            sinkFaucetDefinition = new SinkFaucetDefinition(parser);
                        } else if (text == 'measurement') {
                            measurement = new Measurement(parser);
                        } else if (text == 'verified') {
                            verified = parser.getBooleanValue();
                        } else {
                            System.debug(LoggingLevel.WARN, 'Job consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class SelectedVendorColor {
        public Integer id {get;set;} 
        public String materialType {get;set;} 
        public String type_Z {get;set;} // in json: type
        public String category {get;set;} 
        public String code {get;set;} 
        public Object name {get;set;} 
        public Object description {get;set;} 
        public Object updateDate {get;set;} 
        public Object updateUser {get;set;} 
        public Integer refTHDDoorColor_id {get;set;} 
        public Integer vendor_id {get;set;} 

        public SelectedVendorColor(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'id') {
                            id = parser.getIntegerValue();
                        } else if (text == 'materialType') {
                            materialType = parser.getText();
                        } else if (text == 'type') {
                            type_Z = parser.getText();
                        } else if (text == 'category') {
                            category = parser.getText();
                        } else if (text == 'code') {
                            code = parser.getText();
                        } else if (text == 'name') {
                            name = parser.readValueAs(Object.class);
                        } else if (text == 'description') {
                            description = parser.readValueAs(Object.class);
                        } else if (text == 'updateDate') {
                            updateDate = parser.readValueAs(Object.class);
                        } else if (text == 'updateUser') {
                            updateUser = parser.readValueAs(Object.class);
                        } else if (text == 'refTHDDoorColor_id') {
                            refTHDDoorColor_id = parser.getIntegerValue();
                        } else if (text == 'vendor_id') {
                            vendor_id = parser.getIntegerValue();
                        } else {
                            System.debug(LoggingLevel.WARN, 'SelectedVendorColor consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class JobDefinition {
        public Long createDate {get;set;} 
        public String jobNumber {get;set;} 
        public String customerJobNumber {get;set;} 
        public String branchNumber {get;set;} 
        public String storeNumber {get;set;} 
        public ContractAmount contractAmount {get;set;} 
        public String contractDate {get;set;} 
        public String measureDate {get;set;} 
        public Boolean pre1978 {get;set;} 
        public String customerRating {get;set;} 
        public String jobRating {get;set;} 
        public String timeZoneId {get;set;} 
        public String updateDate {get;set;} 

        public JobDefinition(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'createDate') {
                            createDate = parser.getLongValue();
                        } else if (text == 'jobNumber') {
                            jobNumber = parser.getText();
                        } else if (text == 'customerJobNumber') {
                            customerJobNumber = parser.getText();
                        } else if (text == 'branchNumber') {
                            branchNumber = parser.getText();
                        } else if (text == 'storeNumber') {
                            storeNumber = parser.getText();
                        } else if (text == 'contractAmount') {
                            contractAmount = new ContractAmount(parser);
                        } else if (text == 'contractDate') {
                            contractDate = parser.getText();
                        } else if (text == 'measureDate') {
                            measureDate = parser.getText();
                        } else if (text == 'pre1978') {
                            pre1978 = parser.getBooleanValue();
                        } else if (text == 'customerRating') {
                            customerRating = parser.getText();
                        } else if (text == 'jobRating') {
                            jobRating = parser.getText();
                        } else if (text == 'timeZoneId') {
                            timeZoneId = parser.getText();
                        } else if (text == 'updateDate') {
                            updateDate = parser.getText();
                        } else {
                            System.debug(LoggingLevel.WARN, 'JobDefinition consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class AccessoryDefinition {
        public ContractAmount numberPlywoodShelves {get;set;} 

        public AccessoryDefinition(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'numberPlywoodShelves') {
                            numberPlywoodShelves = new ContractAmount(parser);
                        } else {
                            System.debug(LoggingLevel.WARN, 'AccessoryDefinition consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class SelectedHWAccessories {
        public String item {get;set;} 
        public Option option {get;set;} 
        public SizeModel sizeModel {get;set;} 
        public ContractAmount qty {get;set;} 

        public SelectedHWAccessories(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'item') {
                            item = parser.getText();
                        } else if (text == 'option') {
                            option = new Option(parser);
                        } else if (text == 'sizeModel') {
                            sizeModel = new SizeModel(parser);
                        } else if (text == 'qty') {
                            qty = new ContractAmount(parser);
                        } else {
                            System.debug(LoggingLevel.WARN, 'SelectedHWAccessories consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class OtherRefacingContainer {
        public Boolean cutInNewDoor {get;set;} 
        public Boolean islandPeninsula {get;set;} 
        public Boolean soffitArea {get;set;} 
        public Boolean otherAreas {get;set;} 

        public OtherRefacingContainer(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'cutInNewDoor') {
                            cutInNewDoor = parser.getBooleanValue();
                        } else if (text == 'islandPeninsula') {
                            islandPeninsula = parser.getBooleanValue();
                        } else if (text == 'soffitArea') {
                            soffitArea = parser.getBooleanValue();
                        } else if (text == 'otherAreas') {
                            otherAreas = parser.getBooleanValue();
                        } else {
                            System.debug(LoggingLevel.WARN, 'OtherRefacingContainer consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class SelectedAddOns {
        public Accessory accessory {get;set;} 
        public Depth width {get;set;} 
        public Depth height {get;set;} 
        public Length length {get;set;} 
        public ContractAmount qty {get;set;} 

        public SelectedAddOns(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'accessory') {
                            accessory = new Accessory(parser);
                        } else if (text == 'width') {
                            width = new Depth(parser);
                        } else if (text == 'height') {
                            height = new Depth(parser);
                        } else if (text == 'length') {
                            length = new Length(parser);
                        } else if (text == 'qty') {
                            qty = new ContractAmount(parser);
                        } else {
                            System.debug(LoggingLevel.WARN, 'SelectedAddOns consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class Molding {
        public Integer id {get;set;} 
        public String name {get;set;} 
        public String description {get;set;} 
        public String partNumber {get;set;} 
        public String lineItem {get;set;} 
        public String type_Z {get;set;} // in json: type
        public String vendorItemName {get;set;} 
        public Boolean hasGlaze {get;set;} 
        public String commonName {get;set;} 
        public Object updateDate {get;set;} 
        public Object updateUser {get;set;} 
        public Integer refLaminateCollectionSerie_id {get;set;} 

        public Molding(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'id') {
                            id = parser.getIntegerValue();
                        } else if (text == 'name') {
                            name = parser.getText();
                        } else if (text == 'description') {
                            description = parser.getText();
                        } else if (text == 'partNumber') {
                            partNumber = parser.getText();
                        } else if (text == 'lineItem') {
                            lineItem = parser.getText();
                        } else if (text == 'type') {
                            type_Z = parser.getText();
                        } else if (text == 'vendorItemName') {
                            vendorItemName = parser.getText();
                        } else if (text == 'hasGlaze') {
                            hasGlaze = parser.getBooleanValue();
                        } else if (text == 'commonName') {
                            commonName = parser.getText();
                        } else if (text == 'updateDate') {
                            updateDate = parser.readValueAs(Object.class);
                        } else if (text == 'updateUser') {
                            updateUser = parser.readValueAs(Object.class);
                        } else if (text == 'refLaminateCollectionSerie_id') {
                            refLaminateCollectionSerie_id = parser.getIntegerValue();
                        } else {
                            System.debug(LoggingLevel.WARN, 'Molding consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class InstallationExtraDefinition {
        public List<Valances> cabinetModifications {get;set;} 
        public List<Valances> tripCharges {get;set;} 
        public List<Valances> plumbingReconnections {get;set;} 
        public List<Valances> waterFiltrationUnits {get;set;} 
        public List<Valances> plumbingAddOns {get;set;} 
        public List<InstallerItems> installerItems {get;set;} 
        public ContractAmount sinkFloorLaminateQuantity {get;set;} 
        public ContractAmount sinkFloorReplaceQuantity {get;set;} 
        public String notes {get;set;} 

        public InstallationExtraDefinition(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'cabinetModifications') {
                            cabinetModifications = arrayOfValances(parser);
                        } else if (text == 'tripCharges') {
                            tripCharges = arrayOfValances(parser);
                        } else if (text == 'plumbingReconnections') {
                            plumbingReconnections = arrayOfValances(parser);
                        } else if (text == 'waterFiltrationUnits') {
                            waterFiltrationUnits = arrayOfValances(parser);
                        } else if (text == 'plumbingAddOns') {
                            plumbingAddOns = arrayOfValances(parser);
                        } else if (text == 'installerItems') {
                            installerItems = arrayOfInstallerItems(parser);
                        } else if (text == 'sinkFloorLaminateQuantity') {
                            sinkFloorLaminateQuantity = new ContractAmount(parser);
                        } else if (text == 'sinkFloorReplaceQuantity') {
                            sinkFloorReplaceQuantity = new ContractAmount(parser);
                        } else if (text == 'notes') {
                            notes = parser.getText();
                        } else {
                            System.debug(LoggingLevel.WARN, 'InstallationExtraDefinition consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class SelectedCabModifications {
        public CabModification cabModification {get;set;} 
        public Boolean included {get;set;} 
        public ContractAmount qty {get;set;} 

        public SelectedCabModifications(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'cabModification') {
                            cabModification = new CabModification(parser);
                        } else if (text == 'included') {
                            included = parser.getBooleanValue();
                        } else if (text == 'qty') {
                            qty = new ContractAmount(parser);
                        } else {
                            System.debug(LoggingLevel.WARN, 'SelectedCabModifications consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class Options_Z {
        public Boolean flushBottom {get;set;} 
        public Boolean solidBack {get;set;} 
        public Boolean noBack {get;set;} 
        public Boolean extendStile {get;set;} 
        public Boolean frameless {get;set;} 
        public Boolean finishedInside {get;set;} 
        public Boolean extendToeKick {get;set;} 
        public Boolean knockDown {get;set;} 
        public String notes {get;set;} 

        public Options_Z(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'flushBottom') {
                            flushBottom = parser.getBooleanValue();
                        } else if (text == 'solidBack') {
                            solidBack = parser.getBooleanValue();
                        } else if (text == 'noBack') {
                            noBack = parser.getBooleanValue();
                        } else if (text == 'extendStile') {
                            extendStile = parser.getBooleanValue();
                        } else if (text == 'frameless') {
                            frameless = parser.getBooleanValue();
                        } else if (text == 'finishedInside') {
                            finishedInside = parser.getBooleanValue();
                        } else if (text == 'extendToeKick') {
                            extendToeKick = parser.getBooleanValue();
                        } else if (text == 'knockDown') {
                            knockDown = parser.getBooleanValue();
                        } else if (text == 'notes') {
                            notes = parser.getText();
                        } else {
                            System.debug(LoggingLevel.WARN, 'Options_Z consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class WallCabExteriorMeasurement {
        public ContractAmount returns {get;set;} 
        public Depth depth {get;set;} 
        public Depth frameHeight {get;set;} 
        public List<Depth> endPanelHeights {get;set;} 
        public List<PeninsulaBacks> peninsulaBacks {get;set;} 
        public List<Depth> scribeMoldingHeights {get;set;} 
        public List<CabinetWidths> cabinetWidths {get;set;} 
        public SoffitMeasurement soffitMeasurement {get;set;} 

        public WallCabExteriorMeasurement(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'returns') {
                            returns = new ContractAmount(parser);
                        } else if (text == 'depth') {
                            depth = new Depth(parser);
                        } else if (text == 'frameHeight') {
                            frameHeight = new Depth(parser);
                        } else if (text == 'endPanelHeights') {
                            endPanelHeights = arrayOfDepth(parser);
                        } else if (text == 'peninsulaBacks') {
                            peninsulaBacks = arrayOfPeninsulaBacks(parser);
                        } else if (text == 'scribeMoldingHeights') {
                            scribeMoldingHeights = arrayOfDepth(parser);
                        } else if (text == 'cabinetWidths') {
                            cabinetWidths = arrayOfCabinetWidths(parser);
                        } else if (text == 'soffitMeasurement') {
                            soffitMeasurement = new SoffitMeasurement(parser);
                        } else {
                            System.debug(LoggingLevel.WARN, 'WallCabExteriorMeasurement consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class CalculatedMoldings {
        public ContractAmount ceiling {get;set;} 
        public ContractAmount floor {get;set;} 
        public ContractAmount verticals {get;set;} 
        public ContractAmount lightRail {get;set;} 

        public CalculatedMoldings(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'ceiling') {
                            ceiling = new ContractAmount(parser);
                        } else if (text == 'floor') {
                            floor = new ContractAmount(parser);
                        } else if (text == 'verticals') {
                            verticals = new ContractAmount(parser);
                        } else if (text == 'lightRail') {
                            lightRail = new ContractAmount(parser);
                        } else {
                            System.debug(LoggingLevel.WARN, 'CalculatedMoldings consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class GlassDoorDefinition {
        public Boolean includeGlass {get;set;} 
        public ContractAmount numberDoors {get;set;} 
        public Integer numberLites {get;set;} 
        public String glassColor {get;set;} 
        public String glassStyle {get;set;} 

        public GlassDoorDefinition(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'includeGlass') {
                            includeGlass = parser.getBooleanValue();
                        } else if (text == 'numberDoors') {
                            numberDoors = new ContractAmount(parser);
                        } else if (text == 'numberLites') {
                            numberLites = parser.getIntegerValue();
                        } else if (text == 'glassColor') {
                            glassColor = parser.getText();
                        } else if (text == 'glassStyle') {
                            glassStyle = parser.getText();
                        } else {
                            System.debug(LoggingLevel.WARN, 'GlassDoorDefinition consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class DrawerFronts {
        public String drawerId {get;set;} 
        public Item_Y item {get;set;} 
        public Depth width {get;set;} 
        public Depth height {get;set;} 
        public Boolean fingerGroove {get;set;} 
        public String grainDirection {get;set;} 
        public String drawerFrontType {get;set;} 
        public Depth openingWidth {get;set;} 
        public Depth openingHeight {get;set;} 
        public Depth boxLength {get;set;} 
        public Depth glideLength {get;set;} 
        public Depth boxWidth {get;set;} 
        public BoreUpfromBottom boxHeight {get;set;} 
        public String boxType {get;set;} 
        public String notes {get;set;} 
        public Object notch {get;set;} 

        public DrawerFronts(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'drawerId') {
                            drawerId = parser.getText();
                        } else if (text == 'item') {
                            item = new Item_Y(parser);
                        } else if (text == 'width') {
                            width = new Depth(parser);
                        } else if (text == 'height') {
                            height = new Depth(parser);
                        } else if (text == 'fingerGroove') {
                            fingerGroove = parser.getBooleanValue();
                        } else if (text == 'grainDirection') {
                            grainDirection = parser.getText();
                        } else if (text == 'drawerFrontType') {
                            drawerFrontType = parser.getText();
                        } else if (text == 'openingWidth') {
                            openingWidth = new Depth(parser);
                        } else if (text == 'openingHeight') {
                            openingHeight = new Depth(parser);
                        } else if (text == 'boxLength') {
                            boxLength = new Depth(parser);
                        } else if (text == 'glideLength') {
                            glideLength = new Depth(parser);
                        } else if (text == 'boxWidth') {
                            boxWidth = new Depth(parser);
                        } else if (text == 'boxHeight') {
                            boxHeight = new BoreUpfromBottom(parser);
                        } else if (text == 'boxType') {
                            boxType = parser.getText();
                        } else if (text == 'notes') {
                            notes = parser.getText();
                        } else if (text == 'notch') {
                            notch = parser.readValueAs(Object.class);
                        } else {
                            System.debug(LoggingLevel.WARN, 'DrawerFronts consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class ToggleContainer {
        public Boolean refaceExistingOnly {get;set;} 
        public Boolean leaveExisting {get;set;} 
        public Boolean glazeToggle {get;set;} 
        public Boolean glazing {get;set;} 
        public Boolean glazeDF {get;set;} 
        public Boolean glazeMolding {get;set;} 
        public Boolean glazeDoorDistressed {get;set;} 
        public Boolean glazeDoorFeathered {get;set;} 
        public Boolean glassDoors {get;set;} 
        public Boolean hardware {get;set;} 
        public Boolean metalDoors {get;set;} 
        public Boolean valence {get;set;} 
        public Boolean knickNack {get;set;} 
        public Boolean molding {get;set;} 
        public Boolean toeKick {get;set;} 
        public Boolean accessoryShelves {get;set;} 
        public Boolean accessoryCorbels {get;set;} 
        public Boolean accessoryHW {get;set;} 
        public Boolean finishedShelves {get;set;} 
        public Boolean dishwasher {get;set;} 
        public Boolean refrigerator {get;set;} 
        public Boolean otherRefacing {get;set;} 
        public Boolean newCabinet {get;set;} 
        public Boolean removeExistingCountertop {get;set;} 
        public Boolean newLaminateCountertoperator {get;set;} 
        public Boolean wallLaminate {get;set;} 
        public Boolean sink {get;set;} 
        public Boolean faucet {get;set;} 
        public Boolean instAddParting {get;set;} 
        public Boolean instCuttingBoard {get;set;} 
        public Boolean instFlushInset {get;set;} 
        public Boolean instLaminateSink {get;set;} 
        public Boolean instRRCookTop {get;set;} 
        public Boolean instRRHoodVent {get;set;} 
        public Boolean instRRMicrowave {get;set;} 
        public Boolean instReplaceLaminateSink {get;set;} 
        public Boolean lightRail {get;set;} 
        public Boolean useSlabDF {get;set;} 
        public Boolean highGlossFilter {get;set;} 
        public OtherRefacingContainer otherRefacingContainer {get;set;} 
        public SinkOptions sinkOptions {get;set;} 
        public Boolean flushBottoms {get;set;} 
        public Boolean fingerGrooves {get;set;} 
        public Boolean doorFingers {get;set;} 
        public Boolean cookTop {get;set;} 
        public Boolean drawerBoxesAndGlides {get;set;} 
        public Boolean hinges {get;set;} 
        public Boolean drawerFronts {get;set;} 
        public Boolean addOns {get;set;} 

        public ToggleContainer(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'refaceExistingOnly') {
                            refaceExistingOnly = parser.getBooleanValue();
                        } else if (text == 'leaveExisting') {
                            leaveExisting = parser.getBooleanValue();
                        } else if (text == 'glazeToggle') {
                            glazeToggle = parser.getBooleanValue();
                        } else if (text == 'glazing') {
                            glazing = parser.getBooleanValue();
                        } else if (text == 'glazeDF') {
                            glazeDF = parser.getBooleanValue();
                        } else if (text == 'glazeMolding') {
                            glazeMolding = parser.getBooleanValue();
                        } else if (text == 'glazeDoorDistressed') {
                            glazeDoorDistressed = parser.getBooleanValue();
                        } else if (text == 'glazeDoorFeathered') {
                            glazeDoorFeathered = parser.getBooleanValue();
                        } else if (text == 'glassDoors') {
                            glassDoors = parser.getBooleanValue();
                        } else if (text == 'hardware') {
                            hardware = parser.getBooleanValue();
                        } else if (text == 'metalDoors') {
                            metalDoors = parser.getBooleanValue();
                        } else if (text == 'valence') {
                            valence = parser.getBooleanValue();
                        } else if (text == 'knickNack') {
                            knickNack = parser.getBooleanValue();
                        } else if (text == 'molding') {
                            molding = parser.getBooleanValue();
                        } else if (text == 'toeKick') {
                            toeKick = parser.getBooleanValue();
                        } else if (text == 'accessoryShelves') {
                            accessoryShelves = parser.getBooleanValue();
                        } else if (text == 'accessoryCorbels') {
                            accessoryCorbels = parser.getBooleanValue();
                        } else if (text == 'accessoryHW') {
                            accessoryHW = parser.getBooleanValue();
                        } else if (text == 'finishedShelves') {
                            finishedShelves = parser.getBooleanValue();
                        } else if (text == 'dishwasher') {
                            dishwasher = parser.getBooleanValue();
                        } else if (text == 'refrigerator') {
                            refrigerator = parser.getBooleanValue();
                        } else if (text == 'otherRefacing') {
                            otherRefacing = parser.getBooleanValue();
                        } else if (text == 'newCabinet') {
                            newCabinet = parser.getBooleanValue();
                        } else if (text == 'removeExistingCountertop') {
                            removeExistingCountertop = parser.getBooleanValue();
                        } else if (text == 'newLaminateCountertoperator') {
                            newLaminateCountertoperator = parser.getBooleanValue();
                        } else if (text == 'wallLaminate') {
                            wallLaminate = parser.getBooleanValue();
                        } else if (text == 'sink') {
                            sink = parser.getBooleanValue();
                        } else if (text == 'faucet') {
                            faucet = parser.getBooleanValue();
                        } else if (text == 'instAddParting') {
                            instAddParting = parser.getBooleanValue();
                        } else if (text == 'instCuttingBoard') {
                            instCuttingBoard = parser.getBooleanValue();
                        } else if (text == 'instFlushInset') {
                            instFlushInset = parser.getBooleanValue();
                        } else if (text == 'instLaminateSink') {
                            instLaminateSink = parser.getBooleanValue();
                        } else if (text == 'instRRCookTop') {
                            instRRCookTop = parser.getBooleanValue();
                        } else if (text == 'instRRHoodVent') {
                            instRRHoodVent = parser.getBooleanValue();
                        } else if (text == 'instRRMicrowave') {
                            instRRMicrowave = parser.getBooleanValue();
                        } else if (text == 'instReplaceLaminateSink') {
                            instReplaceLaminateSink = parser.getBooleanValue();
                        } else if (text == 'lightRail') {
                            lightRail = parser.getBooleanValue();
                        } else if (text == 'useSlabDF') {
                            useSlabDF = parser.getBooleanValue();
                        } else if (text == 'highGlossFilter') {
                            highGlossFilter = parser.getBooleanValue();
                        } else if (text == 'otherRefacingContainer') {
                            otherRefacingContainer = new OtherRefacingContainer(parser);
                        } else if (text == 'sinkOptions') {
                            sinkOptions = new SinkOptions(parser);
                        } else if (text == 'flushBottoms') {
                            flushBottoms = parser.getBooleanValue();
                        } else if (text == 'fingerGrooves') {
                            fingerGrooves = parser.getBooleanValue();
                        } else if (text == 'doorFingers') {
                            doorFingers = parser.getBooleanValue();
                        } else if (text == 'cookTop') {
                            cookTop = parser.getBooleanValue();
                        } else if (text == 'drawerBoxesAndGlides') {
                            drawerBoxesAndGlides = parser.getBooleanValue();
                        } else if (text == 'hinges') {
                            hinges = parser.getBooleanValue();
                        } else if (text == 'drawerFronts') {
                            drawerFronts = parser.getBooleanValue();
                        } else if (text == 'addOns') {
                            addOns = parser.getBooleanValue();
                        } else {
                            System.debug(LoggingLevel.WARN, 'ToggleContainer consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class StatusContainer {
        public String status {get;set;} 
        public List<String> verifiedSections {get;set;} 
        public List<UiSections> uiSections {get;set;} 
        public List<Boolean> specPageState {get;set;} 
        public List<Boolean> measurePageState {get;set;} 

        public StatusContainer(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'status') {
                            status = parser.getText();
                        } else if (text == 'verifiedSections') {
                            verifiedSections = arrayOfString(parser);
                        } else if (text == 'uiSections') {
                            uiSections = arrayOfUiSections(parser);
                        } else if (text == 'specPageState') {
                            specPageState = arrayOfBoolean(parser);
                        } else if (text == 'measurePageState') {
                            measurePageState = arrayOfBoolean(parser);
                        } else {
                            System.debug(LoggingLevel.WARN, 'StatusContainer consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class DoorDefinition {
        public ContractAmount numberDoors {get;set;} 
        public ContractAmount numberWallDoors {get;set;} 
        public ContractAmount numberBaseDoors {get;set;} 
        public NumberWallDecorativeDoors numberWallDecorativeDoors {get;set;} 
        public NumberWallDecorativeDoors numberBaseDecorativeDoors {get;set;} 

        public DoorDefinition(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'numberDoors') {
                            numberDoors = new ContractAmount(parser);
                        } else if (text == 'numberWallDoors') {
                            numberWallDoors = new ContractAmount(parser);
                        } else if (text == 'numberBaseDoors') {
                            numberBaseDoors = new ContractAmount(parser);
                        } else if (text == 'numberWallDecorativeDoors') {
                            numberWallDecorativeDoors = new NumberWallDecorativeDoors(parser);
                        } else if (text == 'numberBaseDecorativeDoors') {
                            numberBaseDecorativeDoors = new NumberWallDecorativeDoors(parser);
                        } else {
                            System.debug(LoggingLevel.WARN, 'DoorDefinition consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class CompilerMeasurementContainer {
        public Boolean initializedKnickKnack {get;set;} 
        public List<PeninsulaBacks> knickKnacks {get;set;} 
        public Length sheetWidth {get;set;} 
        public Length sheetLength {get;set;} 
        public NumberWallDecorativeDoors sheetQty {get;set;} 
        public ContractAmount numberPlywoodShelves {get;set;} 
        public ContractAmount numberSinkFloors {get;set;} 
        public Boolean initializedShelveSink {get;set;} 

        public CompilerMeasurementContainer(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'initializedKnickKnack') {
                            initializedKnickKnack = parser.getBooleanValue();
                        } else if (text == 'knickKnacks') {
                            knickKnacks = arrayOfPeninsulaBacks(parser);
                        } else if (text == 'sheetWidth') {
                            sheetWidth = new Length(parser);
                        } else if (text == 'sheetLength') {
                            sheetLength = new Length(parser);
                        } else if (text == 'sheetQty') {
                            sheetQty = new NumberWallDecorativeDoors(parser);
                        } else if (text == 'numberPlywoodShelves') {
                            numberPlywoodShelves = new ContractAmount(parser);
                        } else if (text == 'numberSinkFloors') {
                            numberSinkFloors = new ContractAmount(parser);
                        } else if (text == 'initializedShelveSink') {
                            initializedShelveSink = parser.getBooleanValue();
                        } else {
                            System.debug(LoggingLevel.WARN, 'CompilerMeasurementContainer consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class OverlayWidthLeft {
        public Object whole {get;set;} 
        public Integer numerator {get;set;} 
        public Integer denominator {get;set;} 
        public Boolean cancel {get;set;} 

        public OverlayWidthLeft(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'whole') {
                            whole = parser.readValueAs(Object.class);
                        } else if (text == 'numerator') {
                            numerator = parser.getIntegerValue();
                        } else if (text == 'denominator') {
                            denominator = parser.getIntegerValue();
                        } else if (text == 'cancel') {
                            cancel = parser.getBooleanValue();
                        } else {
                            System.debug(LoggingLevel.WARN, 'OverlayWidthLeft consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class PullHardwares {
        public PullHardware pullHardware {get;set;} 
        public ContractAmount qty {get;set;} 

        public PullHardwares(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'pullHardware') {
                            pullHardware = new PullHardware(parser);
                        } else if (text == 'qty') {
                            qty = new ContractAmount(parser);
                        } else {
                            System.debug(LoggingLevel.WARN, 'PullHardwares consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class HingeDefinition {
        public String hingeType {get;set;} 
        public String faceType {get;set;} 

        public HingeDefinition(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'hingeType') {
                            hingeType = parser.getText();
                        } else if (text == 'faceType') {
                            faceType = parser.getText();
                        } else {
                            System.debug(LoggingLevel.WARN, 'HingeDefinition consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class Option {
        public Integer id {get;set;} 
        public Integer vendorId {get;set;} 
        public String accessoryType {get;set;} 
        public String accessoryTypeDescription {get;set;} 
        public Object materialType {get;set;} 
        public String accessoryName {get;set;} 
        public String accessoryDescription {get;set;} 
        public String itemNumber {get;set;} 
        public String lineItem {get;set;} 
        public String partNumber {get;set;} 
        public Integer optionId {get;set;} 
        public String optionName {get;set;} 
        public String optionDescription {get;set;} 

        public Option(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'id') {
                            id = parser.getIntegerValue();
                        } else if (text == 'vendorId') {
                            vendorId = parser.getIntegerValue();
                        } else if (text == 'accessoryType') {
                            accessoryType = parser.getText();
                        } else if (text == 'accessoryTypeDescription') {
                            accessoryTypeDescription = parser.getText();
                        } else if (text == 'materialType') {
                            materialType = parser.readValueAs(Object.class);
                        } else if (text == 'accessoryName') {
                            accessoryName = parser.getText();
                        } else if (text == 'accessoryDescription') {
                            accessoryDescription = parser.getText();
                        } else if (text == 'itemNumber') {
                            itemNumber = parser.getText();
                        } else if (text == 'lineItem') {
                            lineItem = parser.getText();
                        } else if (text == 'partNumber') {
                            partNumber = parser.getText();
                        } else if (text == 'optionId') {
                            optionId = parser.getIntegerValue();
                        } else if (text == 'optionName') {
                            optionName = parser.getText();
                        } else if (text == 'optionDescription') {
                            optionDescription = parser.getText();
                        } else {
                            System.debug(LoggingLevel.WARN, 'Option consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class MetalAndGrooveDefinition {
        public Boolean includeMetalDoors {get;set;} 
        public ContractAmount numberMetalDoors {get;set;} 
        public Boolean includeFingerGrooves {get;set;} 

        public MetalAndGrooveDefinition(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'includeMetalDoors') {
                            includeMetalDoors = parser.getBooleanValue();
                        } else if (text == 'numberMetalDoors') {
                            numberMetalDoors = new ContractAmount(parser);
                        } else if (text == 'includeFingerGrooves') {
                            includeFingerGrooves = parser.getBooleanValue();
                        } else {
                            System.debug(LoggingLevel.WARN, 'MetalAndGrooveDefinition consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class Drawers {
        public String drawerType {get;set;} 
        public String glideType {get;set;} 
        public ContractAmount quantity {get;set;} 

        public Drawers(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'drawerType') {
                            drawerType = parser.getText();
                        } else if (text == 'glideType') {
                            glideType = parser.getText();
                        } else if (text == 'quantity') {
                            quantity = new ContractAmount(parser);
                        } else {
                            System.debug(LoggingLevel.WARN, 'Drawers consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class SelectedNewCountertop {
        public String backSplashHeight {get;set;} 
        public Object counterTop {get;set;} 

        public SelectedNewCountertop(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'backSplashHeight') {
                            backSplashHeight = parser.getText();
                        } else if (text == 'counterTop') {
                            counterTop = parser.readValueAs(Object.class);
                        } else {
                            System.debug(LoggingLevel.WARN, 'SelectedNewCountertop consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class RefacingSurfaceDefinition {
        public Boolean cutInDoor {get;set;} 
        public Boolean sofitArea {get;set;} 
        public Boolean islandPeninsula {get;set;} 
        public Boolean otherArea {get;set;} 

        public RefacingSurfaceDefinition(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'cutInDoor') {
                            cutInDoor = parser.getBooleanValue();
                        } else if (text == 'sofitArea') {
                            sofitArea = parser.getBooleanValue();
                        } else if (text == 'islandPeninsula') {
                            islandPeninsula = parser.getBooleanValue();
                        } else if (text == 'otherArea') {
                            otherArea = parser.getBooleanValue();
                        } else {
                            System.debug(LoggingLevel.WARN, 'RefacingSurfaceDefinition consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class Measurement {
        public WallCabExteriorMeasurement wallCabExteriorMeasurement {get;set;} 
        public BaseCabExteriorMeasurement baseCabExteriorMeasurement {get;set;} 
        public MoldingMeasurementContainer moldingMeasurementContainer {get;set;} 
        public CompilerMeasurementContainer compilerMeasurementContainer {get;set;} 
        public List<DoorConfigurations> doorConfigurations {get;set;} 
        public Options doorOptions {get;set;} 
        public List<DrawerConfigurations> drawerConfigurations {get;set;} 
        public DrawerOptions drawerOptions {get;set;} 
        public List<CabinetConfigurations> cabinetConfigurations {get;set;} 

        public Measurement(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'wallCabExteriorMeasurement') {
                            wallCabExteriorMeasurement = new WallCabExteriorMeasurement(parser);
                        } else if (text == 'baseCabExteriorMeasurement') {
                            baseCabExteriorMeasurement = new BaseCabExteriorMeasurement(parser);
                        } else if (text == 'moldingMeasurementContainer') {
                            moldingMeasurementContainer = new MoldingMeasurementContainer(parser);
                        } else if (text == 'compilerMeasurementContainer') {
                            compilerMeasurementContainer = new CompilerMeasurementContainer(parser);
                        } else if (text == 'doorConfigurations') {
                            doorConfigurations = arrayOfDoorConfigurations(parser);
                        } else if (text == 'doorOptions') {
                            doorOptions = new Options(parser);
                        } else if (text == 'drawerConfigurations') {
                            drawerConfigurations = arrayOfDrawerConfigurations(parser);
                        } else if (text == 'drawerOptions') {
                            drawerOptions = new DrawerOptions(parser);
                        } else if (text == 'cabinetConfigurations') {
                            cabinetConfigurations = arrayOfCabinetConfigurations(parser);
                        } else {
                            System.debug(LoggingLevel.WARN, 'Measurement consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class BaseCabExteriorMeasurement {
        public ContractAmount returns {get;set;} 
        public Depth depth {get;set;} 
        public Depth frameHeight {get;set;} 
        public List<Depth> endPanelHeights {get;set;} 
        public List<PeninsulaBacks> peninsulaBacks {get;set;} 
        public List<Depth> scribeMoldingHeights {get;set;} 
        public Depth toeKickHeight {get;set;} 
        public ContractAmount endPanel24x36Number {get;set;} 
        public List<CabinetWidths_Z> cabinetWidths {get;set;} 

        public BaseCabExteriorMeasurement(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'returns') {
                            returns = new ContractAmount(parser);
                        } else if (text == 'depth') {
                            depth = new Depth(parser);
                        } else if (text == 'frameHeight') {
                            frameHeight = new Depth(parser);
                        } else if (text == 'endPanelHeights') {
                            endPanelHeights = arrayOfDepth(parser);
                        } else if (text == 'peninsulaBacks') {
                            peninsulaBacks = arrayOfPeninsulaBacks(parser);
                        } else if (text == 'scribeMoldingHeights') {
                            scribeMoldingHeights = arrayOfDepth(parser);
                        } else if (text == 'toeKickHeight') {
                            toeKickHeight = new Depth(parser);
                        } else if (text == 'endPanel24x36Number') {
                            endPanel24x36Number = new ContractAmount(parser);
                        } else if (text == 'cabinetWidths') {
                            cabinetWidths = arrayOfCabinetWidths_Z(parser);
                        } else {
                            System.debug(LoggingLevel.WARN, 'BaseCabExteriorMeasurement consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class Options {
        public OverlayWidthLeft overlayWidthLeft {get;set;} 
        public OverlayWidthLeft overlayWidthRight {get;set;} 
        public OverlayWidthLeft overlayWidthHinge {get;set;} 
        public OverlayWidthLeft overlayHeightTop {get;set;} 
        public OverlayWidthLeft overlayHeightBottom {get;set;} 
        public Object standardOpeningWall {get;set;} 
        public Object standardOpeningBase {get;set;} 
        public Boolean initialized {get;set;} 

        public Options(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'overlayWidthLeft') {
                            overlayWidthLeft = new OverlayWidthLeft(parser);
                        } else if (text == 'overlayWidthRight') {
                            overlayWidthRight = new OverlayWidthLeft(parser);
                        } else if (text == 'overlayWidthHinge') {
                            overlayWidthHinge = new OverlayWidthLeft(parser);
                        } else if (text == 'overlayHeightTop') {
                            overlayHeightTop = new OverlayWidthLeft(parser);
                        } else if (text == 'overlayHeightBottom') {
                            overlayHeightBottom = new OverlayWidthLeft(parser);
                        } else if (text == 'standardOpeningWall') {
                            standardOpeningWall = parser.readValueAs(Object.class);
                        } else if (text == 'standardOpeningBase') {
                            standardOpeningBase = parser.readValueAs(Object.class);
                        } else if (text == 'initialized') {
                            initialized = parser.getBooleanValue();
                        } else {
                            System.debug(LoggingLevel.WARN, 'Options consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class Pullouts {
        public BoxWidth boxWidth {get;set;} 
        public Depth boxHeight {get;set;} 
        public BoxWidth boxLength {get;set;} 
        public String type_Z {get;set;} // in json: type
        public Boolean fingerGroove {get;set;} 
        public Boolean notch {get;set;} 
        public ContractAmount qty {get;set;} 

        public Pullouts(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'boxWidth') {
                            boxWidth = new BoxWidth(parser);
                        } else if (text == 'boxHeight') {
                            boxHeight = new Depth(parser);
                        } else if (text == 'boxLength') {
                            boxLength = new BoxWidth(parser);
                        } else if (text == 'type') {
                            type_Z = parser.getText();
                        } else if (text == 'fingerGroove') {
                            fingerGroove = parser.getBooleanValue();
                        } else if (text == 'notch') {
                            notch = parser.getBooleanValue();
                        } else if (text == 'qty') {
                            qty = new ContractAmount(parser);
                        } else {
                            System.debug(LoggingLevel.WARN, 'Pullouts consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public Job job {get;set;} 
    public SelectionContainer selectionContainer {get;set;} 
    public ToggleContainer toggleContainer {get;set;} 
    public StatusContainer statusContainer {get;set;} 

    public sfdcProductJSONParsing(JSONParser parser) {
        while (parser.nextToken() != System.JSONToken.END_OBJECT) {
            if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                String text = parser.getText();
                if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                    if (text == 'job') {
                        job = new Job(parser);
                    } else if (text == 'selectionContainer') {
                        selectionContainer = new SelectionContainer(parser);
                    } else if (text == 'toggleContainer') {
                        toggleContainer = new ToggleContainer(parser);
                    } else if (text == 'statusContainer') {
                        statusContainer = new StatusContainer(parser);
                    } else {
                        System.debug(LoggingLevel.WARN, 'sfdcProductJSONParsing consuming unrecognized property: '+text);
                        consumeObject(parser);
                    }
                }
            }
        }
    }
    
    public class Corbel {
        public Integer id {get;set;} 
        public String partNo {get;set;} 
        public Double width {get;set;} 
        public Double height {get;set;} 
        public String description {get;set;} 
        public Boolean isCustom {get;set;} 
        public String vendorItemName {get;set;} 
        public Object updateDate {get;set;} 
        public Object updateUser {get;set;} 
        public Integer vendor_id {get;set;} 

        public Corbel(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'id') {
                            id = parser.getIntegerValue();
                        } else if (text == 'partNo') {
                            partNo = parser.getText();
                        } else if (text == 'width') {
                            width = parser.getDoubleValue();
                        } else if (text == 'height') {
                            height = parser.getDoubleValue();
                        } else if (text == 'description') {
                            description = parser.getText();
                        } else if (text == 'isCustom') {
                            isCustom = parser.getBooleanValue();
                        } else if (text == 'vendorItemName') {
                            vendorItemName = parser.getText();
                        } else if (text == 'updateDate') {
                            updateDate = parser.readValueAs(Object.class);
                        } else if (text == 'updateUser') {
                            updateUser = parser.readValueAs(Object.class);
                        } else if (text == 'vendor_id') {
                            vendor_id = parser.getIntegerValue();
                        } else {
                            System.debug(LoggingLevel.WARN, 'Corbel consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class ValanceDefinition {
        public Boolean includeValances {get;set;} 
        public Integer numberValances {get;set;} 
        public List<Valances> valances {get;set;} 

        public ValanceDefinition(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'includeValances') {
                            includeValances = parser.getBooleanValue();
                        } else if (text == 'numberValances') {
                            numberValances = parser.getIntegerValue();
                        } else if (text == 'valances') {
                            valances = arrayOfValances(parser);
                        } else {
                            System.debug(LoggingLevel.WARN, 'ValanceDefinition consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class BoreUpfromBottom {
        public Integer whole {get;set;} 
        public Object numerator {get;set;} 
        public Object denominator {get;set;} 
        public Boolean cancel {get;set;} 

        public BoreUpfromBottom(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'whole') {
                            whole = parser.getIntegerValue();
                        } else if (text == 'numerator') {
                            numerator = parser.readValueAs(Object.class);
                        } else if (text == 'denominator') {
                            denominator = parser.readValueAs(Object.class);
                        } else if (text == 'cancel') {
                            cancel = parser.getBooleanValue();
                        } else {
                            System.debug(LoggingLevel.WARN, 'BoreUpfromBottom consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class DrawerInfo {
        public String layout {get;set;} 
        public String frontType {get;set;} 
        public Object bankType {get;set;} 
        public Object bankNumberFronts {get;set;} 
        public Boolean multiDrawer {get;set;} 
        public Boolean masterMulti {get;set;} 
        public Object drawerBankSpecs {get;set;} 
        public String notes {get;set;} 

        public DrawerInfo(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'layout') {
                            layout = parser.getText();
                        } else if (text == 'frontType') {
                            frontType = parser.getText();
                        } else if (text == 'bankType') {
                            bankType = parser.readValueAs(Object.class);
                        } else if (text == 'bankNumberFronts') {
                            bankNumberFronts = parser.readValueAs(Object.class);
                        } else if (text == 'multiDrawer') {
                            multiDrawer = parser.getBooleanValue();
                        } else if (text == 'masterMulti') {
                            masterMulti = parser.getBooleanValue();
                        } else if (text == 'drawerBankSpecs') {
                            drawerBankSpecs = parser.readValueAs(Object.class);
                        } else if (text == 'notes') {
                            notes = parser.getText();
                        } else {
                            System.debug(LoggingLevel.WARN, 'DrawerInfo consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class NewCabinetDefinition {
        public ContractAmount numberCabinets {get;set;} 
        public ContractAmount numberFaceFrames {get;set;} 

        public NewCabinetDefinition(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'numberCabinets') {
                            numberCabinets = new ContractAmount(parser);
                        } else if (text == 'numberFaceFrames') {
                            numberFaceFrames = new ContractAmount(parser);
                        } else {
                            System.debug(LoggingLevel.WARN, 'NewCabinetDefinition consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class UiSections {
        public String section {get;set;} 
        public String description {get;set;} 
        public String firstPage {get;set;} 
        public List<Items> items {get;set;} 

        public UiSections(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'section') {
                            section = parser.getText();
                        } else if (text == 'description') {
                            description = parser.getText();
                        } else if (text == 'firstPage') {
                            firstPage = parser.getText();
                        } else if (text == 'items') {
                            items = arrayOfItems(parser);
                        } else {
                            System.debug(LoggingLevel.WARN, 'UiSections consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class SelectedWallLaminate {
        public Integer splays {get;set;} 
        public Integer sqFootage {get;set;} 

        public SelectedWallLaminate(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'splays') {
                            splays = parser.getIntegerValue();
                        } else if (text == 'sqFootage') {
                            sqFootage = parser.getIntegerValue();
                        } else {
                            System.debug(LoggingLevel.WARN, 'SelectedWallLaminate consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class Depth {
        public Integer whole {get;set;} 
        public Integer numerator {get;set;} 
        public Integer denominator {get;set;} 
        public Boolean cancel {get;set;} 

        public Depth(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'whole') {
                            whole = parser.getIntegerValue();
                        } else if (text == 'numerator') {
                            numerator = parser.getIntegerValue();
                        } else if (text == 'denominator') {
                            denominator = parser.getIntegerValue();
                        } else if (text == 'cancel') {
                            cancel = parser.getBooleanValue();
                        } else {
                            System.debug(LoggingLevel.WARN, 'Depth consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class ContractAmount {
        public Integer number_Z {get;set;} // in json: number
        public Boolean cancel {get;set;} 

        public ContractAmount(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'number') {
                            number_Z = parser.getIntegerValue();
                        } else if (text == 'cancel') {
                            cancel = parser.getBooleanValue();
                        } else {
                            System.debug(LoggingLevel.WARN, 'ContractAmount consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class KnickKnackDefinition {
        public Boolean includeKnickKnack {get;set;} 
        public ContractAmount wallNumber {get;set;} 
        public ContractAmount baseNumber {get;set;} 

        public KnickKnackDefinition(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'includeKnickKnack') {
                            includeKnickKnack = parser.getBooleanValue();
                        } else if (text == 'wallNumber') {
                            wallNumber = new ContractAmount(parser);
                        } else if (text == 'baseNumber') {
                            baseNumber = new ContractAmount(parser);
                        } else {
                            System.debug(LoggingLevel.WARN, 'KnickKnackDefinition consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class Height {
        public String whole {get;set;} 
        public Integer numerator {get;set;} 
        public Integer denominator {get;set;} 
        public Boolean cancel {get;set;} 

        public Height(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'whole') {
                            whole = parser.getText();
                        } else if (text == 'numerator') {
                            numerator = parser.getIntegerValue();
                        } else if (text == 'denominator') {
                            denominator = parser.getIntegerValue();
                        } else if (text == 'cancel') {
                            cancel = parser.getBooleanValue();
                        } else {
                            System.debug(LoggingLevel.WARN, 'Height consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class DfIds {
        public Integer id {get;set;} 
        public Boolean isDefault {get;set;} 

        public DfIds(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'id') {
                            id = parser.getIntegerValue();
                        } else if (text == 'isDefault') {
                            isDefault = parser.getBooleanValue();
                        } else {
                            System.debug(LoggingLevel.WARN, 'DfIds consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class PullHardware {
        public Integer id {get;set;} 
        public String type_Z {get;set;} // in json: type
        public String hwNumber {get;set;} 
        public String partNumber {get;set;} 
        public String name {get;set;} 
        public String description {get;set;} 
        public String finish {get;set;} 
        public String lineItem {get;set;} 
        public Object updateDate {get;set;} 
        public Object updateUser {get;set;} 
        public Object imageFile {get;set;} 
        public Integer vendor_id {get;set;} 

        public PullHardware(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'id') {
                            id = parser.getIntegerValue();
                        } else if (text == 'type') {
                            type_Z = parser.getText();
                        } else if (text == 'hwNumber') {
                            hwNumber = parser.getText();
                        } else if (text == 'partNumber') {
                            partNumber = parser.getText();
                        } else if (text == 'name') {
                            name = parser.getText();
                        } else if (text == 'description') {
                            description = parser.getText();
                        } else if (text == 'finish') {
                            finish = parser.getText();
                        } else if (text == 'lineItem') {
                            lineItem = parser.getText();
                        } else if (text == 'updateDate') {
                            updateDate = parser.readValueAs(Object.class);
                        } else if (text == 'updateUser') {
                            updateUser = parser.readValueAs(Object.class);
                        } else if (text == 'imageFile') {
                            imageFile = parser.readValueAs(Object.class);
                        } else if (text == 'vendor_id') {
                            vendor_id = parser.getIntegerValue();
                        } else {
                            System.debug(LoggingLevel.WARN, 'PullHardware consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class Lengths {
        public String description {get;set;} 
        public Depth length {get;set;} 

        public Lengths(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'description') {
                            description = parser.getText();
                        } else if (text == 'length') {
                            length = new Depth(parser);
                        } else {
                            System.debug(LoggingLevel.WARN, 'Lengths consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class Inputs {
        public String inputId {get;set;} 
        public Depth measure {get;set;} 

        public Inputs(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'inputId') {
                            inputId = parser.getText();
                        } else if (text == 'measure') {
                            measure = new Depth(parser);
                        } else {
                            System.debug(LoggingLevel.WARN, 'Inputs consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class SoffitMeasurement {
        public Depth height {get;set;} 
        public List<Lengths> lengths {get;set;} 

        public SoffitMeasurement(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'height') {
                            height = new Depth(parser);
                        } else if (text == 'lengths') {
                            lengths = arrayOfLengths(parser);
                        } else {
                            System.debug(LoggingLevel.WARN, 'SoffitMeasurement consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class SelectionContainer {
        public String selectedDoorType {get;set;} 
        public SelectedLaminateCollection selectedLaminateCollection {get;set;} 
        public SelectedLaminateSerie selectedLaminateSerie {get;set;} 
        public Object selectedStainedSpecie {get;set;} 
        public SelectedColor selectedColor {get;set;} 
        public DoorModel wallSelectedModel {get;set;} 
        public DoorModel baseSelectedModel {get;set;} 
        public Object decorativeWallSelectedModel {get;set;} 
        public Object decorativeBaseSelectedModel {get;set;} 
        public String selectedEndPanel {get;set;} 
        public String selectedFrontFace {get;set;} 
        public Item_Y selectedDFModel {get;set;} 
        public String selectedGlazeColor {get;set;} 
        public Integer selectedNumberLites {get;set;} 
        public String selectedGlassColor {get;set;} 
        public String selectedGlassStyle {get;set;} 
        public Boolean hasGlassStyle {get;set;} 
        public DoorModel selectedMullionDoorModel {get;set;} 
        public PullHardware selectedHardwareWall {get;set;} 
        public PullHardware selectedHardwareBase {get;set;} 
        public PullHardware selectedHardwareDrawer {get;set;} 
        public String selectedHingeType {get;set;} 
        public String selectedHingeFrame {get;set;} 
        public List<SelectedValences> selectedValences {get;set;} 
        public List<SelectedCorbels> selectedCorbels {get;set;} 
        public List<SelectedFinishedShelves> selectedFinishedShelves {get;set;} 
        public MoldingContainer moldingContainer {get;set;} 
        public Object selectedSink {get;set;} 
        public Object selectedFaucet {get;set;} 
        public String selectedRefrigeratorPanel {get;set;} 
        public String selectedDishwasherPanel {get;set;} 
        public List<SelectedHWAccessories> selectedHWAccessories {get;set;} 
        public SelectedNewCountertop selectedNewCountertop {get;set;} 
        public SelectedWallLaminate selectedWallLaminate {get;set;} 
        public String selectedBackDoorColor {get;set;} 
        public String selectedExistingCabinetType {get;set;} 
        public Object selectedRemoveExistingCountertopType {get;set;} 
        public List<SelectedAddOns> selectedAddOns {get;set;} 
        public List<SelectedCabModifications> selectedCabModifications {get;set;} 
        public SelectedVendorColor selectedVendorColor {get;set;} 
        public String modifiedHingeFaceType {get;set;} 
        public String modifiedDrawerGlideType {get;set;} 

        public SelectionContainer(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'selectedDoorType') {
                            selectedDoorType = parser.getText();
                        } else if (text == 'selectedLaminateCollection') {
                            selectedLaminateCollection = new SelectedLaminateCollection(parser);
                        } else if (text == 'selectedLaminateSerie') {
                            selectedLaminateSerie = new SelectedLaminateSerie(parser);
                        } else if (text == 'selectedStainedSpecie') {
                            selectedStainedSpecie = parser.readValueAs(Object.class);
                        } else if (text == 'selectedColor') {
                            selectedColor = new SelectedColor(parser);
                        } else if (text == 'wallSelectedModel') {
                            wallSelectedModel = new DoorModel(parser);
                        } else if (text == 'baseSelectedModel') {
                            baseSelectedModel = new DoorModel(parser);
                        } else if (text == 'decorativeWallSelectedModel') {
                            decorativeWallSelectedModel = parser.readValueAs(Object.class);
                        } else if (text == 'decorativeBaseSelectedModel') {
                            decorativeBaseSelectedModel = parser.readValueAs(Object.class);
                        } else if (text == 'selectedEndPanel') {
                            selectedEndPanel = parser.getText();
                        } else if (text == 'selectedFrontFace') {
                            selectedFrontFace = parser.getText();
                        } else if (text == 'selectedDFModel') {
                            selectedDFModel = new Item_Y(parser);
                        } else if (text == 'selectedGlazeColor') {
                            selectedGlazeColor = parser.getText();
                        } else if (text == 'selectedNumberLites') {
                            selectedNumberLites = parser.getIntegerValue();
                        } else if (text == 'selectedGlassColor') {
                            selectedGlassColor = parser.getText();
                        } else if (text == 'selectedGlassStyle') {
                            selectedGlassStyle = parser.getText();
                        } else if (text == 'hasGlassStyle') {
                            hasGlassStyle = parser.getBooleanValue();
                        } else if (text == 'selectedMullionDoorModel') {
                            selectedMullionDoorModel = new DoorModel(parser);
                        } else if (text == 'selectedHardwareWall') {
                            selectedHardwareWall = new PullHardware(parser);
                        } else if (text == 'selectedHardwareBase') {
                            selectedHardwareBase = new PullHardware(parser);
                        } else if (text == 'selectedHardwareDrawer') {
                            selectedHardwareDrawer = new PullHardware(parser);
                        } else if (text == 'selectedHingeType') {
                            selectedHingeType = parser.getText();
                        } else if (text == 'selectedHingeFrame') {
                            selectedHingeFrame = parser.getText();
                        } else if (text == 'selectedValences') {
                            selectedValences = arrayOfSelectedValences(parser);
                        } else if (text == 'selectedCorbels') {
                            selectedCorbels = arrayOfSelectedCorbels(parser);
                        } else if (text == 'selectedFinishedShelves') {
                            selectedFinishedShelves = arrayOfSelectedFinishedShelves(parser);
                        } else if (text == 'moldingContainer') {
                            moldingContainer = new MoldingContainer(parser);
                        } else if (text == 'selectedSink') {
                            selectedSink = parser.readValueAs(Object.class);
                        } else if (text == 'selectedFaucet') {
                            selectedFaucet = parser.readValueAs(Object.class);
                        } else if (text == 'selectedRefrigeratorPanel') {
                            selectedRefrigeratorPanel = parser.getText();
                        } else if (text == 'selectedDishwasherPanel') {
                            selectedDishwasherPanel = parser.getText();
                        } else if (text == 'selectedHWAccessories') {
                            selectedHWAccessories = arrayOfSelectedHWAccessories(parser);
                        } else if (text == 'selectedNewCountertop') {
                            selectedNewCountertop = new SelectedNewCountertop(parser);
                        } else if (text == 'selectedWallLaminate') {
                            selectedWallLaminate = new SelectedWallLaminate(parser);
                        } else if (text == 'selectedBackDoorColor') {
                            selectedBackDoorColor = parser.getText();
                        } else if (text == 'selectedExistingCabinetType') {
                            selectedExistingCabinetType = parser.getText();
                        } else if (text == 'selectedRemoveExistingCountertopType') {
                            selectedRemoveExistingCountertopType = parser.readValueAs(Object.class);
                        } else if (text == 'selectedAddOns') {
                            selectedAddOns = arrayOfSelectedAddOns(parser);
                        } else if (text == 'selectedCabModifications') {
                            selectedCabModifications = arrayOfSelectedCabModifications(parser);
                        } else if (text == 'selectedVendorColor') {
                            selectedVendorColor = new SelectedVendorColor(parser);
                        } else if (text == 'modifiedHingeFaceType') {
                            modifiedHingeFaceType = parser.getText();
                        } else if (text == 'modifiedDrawerGlideType') {
                            modifiedDrawerGlideType = parser.getText();
                        } else {
                            System.debug(LoggingLevel.WARN, 'SelectionContainer consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class SinkOptions {
        public Boolean soapDisp {get;set;} 
        public Boolean holeCover {get;set;} 

        public SinkOptions(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'soapDisp') {
                            soapDisp = parser.getBooleanValue();
                        } else if (text == 'holeCover') {
                            holeCover = parser.getBooleanValue();
                        } else {
                            System.debug(LoggingLevel.WARN, 'SinkOptions consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class DrawerDimensionContainer {
        public Boolean isDrawerSet {get;set;} 
        public DrawerInfo drawerInfo {get;set;} 
        public Object calculatedWidth {get;set;} 
        public Object calculatedHeight {get;set;} 
        public Object orderedWidth {get;set;} 
        public Object orderedHeight {get;set;} 
        public Object grain {get;set;} 
        public Object drawerModel {get;set;} 
        public Object note {get;set;} 
        public List<DrawerFronts> drawerFronts {get;set;} 
        public List<PullHardwares> drawerPulls {get;set;} 
        public List<DrawerGlides> drawerGlides {get;set;} 
        public Object glideType {get;set;} 
        public Object resetGlideType {get;set;} 

        public DrawerDimensionContainer(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'isDrawerSet') {
                            isDrawerSet = parser.getBooleanValue();
                        } else if (text == 'drawerInfo') {
                            drawerInfo = new DrawerInfo(parser);
                        } else if (text == 'calculatedWidth') {
                            calculatedWidth = parser.readValueAs(Object.class);
                        } else if (text == 'calculatedHeight') {
                            calculatedHeight = parser.readValueAs(Object.class);
                        } else if (text == 'orderedWidth') {
                            orderedWidth = parser.readValueAs(Object.class);
                        } else if (text == 'orderedHeight') {
                            orderedHeight = parser.readValueAs(Object.class);
                        } else if (text == 'grain') {
                            grain = parser.readValueAs(Object.class);
                        } else if (text == 'drawerModel') {
                            drawerModel = parser.readValueAs(Object.class);
                        } else if (text == 'note') {
                            note = parser.readValueAs(Object.class);
                        } else if (text == 'drawerFronts') {
                            drawerFronts = arrayOfDrawerFronts(parser);
                        } else if (text == 'drawerPulls') {
                            drawerPulls = arrayOfPullHardwares(parser);
                        } else if (text == 'drawerGlides') {
                            drawerGlides = arrayOfDrawerGlides(parser);
                        } else if (text == 'glideType') {
                            glideType = parser.readValueAs(Object.class);
                        } else if (text == 'resetGlideType') {
                            resetGlideType = parser.readValueAs(Object.class);
                        } else {
                            System.debug(LoggingLevel.WARN, 'DrawerDimensionContainer consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class DrawerFrontDefinition {
        public ContractAmount numberDrawerFronts {get;set;} 
        public String grainDirectionType {get;set;} 

        public DrawerFrontDefinition(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'numberDrawerFronts') {
                            numberDrawerFronts = new ContractAmount(parser);
                        } else if (text == 'grainDirectionType') {
                            grainDirectionType = parser.getText();
                        } else {
                            System.debug(LoggingLevel.WARN, 'DrawerFrontDefinition consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class Cabinet {
        public Integer id {get;set;} 
        public String placement {get;set;} 
        public Integer minHeight {get;set;} 
        public Integer minWidth {get;set;} 
        public Integer maxHeight {get;set;} 
        public Integer maxWidth {get;set;} 
        public String code {get;set;} 
        public String fieldGroupNumber {get;set;} 
        public String itemName {get;set;} 
        public Object imageFilename {get;set;} 
        public String cabinetType {get;set;} 
        public Boolean isKnickKnack {get;set;} 
        public String category {get;set;} 
        public String cabinetJson {get;set;} 
        public Object updateDate {get;set;} 
        public Object updateUser {get;set;} 

        public Cabinet(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'id') {
                            id = parser.getIntegerValue();
                        } else if (text == 'placement') {
                            placement = parser.getText();
                        } else if (text == 'minHeight') {
                            minHeight = parser.getIntegerValue();
                        } else if (text == 'minWidth') {
                            minWidth = parser.getIntegerValue();
                        } else if (text == 'maxHeight') {
                            maxHeight = parser.getIntegerValue();
                        } else if (text == 'maxWidth') {
                            maxWidth = parser.getIntegerValue();
                        } else if (text == 'code') {
                            code = parser.getText();
                        } else if (text == 'fieldGroupNumber') {
                            fieldGroupNumber = parser.getText();
                        } else if (text == 'itemName') {
                            itemName = parser.getText();
                        } else if (text == 'imageFilename') {
                            imageFilename = parser.readValueAs(Object.class);
                        } else if (text == 'cabinetType') {
                            cabinetType = parser.getText();
                        } else if (text == 'isKnickKnack') {
                            isKnickKnack = parser.getBooleanValue();
                        } else if (text == 'category') {
                            category = parser.getText();
                        } else if (text == 'cabinetJson') {
                            cabinetJson = parser.getText();
                        } else if (text == 'updateDate') {
                            updateDate = parser.readValueAs(Object.class);
                        } else if (text == 'updateUser') {
                            updateUser = parser.readValueAs(Object.class);
                        } else {
                            System.debug(LoggingLevel.WARN, 'Cabinet consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class DoorModel {
        public Integer vendorId {get;set;} 
        public String vendorName {get;set;} 
        public Integer collectionId {get;set;} 
        public String collectionName {get;set;} 
        public Boolean isPolymer {get;set;} 
        public Boolean isPolyester {get;set;} 
        public Boolean has1piece {get;set;} 
        public Boolean has5piece {get;set;} 
        public Boolean hasSeries {get;set;} 
        public Integer serieId {get;set;} 
        public String serieName {get;set;} 
        public Integer styleId {get;set;} 
        public String styleName {get;set;} 
        public Boolean styleHasGlaze {get;set;} 
        public Boolean styleNaturallyGlazed {get;set;} 
        public Boolean is1pieceStyle {get;set;} 
        public Boolean is5pieceStyle {get;set;} 
        public String styleDescription {get;set;} 
        public Integer modelNumberPieces {get;set;} 
        public Integer modelId {get;set;} 
        public String modelName {get;set;} 
        public String modelDescription {get;set;} 
        public Boolean modelForceGlaze {get;set;} 
        public Boolean modelHasGlaze {get;set;} 
        public Boolean hasFingerGroove {get;set;} 
        public String partNumber {get;set;} 
        public Double minWidth {get;set;} 
        public Double minHeight {get;set;} 
        public Integer maxHeight {get;set;} 
        public Integer maxWidth {get;set;} 
        public String shapeName {get;set;} 
        public String shapeDescription {get;set;} 
        public String panelType {get;set;} 
        public String panelId {get;set;} 
        public String panelDescription {get;set;} 
        public String frameType {get;set;} 
        public String frameId {get;set;} 
        public String frameDescription {get;set;} 
        public String edgeId {get;set;} 
        public String edgeDescription {get;set;} 
        public List<DfIds> dfIds {get;set;} 
        public List<Integer> mullionMapIds {get;set;} 

        public DoorModel(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'vendorId') {
                            vendorId = parser.getIntegerValue();
                        } else if (text == 'vendorName') {
                            vendorName = parser.getText();
                        } else if (text == 'collectionId') {
                            collectionId = parser.getIntegerValue();
                        } else if (text == 'collectionName') {
                            collectionName = parser.getText();
                        } else if (text == 'isPolymer') {
                            isPolymer = parser.getBooleanValue();
                        } else if (text == 'isPolyester') {
                            isPolyester = parser.getBooleanValue();
                        } else if (text == 'has1piece') {
                            has1piece = parser.getBooleanValue();
                        } else if (text == 'has5piece') {
                            has5piece = parser.getBooleanValue();
                        } else if (text == 'hasSeries') {
                            hasSeries = parser.getBooleanValue();
                        } else if (text == 'serieId') {
                            serieId = parser.getIntegerValue();
                        } else if (text == 'serieName') {
                            serieName = parser.getText();
                        } else if (text == 'styleId') {
                            styleId = parser.getIntegerValue();
                        } else if (text == 'styleName') {
                            styleName = parser.getText();
                        } else if (text == 'styleHasGlaze') {
                            styleHasGlaze = parser.getBooleanValue();
                        } else if (text == 'styleNaturallyGlazed') {
                            styleNaturallyGlazed = parser.getBooleanValue();
                        } else if (text == 'is1pieceStyle') {
                            is1pieceStyle = parser.getBooleanValue();
                        } else if (text == 'is5pieceStyle') {
                            is5pieceStyle = parser.getBooleanValue();
                        } else if (text == 'styleDescription') {
                            styleDescription = parser.getText();
                        } else if (text == 'modelNumberPieces') {
                            modelNumberPieces = parser.getIntegerValue();
                        } else if (text == 'modelId') {
                            modelId = parser.getIntegerValue();
                        } else if (text == 'modelName') {
                            modelName = parser.getText();
                        } else if (text == 'modelDescription') {
                            modelDescription = parser.getText();
                        } else if (text == 'modelForceGlaze') {
                            modelForceGlaze = parser.getBooleanValue();
                        } else if (text == 'modelHasGlaze') {
                            modelHasGlaze = parser.getBooleanValue();
                        } else if (text == 'hasFingerGroove') {
                            hasFingerGroove = parser.getBooleanValue();
                        } else if (text == 'partNumber') {
                            partNumber = parser.getText();
                        } else if (text == 'minWidth') {
                            minWidth = parser.getDoubleValue();
                        } else if (text == 'minHeight') {
                            minHeight = parser.getDoubleValue();
                        } else if (text == 'maxHeight') {
                            maxHeight = parser.getIntegerValue();
                        } else if (text == 'maxWidth') {
                            maxWidth = parser.getIntegerValue();
                        } else if (text == 'shapeName') {
                            shapeName = parser.getText();
                        } else if (text == 'shapeDescription') {
                            shapeDescription = parser.getText();
                        } else if (text == 'panelType') {
                            panelType = parser.getText();
                        } else if (text == 'panelId') {
                            panelId = parser.getText();
                        } else if (text == 'panelDescription') {
                            panelDescription = parser.getText();
                        } else if (text == 'frameType') {
                            frameType = parser.getText();
                        } else if (text == 'frameId') {
                            frameId = parser.getText();
                        } else if (text == 'frameDescription') {
                            frameDescription = parser.getText();
                        } else if (text == 'edgeId') {
                            edgeId = parser.getText();
                        } else if (text == 'edgeDescription') {
                            edgeDescription = parser.getText();
                        } else if (text == 'dfIds') {
                            dfIds = arrayOfDfIds(parser);
                        } else if (text == 'mullionMapIds') {
                            mullionMapIds = arrayOfInteger(parser);
                        } else {
                            System.debug(LoggingLevel.WARN, 'DoorModel consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class SelectedFinishedShelves {
        public Accessory accessory {get;set;} 
        public Depth width {get;set;} 
        public Length height {get;set;} 
        public Depth length {get;set;} 
        public ContractAmount qty {get;set;} 

        public SelectedFinishedShelves(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'accessory') {
                            accessory = new Accessory(parser);
                        } else if (text == 'width') {
                            width = new Depth(parser);
                        } else if (text == 'height') {
                            height = new Length(parser);
                        } else if (text == 'length') {
                            length = new Depth(parser);
                        } else if (text == 'qty') {
                            qty = new ContractAmount(parser);
                        } else {
                            System.debug(LoggingLevel.WARN, 'SelectedFinishedShelves consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class NumberWallDecorativeDoors {
        public Object number_Z {get;set;} // in json: number
        public Boolean cancel {get;set;} 

        public NumberWallDecorativeDoors(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'number') {
                            number_Z = parser.readValueAs(Object.class);
                        } else if (text == 'cancel') {
                            cancel = parser.getBooleanValue();
                        } else {
                            System.debug(LoggingLevel.WARN, 'NumberWallDecorativeDoors consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class ToeKickDefinition {
        public Boolean includeToeKick {get;set;} 
        public Boolean flushBottoms {get;set;} 

        public ToeKickDefinition(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'includeToeKick') {
                            includeToeKick = parser.getBooleanValue();
                        } else if (text == 'flushBottoms') {
                            flushBottoms = parser.getBooleanValue();
                        } else {
                            System.debug(LoggingLevel.WARN, 'ToeKickDefinition consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class DoorInfo {
        public String doorId {get;set;} 
        public String location {get;set;} 
        public String type_Z {get;set;} // in json: type
        public ContractAmount numberDoors {get;set;} 
        public String boreLocation {get;set;} 
        public Boolean fingerGrooves {get;set;} 
        public Boolean glass {get;set;} 
        public String glassStyle {get;set;} 
        public Boolean hasGlassStyle {get;set;} 
        public ContractAmount numberLites {get;set;} 
        public ContractAmount numberPullouts {get;set;} 
        public Depth cabinetDepth {get;set;} 
        public Depth cabinetOpeningWidth {get;set;} 
        public Depth cabinetOpeningHeight {get;set;} 
        public BoreUpfromBottom boreUpfromBottom {get;set;} 
        public Depth boreDownfromTop {get;set;} 
        public String hingeType {get;set;} 
        public Object notes {get;set;} 
        public Boolean dualDoor {get;set;} 
        public Boolean masterDual {get;set;} 
        public Object numberHinges {get;set;} 
        public Boolean isDoorSet {get;set;} 
        public Depth calculatedWidth {get;set;} 
        public Depth calculatedHeight {get;set;} 
        public Depth orderedWidth {get;set;} 
        public Depth orderedHeight {get;set;} 
        public Boolean useDrawerFrontAsDoor {get;set;} 
        public String edge {get;set;} 
        public String frameId {get;set;} 
        public String panelId {get;set;} 
        public DoorModel doorModel {get;set;} 
        public Options options {get;set;} 
        public String doorType {get;set;} 

        public DoorInfo(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'doorId') {
                            doorId = parser.getText();
                        } else if (text == 'location') {
                            location = parser.getText();
                        } else if (text == 'type') {
                            type_Z = parser.getText();
                        } else if (text == 'numberDoors') {
                            numberDoors = new ContractAmount(parser);
                        } else if (text == 'boreLocation') {
                            boreLocation = parser.getText();
                        } else if (text == 'fingerGrooves') {
                            fingerGrooves = parser.getBooleanValue();
                        } else if (text == 'glass') {
                            glass = parser.getBooleanValue();
                        } else if (text == 'glassStyle') {
                            glassStyle = parser.getText();
                        } else if (text == 'hasGlassStyle') {
                            hasGlassStyle = parser.getBooleanValue();
                        } else if (text == 'numberLites') {
                            numberLites = new ContractAmount(parser);
                        } else if (text == 'numberPullouts') {
                            numberPullouts = new ContractAmount(parser);
                        } else if (text == 'cabinetDepth') {
                            cabinetDepth = new Depth(parser);
                        } else if (text == 'cabinetOpeningWidth') {
                            cabinetOpeningWidth = new Depth(parser);
                        } else if (text == 'cabinetOpeningHeight') {
                            cabinetOpeningHeight = new Depth(parser);
                        } else if (text == 'boreUpfromBottom') {
                            boreUpfromBottom = new BoreUpfromBottom(parser);
                        } else if (text == 'boreDownfromTop') {
                            boreDownfromTop = new Depth(parser);
                        } else if (text == 'hingeType') {
                            hingeType = parser.getText();
                        } else if (text == 'notes') {
                            notes = parser.readValueAs(Object.class);
                        } else if (text == 'dualDoor') {
                            dualDoor = parser.getBooleanValue();
                        } else if (text == 'masterDual') {
                            masterDual = parser.getBooleanValue();
                        } else if (text == 'numberHinges') {
                            numberHinges = parser.readValueAs(Object.class);
                        } else if (text == 'isDoorSet') {
                            isDoorSet = parser.getBooleanValue();
                        } else if (text == 'calculatedWidth') {
                            calculatedWidth = new Depth(parser);
                        } else if (text == 'calculatedHeight') {
                            calculatedHeight = new Depth(parser);
                        } else if (text == 'orderedWidth') {
                            orderedWidth = new Depth(parser);
                        } else if (text == 'orderedHeight') {
                            orderedHeight = new Depth(parser);
                        } else if (text == 'useDrawerFrontAsDoor') {
                            useDrawerFrontAsDoor = parser.getBooleanValue();
                        } else if (text == 'edge') {
                            edge = parser.getText();
                        } else if (text == 'frameId') {
                            frameId = parser.getText();
                        } else if (text == 'panelId') {
                            panelId = parser.getText();
                        } else if (text == 'doorModel') {
                            doorModel = new DoorModel(parser);
                        } else if (text == 'options') {
                            options = new Options(parser);
                        } else if (text == 'doorType') {
                            doorType = parser.getText();
                        } else {
                            System.debug(LoggingLevel.WARN, 'DoorInfo consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class SelectedLaminateCollection {
        public Integer collectionId {get;set;} 
        public Integer vendorId {get;set;} 
        public String vendorName {get;set;} 
        public String collectionName {get;set;} 
        public Boolean isPolymer {get;set;} 
        public Boolean isPolyester {get;set;} 
        public Boolean has1piece {get;set;} 
        public Boolean has5piece {get;set;} 
        public Boolean hasSeries {get;set;} 
        public Boolean isSpecialty {get;set;} 

        public SelectedLaminateCollection(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'collectionId') {
                            collectionId = parser.getIntegerValue();
                        } else if (text == 'vendorId') {
                            vendorId = parser.getIntegerValue();
                        } else if (text == 'vendorName') {
                            vendorName = parser.getText();
                        } else if (text == 'collectionName') {
                            collectionName = parser.getText();
                        } else if (text == 'isPolymer') {
                            isPolymer = parser.getBooleanValue();
                        } else if (text == 'isPolyester') {
                            isPolyester = parser.getBooleanValue();
                        } else if (text == 'has1piece') {
                            has1piece = parser.getBooleanValue();
                        } else if (text == 'has5piece') {
                            has5piece = parser.getBooleanValue();
                        } else if (text == 'hasSeries') {
                            hasSeries = parser.getBooleanValue();
                        } else if (text == 'isSpecialty') {
                            isSpecialty = parser.getBooleanValue();
                        } else {
                            System.debug(LoggingLevel.WARN, 'SelectedLaminateCollection consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class Item_Z {
        public Integer id {get;set;} 
        public String name {get;set;} 
        public String description {get;set;} 
        public String itemNumber {get;set;} 
        public String vendorItemName {get;set;} 
        public Object matchBootA {get;set;} 
        public Object matchBootB {get;set;} 
        public Integer qtyPerOrder {get;set;} 
        public Integer qtyPerPackage {get;set;} 
        public Integer glideSize {get;set;} 
        public Integer cabinetDepthMin {get;set;} 
        public Integer drawerBoxWidthMin {get;set;} 
        public Double drawerBoxLength {get;set;} 
        public String vendorNumber {get;set;} 
        public String partNumber {get;set;} 
        public Object notes {get;set;} 
        public String drawerGlideType {get;set;} 
        public String drawerGlideTypeDescription {get;set;} 
        public String drawerGlideHWType {get;set;} 
        public String drawerGlideHWTypeDescription {get;set;} 
        public Integer vendorId {get;set;} 

        public Item_Z(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'id') {
                            id = parser.getIntegerValue();
                        } else if (text == 'name') {
                            name = parser.getText();
                        } else if (text == 'description') {
                            description = parser.getText();
                        } else if (text == 'itemNumber') {
                            itemNumber = parser.getText();
                        } else if (text == 'vendorItemName') {
                            vendorItemName = parser.getText();
                        } else if (text == 'matchBootA') {
                            matchBootA = parser.readValueAs(Object.class);
                        } else if (text == 'matchBootB') {
                            matchBootB = parser.readValueAs(Object.class);
                        } else if (text == 'qtyPerOrder') {
                            qtyPerOrder = parser.getIntegerValue();
                        } else if (text == 'qtyPerPackage') {
                            qtyPerPackage = parser.getIntegerValue();
                        } else if (text == 'glideSize') {
                            glideSize = parser.getIntegerValue();
                        } else if (text == 'cabinetDepthMin') {
                            cabinetDepthMin = parser.getIntegerValue();
                        } else if (text == 'drawerBoxWidthMin') {
                            drawerBoxWidthMin = parser.getIntegerValue();
                        } else if (text == 'drawerBoxLength') {
                            drawerBoxLength = parser.getDoubleValue();
                        } else if (text == 'vendorNumber') {
                            vendorNumber = parser.getText();
                        } else if (text == 'partNumber') {
                            partNumber = parser.getText();
                        } else if (text == 'notes') {
                            notes = parser.readValueAs(Object.class);
                        } else if (text == 'drawerGlideType') {
                            drawerGlideType = parser.getText();
                        } else if (text == 'drawerGlideTypeDescription') {
                            drawerGlideTypeDescription = parser.getText();
                        } else if (text == 'drawerGlideHWType') {
                            drawerGlideHWType = parser.getText();
                        } else if (text == 'drawerGlideHWTypeDescription') {
                            drawerGlideHWTypeDescription = parser.getText();
                        } else if (text == 'vendorId') {
                            vendorId = parser.getIntegerValue();
                        } else {
                            System.debug(LoggingLevel.WARN, 'Item_Z consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class Item_Y {
        public Integer doorNumberPieces {get;set;} 
        public Integer modelId {get;set;} 
        public String modelName {get;set;} 
        public String modelDescription {get;set;} 
        public Boolean hasFingerGroove {get;set;} 
        public String partNumber {get;set;} 
        public Integer dfNumberPieces {get;set;} 
        public Double minWidth {get;set;} 
        public Double minHeight {get;set;} 
        public Integer maxHeight {get;set;} 
        public Integer maxWidth {get;set;} 
        public Object shapeName {get;set;} 
        public Object shapeDescription {get;set;} 
        public Object panelType {get;set;} 
        public Object panelId {get;set;} 
        public Object panelDescription {get;set;} 
        public Object frameType {get;set;} 
        public Object frameId {get;set;} 
        public Object frameDescription {get;set;} 
        public Object edgeId {get;set;} 
        public Object edgeDescription {get;set;} 

        public Item_Y(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'doorNumberPieces') {
                            doorNumberPieces = parser.getIntegerValue();
                        } else if (text == 'modelId') {
                            modelId = parser.getIntegerValue();
                        } else if (text == 'modelName') {
                            modelName = parser.getText();
                        } else if (text == 'modelDescription') {
                            modelDescription = parser.getText();
                        } else if (text == 'hasFingerGroove') {
                            hasFingerGroove = parser.getBooleanValue();
                        } else if (text == 'partNumber') {
                            partNumber = parser.getText();
                        } else if (text == 'dfNumberPieces') {
                            dfNumberPieces = parser.getIntegerValue();
                        } else if (text == 'minWidth') {
                            minWidth = parser.getDoubleValue();
                        } else if (text == 'minHeight') {
                            minHeight = parser.getDoubleValue();
                        } else if (text == 'maxHeight') {
                            maxHeight = parser.getIntegerValue();
                        } else if (text == 'maxWidth') {
                            maxWidth = parser.getIntegerValue();
                        } else if (text == 'shapeName') {
                            shapeName = parser.readValueAs(Object.class);
                        } else if (text == 'shapeDescription') {
                            shapeDescription = parser.readValueAs(Object.class);
                        } else if (text == 'panelType') {
                            panelType = parser.readValueAs(Object.class);
                        } else if (text == 'panelId') {
                            panelId = parser.readValueAs(Object.class);
                        } else if (text == 'panelDescription') {
                            panelDescription = parser.readValueAs(Object.class);
                        } else if (text == 'frameType') {
                            frameType = parser.readValueAs(Object.class);
                        } else if (text == 'frameId') {
                            frameId = parser.readValueAs(Object.class);
                        } else if (text == 'frameDescription') {
                            frameDescription = parser.readValueAs(Object.class);
                        } else if (text == 'edgeId') {
                            edgeId = parser.readValueAs(Object.class);
                        } else if (text == 'edgeDescription') {
                            edgeDescription = parser.readValueAs(Object.class);
                        } else {
                            System.debug(LoggingLevel.WARN, 'Item_Y consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class DrawerConfigurations {
        public String drawerId {get;set;} 
        public DrawerInfo drawerInfo {get;set;} 
        public Depth openingWidth {get;set;} 
        public Depth openingHeight {get;set;} 
        public Depth boxLength {get;set;} 
        public Depth glideLength {get;set;} 
        public Boolean initialized {get;set;} 
        public DrawerDimensionContainer drawerDimensionContainer {get;set;} 

        public DrawerConfigurations(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'drawerId') {
                            drawerId = parser.getText();
                        } else if (text == 'drawerInfo') {
                            drawerInfo = new DrawerInfo(parser);
                        } else if (text == 'openingWidth') {
                            openingWidth = new Depth(parser);
                        } else if (text == 'openingHeight') {
                            openingHeight = new Depth(parser);
                        } else if (text == 'boxLength') {
                            boxLength = new Depth(parser);
                        } else if (text == 'glideLength') {
                            glideLength = new Depth(parser);
                        } else if (text == 'initialized') {
                            initialized = parser.getBooleanValue();
                        } else if (text == 'drawerDimensionContainer') {
                            drawerDimensionContainer = new DrawerDimensionContainer(parser);
                        } else {
                            System.debug(LoggingLevel.WARN, 'DrawerConfigurations consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class DrawerOptions {
        public BoreUpfromBottom boxReduceWidth {get;set;} 
        public OverlayWidthLeft boxReduceHeight {get;set;} 
        public Depth boxLength {get;set;} 
        public Depth glideLength {get;set;} 
        public OverlayWidthLeft overlayWidthLeft {get;set;} 
        public OverlayWidthLeft overlayWidthRight {get;set;} 
        public OverlayWidthLeft overlayHeightTop {get;set;} 
        public OverlayWidthLeft overlayHeightBottom {get;set;} 
        public Object grainDirection {get;set;} 
        public Length openingHeightTopRow {get;set;} 

        public DrawerOptions(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'boxReduceWidth') {
                            boxReduceWidth = new BoreUpfromBottom(parser);
                        } else if (text == 'boxReduceHeight') {
                            boxReduceHeight = new OverlayWidthLeft(parser);
                        } else if (text == 'boxLength') {
                            boxLength = new Depth(parser);
                        } else if (text == 'glideLength') {
                            glideLength = new Depth(parser);
                        } else if (text == 'overlayWidthLeft') {
                            overlayWidthLeft = new OverlayWidthLeft(parser);
                        } else if (text == 'overlayWidthRight') {
                            overlayWidthRight = new OverlayWidthLeft(parser);
                        } else if (text == 'overlayHeightTop') {
                            overlayHeightTop = new OverlayWidthLeft(parser);
                        } else if (text == 'overlayHeightBottom') {
                            overlayHeightBottom = new OverlayWidthLeft(parser);
                        } else if (text == 'grainDirection') {
                            grainDirection = parser.readValueAs(Object.class);
                        } else if (text == 'openingHeightTopRow') {
                            openingHeightTopRow = new Length(parser);
                        } else {
                            System.debug(LoggingLevel.WARN, 'DrawerOptions consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class CabinetConfigurations {
        public String id {get;set;} 
        public String cabinetType {get;set;} 
        public String cabinetLocation {get;set;} 
        public Cabinet cabinet {get;set;} 
        public Options_Z options {get;set;} 
        public Depth width {get;set;} 
        public Depth height {get;set;} 
        public Depth revealLeft {get;set;} 
        public Depth revealRight {get;set;} 
        public ContractAmount clipsOption {get;set;} 
        public ContractAmount shelvesOption {get;set;} 
        public List<Inputs> inputs {get;set;} 
        public Boolean isCabinetSet {get;set;} 
        public String imageContent {get;set;} 
        public Boolean isKKHeightModified {get;set;} 
        public Boolean isKKWidthModified {get;set;} 

        public CabinetConfigurations(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'id') {
                            id = parser.getText();
                        } else if (text == 'cabinetType') {
                            cabinetType = parser.getText();
                        } else if (text == 'cabinetLocation') {
                            cabinetLocation = parser.getText();
                        } else if (text == 'cabinet') {
                            cabinet = new Cabinet(parser);
                        } else if (text == 'options') {
                            options = new Options_Z(parser);
                        } else if (text == 'width') {
                            width = new Depth(parser);
                        } else if (text == 'height') {
                            height = new Depth(parser);
                        } else if (text == 'revealLeft') {
                            revealLeft = new Depth(parser);
                        } else if (text == 'revealRight') {
                            revealRight = new Depth(parser);
                        } else if (text == 'clipsOption') {
                            clipsOption = new ContractAmount(parser);
                        } else if (text == 'shelvesOption') {
                            shelvesOption = new ContractAmount(parser);
                        } else if (text == 'inputs') {
                            inputs = arrayOfInputs(parser);
                        } else if (text == 'isCabinetSet') {
                            isCabinetSet = parser.getBooleanValue();
                        } else if (text == 'imageContent') {
                            imageContent = parser.getText();
                        } else if (text == 'isKKHeightModified') {
                            isKKHeightModified = parser.getBooleanValue();
                        } else if (text == 'isKKWidthModified') {
                            isKKWidthModified = parser.getBooleanValue();
                        } else {
                            System.debug(LoggingLevel.WARN, 'CabinetConfigurations consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class Length {
        public Object whole {get;set;} 
        public Object numerator {get;set;} 
        public Object denominator {get;set;} 
        public Boolean cancel {get;set;} 

        public Length(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'whole') {
                            whole = parser.readValueAs(Object.class);
                        } else if (text == 'numerator') {
                            numerator = parser.readValueAs(Object.class);
                        } else if (text == 'denominator') {
                            denominator = parser.readValueAs(Object.class);
                        } else if (text == 'cancel') {
                            cancel = parser.getBooleanValue();
                        } else {
                            System.debug(LoggingLevel.WARN, 'Length consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class MaterialEnds {
        public String location {get;set;} 
        public Depth length {get;set;} 
        public Depth width {get;set;} 
        public ContractAmount qty {get;set;} 
        public Boolean custom {get;set;} 
        public Boolean editLocation {get;set;} 
        public Boolean editLength {get;set;} 
        public Boolean editWidth {get;set;} 
        public Boolean editQty {get;set;} 
        public Boolean widthFromList {get;set;} 
        public Boolean allowDelete {get;set;} 

        public MaterialEnds(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'location') {
                            location = parser.getText();
                        } else if (text == 'length') {
                            length = new Depth(parser);
                        } else if (text == 'width') {
                            width = new Depth(parser);
                        } else if (text == 'qty') {
                            qty = new ContractAmount(parser);
                        } else if (text == 'custom') {
                            custom = parser.getBooleanValue();
                        } else if (text == 'editLocation') {
                            editLocation = parser.getBooleanValue();
                        } else if (text == 'editLength') {
                            editLength = parser.getBooleanValue();
                        } else if (text == 'editWidth') {
                            editWidth = parser.getBooleanValue();
                        } else if (text == 'editQty') {
                            editQty = parser.getBooleanValue();
                        } else if (text == 'widthFromList') {
                            widthFromList = parser.getBooleanValue();
                        } else if (text == 'allowDelete') {
                            allowDelete = parser.getBooleanValue();
                        } else {
                            System.debug(LoggingLevel.WARN, 'MaterialEnds consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class SelectedValences {
        public String item {get;set;} 
        public String partNumber {get;set;} 
        public Depth height {get;set;} 
        public Depth width {get;set;} 
        public ContractAmount qty {get;set;} 
        public Boolean isCustom {get;set;} 

        public SelectedValences(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'item') {
                            item = parser.getText();
                        } else if (text == 'partNumber') {
                            partNumber = parser.getText();
                        } else if (text == 'height') {
                            height = new Depth(parser);
                        } else if (text == 'width') {
                            width = new Depth(parser);
                        } else if (text == 'qty') {
                            qty = new ContractAmount(parser);
                        } else if (text == 'isCustom') {
                            isCustom = parser.getBooleanValue();
                        } else {
                            System.debug(LoggingLevel.WARN, 'SelectedValences consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class DoorConfigurations {
        public DoorInfo doorInfo {get;set;} 
        public List<PullHardwares> pullHardwares {get;set;} 
        public List<Hinges> hinges {get;set;} 
        public List<Pullouts> pullouts {get;set;} 
        public List<DrawerGlides> drawerGlides {get;set;} 

        public DoorConfigurations(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'doorInfo') {
                            doorInfo = new DoorInfo(parser);
                        } else if (text == 'pullHardwares') {
                            pullHardwares = arrayOfPullHardwares(parser);
                        } else if (text == 'hinges') {
                            hinges = arrayOfHinges(parser);
                        } else if (text == 'pullouts') {
                            pullouts = arrayOfPullouts(parser);
                        } else if (text == 'drawerGlides') {
                            drawerGlides = arrayOfDrawerGlides(parser);
                        } else {
                            System.debug(LoggingLevel.WARN, 'DoorConfigurations consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class SelectedLaminateSerie {
        public Integer serieId {get;set;} 
        public String serieName {get;set;} 
        public Boolean hasHighGloss {get;set;} 

        public SelectedLaminateSerie(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'serieId') {
                            serieId = parser.getIntegerValue();
                        } else if (text == 'serieName') {
                            serieName = parser.getText();
                        } else if (text == 'hasHighGloss') {
                            hasHighGloss = parser.getBooleanValue();
                        } else {
                            System.debug(LoggingLevel.WARN, 'SelectedLaminateSerie consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class DrawerBoxDefinition {
        public Drawers drawers {get;set;} 
        public Drawers pullOuts {get;set;} 

        public DrawerBoxDefinition(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'drawers') {
                            drawers = new Drawers(parser);
                        } else if (text == 'pullOuts') {
                            pullOuts = new Drawers(parser);
                        } else {
                            System.debug(LoggingLevel.WARN, 'DrawerBoxDefinition consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class PeninsulaBacks {
        public String id {get;set;} 
        public String cabinetLocation {get;set;} 
        public Depth height {get;set;} 
        public Depth width {get;set;} 

        public PeninsulaBacks(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'id') {
                            id = parser.getText();
                        } else if (text == 'cabinetLocation') {
                            cabinetLocation = parser.getText();
                        } else if (text == 'height') {
                            height = new Depth(parser);
                        } else if (text == 'width') {
                            width = new Depth(parser);
                        } else {
                            System.debug(LoggingLevel.WARN, 'PeninsulaBacks consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class BoxWidth {
        public Double whole {get;set;} 
        public Integer numerator {get;set;} 
        public Integer denominator {get;set;} 
        public Boolean cancel {get;set;} 

        public BoxWidth(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'whole') {
                            whole = parser.getDoubleValue();
                        } else if (text == 'numerator') {
                            numerator = parser.getIntegerValue();
                        } else if (text == 'denominator') {
                            denominator = parser.getIntegerValue();
                        } else if (text == 'cancel') {
                            cancel = parser.getBooleanValue();
                        } else {
                            System.debug(LoggingLevel.WARN, 'BoxWidth consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class CabModification {
        public Integer id {get;set;} 
        public String name {get;set;} 
        public String description {get;set;} 

        public CabModification(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'id') {
                            id = parser.getIntegerValue();
                        } else if (text == 'name') {
                            name = parser.getText();
                        } else if (text == 'description') {
                            description = parser.getText();
                        } else {
                            System.debug(LoggingLevel.WARN, 'CabModification consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class InstallerItems {
        public String description {get;set;} 
        public Boolean include {get;set;} 

        public InstallerItems(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'description') {
                            description = parser.getText();
                        } else if (text == 'include') {
                            include = parser.getBooleanValue();
                        } else {
                            System.debug(LoggingLevel.WARN, 'InstallerItems consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    
    public static sfdcProductJSONParsing parse(String json) {
        System.JSONParser parser = System.JSON.createParser(json);
        return new sfdcProductJSONParsing(parser);
    }
    
    public static void consumeObject(System.JSONParser parser) {
        Integer depth = 0;
        do {
            System.JSONToken curr = parser.getCurrentToken();
            if (curr == System.JSONToken.START_OBJECT || 
                curr == System.JSONToken.START_ARRAY) {
                depth++;
            } else if (curr == System.JSONToken.END_OBJECT ||
                curr == System.JSONToken.END_ARRAY) {
                depth--;
            }
        } while (depth > 0 && parser.nextToken() != null);
    }
    







    private static List<Items> arrayOfItems(System.JSONParser p) {
        List<Items> res = new List<Items>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Items(p));
        }
        return res;
    }




    private static List<Integer> arrayOfInteger(System.JSONParser p) {
        List<Integer> res = new List<Integer>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(p.getIntegerValue());
        }
        return res;
    }


    private static List<SelectedCabModifications> arrayOfSelectedCabModifications(System.JSONParser p) {
        List<SelectedCabModifications> res = new List<SelectedCabModifications>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new SelectedCabModifications(p));
        }
        return res;
    }






    private static List<UiSections> arrayOfUiSections(System.JSONParser p) {
        List<UiSections> res = new List<UiSections>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new UiSections(p));
        }
        return res;
    }


    private static List<SelectedAddOns> arrayOfSelectedAddOns(System.JSONParser p) {
        List<SelectedAddOns> res = new List<SelectedAddOns>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new SelectedAddOns(p));
        }
        return res;
    }


    private static List<DoorConfigurations> arrayOfDoorConfigurations(System.JSONParser p) {
        List<DoorConfigurations> res = new List<DoorConfigurations>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new DoorConfigurations(p));
        }
        return res;
    }




    private static List<InstallerItems> arrayOfInstallerItems(System.JSONParser p) {
        List<InstallerItems> res = new List<InstallerItems>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new InstallerItems(p));
        }
        return res;
    }












    private static List<SelectedFinishedShelves> arrayOfSelectedFinishedShelves(System.JSONParser p) {
        List<SelectedFinishedShelves> res = new List<SelectedFinishedShelves>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new SelectedFinishedShelves(p));
        }
        return res;
    }












    private static List<PeninsulaBacks> arrayOfPeninsulaBacks(System.JSONParser p) {
        List<PeninsulaBacks> res = new List<PeninsulaBacks>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new PeninsulaBacks(p));
        }
        return res;
    }



    private static List<Hinges> arrayOfHinges(System.JSONParser p) {
        List<Hinges> res = new List<Hinges>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Hinges(p));
        }
        return res;
    }







    private static List<SelectedHWAccessories> arrayOfSelectedHWAccessories(System.JSONParser p) {
        List<SelectedHWAccessories> res = new List<SelectedHWAccessories>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new SelectedHWAccessories(p));
        }
        return res;
    }





    private static List<CabinetConfigurations> arrayOfCabinetConfigurations(System.JSONParser p) {
        List<CabinetConfigurations> res = new List<CabinetConfigurations>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new CabinetConfigurations(p));
        }
        return res;
    }




    private static List<String> arrayOfString(System.JSONParser p) {
        List<String> res = new List<String>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(p.getText());
        }
        return res;
    }


    private static List<CabinetWidths_Z> arrayOfCabinetWidths_Z(System.JSONParser p) {
        List<CabinetWidths_Z> res = new List<CabinetWidths_Z>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new CabinetWidths_Z(p));
        }
        return res;
    }





    private static List<SelectedCorbels> arrayOfSelectedCorbels(System.JSONParser p) {
        List<SelectedCorbels> res = new List<SelectedCorbels>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new SelectedCorbels(p));
        }
        return res;
    }


    private static List<DrawerFronts> arrayOfDrawerFronts(System.JSONParser p) {
        List<DrawerFronts> res = new List<DrawerFronts>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new DrawerFronts(p));
        }
        return res;
    }











    private static List<Lengths> arrayOfLengths(System.JSONParser p) {
        List<Lengths> res = new List<Lengths>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Lengths(p));
        }
        return res;
    }



    private static List<Depth> arrayOfDepth(System.JSONParser p) {
        List<Depth> res = new List<Depth>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Depth(p));
        }
        return res;
    }







    private static List<CabinetWidths> arrayOfCabinetWidths(System.JSONParser p) {
        List<CabinetWidths> res = new List<CabinetWidths>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new CabinetWidths(p));
        }
        return res;
    }







    private static List<Valances> arrayOfValances(System.JSONParser p) {
        List<Valances> res = new List<Valances>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Valances(p));
        }
        return res;
    }




    private static List<Boolean> arrayOfBoolean(System.JSONParser p) {
        List<Boolean> res = new List<Boolean>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(p.getBooleanValue());
        }
        return res;
    }



    private static List<Inputs> arrayOfInputs(System.JSONParser p) {
        List<Inputs> res = new List<Inputs>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Inputs(p));
        }
        return res;
    }


    private static List<DrawerConfigurations> arrayOfDrawerConfigurations(System.JSONParser p) {
        List<DrawerConfigurations> res = new List<DrawerConfigurations>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new DrawerConfigurations(p));
        }
        return res;
    }








    private static List<SelectedValences> arrayOfSelectedValences(System.JSONParser p) {
        List<SelectedValences> res = new List<SelectedValences>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new SelectedValences(p));
        }
        return res;
    }


    private static List<ActualMoldings> arrayOfActualMoldings(System.JSONParser p) {
        List<ActualMoldings> res = new List<ActualMoldings>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new ActualMoldings(p));
        }
        return res;
    }






    private static List<Pullouts> arrayOfPullouts(System.JSONParser p) {
        List<Pullouts> res = new List<Pullouts>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Pullouts(p));
        }
        return res;
    }




    private static List<MaterialEnds> arrayOfMaterialEnds(System.JSONParser p) {
        List<MaterialEnds> res = new List<MaterialEnds>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new MaterialEnds(p));
        }
        return res;
    }


    private static List<PullHardwares> arrayOfPullHardwares(System.JSONParser p) {
        List<PullHardwares> res = new List<PullHardwares>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new PullHardwares(p));
        }
        return res;
    }







    private static List<DfIds> arrayOfDfIds(System.JSONParser p) {
        List<DfIds> res = new List<DfIds>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new DfIds(p));
        }
        return res;
    }












    private static List<DrawerGlides> arrayOfDrawerGlides(System.JSONParser p) {
        List<DrawerGlides> res = new List<DrawerGlides>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new DrawerGlides(p));
        }
        return res;
    }




}