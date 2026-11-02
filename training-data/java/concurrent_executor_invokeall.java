import java.util.*;
import java.util.concurrent.*;

public class ConcurrentExecutorInvokeAll {
    public static void main(String[] args) throws Exception {
        ExecutorService ex = Executors.newFixedThreadPool(3);
        List<Callable<Integer>> tasks = new ArrayList<>();
        for (int i = 1; i <= 4; i++) { final int n = i; tasks.add(() -> n * n); }
        int total = 0;
        for (Future<Integer> f : ex.invokeAll(tasks)) total += f.get();
        ex.shutdown();
        System.out.println(total);
    }
}
