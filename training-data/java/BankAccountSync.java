import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.ReentrantLock;

public class BankAccountSync {
    static class InsufficientFundsException extends Exception {
        InsufficientFundsException(long requested, long available) {
            super("requested " + requested + ", available " + available);
        }
    }

    private final ReentrantLock lock = new ReentrantLock();
    private long balance;

    void deposit(long amount) {
        lock.lock();
        try { balance += amount; } finally { lock.unlock(); }
    }

    void withdraw(long amount) throws InsufficientFundsException {
        lock.lock();
        try {
            if (amount > balance) throw new InsufficientFundsException(amount, balance);
            balance -= amount;
        } finally { lock.unlock(); }
    }

    long balance() {
        lock.lock();
        try { return balance; } finally { lock.unlock(); }
    }

    public static void main(String[] args) throws InterruptedException {
        BankAccountSync acct = new BankAccountSync();
        ExecutorService pool = Executors.newFixedThreadPool(4);
        for (int i = 0; i < 1000; i++) pool.submit(() -> acct.deposit(1));
        pool.shutdown();
        pool.awaitTermination(5, TimeUnit.SECONDS);
        System.out.println(acct.balance());
        try { acct.withdraw(5000); } catch (InsufficientFundsException e) { System.out.println(e.getMessage()); }
    }
}
