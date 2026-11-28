import java.util.concurrent.CompletableFuture;

public class CompletableFutureChain {
    public static void main(String[] args) {
        String out = CompletableFuture.supplyAsync(() -> 20)
            .thenApply(x -> x + 1)
            .thenCombine(CompletableFuture.supplyAsync(() -> 21), Integer::sum)
            .thenApply(n -> "result=" + n)
            .join();
        System.out.println(out);
    }
}
