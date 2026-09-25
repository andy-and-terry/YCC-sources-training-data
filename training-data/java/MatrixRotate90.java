import java.util.Arrays;

public class MatrixRotate90 {
    /** Rotates a square matrix clockwise in place, layer by layer. */
    public static void rotate(int[][] m) {
        int n = m.length;
        for (int layer = 0; layer < n / 2; layer++) {
            int first = layer, last = n - 1 - layer;
            for (int i = first; i < last; i++) {
                int offset = i - first;
                int top = m[first][i];
                m[first][i] = m[last - offset][first];
                m[last - offset][first] = m[last][last - offset];
                m[last][last - offset] = m[i][last];
                m[i][last] = top;
            }
        }
    }

    public static void main(String[] args) {
        int[][] m = {{1, 2, 3, 4}, {5, 6, 7, 8}, {9, 10, 11, 12}, {13, 14, 15, 16}};
        rotate(m);
        for (int[] row : m) System.out.println(Arrays.toString(row));
    }
}
