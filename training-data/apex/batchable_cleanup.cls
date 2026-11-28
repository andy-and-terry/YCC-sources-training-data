public class StaleLeadCleanup implements Database.Batchable<SObject> {
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id FROM Lead WHERE LastActivityDate < LAST_N_DAYS:365');
    }
    public void execute(Database.BatchableContext bc, List<SObject> scope) {
        delete scope;
    }
    public void finish(Database.BatchableContext bc) {
        System.debug('cleanup complete');
    }
}
