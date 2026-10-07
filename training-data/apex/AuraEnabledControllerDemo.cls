public with sharing class AuraEnabledControllerDemo {
    // cacheable=true allows client-side caching and wire service use (read-only).
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(String searchTerm) {
        String pattern = '%' + String.escapeSingleQuotes(searchTerm) + '%';
        return [SELECT Id, Name FROM Account WHERE Name LIKE :pattern LIMIT 20];
    }

    @AuraEnabled
    public static Id createAccount(String name) {
        if (String.isBlank(name)) {
            throw new AuraHandledException('Name is required');
        }
        Account a = new Account(Name = name);
        insert a;
        return a.Id;
    }
}
