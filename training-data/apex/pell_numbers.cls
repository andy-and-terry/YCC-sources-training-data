public class PellNumbers {
    // P(n) = 2*P(n-1) + P(n-2), with P(0) = 0 and P(1) = 1
    public static List<Long> pell(Integer count) {
        List<Long> terms = new List<Long>{ 0L, 1L };
        for (Integer i = 2; i < count; i++) {
            terms.add(2 * terms[i - 1] + terms[i - 2]);
        }
        return terms;
    }

    public static void main() {
        List<Long> terms = pell(15);
        for (Integer i = 0; i < terms.size(); i++) {
            System.debug('P(' + i + ') = ' + terms[i]);
        }
    }
}
