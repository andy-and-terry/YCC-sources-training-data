import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

public class ThreadLocalDemo {
    private static final ThreadLocal<SimpleDateFormat> FORMAT =
        ThreadLocal.withInitial(() -> new SimpleDateFormat("yyyy-MM-dd"));

    private static final ThreadLocal<Integer> CALLS = ThreadLocal.withInitial(() -> 0);

    static String format(long millis) {
        CALLS.set(CALLS.get() + 1);
        return FORMAT.get().format(new Date(millis));
    }

    public static void main(String[] args) throws InterruptedException {
        ExecutorService pool = Executors.newFixedThreadPool(2);
        for (int t = 0; t < 2; t++) {
            final int id = t;
            pool.submit(() -> {
                for (int i = 0; i < 3 + id; i++) {
                    format(0L);
                }
                System.out.println("task " + id + " calls=" + CALLS.get());
                CALLS.remove();
            });
        }
        pool.shutdown();
        pool.awaitTermination(5, TimeUnit.SECONDS);
        System.out.println("main calls=" + CALLS.get());
    }
}
