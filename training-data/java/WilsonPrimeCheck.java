import java.util.stream.IntStream;

// Wilson's theorem primality test.
public class WilsonPrimeCheck {
    static boolean wilson(int n) {
        if (n < 2) return false;
        long f = 1;
        for (int i = 2; i < n; i++) f = f * i % n;
        return f == n - 1;
    }

    public static void main(String[] args) {
        System.out.println(IntStream.range(2, 20).filter(WilsonPrimeCheck::wilson).boxed().toList());
    }
}
