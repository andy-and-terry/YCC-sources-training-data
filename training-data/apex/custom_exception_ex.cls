public class CustomExceptionEx {
    public class InsufficientFundsException extends Exception {}

    public static void withdraw(Decimal balance, Decimal amt) {
        if (amt > balance) {
            throw new InsufficientFundsException('Need ' + (amt - balance) + ' more');
        }
    }
}
