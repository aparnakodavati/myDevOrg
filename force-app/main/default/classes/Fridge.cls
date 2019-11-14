public class Fridge implements KitchenUtility
{
    
    private String modelNumber;
    public Fridge(String mod)
    {
        modelNumber = mod;
    }
    
    public String getModelNumber(){
        return 'F' + modelNumber;
    }
    
}