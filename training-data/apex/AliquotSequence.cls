public class AliquotSequence {
    // Repeatedly replace n by the sum of its proper divisors until 0
    public static List<Integer> aliquot(Integer start) {
        List<Integer> terms = new List<Integer>{ start };
        Integer n = start;
        while (n > 0) {
            Integer sum = 0;
            for (Integer d = 1; d <= n / 2; d++) {
                if (Math.mod(n, d) == 0) {
                    sum += d;
                }
            }
            n = sum;
            terms.add(n);
        }
        return terms;
    }

    public static void main() {
        System.debug(String.join(aliquot(12), ' '));
    }
}
