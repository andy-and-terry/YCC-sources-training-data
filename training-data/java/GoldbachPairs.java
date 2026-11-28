import java.util.stream.IntStream;

public class GoldbachPairs {
    static boolean isPrime(int n) {
        return n > 1 && IntStream.rangeClosed(2, (int) Math.sqrt(n)).noneMatch(d -> n % d == 0);
    }

    public static void main(String[] args) {
        int n = 28;
        IntStream.rangeClosed(2, n / 2)
                .filter(p -> isPrime(p) && isPrime(n - p))
                .forEach(p -> System.out.println(p + " + " + (n - p)));
    }
}
