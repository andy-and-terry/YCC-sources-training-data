public class DatabaseDmlPartialSuccess {
    public static List<String> insertAll(List<Contact> contacts) {
        List<String> errors = new List<String>();
        Database.SaveResult[] results = Database.insert(contacts, false);
        for (Integer i = 0; i < results.size(); i++) {
            if (!results[i].isSuccess()) {
                for (Database.Error e : results[i].getErrors()) {
                    errors.add(contacts[i].LastName + ': ' + e.getStatusCode() + ' ' + e.getMessage());
                }
            }
        }
        return errors;
    }

    public static void upsertByExternalId(List<Account> accts) {
        Database.UpsertResult[] r = Database.upsert(accts, Account.Fields.AccountNumber, false);
        Integer created = 0;
        for (Database.UpsertResult ur : r) if (ur.isSuccess() && ur.isCreated()) created++;
        System.debug('created ' + created);
    }
}
