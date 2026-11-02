public with sharing class AccountTriggerHandlerEx {
    public static void beforeInsert(List<Account> accts) {
        for (Account a : accts) {
            if (String.isBlank(a.Industry)) {
                a.Industry = 'Other';
            }
        }
    }
}
