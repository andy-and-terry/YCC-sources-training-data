public class DelannoyNumbers {
    static long[] centralDelannoy(int count) {
        long[][] grid = new long[count][count];
        for (int m = 0; m < count; m++) {
            for (int n = 0; n < count; n++) {
                if (m == 0 || n == 0) grid[m][n] = 1;
                else grid[m][n] = grid[m - 1][n] + grid[m][n - 1] + grid[m - 1][n - 1];
            }
        }
        long[] out = new long[count];
        for (int k = 0; k < count; k++) out[k] = grid[k][k];
        return out;
    }

    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder();
        for (long v : centralDelannoy(10)) sb.append(v).append(' ');
        System.out.println(sb.toString().trim());
    }
}
