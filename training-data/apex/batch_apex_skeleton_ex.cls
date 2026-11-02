public class BatchApexSkeletonEx implements Database.Batchable<SObject> {
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id, Name FROM Contact');
    }
    public void execute(Database.BatchableContext bc, List<Contact> scope) {
        for (Contact c : scope) {
            c.Description = 'Processed';
        }
        update scope;
    }
    public void finish(Database.BatchableContext bc) {
        System.debug('batch complete');
    }
}
