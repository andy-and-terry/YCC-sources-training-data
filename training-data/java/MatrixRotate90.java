import java.util.Arrays;

public class MatrixRotate90 {
    static void rotateClockwise(int[][] m) {
        int n = m.length;
        for (int layer = 0; layer < n / 2; layer++) {
            int last = n - 1 - layer;
            for (int i = layer; i < last; i++) {
                int off = i - layer;
                int top = m[layer][i];
                m[layer][i] = m[last - off][layer];
                m[last - off][layer] = m[last][last - off];
                m[last][last - off] = m[i][last];
                m[i][last] = top;
            }
        }
    }

    public static void main(String[] args) {
        int[][] m = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};
        rotateClockwise(m);
        System.out.println(Arrays.deepToString(m));
    }
}
