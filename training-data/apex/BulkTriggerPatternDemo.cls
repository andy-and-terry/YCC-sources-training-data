public class BulkTriggerPatternDemo {
    public static void applyDiscountByParentRevenue(List<Opportunity> opps) {
        Set<Id> accountIds = new Set<Id>();
        for (Opportunity opp : opps) {
            accountIds.add(opp.AccountId);
        }

        Map<Id, Account> accountsById = new Map<Id, Account>(
            [SELECT Id, AnnualRevenue FROM Account WHERE Id IN :accountIds]
        );

        for (Opportunity opp : opps) {
            Account acc = accountsById.get(opp.AccountId);
            if (acc != null && acc.AnnualRevenue > 1000000) {
                opp.Amount = opp.Amount * 0.9;
            }
        }
    }

    public static void main() {
        applyDiscountByParentRevenue(new List<Opportunity>());
    }
}
