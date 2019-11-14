public class myTestClass{


    public myTestClass()
{
System.debug('check the debug logs');

}

public Account createAccount(String name) { 
		Account acc = new Account();
		acc.Name = name;
		return acc;
	}


}