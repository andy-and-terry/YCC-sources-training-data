import java.util.concurrent.CompletableFuture;

public class CompletableFutureChain {
    public static void main(String[] args) {
        String r = CompletableFuture.supplyAsync(() -> 21)
            .thenApply(x -> x * 2)
            .thenCombine(CompletableFuture.supplyAsync(() -> "!"), (n, s) -> n + s)
            .join();
        System.out.println(r);
    }
}
