public class UtilityHolder {
    public static string calculateMixedFraction(double whole, double Numerator, double Denominator){
        if(whole == null || whole == 0.0) {return null;}
        double decimalValue = 0.0;
        if(Numerator != null && Numerator != 0.0  && Denominator != null && Denominator != 0.0){
        	decimalValue=Numerator/Denominator;
        }else{
            return String.valueOf(whole);
        }
        double totalValue=whole+decimalValue;
        return String.ValueOf(Math.round(totalValue * 100.0)/100.0);
    }
}