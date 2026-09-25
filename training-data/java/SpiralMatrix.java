import java.util.Arrays;

public class SpiralMatrix {
    static int[][] spiral(int n) {
        int[][] g = new int[n][n];
        int top = 0, left = 0, bottom = n - 1, right = n - 1, k = 1;
        while (top <= bottom && left <= right) {
            for (int c = left; c <= right; c++) g[top][c] = k++;
            top++;
            for (int r = top; r <= bottom; r++) g[r][right] = k++;
            right--;
            if (top <= bottom) {
                for (int c = right; c >= left; c--) g[bottom][c] = k++;
                bottom--;
            }
            if (left <= right) {
                for (int r = bottom; r >= top; r--) g[r][left] = k++;
                left++;
            }
        }
        return g;
    }

    public static void main(String[] args) {
        for (int[] row : spiral(4)) System.out.println(Arrays.toString(row));
    }
}
