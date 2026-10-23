public class VanEckSequence {
    // Next term is the distance since the last term previously appeared, or 0 if it is new
    public static List<Integer> vanEck(Integer count) {
        List<Integer> seq = new List<Integer>{ 0 };
        for (Integer n = 1; n < count; n++) {
            Integer next = 0;
            for (Integer k = n - 2; k >= 0; k--) {
                if (seq[k] == seq[n - 1]) {
                    next = n - 1 - k;
                    break;
                }
            }
            seq.add(next);
        }
        return seq;
    }

    public static void main() {
        System.debug(vanEck(20));
    }
}
