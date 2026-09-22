@isTest
public class TestClassDemo {
    public class Calculator {
        public Integer add(Integer a, Integer b) {
            return a + b;
        }
        public Integer divide(Integer a, Integer b) {
            if (b == 0) {
                throw new IllegalArgumentException('Cannot divide by zero');
            }
            return a / b;
        }
    }

    @isTest
    static void testAdd() {
        Calculator calc = new Calculator();
        System.assertEquals(7, calc.add(3, 4));
    }

    @isTest
    static void testDivide() {
        Calculator calc = new Calculator();
        Test.startTest();
        Integer result = calc.divide(10, 2);
        Test.stopTest();
        System.assertEquals(5, result);
    }

    @isTest
    static void testDivideByZeroThrows() {
        Calculator calc = new Calculator();
        Boolean threw = false;
        try {
            calc.divide(10, 0);
        } catch (IllegalArgumentException e) {
            threw = true;
        }
        System.assert(threw, 'Expected an exception for division by zero');
    }
}
