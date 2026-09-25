import java.util.ArrayList;
import java.util.List;

public class SaddlePoints {
    record Point(int row, int col) {}

    static List<Point> find(int[][] m) {
        List<Point> out = new ArrayList<>();
        if (m.length == 0) return out;
        int[] colMin = m[0].clone();
        for (int[] row : m) for (int c = 0; c < row.length; c++) colMin[c] = Math.min(colMin[c], row[c]);
        for (int r = 0; r < m.length; r++) {
            int rowMax = Integer.MIN_VALUE;
            for (int v : m[r]) rowMax = Math.max(rowMax, v);
            for (int c = 0; c < m[r].length; c++) {
                if (m[r][c] == rowMax && m[r][c] == colMin[c]) out.add(new Point(r, c));
            }
        }
        return out;
    }

    public static void main(String[] args) {
        System.out.println(find(new int[][] {{9, 8, 7}, {5, 3, 2}, {6, 6, 7}}));
    }
}
