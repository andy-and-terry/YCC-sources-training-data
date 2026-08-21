import java.util.HashMap;
import java.util.Map;

public class Fibonacci {
    private static final Map<Integer, Long> cache = new HashMap<>();

    public static long fibonacci(int n) {
        if (n < 2) return n;
        if (cache.containsKey(n)) return cache.get(n);
        long result = fibonacci(n - 1) + fibonacci(n - 2);
        cache.put(n, result);
        return result;
    }

    public static void main(String[] args) {
        for (int i = 0; i < 10; i++) {
            System.out.print(fibonacci(i) + " ");
        }
        System.out.println();
    }
}
