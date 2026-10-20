import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

public class ReentrantLockCondition {
    private final ReentrantLock lock = new ReentrantLock();
    private final Condition ready = lock.newCondition();
    private boolean flag = false;

    void await() throws InterruptedException {
        lock.lock();
        try {
            while (!flag) ready.await();
        } finally {
            lock.unlock();
        }
    }

    void signal() {
        lock.lock();
        try {
            flag = true;
            ready.signalAll();
        } finally {
            lock.unlock();
        }
    }

    public static void main(String[] args) throws Exception {
        ReentrantLockCondition c = new ReentrantLockCondition();
        Thread t = new Thread(() -> { try { c.await(); System.out.println("released"); } catch (InterruptedException e) { } });
        t.start();
        c.signal();
        t.join();
    }
}
