public class CleanupBatch implements Database.Batchable<SObject> {
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id FROM Task WHERE IsClosed = true');
    }
    public void execute(Database.BatchableContext bc, List<SObject> scope) {
        delete scope;
    }
    public void finish(Database.BatchableContext bc) {
        System.debug('cleanup done');
    }
}
