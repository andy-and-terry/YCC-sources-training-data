public class DmlPartialSuccessDemo {
    public static void insertAll(List<Account> accounts) {
        Database.SaveResult[] results = Database.insert(accounts, false);
        for (Integer i = 0; i < results.size(); i++) {
            if (!results[i].isSuccess()) {
                for (Database.Error err : results[i].getErrors()) {
                    System.debug('Row ' + i + ' failed: ' + err.getMessage());
                }
            }
        }
    }

    public static void main() {
        insertAll(new List<Account>{
            new Account(Name = 'Good Co'),
            new Account()
        });
    }
}
