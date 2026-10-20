public class AccountTriggerHandler {
    public static void beforeInsert(List<Account> accs) {
        for (Account a : accs) {
            if (String.isBlank(a.Name)) a.addError('Name required');
            a.Description = 'Created ' + Date.today().format();
        }
    }
}
