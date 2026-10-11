import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

public class ExecutorInvokeAllDemo {
    public static void main(String[] args) throws Exception {
        ExecutorService pool = Executors.newFixedThreadPool(3);
        try {
            List<Callable<Integer>> tasks = new ArrayList<>();
            for (int n = 1; n <= 5; n++) {
                final int k = n;
                tasks.add(() -> k * k);
            }
            int total = 0;
            for (Future<Integer> f : pool.invokeAll(tasks)) total += f.get();
            System.out.println("sum of squares = " + total);

            String first = pool.invokeAny(List.of(() -> "alpha", () -> "alpha"));
            System.out.println(first);
        } finally {
            pool.shutdown();
        }
    }
}
