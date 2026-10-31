public class SemiprimeCheck {
    static int primeFactorCount(int n) {
        int count = 0;
        for (int p = 2; p * p <= n; p++) {
            while (n % p == 0) {
                n /= p;
                count++;
            }
        }
        return count + (n > 1 ? 1 : 0);
    }

    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder();
        for (int n = 2; n < 30; n++) if (primeFactorCount(n) == 2) sb.append(n).append(' ');
        System.out.println(sb.toString().trim());
    }
}
