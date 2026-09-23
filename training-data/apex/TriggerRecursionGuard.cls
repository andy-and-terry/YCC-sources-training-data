public class TriggerRecursionGuard {
    private static Set<Id> processedIds = new Set<Id>();
    private static Boolean isRunning = false;

    public static Boolean shouldRun() {
        return !isRunning;
    }

    public static Boolean alreadyProcessed(Id recordId) {
        return processedIds.contains(recordId);
    }

    public static void markProcessed(Id recordId) {
        processedIds.add(recordId);
    }

    public static void run(List<Account> accounts) {
        if (!shouldRun()) {
            return;
        }
        isRunning = true;
        try {
            for (Account acc : accounts) {
                if (!alreadyProcessed(acc.Id)) {
                    acc.Description = 'Processed once';
                    markProcessed(acc.Id);
                }
            }
        } finally {
            isRunning = false;
        }
    }

    public static void main() {
        List<Account> accounts = new List<Account>{ new Account(Name = 'Test') };
        run(accounts);
        run(accounts);
        System.debug('Recursion guard demo complete.');
    }
}
