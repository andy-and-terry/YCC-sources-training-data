public class DelannoyNumbers {
    public static List<Long> central(Integer n) {
        List<List<Long>> d = new List<List<Long>>();
        for (Integer i = 0; i <= n; i++) {
            List<Long> row = new List<Long>();
            for (Integer j = 0; j <= n; j++) row.add(1L);
            d.add(row);
        }
        for (Integer i = 1; i <= n; i++) {
            for (Integer j = 1; j <= n; j++) {
                d[i][j] = d[i - 1][j] + d[i][j - 1] + d[i - 1][j - 1];
            }
        }
        List<Long> out = new List<Long>();
        for (Integer i = 0; i <= n; i++) out.add(d[i][i]);
        return out;
    }
}
