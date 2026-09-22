import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;

public class VirtualThreadsDemo {
    public static void main(String[] args) throws Exception {
        AtomicInteger completed = new AtomicInteger(0);

        try (ExecutorService executor = Executors.newVirtualThreadPerTaskExecutor()) {
            Future<Boolean> virtualCheck = executor.submit(() -> Thread.currentThread().isVirtual());

            List<Future<Integer>> futures = List.of(1, 2, 3, 4, 5).stream()
                .map(n -> executor.submit(() -> {
                    Thread.sleep(10);
                    completed.incrementAndGet();
                    return n * n;
                }))
                .collect(Collectors.toList());

            List<Integer> squares = futures.stream()
                .map(f -> {
                    try {
                        return f.get();
                    } catch (Exception e) {
                        throw new RuntimeException(e);
                    }
                })
                .collect(Collectors.toList());

            System.out.println(squares);
            System.out.println("tasks completed: " + completed.get());
            System.out.println("virtual: " + virtualCheck.get());
        }
    }
}
