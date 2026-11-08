public class ShoelaceArea {
    public static Decimal area(List<Decimal> xs, List<Decimal> ys) {
        Decimal s = 0;
        Integer n = xs.size();
        for (Integer i = 0; i < n; i++) {
            Integer j = Math.mod(i + 1, n);
            s += xs[i] * ys[j] - xs[j] * ys[i];
        }
        return Math.abs(s) / 2;
    }
}
