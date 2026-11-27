import java.math.BigInteger;

public class LahNumbers {
    static BigInteger fact(int n) {
        BigInteger r = BigInteger.ONE;
        for (int i = 2; i <= n; i++) r = r.multiply(BigInteger.valueOf(i));
        return r;
    }

    static BigInteger comb(int n, int k) {
        return fact(n).divide(fact(k).multiply(fact(n - k)));
    }

    static BigInteger lah(int n, int k) {
        return comb(n - 1, k - 1).multiply(fact(n)).divide(fact(k));
    }

    public static void main(String[] args) {
        for (int n = 1; n <= 5; n++) {
            StringBuilder sb = new StringBuilder();
            for (int k = 1; k <= n; k++) sb.append(lah(n, k)).append(' ');
            System.out.println(sb);
        }
    }
}
