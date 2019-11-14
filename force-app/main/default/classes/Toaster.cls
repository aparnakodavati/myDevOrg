public class Toaster  implements KitchenUtility {
private String modelNumber;
    public Toaster(String mod)
    {
        modelNumber = mod;
    }
    
    public String getModelNumber(){
        return 'T' + modelNumber;
    }
}