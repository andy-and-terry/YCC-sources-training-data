import java.util.List;
import java.util.concurrent.atomic.AtomicReference;

public class AtomicReferenceDemo {
    record Stats(int count, int sum) {
        Stats add(int v) { return new Stats(count + 1, sum + v); }
    }

    public static void main(String[] args) throws InterruptedException {
        AtomicReference<Stats> stats = new AtomicReference<>(new Stats(0, 0));

        Runnable task = () -> {
            for (int i = 1; i <= 1000; i++) {
                final int v = i;
                // Lock-free update: retries on contention via compare-and-set
                stats.updateAndGet(s -> s.add(v));
            }
        };

        List<Thread> threads = List.of(new Thread(task), new Thread(task), new Thread(task));
        threads.forEach(Thread::start);
        for (Thread t : threads) t.join();

        System.out.println(stats.get());

        Stats old = stats.get();
        boolean swapped = stats.compareAndSet(old, new Stats(0, 0));
        System.out.println(swapped + " " + stats.get());
    }
}
