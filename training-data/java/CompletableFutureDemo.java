import java.util.List;
import java.util.concurrent.CompletableFuture;

public class CompletableFutureDemo {
    static int slowSquare(int n) {
        try {
            Thread.sleep(10);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
        return n * n;
    }

    public static void main(String[] args) throws Exception {
        CompletableFuture<Integer> future = CompletableFuture
            .supplyAsync(() -> slowSquare(5))
            .thenApply(n -> n + 1)
            .thenApply(n -> n * 2);
        System.out.println(future.get());

        List<CompletableFuture<Integer>> futures = List.of(
            CompletableFuture.supplyAsync(() -> slowSquare(2)),
            CompletableFuture.supplyAsync(() -> slowSquare(3)),
            CompletableFuture.supplyAsync(() -> slowSquare(4))
        );
        CompletableFuture<Void> all = CompletableFuture.allOf(futures.toArray(new CompletableFuture[0]));
        all.get();
        int total = futures.stream().mapToInt(CompletableFuture::join).sum();
        System.out.println(total);

        CompletableFuture<Integer> failing = CompletableFuture
            .<Integer>supplyAsync(() -> {
                throw new RuntimeException("boom");
            })
            .exceptionally(ex -> -1);
        System.out.println(failing.get());
    }
}
