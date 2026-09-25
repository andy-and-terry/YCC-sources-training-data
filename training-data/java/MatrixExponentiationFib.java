public class MatrixExponentiationFib {
    static final long MOD = 1_000_000_007L;

    static long[][] multiply(long[][] a, long[][] b) {
        int n = a.length;
        long[][] c = new long[n][n];
        for (int i = 0; i < n; i++)
            for (int k = 0; k < n; k++)
                for (int j = 0; j < n; j++) c[i][j] = (c[i][j] + a[i][k] * b[k][j]) % MOD;
        return c;
    }

    static long[][] power(long[][] m, long e) {
        int n = m.length;
        long[][] r = new long[n][n];
        for (int i = 0; i < n; i++) r[i][i] = 1;
        for (; e > 0; e >>= 1) {
            if ((e & 1) == 1) r = multiply(r, m);
            m = multiply(m, m);
        }
        return r;
    }

    public static long fib(long n) {
        return power(new long[][] {{1, 1}, {1, 0}}, n)[0][1];
    }

    /** Tribonacci via a 3x3 companion matrix: T(n) = T(n-1) + T(n-2) + T(n-3). */
    public static long tribonacci(long n) {
        if (n < 2) return 0;
        return power(new long[][] {{1, 1, 1}, {1, 0, 0}, {0, 1, 0}}, n - 2)[0][0];
    }

    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 15; i++) sb.append(fib(i)).append(' ');
        System.out.println(sb.toString().trim());
        System.out.println("fib(1e18) mod p = " + fib(1_000_000_000_000_000_000L));
        System.out.println("tribonacci(2..10): " + tribonacci(2) + " " + tribonacci(5) + " " + tribonacci(10));
    }
}
