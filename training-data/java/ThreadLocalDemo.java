import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

public class ThreadLocalDemo {
    private static final ThreadLocal<SimpleDateFormat> FORMAT =
        ThreadLocal.withInitial(() -> new SimpleDateFormat("yyyy-MM-dd"));

    private static final ThreadLocal<Integer> COUNTER = ThreadLocal.withInitial(() -> 0);

    static String format(long millis) {
        return FORMAT.get().format(new Date(millis));
    }

    public static void main(String[] args) throws InterruptedException {
        ExecutorService pool = Executors.newFixedThreadPool(3);
        for (int i = 0; i < 6; i++) {
            final long ts = i * 86_400_000L;
            pool.submit(() -> {
                COUNTER.set(COUNTER.get() + 1);
                System.out.println(Thread.currentThread().getName() + " " + format(ts) + " n=" + COUNTER.get());
            });
        }
        pool.shutdown();
        pool.awaitTermination(5, TimeUnit.SECONDS);
    }
}
