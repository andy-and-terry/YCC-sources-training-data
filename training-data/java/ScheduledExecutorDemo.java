import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

public class ScheduledExecutorDemo {
    public static void main(String[] args) throws InterruptedException {
        ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);
        AtomicInteger ticks = new AtomicInteger(0);
        CountDownLatch done = new CountDownLatch(3);

        ScheduledFuture<?> heartbeat = scheduler.scheduleAtFixedRate(() -> {
            int tick = ticks.incrementAndGet();
            System.out.println("tick " + tick);
            done.countDown();
        }, 0, 10, TimeUnit.MILLISECONDS);

        done.await();
        heartbeat.cancel(true);

        scheduler.schedule(() -> System.out.println("delayed task ran"), 5, TimeUnit.MILLISECONDS);

        scheduler.shutdown();
        scheduler.awaitTermination(1, TimeUnit.SECONDS);
        System.out.println("ticks observed: " + (ticks.get() >= 3));
    }
}
