import java.util.*;
import java.util.concurrent.locks.*;

public class ReentrantLockConditionBuffer {
    private final Deque<Integer> q = new ArrayDeque<>();
    private final ReentrantLock lock = new ReentrantLock();
    private final Condition notEmpty = lock.newCondition();

    void put(int x) {
        lock.lock();
        try { q.add(x); notEmpty.signal(); } finally { lock.unlock(); }
    }

    int take() throws InterruptedException {
        lock.lock();
        try {
            while (q.isEmpty()) notEmpty.await();
            return q.poll();
        } finally { lock.unlock(); }
    }

    public static void main(String[] args) throws Exception {
        var b = new ReentrantLockConditionBuffer();
        new Thread(() -> b.put(42)).start();
        System.out.println(b.take());
    }
}
