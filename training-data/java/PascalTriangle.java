import java.util.ArrayList;
import java.util.List;

public class PascalTriangle {
    public static List<List<Integer>> generate(int n) {
        List<List<Integer>> rows = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            List<Integer> row = new ArrayList<>();
            for (int j = 0; j <= i; j++) {
                if (j == 0 || j == i) row.add(1);
                else row.add(rows.get(i - 1).get(j - 1) + rows.get(i - 1).get(j));
            }
            rows.add(row);
        }
        return rows;
    }

    public static void main(String[] args) {
        generate(6).forEach(System.out::println);
    }
}
