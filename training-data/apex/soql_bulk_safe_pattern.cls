public class SoqlBulkSafe {
    public static Map<Id, Account> byId(Set<Id> ids) {
        return new Map<Id, Account>([SELECT Id, Name FROM Account WHERE Id IN :ids]);
    }
    public static void rename(List<Account> accts) {
        for (Account a : accts) { a.Name = a.Name.trim(); }
        update accts;
    }
}
