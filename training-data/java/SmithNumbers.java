import java.util.StringJoiner;

public class SmithNumbers {
    static int digitSum(int n) {
        int s = 0;
        for (; n > 0; n /= 10) s += n % 10;
        return s;
    }

    static int factorDigitSum(int n) {
        int total = 0;
        for (int d = 2; n > 1; d++) {
            while (n % d == 0) {
                total += digitSum(d);
                n /= d;
            }
        }
        return total;
    }

    static boolean isPrime(int n) {
        for (int d = 2; d * d <= n; d++) if (n % d == 0) return false;
        return n > 1;
    }

    public static void main(String[] args) {
        StringJoiner out = new StringJoiner(" ");
        for (int n = 2; n < 100; n++) {
            if (!isPrime(n) && digitSum(n) == factorDigitSum(n)) out.add(Integer.toString(n));
        }
        System.out.println(out);
    }
}
