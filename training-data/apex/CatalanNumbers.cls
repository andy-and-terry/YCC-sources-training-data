public class CatalanNumbers {
    public static List<Long> generate(Integer n) {
        List<Long> catalan = new List<Long>();
        for (Integer i = 0; i <= n; i++) {
            catalan.add(0L);
        }
        catalan[0] = 1L;
        for (Integer i = 1; i <= n; i++) {
            Long total = 0L;
            for (Integer j = 0; j < i; j++) {
                total += catalan[j] * catalan[i - 1 - j];
            }
            catalan[i] = total;
        }
        return catalan;
    }

    public static void main() {
        System.debug(generate(10));
    }
}
