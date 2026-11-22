// Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
public class LahNumbers {
    static long fact(int n) { return n <= 1 ? 1 : n * fact(n - 1); }
    static long comb(int n, int k) { return fact(n) / (fact(k) * fact(n - k)); }

    public static void main(String[] args) {
        int n = 5;
        StringBuilder sb = new StringBuilder();
        for (int k = 1; k <= n; k++) sb.append(comb(n - 1, k - 1) * fact(n) / fact(k)).append(' ');
        System.out.println(sb.toString().trim());
    }
}
