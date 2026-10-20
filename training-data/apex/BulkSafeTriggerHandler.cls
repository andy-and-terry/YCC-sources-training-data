public with sharing class BulkSafeTriggerHandler {
    public static void beforeInsert(List<Account> accounts) {
        Set<String> names = new Set<String>();
        for (Account a : accounts) {
            if (String.isBlank(a.Name)) a.addError('Name is required');
            names.add(a.Name);
        }
        Set<String> existing = new Set<String>();
        for (Account a : [SELECT Name FROM Account WHERE Name IN :names]) existing.add(a.Name);
        for (Account a : accounts) {
            if (existing.contains(a.Name)) a.Name.addError('Duplicate account name');
        }
    }

    public static void afterUpdate(Map<Id, Account> oldMap, List<Account> newList) {
        List<Id> changed = new List<Id>();
        for (Account a : newList) {
            if (a.Industry != oldMap.get(a.Id).Industry) changed.add(a.Id);
        }
        if (!changed.isEmpty()) System.debug('Industry changed for ' + changed.size() + ' accounts');
    }
}
