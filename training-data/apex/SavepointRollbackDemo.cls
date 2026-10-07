public class SavepointRollbackDemo {
    public static void transferFunds(Id fromId, Id toId, Decimal amount) {
        Savepoint sp = Database.setSavepoint();
        try {
            Account fromAcc = [SELECT Id, AnnualRevenue FROM Account WHERE Id = :fromId];
            Account toAcc = [SELECT Id, AnnualRevenue FROM Account WHERE Id = :toId];

            fromAcc.AnnualRevenue -= amount;
            if (fromAcc.AnnualRevenue < 0) {
                throw new DmlException('Insufficient funds');
            }
            toAcc.AnnualRevenue += amount;

            update new List<Account>{fromAcc, toAcc};
        } catch (Exception e) {
            Database.rollback(sp);
            System.debug('Transfer failed, rolled back: ' + e.getMessage());
        }
    }

    public static void main() {
        transferFunds(null, null, 100);
    }
}
