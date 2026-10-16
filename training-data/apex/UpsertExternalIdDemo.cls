public class UpsertExternalIdDemo {
    public static void syncAccounts(List<Account> incoming) {
        Database.UpsertResult[] results = Database.upsert(incoming, Account.Fields.AccountNumber, false);
        Integer created = 0;
        Integer updated = 0;
        for (Database.UpsertResult r : results) {
            if (r.isSuccess()) {
                if (r.isCreated()) created++; else updated++;
            }
        }
        System.debug('created=' + created + ' updated=' + updated);
    }
}
