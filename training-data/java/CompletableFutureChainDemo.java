import java.util.concurrent.CompletableFuture;

public class CompletableFutureChainDemo {
    public static void main(String[] args) {
        String r = CompletableFuture.supplyAsync(() -> 21)
                .thenApply(x -> x * 2)
                .thenCombine(CompletableFuture.supplyAsync(() -> 8), Integer::sum)
                .thenApply(x -> "result=" + x)
                .join();
        System.out.println(r);
    }
}
