@isTest
private class TestClassWithTestSetup {
    @TestSetup
    static void setup() {
        List<Account> accts = new List<Account>();
        for (Integer i = 0; i < 3; i++) accts.add(new Account(Name = 'Test ' + i));
        insert accts;
    }

    @isTest
    static void countsAccounts() {
        Test.startTest();
        Integer n = [SELECT COUNT() FROM Account WHERE Name LIKE 'Test %'];
        Test.stopTest();
        System.assertEquals(3, n, 'three accounts from setup');
    }

    @isTest
    static void rejectsBlankName() {
        try {
            insert new Account();
            System.assert(false, 'expected failure');
        } catch (DmlException e) {
            System.assert(e.getMessage().contains('REQUIRED_FIELD_MISSING'));
        }
    }

    @isTest
    static void runsAsUser() {
        User u = [SELECT Id FROM User WHERE Id = :UserInfo.getUserId()];
        System.runAs(u) { System.assertNotEquals(null, UserInfo.getUserId()); }
    }
}
