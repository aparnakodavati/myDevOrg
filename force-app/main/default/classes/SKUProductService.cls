global class SKUProductService {
    global static void getBOS(String bosJson){
        Map<String, Object> root = (Map<String, Object>) JSON.deserializeUntyped(bosJson);
        List<Object> products = (List<Object>) root.get('products');
        integer i = 0;
        
        while(i < products.size()){
            Map<String, Object> productsElement = (Map<String, Object>) products.get(i); 
            List<Object> productLines = (List<Object>) productsElement.get('product_lines');
            integer linesCounter = 0;
            while(linesCounter < productLines.size()){
                Map<String, Object> productLinesElement = (Map<String, Object>) productLines.get(linesCounter);
                List<Object> custom_attributes = (List<Object>) productLinesElement.get('custom_attributes');
                
                String productName = String.valueOf(productLinesElement.get('productName'));
                Type t = Type.forName(productName);
                SKUMapper prod = (SKUMapper) t.newInstance();
                //custom_attributes = prod.getSkuNumber(custom_attributes);
                System.debug('customAtt: ' + JSON.serialize(custom_attributes));
                
                linesCounter++;
            }
            i++;
        }
    }
}