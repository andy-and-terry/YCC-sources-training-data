public class DelannoyNumbers {
    static long centralDelannoy(int n) {
        long[][] g = new long[n + 1][n + 1];
        for (int i = 0; i <= n; i++)
            for (int j = 0; j <= n; j++)
                g[i][j] = (i == 0 || j == 0) ? 1 : g[i - 1][j] + g[i][j - 1] + g[i - 1][j - 1];
        return g[n][n];
    }

    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder();
        for (int n = 0; n <= 5; n++) sb.append(centralDelannoy(n)).append(' ');
        System.out.println(sb.toString().trim()); // 1 3 13 63 321 1683
    }
}
