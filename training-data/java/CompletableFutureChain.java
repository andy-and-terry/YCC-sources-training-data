import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.stream.Collectors;

public class CompletableFutureChain {
    static CompletableFuture<Integer> fetchPrice(String item) {
        return CompletableFuture.supplyAsync(() -> item.length() * 10);
    }

    public static void main(String[] args) {
        List<String> items = List.of("apple", "kiwi", "banana");
        List<CompletableFuture<Integer>> futures = items.stream().map(CompletableFutureChain::fetchPrice).collect(Collectors.toList());
        int total = CompletableFuture.allOf(futures.toArray(new CompletableFuture[0]))
                .thenApply(v -> futures.stream().mapToInt(CompletableFuture::join).sum())
                .exceptionally(ex -> -1)
                .join();
        System.out.println("total = " + total);
    }
}
