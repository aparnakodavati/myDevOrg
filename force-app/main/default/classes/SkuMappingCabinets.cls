public class SkuMappingCabinets {
    public SkuMappingCabinets(){}
    public Map<String, String> cabinetConfigAttributes(){
        Map<String, String> cabConfigAtt = new Map<String, String>();
        cabConfigAtt.put('cabinet_type', 'cabinetType');
        return cabConfigAtt;
    }
    public Map<String, String> innerCabinetAttributes(){
        Map<String, String> innerCabAtt = new Map<String, String>();
        innerCabAtt.put('cabinet_description', 'itemName');
        return innerCabAtt;
    }
    public Map<String, String> shelvesOptionAttributes(){
        Map<String, String> shelvesCabAtt = new Map<String, String>();
        shelvesCabAtt.put('cabinet_shelves', 'number');
        return shelvesCabAtt;
    }
    public Map<String, String> clipsOptionAttributes(){
        Map<String, String> clipsCabAtt = new Map<String, String>();
        clipsCabAtt.put('cabinet_clips', 'number');
        return clipsCabAtt;
    }
    public Map<String, String> measureAttributes(){
        Map<String, String> measureCabAtt = new Map<String, String>();
        measureCabAtt.put('whole', 'whole');
        measureCabAtt.put('numerator', 'numerator');
        measureCabAtt.put('denominator', 'denominator');
        return measureCabAtt;
    }
    public Map<String, String> cabOptionsAttributes(){
        Map<String, String> optionsCabAtt = new Map<String, String>();
        optionsCabAtt.put('flushBottom', 'Cabinet Options');
        optionsCabAtt.put('solidBack', 'Cabinet Options');
        optionsCabAtt.put('noBack', 'Cabinet Options');
        optionsCabAtt.put('extendStile', 'Cabinet Options');
        optionsCabAtt.put('frameless', 'Cabinet Options');
        optionsCabAtt.put('finishedInside', 'Cabinet Options');
        optionsCabAtt.put('extendToeKick', 'Cabinet Options');
        optionsCabAtt.put('knockDown', 'Cabinet Options');
        optionsCabAtt.put('notes', 'Cabinet Options');
        return optionsCabAtt;
    }
    public List<String> cabSkuNumberAttributes(){
        List<String> cabSkuAtt = new List<String>();
        cabSkuAtt.add('cabinet_skuNumber');
        return cabSkuAtt;
    }
}