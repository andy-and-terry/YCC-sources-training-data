import java.util.Arrays;

public class SetMatrixZeroes {
    /** O(1) extra space: uses the first row and column as markers. */
    public static void setZeroes(int[][] m) {
        int rows = m.length, cols = m[0].length;
        boolean firstRow = false, firstCol = false;
        for (int c = 0; c < cols; c++) if (m[0][c] == 0) firstRow = true;
        for (int[] row : m) if (row[0] == 0) firstCol = true;
        for (int r = 1; r < rows; r++)
            for (int c = 1; c < cols; c++)
                if (m[r][c] == 0) m[r][0] = m[0][c] = 0;
        for (int r = 1; r < rows; r++)
            for (int c = 1; c < cols; c++)
                if (m[r][0] == 0 || m[0][c] == 0) m[r][c] = 0;
        if (firstRow) Arrays.fill(m[0], 0);
        if (firstCol) for (int[] row : m) row[0] = 0;
    }

    public static void main(String[] args) {
        int[][] m = {{0, 1, 2, 0}, {3, 4, 5, 2}, {1, 3, 1, 5}};
        setZeroes(m);
        for (int[] row : m) System.out.println(Arrays.toString(row));
    }
}
