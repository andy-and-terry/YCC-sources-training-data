public class CountBatch implements Database.Batchable<SObject>, Database.Stateful {
    public Integer total = 0;
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id FROM Contact');
    }
    public void execute(Database.BatchableContext bc, List<Contact> scope) { total += scope.size(); }
    public void finish(Database.BatchableContext bc) { System.debug('total=' + total); }
}
