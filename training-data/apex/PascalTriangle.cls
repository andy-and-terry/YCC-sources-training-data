public class PascalTriangle {
    public static List<List<Integer>> generate(Integer rows) {
        List<List<Integer>> triangle = new List<List<Integer>>();
        for (Integer i = 0; i < rows; i++) {
            List<Integer> row = new List<Integer>();
            for (Integer j = 0; j <= i; j++) {
                if (j == 0 || j == i) {
                    row.add(1);
                } else {
                    List<Integer> prev = triangle.get(i - 1);
                    row.add(prev.get(j - 1) + prev.get(j));
                }
            }
            triangle.add(row);
        }
        return triangle;
    }

    public static void main() {
        for (List<Integer> row : generate(6)) {
            System.debug(String.join(row, ' '));
        }
    }
}
