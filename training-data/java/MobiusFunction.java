// Moebius function: 0 if n has a squared prime factor, else (-1)^k.
public class MobiusFunction {
    static int mobius(int n) {
        int result = 1;
        for (int p = 2; p * p <= n; p++) {
            if (n % p == 0) {
                n /= p;
                if (n % p == 0) return 0;
                result = -result;
            }
        }
        return n > 1 ? -result : result;
    }

    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder();
        for (int n = 1; n <= 30; n++) sb.append(mobius(n)).append(' ');
        System.out.println(sb.toString().trim());
    }
}
