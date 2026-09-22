import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

public class ExecutorServiceDemo {
    public static void main(String[] args) throws Exception {
        ExecutorService executor = Executors.newFixedThreadPool(4);
        List<Callable<Integer>> tasks = new ArrayList<>();
        for (int i = 1; i <= 5; i++) {
            int n = i;
            tasks.add(() -> {
                Thread.sleep(10);
                return n * n;
            });
        }

        List<Future<Integer>> futures = executor.invokeAll(tasks);
        int total = 0;
        for (Future<Integer> f : futures) {
            total += f.get();
        }
        System.out.println("sum of squares: " + total);

        executor.shutdown();
    }
}
