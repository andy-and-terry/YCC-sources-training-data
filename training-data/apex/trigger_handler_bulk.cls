public with sharing class AccountTriggerHandler {
    public static void beforeInsert(List<Account> accts) {
        for (Account a : accts) {
            if (String.isBlank(a.Description)) {
                a.Description = 'Created ' + System.today().format();
            }
        }
    }
}
