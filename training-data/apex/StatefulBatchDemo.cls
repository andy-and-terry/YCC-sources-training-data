public class StatefulBatchDemo implements Database.Batchable<SObject>, Database.Stateful {
    // Instance state survives across execute() chunks because of Database.Stateful.
    private Integer processed = 0;
    private Decimal totalRevenue = 0;

    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id, AnnualRevenue FROM Account');
    }

    public void execute(Database.BatchableContext bc, List<Account> scope) {
        for (Account a : scope) {
            processed++;
            totalRevenue += (a.AnnualRevenue == null ? 0 : a.AnnualRevenue);
        }
    }

    public void finish(Database.BatchableContext bc) {
        System.debug('Processed ' + processed + ' accounts, revenue ' + totalRevenue);
    }
}
