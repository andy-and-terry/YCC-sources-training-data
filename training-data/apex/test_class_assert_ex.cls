@IsTest
private class TestClassAssertEx {
    @IsTest
    static void insertsAccount() {
        Account a = new Account(Name = 'Acme');
        insert a;
        Account got = [SELECT Name FROM Account WHERE Id = :a.Id];
        System.assertEquals('Acme', got.Name);
    }
}
