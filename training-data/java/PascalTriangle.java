import java.util.ArrayList;
import java.util.List;

public class PascalTriangle {
    public static List<List<Long>> generate(int rows) {
        List<List<Long>> tri = new ArrayList<>();
        for (int r = 0; r < rows; r++) {
            List<Long> row = new ArrayList<>();
            for (int i = 0; i <= r; i++) {
                row.add(i == 0 || i == r ? 1L : tri.get(r - 1).get(i - 1) + tri.get(r - 1).get(i));
            }
            tri.add(row);
        }
        return tri;
    }

    public static void main(String[] args) {
        List<List<Long>> t = generate(8);
        int width = rowString(t.get(t.size() - 1)).length();
        for (List<Long> row : t) {
            String s = rowString(row);
            System.out.println(" ".repeat((width - s.length()) / 2) + s);
        }
    }

    private static String rowString(List<Long> row) {
        return String.join(" ", row.stream().map(String::valueOf).toList());
    }
}
