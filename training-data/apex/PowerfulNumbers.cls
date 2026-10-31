public class PowerfulNumbers {
    public static Boolean isPowerful(Integer n) {
        for (Integer p = 2; p * p <= n; p++) {
            if (Math.mod(n, p) == 0) {
                if (Math.mod(n, p * p) != 0) return false;
                while (Math.mod(n, p) == 0) {
                    n = n / p;
                }
            }
        }
        return n == 1;
    }

    public static void main() {
        List<Integer> found = new List<Integer>();
        for (Integer n = 1; n <= 100; n++) {
            if (isPowerful(n)) found.add(n);
        }
        System.debug(found);
    }
}
