global class BatchApexStatefulCounter implements Database.Batchable<SObject>, Database.Stateful {
    global Integer recordsSeen = 0;
    global Integer failures = 0;

    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id, Name FROM Account WHERE CreatedDate = LAST_N_DAYS:30');
    }

    global void execute(Database.BatchableContext bc, List<Account> scope) {
        recordsSeen += scope.size();
        for (Account a : scope) a.Name = a.Name.trim();
        Database.SaveResult[] sr = Database.update(scope, false);
        for (Database.SaveResult r : sr) if (!r.isSuccess()) failures++;
    }

    global void finish(Database.BatchableContext bc) {
        System.debug('seen=' + recordsSeen + ' failures=' + failures);
    }
}
