import java.util.concurrent.*;
import java.util.stream.IntStream;

public class VirtualThreadsExecutor {
    public static void main(String[] args) throws Exception {
        try (ExecutorService ex = Executors.newVirtualThreadPerTaskExecutor()) {
            var fs = IntStream.range(0, 5).mapToObj(i -> ex.submit(() -> i * i)).toList();
            int s = 0;
            for (var f : fs) s += f.get();
            System.out.println(s);
        }
    }
}
