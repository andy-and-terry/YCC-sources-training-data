public class QueueableChainedJob implements Queueable, Database.AllowsCallouts {
    private List<Id> remaining;
    private Integer processed;

    public QueueableChainedJob(List<Id> ids, Integer processed) {
        this.remaining = ids;
        this.processed = processed;
    }

    public void execute(QueueableContext ctx) {
        Integer batchSize = Math.min(2, remaining.size());
        List<Id> current = new List<Id>();
        for (Integer i = 0; i < batchSize; i++) current.add(remaining.remove(0));
        List<Account> accts = [SELECT Id, Description FROM Account WHERE Id IN :current];
        for (Account a : accts) a.Description = 'processed ' + System.now().format();
        update accts;
        if (!remaining.isEmpty()) {
            System.enqueueJob(new QueueableChainedJob(remaining, processed + batchSize));
        }
    }
}
