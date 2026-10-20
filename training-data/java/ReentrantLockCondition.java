import java.util.*;
import java.util.concurrent.locks.*;

public class ReentrantLockCondition {
    static final Lock lock = new ReentrantLock();
    static final Condition notEmpty = lock.newCondition();
    static final Deque<Integer> q = new ArrayDeque<>();

    public static void main(String[] args) throws Exception {
        Thread consumer = new Thread(() -> {
            lock.lock();
            try { while (q.isEmpty()) notEmpty.awaitUninterruptibly(); System.out.println("got " + q.poll()); }
            finally { lock.unlock(); }
        });
        consumer.start();
        lock.lock();
        try { q.add(42); notEmpty.signal(); } finally { lock.unlock(); }
        consumer.join();
    }
}
