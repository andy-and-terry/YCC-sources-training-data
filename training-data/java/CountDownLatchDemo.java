import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CountDownLatch;

public class CountDownLatchDemo {
    static class Worker implements Runnable {
        private final int id;
        private final CountDownLatch startSignal;
        private final CountDownLatch doneSignal;

        Worker(int id, CountDownLatch startSignal, CountDownLatch doneSignal) {
            this.id = id;
            this.startSignal = startSignal;
            this.doneSignal = doneSignal;
        }

        @Override
        public void run() {
            try {
                startSignal.await();
                System.out.println("worker " + id + " running");
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            } finally {
                doneSignal.countDown();
            }
        }
    }

    public static void main(String[] args) throws InterruptedException {
        int workerCount = 4;
        CountDownLatch startSignal = new CountDownLatch(1);
        CountDownLatch doneSignal = new CountDownLatch(workerCount);
        List<Thread> threads = new ArrayList<>();

        for (int i = 0; i < workerCount; i++) {
            Thread thread = new Thread(new Worker(i, startSignal, doneSignal));
            threads.add(thread);
            thread.start();
        }

        System.out.println("releasing workers");
        startSignal.countDown();
        doneSignal.await();
        System.out.println("all workers finished");

        for (Thread thread : threads) thread.join();
    }
}
