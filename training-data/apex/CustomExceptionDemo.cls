public class CustomExceptionDemo {
    public class InsufficientFundsException extends Exception {}

    public void withdraw(Decimal balance, Decimal amount) {
        if (amount > balance) {
            throw new InsufficientFundsException('Insufficient funds for withdrawal');
        }
    }

    public static void main() {
        CustomExceptionDemo demo = new CustomExceptionDemo();
        try {
            demo.withdraw(100, 150);
        } catch (InsufficientFundsException e) {
            System.debug('Caught: ' + e.getMessage());
        }
    }
}
