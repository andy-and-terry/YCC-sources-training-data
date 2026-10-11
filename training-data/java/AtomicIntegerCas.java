import java.util.concurrent.atomic.AtomicInteger;

public class AtomicIntegerCas {
    static int incrementIfBelow(AtomicInteger value, int limit) {
        while (true) {
            int cur = value.get();
            if (cur >= limit) return cur;
            if (value.compareAndSet(cur, cur + 1)) return cur + 1;
        }
    }

    public static void main(String[] args) throws InterruptedException {
        AtomicInteger counter = new AtomicInteger();
        Runnable r = () -> {
            for (int i = 0; i < 1000; i++) incrementIfBelow(counter, 3000);
        };
        Thread[] ts = new Thread[4];
        for (int i = 0; i < ts.length; i++) (ts[i] = new Thread(r)).start();
        for (Thread t : ts) t.join();
        System.out.println(counter.get());
        System.out.println(counter.updateAndGet(x -> x / 2));
        System.out.println(counter.accumulateAndGet(10, Math::max));
    }
}
