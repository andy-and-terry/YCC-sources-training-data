public class TestClassDemo {
    public static Integer addPositive(Integer a, Integer b) {
        if (a < 0 || b < 0) {
            throw new IllegalArgumentException('Both arguments must be non-negative');
        }
        return a + b;
    }

    // A minimal illustration of Apex's @isTest class/method annotations,
    // Test.startTest/Test.stopTest to reset governor limits around the
    // code under test, and System.assert* for verification. Real Apex
    // test classes typically also insert test data and run under
    // System.runAs() to check sharing/permission behavior.
    @isTest
    private class AddPositiveTest {
        @isTest
        static void addsTwoPositiveNumbers() {
            Test.startTest();
            Integer result = TestClassDemo.addPositive(2, 3);
            Test.stopTest();

            System.assertEquals(5, result, 'Expected 2 + 3 to equal 5');
        }

        @isTest
        static void throwsOnNegativeInput() {
            try {
                TestClassDemo.addPositive(-1, 3);
                System.assert(false, 'Expected an IllegalArgumentException to be thrown');
            } catch (IllegalArgumentException e) {
                System.assert(e.getMessage().contains('non-negative'));
            }
        }
    }

    public static void main() {
        System.debug(addPositive(4, 6));
    }
}
