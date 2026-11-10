public class SuperperfectNumbers {
    static int sigma(int n) {
        int s = 0;
        for (int d = 1; d <= n; d++) if (n % d == 0) s += d;
        return s;
    }

    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder();
        for (int n = 1; n < 100; n++) if (sigma(sigma(n)) == 2 * n) sb.append(n).append(' ');
        System.out.println(sb.toString().trim()); // 2 4 16 64
    }
}
