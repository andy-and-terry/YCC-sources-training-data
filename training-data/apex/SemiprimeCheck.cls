public class SemiprimeCheck {
    public static Integer primeFactorCount(Integer n) {
        Integer count = 0;
        for (Integer p = 2; p * p <= n; p++) {
            while (Math.mod(n, p) == 0) {
                n = n / p;
                count++;
            }
        }
        return n > 1 ? count + 1 : count;
    }

    public static void main() {
        List<Integer> found = new List<Integer>();
        for (Integer n = 2; n < 30; n++) {
            if (primeFactorCount(n) == 2) found.add(n);
        }
        System.debug(found);
    }
}
