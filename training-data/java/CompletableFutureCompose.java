import java.util.concurrent.CompletableFuture;

public class CompletableFutureCompose {
    public static void main(String[] args) {
        CompletableFuture<Integer> a = CompletableFuture.supplyAsync(() -> 6);
        CompletableFuture<Integer> b = CompletableFuture.supplyAsync(() -> 7);
        System.out.println(a.thenCombine(b, (x, y) -> x * y).thenApply(n -> "answer=" + n).join());
        System.out.println(CompletableFuture.<Integer>supplyAsync(() -> { throw new IllegalStateException("x"); })
            .exceptionally(e -> -1).join());
    }
}
