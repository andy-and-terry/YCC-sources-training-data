import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Semaphore;
import java.util.concurrent.atomic.AtomicInteger;

public class SemaphoreDemo {
    static class ConnectionPool {
        private final Semaphore permits;
        private final AtomicInteger active = new AtomicInteger(0);
        private final AtomicInteger peak = new AtomicInteger(0);

        ConnectionPool(int maxConnections) {
            permits = new Semaphore(maxConnections);
        }

        void useConnection(int id) throws InterruptedException {
            permits.acquire();
            try {
                int current = active.incrementAndGet();
                peak.updateAndGet(p -> Math.max(p, current));
                Thread.sleep(5);
            } finally {
                active.decrementAndGet();
                permits.release();
            }
        }
    }

    public static void main(String[] args) throws InterruptedException {
        ConnectionPool pool = new ConnectionPool(3);
        List<Thread> threads = new ArrayList<>();

        for (int i = 0; i < 10; i++) {
            int id = i;
            Thread thread = new Thread(() -> {
                try {
                    pool.useConnection(id);
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                }
            });
            threads.add(thread);
            thread.start();
        }

        for (Thread thread : threads) thread.join();
        System.out.println("peak concurrent connections: " + pool.peak.get());
        System.out.println("peak within limit: " + (pool.peak.get() <= 3));
    }
}
