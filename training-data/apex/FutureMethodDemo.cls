public class FutureMethodDemo {
    @future
    public static void updateAccountRatings(Set<Id> accountIds) {
        List<Account> accounts = [SELECT Id, Rating FROM Account WHERE Id IN :accountIds];
        for (Account acc : accounts) {
            acc.Rating = 'Hot';
        }
        update accounts;
    }

    public static void main() {
        Set<Id> ids = new Set<Id>();
        updateAccountRatings(ids);
        System.debug('Future method enqueued');
    }
}
