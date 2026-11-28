@IsTest
private class MathTest {
    @IsTest static void addsNumbers() {
        Test.startTest();
        Integer r = 2 + 3;
        Test.stopTest();
        System.assertEquals(5, r, 'sum should be 5');
    }
}
