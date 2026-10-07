import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.LongAdder;

public class LongAdderDemo {
    public static void main(String[] args) throws InterruptedException {
        // LongAdder spreads contention across internal cells, favoring
        // high-throughput increments over immediate readability, unlike
        // AtomicLong which serializes every increment on one CAS field.
        LongAdder hits = new LongAdder();

        ExecutorService pool = Executors.newFixedThreadPool(8);
        for (int i = 0; i < 8; i++) {
            pool.submit(() -> {
                for (int j = 0; j < 10_000; j++) hits.increment();
            });
        }
        pool.shutdown();
        pool.awaitTermination(5, TimeUnit.SECONDS);

        System.out.println("total hits: " + hits.sum());
    }
}
