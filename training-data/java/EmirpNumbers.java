// Emirps: primes whose digit reversal is a different prime.
import java.util.stream.IntStream;

public class EmirpNumbers {
    static boolean isPrime(int n) {
        return n >= 2 && IntStream.rangeClosed(2, (int) Math.sqrt(n)).noneMatch(i -> n % i == 0);
    }

    public static void main(String[] args) {
        IntStream.range(2, 100)
            .filter(n -> {
                int r = Integer.parseInt(new StringBuilder(String.valueOf(n)).reverse().toString());
                return r != n && isPrime(n) && isPrime(r);
            })
            .forEach(n -> System.out.print(n + " "));
        System.out.println();
    }
}
