import java.text.SimpleDateFormat;
import java.util.Date;

public class ThreadLocalDemo {
    // SimpleDateFormat is not thread-safe, so give each thread its own copy
    private static final ThreadLocal<SimpleDateFormat> FORMAT =
        ThreadLocal.withInitial(() -> new SimpleDateFormat("yyyy-MM-dd"));

    private static final ThreadLocal<Integer> COUNTER = ThreadLocal.withInitial(() -> 0);

    public static void main(String[] args) throws InterruptedException {
        Runnable r = () -> {
            for (int i = 0; i < 3; i++) {
                COUNTER.set(COUNTER.get() + 1);
            }
            String day = FORMAT.get().format(new Date(0L));
            System.out.println(Thread.currentThread().getName()
                + " counter=" + COUNTER.get() + " date=" + day.length());
            COUNTER.remove();
        };
        Thread a = new Thread(r, "worker-A");
        Thread b = new Thread(r, "worker-B");
        a.start();
        b.start();
        a.join();
        b.join();
    }
}
