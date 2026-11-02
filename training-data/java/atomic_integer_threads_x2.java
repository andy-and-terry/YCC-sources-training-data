import java.util.concurrent.atomic.AtomicInteger;

public class AtomicIntegerThreadsX2 {
    public static void main(String[] args) throws Exception {
        AtomicInteger n = new AtomicInteger();
        Thread[] ts = new Thread[4];
        for (int i = 0; i < 4; i++) { ts[i] = new Thread(() -> { for (int j = 0; j < 1000; j++) n.incrementAndGet(); }); ts[i].start(); }
        for (Thread t : ts) t.join();
        System.out.println(n.get());
    }
}
