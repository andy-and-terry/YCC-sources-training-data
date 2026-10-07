import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;

public class ExecutorServiceDemo {
    static int square(int n) {
        return n * n;
    }

    public static void main(String[] args) throws Exception {
        ExecutorService pool = Executors.newFixedThreadPool(4);

        List<Callable<Integer>> tasks = List.of(1, 2, 3, 4, 5).stream()
            .<Callable<Integer>>map(n -> () -> square(n))
            .toList();

        List<Future<Integer>> results = pool.invokeAll(tasks);
        int sum = 0;
        for (Future<Integer> result : results) {
            sum += result.get();
        }
        System.out.println("sum of squares: " + sum);

        Future<String> single = pool.submit(() -> "single task result");
        System.out.println(single.get());

        pool.shutdown();
        boolean terminated = pool.awaitTermination(5, TimeUnit.SECONDS);
        System.out.println("terminated cleanly: " + terminated);
    }
}
