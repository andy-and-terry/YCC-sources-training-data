public class FactorionCheck {
    private static final List<Integer> FACT = new List<Integer>{
        1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880
    };

    public static Boolean isFactorion(Integer n) {
        Integer sum = 0;
        for (Integer m = n; m > 0; m = m / 10) {
            sum += FACT[Math.mod(m, 10)];
        }
        return sum == n;
    }

    public static void main() {
        List<Integer> found = new List<Integer>();
        for (Integer n = 1; n < 50000; n++) {
            if (isFactorion(n)) found.add(n);
        }
        System.debug(found);
    }
}
