public class AccountTriggerHandler {
    public static void handleBeforeInsert(List<Account> newAccounts) {
        for (Account acc : newAccounts) {
            if (String.isBlank(acc.Name)) {
                acc.Name = 'Unnamed Account';
            }
            if (acc.AnnualRevenue == null) {
                acc.AnnualRevenue = 0;
            }
        }
    }

    public static void handleAfterInsert(List<Account> newAccounts) {
        Set<Id> accountIds = new Set<Id>();
        for (Account acc : newAccounts) {
            accountIds.add(acc.Id);
        }
        System.debug('Inserted account IDs: ' + accountIds);
    }
}
