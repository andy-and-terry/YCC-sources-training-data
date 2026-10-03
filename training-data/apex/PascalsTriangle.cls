public class PascalsTriangle {
    public static List<List<Long>> generate(Integer rows) {
        List<List<Long>> triangle = new List<List<Long>>();
        for (Integer r = 0; r < rows; r++) {
            List<Long> row = new List<Long>();
            for (Integer c = 0; c <= r; c++) {
                if (c == 0 || c == r) {
                    row.add(1L);
                } else {
                    row.add(triangle[r - 1][c - 1] + triangle[r - 1][c]);
                }
            }
            triangle.add(row);
        }
        return triangle;
    }

    public static void main() {
        for (List<Long> row : generate(6)) {
            System.debug(row);
        }
    }
}
