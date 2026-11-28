public class LahNumbers {
    public static Long lah(Integer n, Integer k) {
        Long c = 1, f = 1;
        for (Integer i = 0; i < k - 1; i++) c = c * (n - 1 - i) / (i + 1);
        for (Integer i = k + 1; i <= n; i++) f *= i;
        return c * f;
    }

    public static void demo() {
        for (Integer n = 1; n <= 5; n++) {
            List<Long> row = new List<Long>();
            for (Integer k = 1; k <= n; k++) row.add(lah(n, k));
            System.debug(row);
        }
    }
}
