public class PascalTriangle {
    public static List<List<Integer>> generate(Integer rows) {
        List<List<Integer>> result = new List<List<Integer>>();
        for (Integer i = 0; i < rows; i++) {
            List<Integer> row = new List<Integer>();
            for (Integer j = 0; j <= i; j++) {
                if (j == 0 || j == i) {
                    row.add(1);
                } else {
                    row.add(result[i - 1][j - 1] + result[i - 1][j]);
                }
            }
            result.add(row);
        }
        return result;
    }

    public static void main() {
        for (List<Integer> row : generate(6)) {
            System.debug(String.join(row, ' '));
        }
    }
}
