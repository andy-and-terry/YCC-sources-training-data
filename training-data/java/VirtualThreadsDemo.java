import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.stream.Collectors;

public class VirtualThreadsDemo {
    static int slowTask(int id) {
        try {
            Thread.sleep(5);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
        return id * id;
    }

    public static void main(String[] args) throws Exception {
        try (ExecutorService executor = Executors.newVirtualThreadPerTaskExecutor()) {
            List<Future<Integer>> futures = List.of(1, 2, 3, 4, 5).stream()
                .map(id -> executor.submit(() -> slowTask(id)))
                .collect(Collectors.toList());

            int total = 0;
            for (Future<Integer> future : futures) {
                total += future.get();
            }
            System.out.println("total: " + total);

            Thread virtual = Thread.ofVirtual().start(() -> System.out.println("virtual: " + Thread.currentThread().isVirtual()));
            virtual.join();
        }
    }
}
