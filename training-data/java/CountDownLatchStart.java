import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicInteger;

public class CountDownLatchStart {
    public static void main(String[] args) throws Exception {
        CountDownLatch go = new CountDownLatch(1), done = new CountDownLatch(3);
        AtomicInteger n = new AtomicInteger();
        for (int i = 0; i < 3; i++) new Thread(() -> {
            try { go.await(); n.incrementAndGet(); } catch (InterruptedException e) { }
            done.countDown();
        }).start();
        go.countDown();
        done.await();
        System.out.println(n.get());
    }
}
