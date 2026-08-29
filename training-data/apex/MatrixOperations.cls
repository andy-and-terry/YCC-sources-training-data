public class MatrixOperations {
    public static List<List<Integer>> multiply(List<List<Integer>> a, List<List<Integer>> b) {
        Integer n = a.size();
        Integer m = b[0].size();
        Integer k = b.size();
        List<List<Integer>> result = new List<List<Integer>>();
        for (Integer i = 0; i < n; i++) {
            List<Integer> row = new List<Integer>();
            for (Integer j = 0; j < m; j++) {
                Integer sum = 0;
                for (Integer x = 0; x < k; x++) {
                    sum += a[i][x] * b[x][j];
                }
                row.add(sum);
            }
            result.add(row);
        }
        return result;
    }

    public static void main() {
        List<List<Integer>> a = new List<List<Integer>>{
            new List<Integer>{1, 2}, new List<Integer>{3, 4}
        };
        List<List<Integer>> b = new List<List<Integer>>{
            new List<Integer>{5, 6}, new List<Integer>{7, 8}
        };
        System.debug(multiply(a, b));
    }
}
