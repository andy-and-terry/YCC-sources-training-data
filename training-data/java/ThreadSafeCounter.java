import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;

public class ThreadSafeCounter {
    private final AtomicLong count = new AtomicLong(0);

    public void increment() {
        count.incrementAndGet();
    }

    public long get() {
        return count.get();
    }

    public static void main(String[] args) throws InterruptedException {
        ThreadSafeCounter counter = new ThreadSafeCounter();
        List<Thread> threads = new ArrayList<>();

        for (int i = 0; i < 10; i++) {
            Thread thread = new Thread(() -> {
                for (int j = 0; j < 1000; j++) counter.increment();
            });
            threads.add(thread);
            thread.start();
        }

        for (Thread thread : threads) thread.join();

        System.out.println("Final count: " + counter.get());
    }
}
