import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

public class ThreadLocalDemo {
    // Each thread gets its own independent counter, seeded lazily by the
    // supplier the first time that thread touches it.
    private static final ThreadLocal<Integer> requestCount =
        ThreadLocal.withInitial(() -> 0);

    private static void handleRequest() {
        requestCount.set(requestCount.get() + 1);
        System.out.println(Thread.currentThread().getName() + " handled " + requestCount.get() + " request(s)");
    }

    public static void main(String[] args) throws InterruptedException {
        ExecutorService pool = Executors.newFixedThreadPool(2);
        for (int i = 0; i < 6; i++) {
            pool.submit(ThreadLocalDemo::handleRequest);
        }
        pool.shutdown();
        pool.awaitTermination(5, TimeUnit.SECONDS);
    }
}
