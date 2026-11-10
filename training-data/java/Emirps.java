import java.util.ArrayList;
import java.util.List;

public class Emirps {
    static boolean isPrime(long n) {
        if (n < 2) return false;
        for (long i = 2; i * i <= n; i++) if (n % i == 0) return false;
        return true;
    }

    static long reverse(long n) {
        long r = 0;
        for (; n > 0; n /= 10) r = r * 10 + n % 10;
        return r;
    }

    public static void main(String[] args) {
        List<Long> out = new ArrayList<>();
        for (long n = 2; out.size() < 10; n++) {
            long r = reverse(n);
            if (r != n && isPrime(n) && isPrime(r)) out.add(n);
        }
        System.out.println(out); // [13, 17, 31, 37, 71, 73, 79, 97, 107, 113]
    }
}
