public class AccountTriggerHandler {
    public static void run(TriggerOperation op, List<Account> news) {
        switch on op {
            when BEFORE_INSERT { for (Account a : news) a.Description = 'new'; }
            when AFTER_UPDATE { System.debug('updated ' + news.size()); }
            when else { }
        }
    }
}
