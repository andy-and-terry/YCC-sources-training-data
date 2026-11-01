public class RuthAaronPairs {
    // Sum of prime factors counted with multiplicity.
    public static Integer sopfr(Integer n) {
        Integer total = 0;
        for (Integer p = 2; p * p <= n; p++) {
            while (Math.mod(n, p) == 0) {
                total += p;
                n = n / p;
            }
        }
        return n > 1 ? total + n : total;
    }

    public static String lowerMembers() {
        List<String> out = new List<String>();
        for (Integer n = 2; n < 110; n++) {
            if (sopfr(n) == sopfr(n + 1)) out.add(String.valueOf(n));
        }
        return String.join(out, ' ');
    }
}
