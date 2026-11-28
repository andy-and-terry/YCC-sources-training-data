public class EmirpNumbers {
    static boolean isPrime(int n) {
        if (n < 2) return false;
        for (int i = 2; i * i <= n; i++) if (n % i == 0) return false;
        return true;
    }

    static int reverse(int n) {
        return Integer.parseInt(new StringBuilder(Integer.toString(n)).reverse().toString());
    }

    public static void main(String[] args) {
        for (int p = 2; p < 200; p++) {
            int r = reverse(p);
            if (r != p && isPrime(p) && isPrime(r)) System.out.print(p + " ");
        }
        System.out.println(); // 13 17 31 37 71 73 79 97 107 113 149 157 167 179 199
    }
}
