public with sharing class SecurityEnforcedDemo {
    // Throws if the running user lacks field-level read access.
    public static List<Account> queryEnforced() {
        return [SELECT Id, Name, Industry FROM Account WITH SECURITY_ENFORCED LIMIT 10];
    }

    // Strips fields the user cannot read instead of throwing.
    public static List<Account> queryStripped() {
        List<Account> accounts = [SELECT Id, Name, AnnualRevenue FROM Account LIMIT 10];
        SObjectAccessDecision decision =
            Security.stripInaccessible(AccessType.READABLE, accounts);
        return (List<Account>) decision.getRecords();
    }

    public static Boolean canCreateAccount() {
        return Schema.sObjectType.Account.isCreateable();
    }
}
