public class ShoelacePolygonArea {
    public static Decimal area(List<List<Integer>> pts) {
        Integer s = 0;
        Integer n = pts.size();
        for (Integer i = 0; i < n; i++) {
            List<Integer> a = pts[i];
            List<Integer> b = pts[Math.mod(i + 1, n)];
            s += a[0] * b[1] - b[0] * a[1];
        }
        return Decimal.valueOf(Math.abs(s)) / 2;
    }

    public static void demo() {
        System.debug(area(new List<List<Integer>>{ new List<Integer>{0, 0}, new List<Integer>{4, 0},
            new List<Integer>{4, 3}, new List<Integer>{0, 3} }));
    }
}
