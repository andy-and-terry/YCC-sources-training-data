public class DatabaseSaveResultDemo {
    public static void insertPartial(List<Account> accts) {
        Database.SaveResult[] results = Database.insert(accts, false);
        for (Integer i = 0; i < results.size(); i++) {
            if (!results[i].isSuccess()) {
                for (Database.Error err : results[i].getErrors()) {
                    System.debug('Row ' + i + ': ' + err.getMessage());
                }
            }
        }
    }
}
