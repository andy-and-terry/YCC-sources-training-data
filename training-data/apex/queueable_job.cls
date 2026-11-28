public class RecalcJob implements Queueable {
    private final Set<Id> accountIds;
    public RecalcJob(Set<Id> ids) { this.accountIds = ids; }

    public void execute(QueueableContext ctx) {
        List<Account> accts = [SELECT Id, NumberOfEmployees FROM Account WHERE Id IN :accountIds];
        for (Account a : accts) {
            a.NumberOfEmployees = a.NumberOfEmployees == null ? 1 : a.NumberOfEmployees + 1;
        }
        update accts;
    }
}
