public class AccountCustomController {

    public PageReference saveTheRecord() {
    update account;
        return null;
    }


private final Account account;

public AccountCustomController ()
{
account= [select id, name, site from account where id= :ApexPages.CurrentPage().getParameters().get('id')];
}
    public Account getAccount() {
        return account;
    }
}