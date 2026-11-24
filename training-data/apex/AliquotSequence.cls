// Aliquot sequence: replace n by the sum of its proper divisors.
public class AliquotSequence {
    public static Integer aliquotSum(Integer n) {
        Integer s = 0;
        for (Integer d = 1; d <= n / 2; d++) {
            if (Math.mod(n, d) == 0) s += d;
        }
        return s;
    }

    public static void run() {
        List<Integer> seq = new List<Integer>{ 12 };
        while (seq[seq.size() - 1] > 1 && seq.size() < 20) {
            seq.add(aliquotSum(seq[seq.size() - 1]));
        }
        System.debug(String.join(seq, ' '));
    }
}
