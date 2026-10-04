public class PascalTriangle {
    public static List<List<Integer>> build(Integer rows) {
        List<List<Integer>> tri = new List<List<Integer>>();
        for (Integer i = 0; i < rows; i++) {
            List<Integer> row = new List<Integer>();
            for (Integer j = 0; j <= i; j++) {
                if (j == 0 || j == i) {
                    row.add(1);
                } else {
                    row.add(tri[i - 1][j - 1] + tri[i - 1][j]);
                }
            }
            tri.add(row);
        }
        return tri;
    }

    public static void main() {
        for (List<Integer> row : build(6)) {
            System.debug(String.join(row, ' '));
        }
    }
}
