public class FareySequence {
    // Farey sequence F_n: reduced fractions in [0,1] with denominator <= n
    public static List<String> farey(Integer n) {
        List<String> terms = new List<String>();
        Integer a = 0, b = 1, c = 1, d = n;
        terms.add(a + '/' + b);
        while (c <= n) {
            Integer k = Integer.valueOf(Math.floor((n + b) / (Double) d));
            Integer e = k * c - a;
            Integer f = k * d - b;
            a = c; b = d; c = e; d = f;
            terms.add(a + '/' + b);
        }
        return terms;
    }

    public static void main() {
        System.debug(String.join(farey(5), ' '));
    }
}
