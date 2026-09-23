import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.BrokenBarrierException;
import java.util.concurrent.CyclicBarrier;
import java.util.concurrent.atomic.AtomicInteger;

public class CyclicBarrierDemo {
    public static void main(String[] args) throws InterruptedException {
        int runnerCount = 4;
        AtomicInteger round = new AtomicInteger(0);
        CyclicBarrier barrier = new CyclicBarrier(runnerCount,
            () -> System.out.println("round " + round.incrementAndGet() + " complete"));

        List<Thread> runners = new ArrayList<>();
        for (int i = 0; i < runnerCount; i++) {
            int id = i;
            Thread runner = new Thread(() -> {
                try {
                    for (int lap = 0; lap < 3; lap++) {
                        Thread.sleep((id + 1) * 2L);
                        System.out.println("runner " + id + " finished lap " + lap);
                        barrier.await();
                    }
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                } catch (BrokenBarrierException e) {
                    throw new IllegalStateException(e);
                }
            });
            runners.add(runner);
            runner.start();
        }

        for (Thread runner : runners) runner.join();
        System.out.println("all runners done");
    }
}
