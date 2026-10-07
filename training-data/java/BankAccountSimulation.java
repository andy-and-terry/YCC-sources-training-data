import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.ReentrantLock;

public class BankAccountSimulation {
    static final class InsufficientFundsException extends RuntimeException {
        InsufficientFundsException(String msg) { super(msg); }
    }

    static final class Account {
        final int id;
        private long balance;
        final ReentrantLock lock = new ReentrantLock();

        Account(int id, long balance) {
            this.id = id;
            this.balance = balance;
        }
    }

    /** Locks accounts in id order so concurrent transfers can't deadlock. */
    static void transfer(Account from, Account to, long amount) {
        Account first = from.id < to.id ? from : to, second = first == from ? to : from;
        first.lock.lock();
        second.lock.lock();
        try {
            if (from.balance < amount) throw new InsufficientFundsException("account " + from.id + " short by " + (amount - from.balance));
            from.balance -= amount;
            to.balance += amount;
        } finally {
            second.lock.unlock();
            first.lock.unlock();
        }
    }

    public static void main(String[] args) throws InterruptedException {
        List<Account> accounts = new ArrayList<>();
        for (int i = 0; i < 5; i++) accounts.add(new Account(i, 1_000));
        ExecutorService pool = Executors.newFixedThreadPool(8);
        java.util.concurrent.atomic.AtomicInteger rejected = new java.util.concurrent.atomic.AtomicInteger();
        for (int t = 0; t < 10_000; t++) {
            int a = t % 5, b = (t * 7 + 3) % 5;
            if (a == b) continue;
            pool.submit(() -> {
                try {
                    transfer(accounts.get(a), accounts.get(b), 37);
                } catch (InsufficientFundsException e) {
                    rejected.incrementAndGet();
                }
            });
        }
        pool.shutdown();
        pool.awaitTermination(10, TimeUnit.SECONDS);
        long total = accounts.stream().mapToLong(acc -> acc.balance).sum();
        System.out.println("total preserved: " + (total == 5_000) + ", rejected transfers: " + rejected.get());
    }
}
