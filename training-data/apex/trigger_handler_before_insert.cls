public class AccountTriggerHandler {
    public static void beforeInsert(List<Account> newList) {
        for (Account a : newList) {
            if (String.isBlank(a.Description)) {
                a.Description = 'Created ' + System.today().format();
            }
        }
    }
}
