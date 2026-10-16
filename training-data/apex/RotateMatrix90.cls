public class RotateMatrix90 {
    public static List<List<Integer>> rotate(List<List<Integer>> m) {
        Integer n = m.size();
        List<List<Integer>> r = new List<List<Integer>>();
        for (Integer i = 0; i < n; i++) {
            List<Integer> row = new List<Integer>();
            for (Integer j = n - 1; j >= 0; j--) {
                row.add(m[j][i]);
            }
            r.add(row);
        }
        return r;
    }

    public static void main() {
        System.debug(rotate(new List<List<Integer>>{
            new List<Integer>{ 1, 2 },
            new List<Integer>{ 3, 4 }
        }));
    }
}
