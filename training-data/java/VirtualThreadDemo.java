import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

public class VirtualThreadDemo {
    // Java 21's virtual threads are cheap enough to spawn one per task
    // instead of pooling a handful of platform threads, which is a natural
    // fit for short, blocking, I/O-bound work like this simulated fetch.
    static int simulatedFetch(int id) throws InterruptedException {
        Thread.sleep(20);
        return id * id;
    }

    public static void main(String[] args) throws InterruptedException, ExecutionException {
        try (ExecutorService executor = Executors.newVirtualThreadPerTaskExecutor()) {
            List<Callable<Integer>> tasks = List.of(
                () -> simulatedFetch(1),
                () -> simulatedFetch(2),
                () -> simulatedFetch(3),
                () -> simulatedFetch(4),
                () -> simulatedFetch(5)
            );

            List<Future<Integer>> futures = executor.invokeAll(tasks);
            int total = 0;
            for (Future<Integer> future : futures) {
                total += future.get();
            }
            System.out.println("total: " + total);

            Future<Boolean> onVirtualThread = executor.submit(() -> Thread.currentThread().isVirtual());
            System.out.println("task ran on virtual thread: " + onVirtualThread.get());
        }
    }
}
