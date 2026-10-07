public class SelectorPatternDemo {
    public interface AccountSelector {
        List<Account> selectByIds(Set<Id> ids);
        List<Account> selectHighRevenue(Decimal minRevenue);
    }

    public class AccountSelectorImpl implements AccountSelector {
        public List<Account> selectByIds(Set<Id> ids) {
            return [SELECT Id, Name, AnnualRevenue FROM Account WHERE Id IN :ids];
        }

        public List<Account> selectHighRevenue(Decimal minRevenue) {
            return [
                SELECT Id, Name, AnnualRevenue
                FROM Account
                WHERE AnnualRevenue >= :minRevenue
                ORDER BY AnnualRevenue DESC
            ];
        }
    }

    public static void main() {
        AccountSelector selector = new AccountSelectorImpl();
        List<Account> highRevenueAccounts = selector.selectHighRevenue(1000000);
        System.debug('High revenue accounts found: ' + highRevenueAccounts.size());
    }
}
