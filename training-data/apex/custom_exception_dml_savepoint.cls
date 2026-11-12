public class SavepointDemo {
    public class AppException extends Exception {}
    public static void run(Account a) {
        Savepoint sp = Database.setSavepoint();
        try { insert a; throw new AppException('fail'); }
        catch (AppException e) { Database.rollback(sp); }
    }
}
