import java.util.concurrent.CountDownLatch;

public class ThreadLocalDemo {
    private static final ThreadLocal<Integer> counter = ThreadLocal.withInitial(() -> 0);

    static int incrementAndGet() {
        int next = counter.get() + 1;
        counter.set(next);
        return next;
    }

    public static void main(String[] args) throws InterruptedException {
        int threadCount = 4;
        CountDownLatch latch = new CountDownLatch(threadCount);

        for (int t = 0; t < threadCount; t++) {
            final int threadId = t;
            new Thread(() -> {
                for (int i = 0; i < 3; i++) {
                    System.out.println("thread " + threadId + " -> " + incrementAndGet());
                }
                latch.countDown();
            }).start();
        }

        latch.await();
        System.out.println("main thread counter (never touched): " + counter.get());
    }
}
