public class PowerfulNumbers {
    static boolean isPowerful(int n) {
        for (int p = 2; p * p <= n; p++) {
            if (n % p == 0) {
                if (n % (p * p) != 0) return false;
                while (n % p == 0) n /= p;
            }
        }
        return n == 1;
    }

    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder();
        for (int n = 1; n <= 100; n++) if (isPowerful(n)) sb.append(n).append(' ');
        System.out.println(sb.toString().trim());
    }
}
