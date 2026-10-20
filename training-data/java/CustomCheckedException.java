public class CustomCheckedException {
    static class InsufficientFundsException extends Exception {
        final double shortBy;
        InsufficientFundsException(double s) { super("short by " + s); shortBy = s; }
    }

    static void withdraw(double bal, double amt) throws InsufficientFundsException {
        if (amt > bal) throw new InsufficientFundsException(amt - bal);
    }

    public static void main(String[] args) {
        try { withdraw(50, 80); }
        catch (InsufficientFundsException e) { System.out.println(e.getMessage() + " " + e.shortBy); }
        finally { System.out.println("done"); }
    }
}
