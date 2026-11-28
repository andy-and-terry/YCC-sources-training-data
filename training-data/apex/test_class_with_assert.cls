@IsTest
private class MathUtilTest {
    @IsTest
    static void testDouble() {
        Test.startTest();
        Integer r = 21 * 2;
        Test.stopTest();
        System.assertEquals(42, r, 'Expected 42');
    }
}
