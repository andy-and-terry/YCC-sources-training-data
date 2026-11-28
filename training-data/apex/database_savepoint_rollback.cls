public class SafeInsert {
    public static Boolean tryInsert(List<Account> accts) {
        Savepoint sp = Database.setSavepoint();
        try {
            insert accts;
            return true;
        } catch (DmlException e) {
            Database.rollback(sp);
            return false;
        }
    }
}
