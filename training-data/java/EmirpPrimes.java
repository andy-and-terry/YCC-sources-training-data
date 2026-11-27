import java.util.stream.IntStream;

public class EmirpPrimes {
    static boolean isPrime(int n) {
        return n >= 2 && IntStream.rangeClosed(2, (int) Math.sqrt(n)).noneMatch(i -> n % i == 0);
    }

    static int reverse(int n) {
        return Integer.parseInt(new StringBuilder(Integer.toString(n)).reverse().toString());
    }

    public static void main(String[] args) {
        IntStream.range(2, 100)
            .filter(p -> isPrime(p) && reverse(p) != p && isPrime(reverse(p)))
            .forEach(p -> System.out.print(p + " "));
        System.out.println();
    }
}
