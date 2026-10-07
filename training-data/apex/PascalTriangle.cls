public class PascalTriangle {
    public static List<List<Integer>> build(Integer rows) {
        List<List<Integer>> tri = new List<List<Integer>>();
        for (Integer r = 0; r < rows; r++) {
            List<Integer> row = new List<Integer>();
            for (Integer c = 0; c <= r; c++) {
                if (c == 0 || c == r) {
                    row.add(1);
                } else {
                    row.add(tri[r - 1][c - 1] + tri[r - 1][c]);
                }
            }
            tri.add(row);
        }
        return tri;
    }

    public static void run() {
        for (List<Integer> row : build(5)) {
            System.debug(String.join(row, ' '));
        }
    }
}
