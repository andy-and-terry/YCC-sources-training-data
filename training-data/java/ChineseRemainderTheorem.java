public class ChineseRemainderTheorem {
    private static long[] extGCD(long a, long b) {
        if (b == 0) return new long[] {a, 1, 0};
        long[] r = extGCD(b, a % b);
        return new long[] {r[0], r[2], r[1] - (a / b) * r[2]};
    }

    // Solves x = remainders[i] (mod moduli[i]) for all i, assuming the
    // moduli are pairwise coprime.
    public static long crt(long[] remainders, long[] moduli) {
        long prod = 1;
        for (long m : moduli) prod *= m;

        long result = 0;
        for (int i = 0; i < moduli.length; i++) {
            long partial = prod / moduli[i];
            long inv = extGCD(partial, moduli[i])[1];
            result += remainders[i] * partial * inv;
        }
        result %= prod;
        if (result < 0) result += prod;
        return result;
    }

    public static void main(String[] args) {
        long[] remainders = {2, 3, 2};
        long[] moduli = {3, 5, 7};
        System.out.println("x = " + crt(remainders, moduli));
    }
}
